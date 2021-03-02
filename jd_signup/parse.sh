#!/bin/bash
set -e
set +E
set +x

trap "exit 1" TERM
export TOP_PID=$$

log_error() {
	echo -e "\e[0;31;3m${1}\e[0m" "\e[0;31;3m[$(date '+%Y%m%d %H:%M:%S')] [ERROR] \e[0m" >&2
	echo
}

error() {
  log_error "$1"
  kill -s TERM $TOP_PID
}


readonly curl_r="curl -sS -k"
readonly User_Agent='Mozilla/5.0 (Linux; Android 10; ALP-AL00 Build/HUAWEIALP-AL00; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/77.0.3865.120 MQQBrowser/6.2 TBS/045513 Mobile Safari/537.36 MMWEBID/6886 MicroMessenger/8.0.1840(0x2800003D) Process/tools WeChat/arm64 Weixin NetType/4G Language/zh_CN ABI/arm64'
readonly curl_h="-H 'Connection: keep-alive' \
-H 'Upgrade-Insecure-Requests: 1' \
-H \"User-Agent: $User_Agent\" \
-H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' \
-H 'Accept-Language: zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.5;q=0.4'"

readonly User_Agent_meta10="jdapp;android;9.4.0;10;8363838303530333030393730373-83D2338333738326233603436336;network/wifi;model/ALP-AL00;addressid/15299083;aid/9a0d1381915369ba;oaid/f2def9db-defe-ba42-f7b3-fb8de59b5882;osVer/29;appBuild/86737;partner/huawei;eufv/1;jdSupportDarkMode/0;Mozilla/5.0 (Linux; Android 10; ALP-AL00 Build/HUAWEIALP-AL00; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/77.0.3865.120 MQQBrowser/6.2 TBS/045230 Mobile Safari/537.36"
readonly curl_h_meta10="-H 'Connection: keep-alive' \
-H 'Accept: application/json' \
-H 'X-Requested-With: XMLHttpRequest' \
-H \"User-Agent: ${User_Agent_meta10}\" \
-H 'Sec-Fetch-Mode: cors' \
-H 'Content-Type: application/x-www-form-urlencoded' \
-H 'Sec-Fetch-Site: same-origin' \
-H 'Accept-Language: zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7'"

readonly lzkj_svr="lzkj-isv.isvjcloud.com"
readonly h5_svr="h5.m.jd.com"


log_d() {
	echo -e "$1"
}

duan_to_chang() {
	log_d "短连接: $duan"
	readonly duan_html="$log/duan.html"
	eval $(echo $curl_r "$curl_h" "$duan") > "$duan_html"
}

chang_to_hrl() {
	unset hrl
	eval $(cat "$duan_html" | sed -r -e 's,;,\n,g' | egrep '^var hrl=' | sed -r -e 's,^var ,,')
	[ ! -z "$hrl" ] || error "hrl error"
	log_d "get hrl from $1:\n$hrl"
}

hrl_to_location() {
	unset location
	eval $(echo $curl_r -I "$curl_h" -H "'Referer: $duan'" "'$hrl'") > "$log/location.header"
  location=$(cat "$log/location.header" | egrep '^location:' | sed -r -e 's,^location: ,,' -e 's,\r$,,')	
	[ ! -z "$location" ] || error "location error"
	log_d "get location from hrl:\n$location"
}

get_sign_html() {
	eval $(echo $curl_r "$curl_h" -H "'Referer: $duan'" "'$location'") > "$log/index.html"
}

check_shop_base() {
	if [ ! -z "$force_del" ]; then
		rm -rvf "$shop_base"
	fi
	
	if [ -d "$shop_base" ]; then
		echo "发现重复的店铺活动"
		echo -e "${input}\n$shop_base/shop"
		echo "发现重复的店铺活动" >> repeatshop
		echo -e "${input}\n$shop_base/shop" >> repeatshop
		echo >> repeatshop
		echo
		echo "show 重复的店铺活动"
		if [ -f "$shop_base/shop" ]; then
			echo [$shop_base/shop]
			cat $shop_base/shop
		elif [ -f "$shop_base/shopSign.json" ]; then
			echo [$shop_base/shopSign.json]
			jq '' $shop_base/shopSign.json		
		else
			error "解析重复的店铺活动失败。"
		fi		
		error "[ERROR] 重复的 $shop_base"
	else
		if [ "$batch_pro" = "true" ]; then
			echo "批量处理时，发现新店铺活动"
			echo "$shop_base" >> $sign_base_dir/log/batch_parse_find_new_vender.tmp
		fi
	fi
}

