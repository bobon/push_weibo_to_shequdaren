#!/bin/bash
set -e
set +E
set +x

trap "exit 1" TERM
export TOP_PID=$$

old_IFS=$IFS
IFS=$'\n'
sign_base_dir=/home/myid/jd/jd_signup

log_s() {
	if [ -z "$send_log" ]; then
		send_log=$sign_base_dir/log/sendNotify_$(date +"%Y%m%d").log
	fi
	if [ "$1" = "-" ]; then
		cat $1
		cat $1 >> "$send_log"
  else
  	echo -e "$1"
		echo -e "$1" >> "$send_log"
	fi
}

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

search() {
	curl -sS -k 'https://so.m.jd.com/ware/search.action?searchFrom=search&sf=11&as=1' \
	  -H 'Connection: keep-alive' \
	  -H 'Upgrade-Insecure-Requests: 1' \
	  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36 QBCore/4.0.1316.400 QQBrowser/9.0.2524.400 Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2875.116 Safari/537.36 NetType/WIFI MicroMessenger/7.0.20.1781(0x6700143B) WindowsWechat' \
	  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
	  -H 'Sec-Fetch-Site: same-origin' \
	  -H 'Sec-Fetch-Mode: navigate' \
	  -H 'Sec-Fetch-User: ?1' \
	  -H 'Sec-Fetch-Dest: document' \
	  -H 'Referer: https://so.m.jd.com/ware/search.action?keyword=%E5%A5%B6%E7%B2%89&searchFrom=home&sf=11&as=1' \
	  -H 'Accept-Language: zh-CN,zh;q=0.9' \
	  --get --data-urlencode "keyword=${1}"
	  
}

search_page() {
	curl -sS -k 'https://so.m.jd.com/ware/search._m2wq_list?datatype=1&callback=jdSearchResultBkCbC&page=${2}&pagesize=10' \
	  -H 'Connection: keep-alive' \
	  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36 QBCore/4.0.1316.400 QQBrowser/9.0.2524.400 Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2875.116 Safari/537.36 NetType/WIFI MicroMessenger/7.0.20.1781(0x6700143B) WindowsWechat' \
	  -H 'Accept: */*' \
	  -H 'Sec-Fetch-Site: same-origin' \
	  -H 'Sec-Fetch-Mode: no-cors' \
	  -H 'Sec-Fetch-Dest: script' \
	  -H 'Referer: https://so.m.jd.com/ware/search.action?keyword=%E6%9D%9C%E5%B8%88%E5%82%85&searchFrom=search&sf=11&as=1' \
	  -H 'Accept-Language: zh-CN,zh;q=0.9' \
	  --get --data-urlencode "keyword=${1}"
}

get_sign() {
	curl -sS -k "https://wq.jd.com/shopbranch/GetUrlSignDraw?venderId=${1}" \
	  -H 'Connection: keep-alive' \
	  -H 'Cache-Control: max-age=0' \
	  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36 QBCore/4.0.1316.400 QQBrowser/9.0.2524.400 Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2875.116 Safari/537.36 NetType/WIFI MicroMessenger/7.0.20.1781(0x6700143B) WindowsWechat' \
	  -H 'Accept: */*' \
	  -H 'Referer: https://shop.m.jd.com/shopv2/mzpage?shopId=628372&venderId=633272' \
	  -H 'Accept-Language: zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.5;q=0.4' | jq 'if(.data.isvUrl != "") then .data.isvUrl else empty end'
}

