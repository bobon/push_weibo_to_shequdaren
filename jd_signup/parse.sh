set -e

readonly curl_r="curl -sS -k"
readonly User_Agent='Mozilla/5.0 (Linux; Android 10; ALP-AL00 Build/HUAWEIALP-AL00; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/77.0.3865.120 MQQBrowser/6.2 TBS/045513 Mobile Safari/537.36 MMWEBID/6886 MicroMessenger/8.0.1840(0x2800003D) Process/tools WeChat/arm64 Weixin NetType/4G Language/zh_CN ABI/arm64'
readonly curl_h="-H 'Connection: keep-alive' \
-H 'Upgrade-Insecure-Requests: 1' \
-H \"User-Agent: $User_Agent\" \
-H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' \
-H 'Accept-Language: zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.5;q=0.4'"

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

get_shopSign() {
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
	
	echo "# 短连接: $duan" > "$shop"	
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
	source "$shop"
	echo "token=$token" >> "$shop"
	
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

readonly duan="$1"
readonly log=log/parse/$(echo "$1" | sed -r -e 's,:|[.]|/,_,g')
rm -rvf "$log"
mkdir -vp "$log"

duan_to_chang
chang_to_hrl
hrl_to_location
get_sign_html
get_shopSign

exit 0


#<a class="dtm-map-area" href="//h5.m.jd.com/babelDiy/Zeus/2PAAf74aG3D61qvfKUM5dxUssJQ9/index.html?token=28AABCB3B08D6DF9BB03788D53E84C2B" style="position: absolute; width: 126.667px; height: 195.573px; top: 1278.83px; left: 1.01333px;"></a>