get_shopSign_h5() {
	unset token
	token=$(echo $location | grep 'token=' | sed -r -e 's,.*token=,,' -e 's,&.*,,')
	if [ -z "$token" ]; then
		echo "[WARN] token error from $location"
		return
	fi
	log_d "get token from location:\n$token"
	
	shop_base="shop/$token"
	check_shop_base
	shopSign="$shop_base/shopSign.json"
	shop="$shop_base/shop"
	shop_prize="$shop_base/prize"	
	rm -rvf "$shopSign"
	rm -rvf "$shop"
	rm -rvf "$shop_base/*.tmp"
	rm -rvf "$shop_prize"
	mkdir -vp "$shop_prize"
		  
  eval $(echo $curl_r "$curl_h" -H "'Referer: $location'" \
    "'https://api.m.jd.com/api?appid=interCenter_shopSign&t=$(date '+%s')000&loginType=2&functionId=interact_center_shopSign_getActivityInfo&jsonp=jsonp1000'" \
	  -H "'Accept: */*'" \
	  --get --data-urlencode "'body={\"token\":\"${token}\",\"venderId\":\"\"}'") | sed -r -e 's,^[^\(]+\(,,' -e 's,\);$,,' > "$shopSign"
	 
	jq 'if(.success) then empty else . end' "$shopSign"
	grep '当前不存在有效的活动' "$shopSign" && return || true	
	
	echo -e "# 短链接\nsuo_url=\"$duan\"" > "$shop"
	echo "get shopSign to $shopSign"
	jq -r '.data|(
		"venderId=" + (.venderId|tostring)
		 + "\nstartTime=" + (.startTime|tostring)
		 + "\nendTime=" + (.endTime|tostring)
		 + "\nactivityId=" + (.id|tostring)
	)' "$shopSign" >> "$shop"
	
	unset venderId
	unset startTime
	unset endTime
	unset activityId
	unset url
	source "$shop"
	echo "token=$token" >> "$shop"
	echo "#店铺名称" >> "$shop"
	echo "vendername=\"$(get_shopmemberinfo $venderId)\"" >> "$shop"
	if [ "$1" = "nolocation" ]; then
		echo -e "# 长链接\nurl=\"https://api.m.jd.com/api?appid=interCenter_shopSign&t=$(date '+%s')000&loginType=2&functionId=interact_center_shopSign_getActivityInfo&jsonp=jsonp1000\"" >> "$shop"
	else
		#echo -e "# 长链接\nurl=$(get_sign $venderId)" >> "$shop"
		echo -e "# 长链接\nurl=$location" >> "$shop"
	fi
	
	local startTime_=$(echo $startTime | sed -r -e 's,[0-9]{3}$,,')
	local endTime_=$(echo $endTime | sed -r -e 's,[0-9]{3}$,,')
	echo "# 活动时间：$(date +"%Y.%m.%d %H:%M:%S" --date="@$startTime_") - $(date +"%Y.%m.%d %H:%M:%S" --date="@$endTime_")" >> "$shop"
	
	echo -e "# 奖励说明：\nactRule=\"" >> "$shop"
	jq -r '.data.prizeRuleList[]|(
		"days=0"
		+ ";p_type=" +  (.prizeList[0].type|tostring)
		+ ";level=" +  (.level|tostring)
		+ ";discount=" +  (.prizeList[0].discount|tostring)
		+ ";quota=" +  (.prizeList[0].quota|tostring)
	)' "$shopSign" > "$shop_base/prize.tmp"
	
	for i in $(cat "$shop_base/prize.tmp"); do
		unset days;unset p_type;unset level;unset discount;unset quota;unset promoPrice;unset jdPrice
		eval $i
		parse_prize "$i"
	done
	
	for i in $(jq -r '.data.continuePrizeRuleList[].prizeList|length' "$shopSign" | sort | uniq); do
		local index=$(($i-1))
		jq -r --argjson index "$index" '.data.continuePrizeRuleList[]|(
			"days=" + (.days|tostring)
			+ ";p_type=" +  (.prizeList[$index].type|tostring)
			+ ";level=" +  (.level|tostring)
			+ ";discount=" +  (.prizeList[$index].discount|tostring)
			+ ";quota=" +  (.prizeList[$index].quota|tostring)
			+ ";promoPrice=" +  (.prizeList[$index].interactPrizeSkuList[0].promoPrice)
			+ ";jdPrice=" +  (.prizeList[$index].interactPrizeSkuList[0].jdPrice)
		)' "$shopSign" > "$shop_base/prize.tmp"
		
		for i in $(cat "$shop_base/prize.tmp"); do
			unset days;unset p_type;unset level;unset discount;unset quota;unset promoPrice;unset jdPrice
			eval $i			
			parse_prize "$i"
		done
	done
	echo "\"" >> "$shop"
	
	echo
	echo "[$shop]"
	cat "$shop"
}

