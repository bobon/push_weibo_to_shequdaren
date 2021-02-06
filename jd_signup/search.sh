set -e

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
	curl -sS -k "https://shop.m.jd.com/mshop/QueryShopMemberInfoJson?venderId=${1}" \
	  -H 'Connection: keep-alive' \
	  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36 QBCore/4.0.1316.400 QQBrowser/9.0.2524.400 Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2875.116 Safari/537.36 NetType/WIFI MicroMessenger/7.0.20.1781(0x6700143B) WindowsWechat' \
	  -H 'Accept: */*' \
	  -H 'Sec-Fetch-Site: same-origin' \
	  -H 'Sec-Fetch-Mode: no-cors' \
	  -H 'Sec-Fetch-Dest: script' \
	  -H 'Referer: https://shop.m.jd.com/shopv2/mzpage?venderId=1000017162&_fd=jdm' \
		-H 'Accept-Language: zh-CN,zh;q=0.9' \
		| jq -r '.shopName'
}

filer_shopurl() {
	echo -e "$1" | egrep 'shopurl|toShopLink' | sed -r -e 's,[ ]+,,' | sort | uniq
}

filer_venderId() {
	cat "$1" | sed -r -e 's,.*venderId=,,' -e 's,&.*,,' | sort | uniq	
}

check_sign() {
	for i in $(cat "$1"); do
		echo "check vender: $i -> $(get_shopmemberinfo $i)"
		get_sign "$i"
	done
}

search_shop() {
	curl -sS -k "https://wqsou.jd.com/shopsearch/mshopsearch?sort_type=sort_mobile_shop_desc&pagesize=${2}&callback=jdSearchShopResultCbA" \
	  -H 'Connection: keep-alive' \
	  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36 QBCore/4.0.1316.400 QQBrowser/9.0.2524.400 Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2875.116 Safari/537.36 NetType/WIFI MicroMessenger/7.0.20.1781(0x6700143B) WindowsWechat' \
	  -H 'Accept: */*' \
	  -H 'Sec-Fetch-Site: same-site' \
	  -H 'Sec-Fetch-Mode: no-cors' \
	  -H 'Sec-Fetch-Dest: script' \
	  -H 'Referer: https://wqs.jd.com/' \
	  -H 'Accept-Language: zh-CN,zh;q=0.9' \
	  --get --data-urlencode "key=${1}" \
	  | sed -r -e 's,^[^\(]+\(,,' -e 's,\),,'
}

filer_venderId_from_shop() {
	echo -e "$result" |  egrep 'vender_id' | cut -d '"' -f 4
}


pagesize=100
page=1
result=$(search_shop "奶粉" $pagesize $page)
filer_venderId_from_shop "$result" > shop.tmp
check_sign shop.tmp
exit 

result=$(search "奶粉")
filer_shopurl "$result" > shopurl.tmp
for i in $(seq 500 600); do
	result=$(search_page "奶粉" $i)
	filer_shopurl "$result" >> shopurl.tmp
	sleep 1
done
filer_venderId shopurl.tmp > venderId.tmp
check_sign venderId.tmp
