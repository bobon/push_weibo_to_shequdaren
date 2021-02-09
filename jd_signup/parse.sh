set -e

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

error() {
	log_d "[ERROR] $1"
}

log_d() {
	echo -e "$1" >&2
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

get_shopSign_h5() {
	unset token
	readonly token=$(echo $location | sed -r -e 's,.*token=,,' -e 's,&.*,,')
	[ ! -z "$token" ] || error "token error"
	log_d "get token from location:\n$token"
	readonly shop_base="shop/$token"	
	readonly shopSign="$shop_base/shopSign.json"
	readonly shop="$shop_base/shop"
	readonly shop_prize="$shop_base/prize"	
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
	echo -e "# 长链接\nurl=$(get_sign $venderId)" >> "$shop"
	
	local startTime_=$(echo $startTime | sed -r -e 's,[0-9]{3}$,,')
	local endTime_=$(echo $endTime | sed -r -e 's,[0-9]{3}$,,')
	echo "# 活动时间：$(date +"%Y.%m.%d %H:%M:%S" --date="@$startTime_") - $(date +"%Y.%m.%d %H:%M:%S" --date="@$endTime_")" >> "$shop"
	
	echo "奖励说明：" >> "$shop"
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

get_sign() {
	eval $(echo $curl_r "$curl_h" "'https://wq.jd.com/shopbranch/GetUrlSignDraw?venderId=${1}'" \
	  -H "'Cache-Control: max-age=0'" \
	  -H "'Accept: */*'" \
	  -H "'Referer: https://shop.m.jd.com/shopv2/mzpage?shopId=${1}&venderId=${1}'") \
		 | jq -r 'if(.data.isvUrl != "") then .data.isvUrl else empty end'
}

get_shopmemberinfo() {
	eval $(echo $curl_r "$curl_h" "'https://shop.m.jd.com/mshop/QueryShopMemberInfoJson?venderId=${1}'" \
	  -H "'Accept: */*'" \
	  -H "'Sec-Fetch-Site: same-origin'" \
	  -H "'Sec-Fetch-Mode: no-cors'" \
	  -H "'Sec-Fetch-Dest: script'" \
	  -H "'Referer: https://shop.m.jd.com/shopv2/mzpage?venderId=${1}&_fd=jdm'" )	| jq -r '.shopName'
}

parse_venderId_actId_sevenDay() {
	local actId=$(echo "$1" | sed -r -e 's,.*activityId=,,' -e 's,&.*,,')
	local venderId=$(echo "$1" | sed -r -e 's,.*venderId=,,' -e 's,&.*,,')
	echo "${venderId}|${actId}"
}

get_shopSign_lzkj_sevenDay() {
	local venderId=$(echo $1 | cut -d '|' -f 1)
	local actId=$(echo $1 | cut -d '|' -f 2)
	
	readonly shop_base="shop/$actId"
	readonly shop="shop"
	readonly shopSign="shopSign.json"
	readonly shop_prize="prize"	
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
		"dayNum=" + .dayNum + ";giftName=\"" + .gift.giftName + "\";giftType=" + .gift.giftType
	' "$shopSign" #> "$shop_base/prize.tmp"
	
	echo "7天签到" >> "$shop"
	jq -r '.giftConditions[]|
		"连续签到" + .dayNum + "天：" + .gift.giftName
	' "$shopSign" >> "$shop"
		
	echo
	echo "[$(pwd)/$shop]"
	cat "$shop"
}


if [ ! -z "$1" ] && [ $(echo "$1" | egrep "^https:" >/dev/null;echo $?) -eq 0 ]; then
	location="$1"
elif [ -f "$1" ]; then
	echo "parse $1"
	source "$1" || error "source $1 error"
	[ ! -z "$venderId" ] || error "venderId error from $1"

	echo "$(get_shopmemberinfo $venderId)"
	location=$(get_sign $venderId)
	unset venderId
fi
echo "$location"


# https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity?activityId=3f064b1a32ec4b2ab6e044aa1cacad06&venderId=182542
if [ $(echo "$location" | egrep "^https://${lzkj_svr}/sign/sevenDay/signActivity" >/dev/null;echo $?) -eq 0 ]; then
	get_shopSign_lzkj_sevenDay $(parse_venderId_actId_sevenDay "$location")
	parse_prize_lzkj_sevenDay
# https://h5.m.jd.com/babelDiy/Zeus/2PAAf74aG3D61qvfKUM5dxUssJQ9/index.html?token=1EEAA3666DC9E22BABE44B1ABCC27325
elif [ $(echo "$location" | egrep "^https://${h5_svr}/babelDiy/Zeus/" >/dev/null;echo $?) -eq 0 ]; then
	get_shopSign_h5
elif [ $(echo "$1" | egrep "^https://u.jd.com/" >/dev/null;echo $?) -eq 0 ]; then
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
		get_shopSign_h5
	fi
fi

exit 0


#<a class="dtm-map-area" href="//h5.m.jd.com/babelDiy/Zeus/2PAAf74aG3D61qvfKUM5dxUssJQ9/index.html?token=28AABCB3B08D6DF9BB03788D53E84C2B" style="position: absolute; width: 126.667px; height: 195.573px; top: 1278.83px; left: 1.01333px;"></a>