parse_prize() {
	local s="连续签到${days}天"
	if [ "$level" = "0" ]; then
		local s="每日签到"
	fi
	
	if [ "$p_type" = "6" ]; then
		echo "${s}：${discount}店铺积分" >> "$shop"
	elif [ "$p_type" = "4" ]; then
		echo "${s}：${discount}京豆" >> "$shop"
	elif [ "$p_type" = "10" ]; then
		echo "${s}：${discount}元E卡" >> "$shop"
	elif [ "$p_type" = "1" ]; then
		echo "${s}：满${quota}-${discount}店铺券" >> "$shop"
	elif [ "$p_type" = "14" ]; then
		echo "${s}：$(echo "scale=2; $discount/100" | bc)元红包" >> "$shop"
	elif [ "$p_type" = "9" ]; then
		echo "${s}：专享价商品（${promoPrice}元购买原价${jdPrice}元的商品）" >> "$shop"
	elif [ "$p_type" = "null" ]; then
		return
	else 
		error "not support sign type: $p_type"
	fi
	echo "$1" >> "$shop_prize/$level"
}

get_sign_fromSignDraw() {
	eval $(echo $curl_r "$curl_h" "'https://wq.jd.com/shopbranch/GetUrlSignDraw?venderId=${1}'" \
	  -H "'Cache-Control: max-age=0'" \
	  -H "'Accept: */*'" \
	  -H "'Referer: https://shop.m.jd.com/shopv2/mzpage?shopId=${1}&venderId=${1}'") \
		 | jq -r 'if(.data.isvUrl != "") then .data.isvUrl else empty end'
}

get_sign_fromMzpage() {
	local shop_vender_base="shop/$venderId"
	mkdir -p "$shop_vender_base"
	
	get_shop_mzpage "$1" > "$shop_vender_base/mzpage.html"
	cat "$shop_vender_base/mzpage.html" | egrep 'https.*/sign/|isv.isvjcloud.com' | sed -r -e 's,.*https,https,' -e 's,"\,$|"$,,' | sort | uniq
}

get_sign() {
	get_sign_fromSignDraw "$1"
	get_sign_fromMzpage "$1"
}

get_shopmemberinfo() {
	eval $(echo $curl_r "$curl_h" "'https://shop.m.jd.com/mshop/QueryShopMemberInfoJson?venderId=${1}'" \
	  -H "'Accept: */*'" \
	  -H "'Sec-Fetch-Site: same-origin'" \
	  -H "'Sec-Fetch-Mode: no-cors'" \
	  -H "'Sec-Fetch-Dest: script'" \
	  -H "'Referer: https://shop.m.jd.com/shopv2/mzpage?venderId=${1}&_fd=jdm'" )	| jq -r '.shopName'
}

parse_venderId_actId_from_location() {
	local actId=$(echo "$1" | sed -r -e 's,.*activityId=,,' -e 's,&.*,,')
	local venderId=$(echo "$1" | sed -r -e 's,.*venderId=,,' -e 's,&.*,,')
	echo "${venderId}|${actId}"
}

