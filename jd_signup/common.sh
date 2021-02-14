parse_sign_res_info() {
	for i in $(echo -e "$1"); do
		eval $(echo $i)
		if [ "$signed" = "2" ]; then
			local si="[已~签~到]"
		else
			local si="未签到"
		fi
		printf "%-20s %-4s %-5s\n" $(date -d @$signTime +"%Y/%m/%d_%H:%M:%S") $currentDay $si
	done
}

write_sign_res() {
	local sign_res_num=$(echo -e "$3" | jq -r '"sign_num=" + (.data.days|tostring)')
	eval $(echo $sign_res_num)
	
	local giftRes=$(echo -e "$4"| jq -r 'if (.success or (.msg|test("只能签到一次|已经参加过该活动")) ) then "ok" else empty end')
	
	local sign_res=$(echo -e "$3" | jq -r '.data.signRecords[]|
		"signTime=" + (.signTime|tostring) + ";signed=" + (.signed|tostring) + ";currentDay=" + (.currentDay|tostring)
		' | sed -r -e 's,[0-9]{3}(;signed=),\1,')

	local sign_res_info=$(parse_sign_res_info "$sign_res")
	local sign_res_info="$sign_res_info\n"$(echo "已签到 $sign_num 天")
	
	echo "#$1 sign_res" >> $2
	echo -e "sign_res=\"\n$sign_res\"" >> $2
	echo -e "sign_num=\"$sign_num\"" >> $2
	echo -e "giftRes=\"$giftRes\"" >> $2
	echo -e "giftDate=\"$(date +"%Y%m%d")\"" >> $2
	echo -e "sign_res_info=\"\n$sign_res_info\"" >> $2
	echo "#$1 sign_res_end" >> $2
	echo >> $2
	
	echo
	echo "***********************************************"
	echo -e "$sign_res_info"
	echo "***********************************************"
}

write_sign_res_lzkj() {
	local giftName=$(echo -e "$4" | jq '.gift.giftName')
	local giftRes=$(echo -e "$4"| jq -r 'if (.isOk or (.msg|test("只能签到一次|只能签到一次")) ) then "ok" else empty end')
	
	local sign_res_num=$(echo -e "$3" | jq -r '"contiSignNum=" + (.signRecord.contiSignNum|tostring) + ";totalSignNum=" + (.signRecord.totalSignNum|tostring)')
	eval $(echo $sign_res_num)
	local sign_res=$(echo -e "$3" | jq -r '.signDetail|to_entries|sort_by(.key)[]|"signTime=" 
		+ (.key|strptime("%Y%m%d")|mktime|tostring) 
		+ ";signed=" + if(.value == "y") then "2" else "1" end')
	local sign_res_info=$(parse_sign_res_info "$sign_res")
	local sign_res_info="$sign_res_info\n"$(echo -e "当天签到奖励 $giftName\n连续签到 $contiSignNum 天\n签到总天数 $totalSignNum")
	
	echo "#$1 sign_res" >> $2
	echo -e "sign_res=\"\n$sign_res\"" >> $2
	echo -e "sign_num=\"$contiSignNum\"" >> $2
	echo -e "sign_total_num=\"$totalSignNum\"" >> $2
	echo -e "giftName=\"$giftName\"" >> $2
	echo -e "giftRes=\"$giftRes\"" >> $2
	echo -e "giftDate=\"$(date +"%Y%m%d")\"" >> $2
	echo -e "sign_res_info=\"\n$sign_res_info\"" >> $2
	echo "#$1 sign_res_end" >> $2
	
	echo
	echo "***********************************************"
	echo -e "$sign_res_info"
	echo "***********************************************"
}

write_sign_res_lzkj_7() {
	local sign_days_7=$(echo "$3" | jq -r '.contiSignDays')
	local sign_res_info="7天签到 第 $sign_days_7 天"
	local giftRes=$(echo -e "$4"| jq -r 'if (.isOk or (.msg|test("只允许签到一次|只能签到一次")) ) then "ok" else empty end')
	
	echo "#$1 sign_res" >> $2
	echo -e "sign_days_7=\"\n$sign_days_7\"" >> $2
	echo -e "sign_res_info=\"\n$sign_res_info\"" >> $2
	echo -e "giftRes=\"$giftRes\"" >> $2
	echo -e "giftDate=\"$(date +"%Y%m%d")\"" >> $2
	echo "#$1 sign_res_end" >> $2
	
	echo
	echo "***********************************************"
	echo -e "$sign_res_info"
	echo "***********************************************"
}

#grep -r '^token=' api_vender/ | egrep -v '_del:|_fq:' | cut -d ':' -f 2 | sed -r -e 's,.*="*,,' -e 's,",,' | xargs -i ls -1 shop/{}/shop

#token="9F32AF8D7A055BD6760EF22E08FB6470"
#sign_num="1"
#let sign_num++
#ll shop/$token/prize/$sign_num
