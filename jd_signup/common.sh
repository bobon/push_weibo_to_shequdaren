#!/bin/bash
set -e
set +E
set +x

trap "exit 1" TERM
export TOP_PID=$$

old_IFS=$IFS
IFS=$'\n'

log_error() {
	echo -e "\e[0;31;3m${1}\e[0m" "\e[0;31;3m[$(date '+%Y%m%d %H:%M:%S')] [ERROR] \e[0m" >&2
	echo
}

error() {
  log_error "$1"
  kill -s TERM $TOP_PID
}

log_d() {
	if [ "$1" = "-" ]; then
    cat $1 >&2
  else
		echo -e "$1" >&2
	fi
}

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

find_all_sign_res() {
	rm -rvf log/if_chang_delay_* | log_d -
	local sign_num_=
	awk 'BEGIN {b=0} {
		if($0~/#.* sign_res$/) {a=1;b++;c=$0} else if($0~/#.* sign_res_end$/) {a=0}; if(a==1) 
		{
			if ($0~/sign_num=/) {
				print $0";f=\""c"\"" >> "log/if_chang_delay_"b
			} else {
				print $0 >> "log/if_chang_delay_"b
			}
		} 
	}' "$1"
	for i in $(find log -type f -name 'if_chang_delay_*'); do
		unset sign_num; unset f; unset sign_res_info
		source $i
		log_d "\n$f"
		log_d "$sign_res_info"
		let sign_num++
		local sign_num_="$sign_num_\n$sign_num;$f"
	done
	log_d "$sign_num_"
	echo -e "$sign_num_"
}

if_chang_delay() {
	local ven_f="$1"
	echo -e "\n* * * * * * * *\nchekc if chang delay $ven_f"
	if [ "${ven_f:0-4:4}" = "_del" ] || [ "${ven_f:0-3:3}" = "_fq" ]  || [ "${ven_f:0-6:6}" = "_jifen" ]; then
		echo "find del or jq or jifen file. skip."
		return
	fi
	
	unset actId; unset token; unset rule; unset actRule; unset vendername
	source "$ven_f"
	if [ -z "$vendername" ]; then
		vendername=$(basename $ven_f)
	fi
	echo -e "$vendername"
	grep '^# 活动时间' "$ven_f" || true
	echo -e "$actRule$rule"
	#sed -n '/^#.* sign_res$/,$p' "$ven_f"
	
	local type=
	if [ -z "$token" ]; then
		local key="$actId"
		local type="lzkj"
	else
		local key="$token"
		local type="h5"
	fi
	[ ! -z "$key" ] || error "key is empty from $ven_f"
	
	local sign_num_=$(find_all_sign_res "$ven_f")
	local tt=$(for j in $(echo -e "$sign_num_" | cut -d ';' -f 1 | sort | uniq); do
		echo -e "$sign_num_" | grep "^$j" | xargs
	done | sed -r -e 's,sign_res [0-9]+;#,,g')
	#echo -e "$tt"

	ls -1 shop/$key/prize/ >/dev/null || local res=1
	if [ "$res" = "1" ]; then
		echo "[WARN] not find shop/$key/prize"
		echo
		return
	fi
	local tmm=$((echo -e "$tt";ls -1 shop/$key/prize/) | sed -r -e 's,;|$,   ;,' | sort -r -t ';' -k 1,1 | uniq -w 3 -d)
	echo "show shop/$key/prize/: $(ls -1 shop/$key/prize/ | sort -n | xargs)"
	if [ -z "$tmm" ]; then
		if [ "${ven_f:0-6:6}" = "_delay" ]; then
			echo "明天签到 $vendername, 不会获取奖品, 保持文件名 $ven_f 不变."
		else
			echo "[RUN] 明天签到 $vendername, 不会获取奖品. $ven_f --> ${ven_f}_delay"
			if [ "$2" = "test" ]; then
				echo mv -vf "$ven_f" "${ven_f}_delay"
			else
				mv -vf "$ven_f" "${ven_f}_delay"
			fi
		fi
	else
		echo
		for tm in $(echo -e "$tmm"); do
			local sign_num_=$(echo "$tm" | cut -d ';' -f 1 | sed -r -e 's,[ ]+$,,')
			local sign_n=$(echo "$tm" | cut -d ';' -f 2 | sed -r -e 's,^#,,' -e 's,[ ]+sign_res$,,')
			[ ! -z "$sign_num_" ] || error "sign_num_ is empty from shop/$key/prize/ and $ven_f"
			[ ! -z "$sign_n" ] || error "sign_n is empty from shop/$key/prize/ and $ven_f"
			local prize=$(ls -1 shop/$key/prize/$sign_num_ 2>/dev/null)
			[ ! -z "$prize" ] || error "prize file is not exit: shop/$key/prize/$sign_num_"
			echo "发现明天是 [$sign_n] 签到 [$vendername] 的第 $sign_num_ 天，将要获取到奖品."	

			unset days; unset p_type; unset level; unset discount; unset quota; unset promoPrice; unset jdPrice
			source "$prize"
			
			local f=$(echo $ven_f | sed -r -e 's,_delay$|_fq$|_del$,,')	
			local remind="$sign_n 明天可获得"
			local is_now=false
			
			if [ "$type" = "h5" ]; then
				if [ "$p_type" = "6" ]; then
					local remind="$remind ${discount} 店铺积分"
				elif [ "$p_type" = "4" ]; then
					local remind="$remind ${discount} 京豆"
					local is_now=true	
				elif [ "$p_type" = "10" ]; then
					local remind="${remind} ${discount}元E卡"
				elif [ "$p_type" = "1" ]; then
					local remind="${remind} 满${quota}-${discount}店铺券"
				elif [ "$p_type" = "14" ]; then
					local remind="${remind} $(echo "scale=2; $discount/100" | bc)元红包"
				elif [ "$p_type" = "9" ]; then
					local remind="${remind} 专享价商品（${promoPrice}元购买原价${jdPrice}元的商品）"
				elif [ "$p_type" = "null" ]; then
					local remind=""
				else 
					error "not support sign type: $p_type"
				fi	
			elif [ "$type" = "lzkj" ]; then
				if [ "$p_type" = "1" ]; then
					local remind="$remind ${giftName}"
				elif [ "$p_type" = "6" ]; then
					local remind="$remind ${discount}京豆 $giftName"
					local is_now=true	
				elif [ "$p_type" = "7" ]; then
					local remind="$remind 赠送${giftName}"
				elif [ "$p_type" = "8" ]; then
					local remind="$remind ${giftName}"
				elif [ "$p_type" = "9" ]; then
					local remind="$remind ${discount}积分 $giftName"
				elif [ "$p_type" = "10" ]; then
					local remind="$remind ${giftName}"
				elif [ "$p_type" = "null" ]; then
					local remind=""
				else 
					error "not support sign type: $p_type"
				fi
			else
				error "not support type: $type"
			fi
			echo -e "$remind"
		done
		echo
		
		if [ "$is_now" = "true" ]; then
			if [ "$ven_f" = "${f}" ]; then
				echo "明天立即执行. 不改名字 $ven_f"
			else
				echo "[RUN] 明天立即执行. $ven_f --> ${f}"
				if [ "$2" = "test" ]; then
					echo mv -vf "$ven_f" "${f}"
				else
					mv -vf "$ven_f" "${f}"
				fi
			fi
		fi
	fi
	echo
}