get_shopSign_lzkj_sevenDay() {
	unset venderId
	unset actId
	venderId=$(echo $1 | cut -d '|' -f 1)
	actId=$(echo $1 | cut -d '|' -f 2)
		
	shop_base="shop/$actId"
	check_shop_base
	shop="shop"
	shopSign="shopSign.json"
	shop_prize="prize"	
	mkdir -vp "$shop_base"
	cd "$shop_base"
	rm -rvf "$shop"
	rm -rvf "$shopSign"
	rm -rvf "*.tmp"
	rm -rvf "$shop_prize"
	mkdir -vp "$shop_prize"
	
	$curl_r -c ${venderId}_signActivity2.cookie "$curl_h" "https://${lzkj_svr}/sign/sevenDay/signActivity?activityId=${actId}&venderId=${venderId}" \
	  -H 'Sec-Fetch-Mode: navigate' \
	  -H 'Sec-Fetch-User: ?1' \
	  -H 'X-Requested-With: com.tencent.mm' \
	  -H 'Sec-Fetch-Site: none' > "activity.html"

	$curl_r -b ${venderId}_signActivity2.cookie "$curl_h_meta10" "https://${lzkj_svr}/sign/sevenDay/wx/getSignInfo" \
	  -H "Origin: https://${lzkj_svr}" \
	  -H "Referer: https://${lzkj_svr}/sign/sevenDay/signActivity?activityId=${actId}&venderId=${venderId}" \
	  -X POST --data-raw "venderId=${venderId}" --data-raw "actId=${actId}" > "$shopSign"
	
	#cat "$shopSign"
	cd -
}