get_shopmemberinfo() {
	if [ -d "/home/myid/all_shop_info/${1}" ]; then
		error "重复的店铺 /home/myid/all_shop_info/${1}"
	else
		mkdir -vp "/home/myid/all_shop_info/${1}" | log_d -
	fi
	
	curl -sS -k "https://shop.m.jd.com/mshop/QueryShopMemberInfoJson?venderId=${1}" \
	  -H 'Connection: keep-alive' \
	  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36 QBCore/4.0.1316.400 QQBrowser/9.0.2524.400 Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2875.116 Safari/537.36 NetType/WIFI MicroMessenger/7.0.20.1781(0x6700143B) WindowsWechat' \
	  -H 'Accept: */*' \
	  -H 'Sec-Fetch-Site: same-origin' \
	  -H 'Sec-Fetch-Mode: no-cors' \
	  -H 'Sec-Fetch-Dest: script' \
	  -H 'Referer: https://shop.m.jd.com/shopv2/mzpage?venderId=1000017162&_fd=jdm' \
		-H 'Accept-Language: zh-CN,zh;q=0.9' > "/home/myid/all_shop_info/${1}/shopmemberinfo.json" || rm -rvf "/home/myid/all_shop_info/${1}" | log_d -
	if [ -d "/home/myid/all_shop_info/${1}" ]; then
		jq -r '.shopName' "/home/myid/all_shop_info/${1}/shopmemberinfo.json"
	fi
}

filer_shopurl() {
	echo -e "$1" | egrep 'shopurl|toShopLink' | sed -r -e 's,[ ]+,,' | sort | uniq
}

filer_venderId() {
	cat "$1" | sed -r -e 's,.*venderId=,,' -e 's,&.*,,' | sort | uniq	
}

check_sign() {
	echo "新店铺 $(cat "$1" | wc -l) 个"
	for i in $(cat "$1"); do
		echo "check vender: $i -> $(get_shopmemberinfo $i)"
		get_sign "$i"  | tee -a log/sign.tmp
	done
}

search_shop_count() {
	shop_count=$(search_shop "$1" 5 1 | sed -r -e '/shop_logo/s,\,,,' | jq -r '.summary.shop_count')
}

search_shop() {
	curl -sS -k "https://wqsou.jd.com/shopsearch/mshopsearch?sort_type=sort_mobile_shop_desc&pagesize=${2}&page=${3}&callback=jdSearchShopResultCbA&filt_type=not_cid1,L4053M4053;not_cid1,L4938M4938;not_cid1,L5272M5272;not_cid1,L7191M7191;not_cid1,L7192M7192;not_cid1,L9259M9259;not_cid1,L9669M9669;not_cid1,L12367M12367;not_cid1,L12473M12473;not_cid1,L13314M13314;not_cid1,L13678M13678;not_cid1,L13765M13765" \
	  -H 'authority: wqsou.jd.com' \
	  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36 QBCore/4.0.1316.400 QQBrowser/9.0.2524.400 Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2875.116 Safari/537.36 NetType/WIFI MicroMessenger/7.0.20.1781(0x6700143B) WindowsWechat' \
	  -H 'accept: */*' \
	  -H 'sec-fetch-site: same-site' \
	  -H 'sec-fetch-mode: no-cors' \
	  -H 'sec-fetch-dest: script' \
	  -H 'referer: https://wqs.jd.com/' \
	  -H 'accept-language: zh-CN,zh;q=0.9' \
	  --get --data-urlencode "key=${1}" \
	  | sed -r -e 's,^[^\(]+\(,,' -e 's,\),,'
}

filer_venderId_from_shop() {
	echo -e "$result" | egrep 'vender_id' | cut -d '"' -f 4
}



#result=$(search "$key")
#filer_shopurl "$result" > shopurl.tmp
#for i in $(seq 1 100); do
#	result=$(search_page "$key" $i)
#	filer_shopurl "$result" >> shopurl.tmp
#	sleep 1
#done
#filer_venderId shopurl.tmp > venderId.tmp
#check_sign venderId.tmp
#| sed -r -e '/shop_logo/s,\,,,' -e '/"shop_name"/d' -e '/"shop_brief"/d' | jq -c '.shops[]|{shop_id, vender_type, vender_id}'

mkdir -vp /home/myid/all_shop_info
if [ -f "$1" ]; then
	echo "search $1 sign"
	source "$1" || error "source $1 error"
	[ ! -z "$venderId" ] || error "venderId error from $1"
	echo "check vender: $venderId -> $(get_shopmemberinfo $venderId)"
	get_sign "$venderId"
else
	unset shop_count; unset page_c
	key="$1"
	search_shop_count "$key"
	[ ! -z "$shop_count" ] || error "shop_count is empty"
	page_c=$((shop_count/300))
	echo "搜索 [$key] 找到 $shop_count 个店铺. 分成 $page_c 页浏览"
	for index in $(seq 1 $page_c); do 
		search_shop "$key" 300 $index | egrep 'vender_id' | cut -d '"' -f 4
	done | sort | uniq > log/shop.tmp
	
	if [ -f "log/all_shop.tmp" ]; then
		(cat log/all_shop.tmp log/shop.tmp | sort | uniq -u; cat log/shop.tmp) | sort | uniq -d > log/shop2.tmp
		mv -vf log/shop2.tmp log/shop.tmp
	else
		cp -rvf log/shop.tmp log/all_shop.tmp
	fi
	cat log/all_shop.tmp log/shop.tmp | sort | uniq > log/shop2.tmp
	mv -vf log/shop2.tmp log/all_shop.tmp
	check_sign log/shop.tmp
	
	cat log/sign.tmp | sort | uniq > log/shop2.tmp
	mv -vf log/shop2.tmp log/sign.tmp
	echo "从 $(cat log/all_shop.tmp | wc -l) 个店铺中，已发现 $(cat log/sign.tmp | wc -l) 个活动"
fi
exit 