parse_prize_lzkj_sevenDay() {
	cd "$shop_base"
	
	jq -r '.giftConditions[]|
		"days=" + .dayNum + ";discount=\"" + .gift.giftName + "\";giftName=\"" + .gift.giftName + "\";p_type=" + .gift.giftType
	' "$shopSign" > "prize.tmp"
	
	mkdir -vp prize
	old_IFS=$IFS
	IFS=$'\n'
	for ki in $(cat "prize.tmp"); do
		unset days;unset p_type;unset giftName;unset discount;unset quota;unset promoPrice;unset jdPrice
		eval $ki
		echo "$ki" >> "prize/$days"
	done
	IFS=$old_IFS
	cat prize/*
	
	if [ -z "$vendername" ]; then
		vendername="$(get_shopmemberinfo $venderId)"
	fi
	
	cat > "$shop" << END
#店铺名称
vendername="$vendername"
#店铺激活码
actId="$actId"
#店铺id
venderId="$venderId"
#长链接
url="$location"

END
	
	local s_date=$(jq -r '.actRule' "$shopSign" | grep '活动时间' | sed -r -e 's,.*活动时间：,,')
	local startTime=$(echo -e "$s_date" | sed -r -e 's,.*活动时间：,,' -e 's,；,,' -e 's, - ,;,' | cut -d ';' -f 1)
	local endTime=$(echo -e "$s_date" | sed -r -e 's,.*活动时间：,,' -e 's,；,,' -e 's, - ,;,' | cut -d ';' -f 2)
	echo "startTime=$(date -d "$startTime" "+%s")" >> "$shop"
	echo "endTime=$(date -d "$endTime" "+%s")" >> "$shop"
	echo "# 活动时间：$s_date" >> "$shop"
	echo -e "# 奖励说明：\nactRule=\"" >> "$shop"
	echo "7天签到" >> "$shop"
	jq -r '.giftConditions[]|
		"连续签到" + .dayNum + "天：" + .gift.giftName
	' "$shopSign" >> "$shop"
	echo -e "\"" >> "$shop"
		
	echo
	echo "[$(pwd)/$shop]"
	cat "$shop"
	cd -
}

get_shop_mzpage() {
	eval $(echo $curl_r "$curl_h" "https://shop.m.jd.com/shopv2/mzpage?venderid=${1}" -H "'Referer: https://so.m.jd.com/'")
}

get_shopSign_lzkj() {
	unset venderId
	unset actId
	venderId=$(echo $1 | cut -d '|' -f 1)
	actId=$(echo $1 | cut -d '|' -f 2)
	
	shop_base="shop/$actId"
	check_shop_base
	shop="shop"
	shopSign="shopSign.json"
	shop_prize="prize"	
	mkdir -vp "$shop_base"
	cd "$shop_base"
	rm -rvf "$shop"
	rm -rvf "$shopSign"
	rm -rvf "*.tmp"
	rm -rvf "$shop_prize"
	mkdir -vp "$shop_prize"
	
	$curl_r -c ${venderId}_signActivity2.cookie "$curl_h" "https://${lzkj_svr}/sign/signActivity2?activityId=${actId}&venderId=${venderId}" \
	  -H 'Sec-Fetch-Mode: navigate' \
	  -H 'Sec-Fetch-User: ?1' \
	  -H 'X-Requested-With: com.tencent.mm' \
	  -H 'Sec-Fetch-Site: none' > "activity.html"

	echo "${vendername}活动规则"
	$curl_r -b ${venderId}_signActivity2.cookie "$curl_h_meta10" "https://${lzkj_svr}/sign/wx/getActivity" \
	  -H "Origin: https://${lzkj_svr}" \
	  -H "Referer: https://${lzkj_svr}/sign/wx/getActivity" \
	  -X POST --data-raw "venderId=${venderId}&actId=${actId}" > "$shopSign"
	
	grep '"isOk":false' "$shopSign" && return || true
	  
	jq -r '"actId=" + .act.id
	  + "\nvenderId=" + (.act.venderId|tostring)
	  + "\nstartTime=" + (.act.startTime|tostring)
		+ "\nendTime=" + (.act.endTime|tostring)
		+ "\n# 短链接\nsuo_url=\"https://" + .act.shortUrl + "\""
		+ "\nactTimeStr=\"" + .act.actTimeStr + "\""' "$shopSign" > "$shop"
	unset venderId;	unset actId
	source "$shop"
		
	jq -r '.act.wxSignActivityGiftBean.giftConditions[]|
		"level=" + .dayNum + ";days=" + .dayNum + ";p_type=" + .gift.giftType + ";discount=" + .gift.giftNum + ";giftName=\"" + .gift.giftName + "\""
		' "$shopSign" > "prize.tmp"
	
	echo "#店铺名称" >> "$shop"
	if [ -z "$vendername" ]; then
		vendername="$(get_shopmemberinfo $venderId)"
	fi
	echo "vendername=\"${vendername}\"" >> "$shop"
	echo -e "# 长链接\nurl=$location" >> "$shop"
	
	local startTime_=$(echo $startTime | sed -r -e 's,[0-9]{3}$,,')
	local endTime_=$(echo $endTime | sed -r -e 's,[0-9]{3}$,,')
	echo "# 活动时间：$(date +"%Y.%m.%d %H:%M:%S" --date="@$startTime_") - $(date +"%Y.%m.%d %H:%M:%S" --date="@$endTime_")" >> "$shop"
	
	echo -e "# 奖励说明：\nactRule=\"" >> "$shop"
	old_IFS=$IFS
	IFS=$'\n'
	for i in $(cat "prize.tmp"); do
		unset days;unset p_type;unset level;unset discount;unset quota;unset promoPrice;unset jdPrice
		eval $i
		parse_prize_lzkj "$i"
	done
	IFS=$old_IFS
	echo "\"" >> "$shop"
	
	echo
	echo "[$shop_base/$shop]"
	cat "$shop"
	cd -
}

parse_prize_lzkj() {
	local s="连续签到${days}天"
	if [ "$level" = "0" ]; then
		local s="每日签到"
	fi
	
	if [ "$p_type" = "1" ]; then
		echo "${s}：${giftName}" >> "$shop"
	elif [ "$p_type" = "6" ]; then
		echo "${s}：${discount}京豆 $giftName" >> "$shop"
	elif [ "$p_type" = "7" ]; then
		echo "${s}：赠送${giftName}" >> "$shop"
	elif [ "$p_type" = "8" ]; then
		echo "${s}：${giftName}" >> "$shop"
	elif [ "$p_type" = "9" ]; then
		echo "${s}：${discount}积分 $giftName" >> "$shop"
	elif [ "$p_type" = "10" ]; then
		echo "${s}：${giftName}" >> "$shop"
	elif [ "$p_type" = "null" ]; then
		return
	else 
		error "not support sign type: $p_type"
	fi
	echo "$1" >> "$shop_prize/$level"
}


sign_base_dir=/home/myid/jd/jd_signup
cd $sign_base_dir

if [ "$3" = "-f" ]; then
	force_del="force"
fi
if [ "$2" = "-f" ]; then
	force_del="force"
elif [ "$2" = "batch_pro" ]; then
	batch_pro=true
fi
if [ ! -z "$1" ] && [ $(echo "$1" | egrep "^https:" >/dev/null;echo $?) -eq 0 ]; then
	locations="$1"
elif [ -f "$1" ]; then
	echo "parse $1"
	source "$1" || error "source $1 error"
	[ ! -z "$venderId" ] || error "venderId error from $1"
	
	vendername="$(get_shopmemberinfo $venderId)"
	echo "$vendername"
	locations=$(get_sign $venderId | sed -r -e 's,&adsource=[^&]+,,' | sort | uniq)
	unset venderId
fi
echo -e "$locations"
mkdir -vp locations
echo -e "$locations" >> locations/locations
cat locations/locations | sort | uniq > locations/locations.tmp
mv locations/locations.tmp locations/locations
echo

for location in $(echo -e "$locations"); do
	echo "location: $location"
	input="$location"
	# https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity?activityId=3f064b1a32ec4b2ab6e044aa1cacad06&venderId=182542
	if [ $(echo "$location" | egrep "^https://${lzkj_svr}/sign/sevenDay/signActivity" >/dev/null;echo $?) -eq 0 ]; then
		get_shopSign_lzkj_sevenDay $(parse_venderId_actId_from_location "$location")
		parse_prize_lzkj_sevenDay
	# https://lzkj-isv.isvjcloud.com/sign/signActivity2?activityId=eb0ef5535d6e462096ab4e2135ba6c45&venderId=37166
	elif [ $(echo "$location" | egrep "^https://${lzkj_svr}/sign/signActivity" >/dev/null;echo $?) -eq 0 ]; then
		get_shopSign_lzkj $(parse_venderId_actId_from_location "$location")
	# https://h5.m.jd.com/babelDiy/Zeus/2PAAf74aG3D61qvfKUM5dxUssJQ9/index.html?token=1EEAA3666DC9E22BABE44B1ABCC27325
	elif [ $(echo "$location" | egrep "^https://${h5_svr}/babelDiy/Zeus/" >/dev/null;echo $?) -eq 0 ]; then
		get_shopSign_h5
	elif [ $(echo "$location" | egrep "^https://u.jd.com/" >/dev/null;echo $?) -eq 0 ]; then
		# https://u.jd.com/IyOZZAp
		readonly duan="$1"
		readonly log=log/parse/$(echo "$1" | sed -r -e 's,:|[.]|/,_,g')
		rm -rvf "$log"
		mkdir -vp "$log"

		duan_to_chang
		chang_to_hrl
		hrl_to_location
		get_sign_html
		get_shopSign_h5
	else
		if [ ! -z "$token" ]; then
			location="https://${h5_svr}/babelDiy/Zeus/2PAAf74aG3D61qvfKUM5dxUssJQ9/index.html?token=${token}&"
			echo "have token from $1"
			get_shopSign_h5 nolocation
		fi
	fi
done

exit 0


#<a class="dtm-map-area" href="//h5.m.jd.com/babelDiy/Zeus/2PAAf74aG3D61qvfKUM5dxUssJQ9/index.html?token=28AABCB3B08D6DF9BB03788D53E84C2B" style="position: absolute; width: 126.667px; height: 195.573px; top: 1278.83px; left: 1.01333px;"></a>

## ./parse.sh lzkj_sevenDay_vender/mengniu -f

# rm -rvf rr err repeatshop shop locations; find fq_vender vender api_vender/ lzkj_sevenDay_vender dingzhi_vender -type f | xargs -i ./parse.sh {} >rr 2>err
# ./sign_check.sh | tee sign_check

# ./search.sh "牛奶"
# ./search.sh "电器"
# ./search.sh "电子产品"
# ./search.sh "奶粉"
# ./search.sh "数码"
# ./search.sh "化妆"
# ./search.sh "酒"
# ./search.sh "零食"
# ./search.sh "洗护"
# ./search.sh "表"
# ./search.sh "家电"
# cat log/sign.tmp | xargs -i ./parse.sh {}
# ./sign_check.sh | tee log/sign_check
# find ./ -name 'shop_[0-9]*_delay'
