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

ERRTRAP() {
  log_error "RUN $u31_2_ume_sh at $1 ERROR CODE: $?"
}
trap 'ERRTRAP {$LINENO:${FUNCNAME[0]}\<--${FUNCNAME[1]}}' ERR

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
		if [ "$flush" = "true" ]; then
			echo "[WARN] 重复的店铺 /home/myid/all_shop_info/${1}"
		else
			error "重复的店铺 /home/myid/all_shop_info/${1}"
		fi
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


sign_list() {
	rm -rvf log/batch_parse_find_new_vender.tmp
	if [ "$2" = one ]; then
		for s_f in $(cat $1 | sed -n 1p); do
			if [ $(echo "$s_f" | egrep 'isv.isvjcloud.com'>/dev/null;echo $?) -eq 0 ]; then
				bash parse.sh "$s_f" batch_pro -f
			else
				bash parse.sh "$s_f" batch_pro -f || true
			fi
		done
	else
		for s_f in $(cat $1); do
			if [ $(echo "$s_f" | egrep 'isv.isvjcloud.com'>/dev/null;echo $?) -eq 0 ]; then
				bash parse.sh "$s_f" batch_pro -f
			else
				bash parse.sh "$s_f" batch_pro -f || true
			fi
			sleep 2
		done
	fi	
	unset s_f
	
	if [ -f "log/batch_parse_find_new_vender.tmp" ]; then
		new_s=""
		num=0
		for s_f in $(cat log/batch_parse_find_new_vender.tmp); do
			key=$(echo "$s_f" | sed -r -e 's,shop/,,')
			echo "process $key"
			kt=$s_f/shop
			if [ ! -f "$kt" ]; then continue; fi
			if [ $(grep '^url=' "$kt" | egrep 'api.m.jd.com|h5.m.jd.com'>/dev/null;echo $?) -eq 0 ]; then				
				egrep -r "^token=$key|^token=\"$key" api_vender | grep -v '_del:' && continue || true
				flag=api_vender_pre
				new_v="$sign_base_dir/$flag/shop_$(date '+%s')_${num}_delay"
				cp -rvf "$kt" "$new_v"
			elif [ $(grep '^url=' "$kt" | grep 'lzkj-isv.isvjcloud.com/sign/sevenDay'>/dev/null;echo $?) -eq 0 ]; then
				egrep -r "^actId=$key|^actId=\"$key" lzkj_sevenDay_vender | grep -v '_del:' && continue || true
				flag=lzkj_sevenDay_vender
				new_v="$sign_base_dir/$flag/shop_$(date '+%s')_${num}_delay"
				cp -rvf "$kt" "$new_v"
				bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 $new_v 2
				bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_02 $new_v 2
				bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 $new_v 2
				bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 $new_v 2
			elif [ $(grep '^url=' "$kt" | grep 'lzkj-isv.isvjcloud.com/sign/signActivity'>/dev/null;echo $?) -eq 0 ]; then
				egrep -r "^actId=$key|^actId=\"$key" vender | grep -v '_del:' && continue || true
				flag=vender
				new_v="$sign_base_dir/$flag/shop_$(date '+%s')_${num}_delay"
				cp -rvf "$kt" "$new_v"
				bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_01 $new_v 2
				bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_02 $new_v 2
				bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_03 $new_v 2
				bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_04 $new_v 2
			else
				error "not find process fun." 
			fi
			let num++ || true
			new_s="$new_s\n***** 新签到 $new_v"
		done
		unset s_f
		echo -e "$new_s"
	fi	
}


cd $sign_base_dir
mkdir -vp /home/myid/all_shop_info
if [ "$1" = "sign_list" ]; then
	if [ $(cat $sign_base_dir/$1 | grep '^https://'>/dev/null;echo $?) -eq 0 ]; then
		cat $sign_base_dir/$1 | grep '^https://' > $sign_base_dir/sign_list_t
		sign_list $sign_base_dir/sign_list_t $2
	fi
	
	cat $sign_base_dir/$1 | grep -v '^https://' || exit	
	cat $sign_base_dir/$1 | grep -v '^https://' > $sign_base_dir/sign_list_t
	flush=true
	echo "从 sign_vender_list 查找活动. 备份 log/sign.tmp --> log/sign.tmp.bak"
	if [ -f "log/sign.tmp" ]; then
		cp -rvf log/sign.tmp log/sign.tmp.bak_$(date +%s)
	fi
	rm -rvf log/sign.tmp
	
	cat $sign_base_dir/sign_list_t | sort | uniq > log/all_shop_signed.tmp
	
	check_sign log/all_shop_signed.tmp
	cat log/sign.tmp | sort | uniq > log/shop2.tmp
	mv -vf log/shop2.tmp log/sign.tmp
	echo "从 $(cat log/all_shop_signed.tmp | wc -l) 个已签到的店铺中，已发现 $(cat log/sign.tmp | wc -l) 个新活动"
	
	sed -r -e 's,^",,' -e 's,"$,,' log/sign.tmp > $sign_base_dir/sign_list_t
	sign_list $sign_base_dir/sign_list_t $2

elif [ "$1" = "sign_vender_list" ]; then
	flush=true
	echo "从 sign_vender_list 查找活动. 备份 log/sign.tmp --> log/sign.tmp.bak"
	if [ -f "log/sign.tmp" ]; then
		cp -rvf log/sign.tmp log/sign.tmp.bak_$(date +%s)
	fi
	rm -rvf log/sign.tmp
	
	cat sign_vender_list | sort | uniq > log/all_shop_signed.tmp
	
	check_sign log/all_shop_signed.tmp
	cat log/sign.tmp | sort | uniq > log/shop2.tmp
	mv -vf log/shop2.tmp log/sign.tmp
	echo "从 $(cat log/all_shop_signed.tmp | wc -l) 个已签到的店铺中，已发现 $(cat log/sign.tmp | wc -l) 个新活动"
	
	sed -r -e 's,^",,' -e 's,"$,,' log/sign.tmp > $sign_base_dir/sign_list_t
	sign_list $sign_base_dir/sign_list_t
	
elif [ -f "$1" ]; then
	echo "search $1 sign"
	source "$1" || error "source $1 error"
	[ ! -z "$venderId" ] || error "venderId error from $1"
	echo "check vender: $venderId -> $(get_shopmemberinfo $venderId)"
	get_sign "$venderId"
elif [ "$1" = "flush" ]; then
	flush=true
	echo "重新从/home/myid/all_shop.tmp中查找所有活动. 备份 log/sign.tmp --> log/sign.tmp.bak"
	if [ -f "log/sign.tmp" ]; then
		cp -rvf log/sign.tmp log/sign.tmp.bak_$(date +%s)
	fi
	rm -rvf log/sign.tmp
	check_sign /home/myid/all_shop.tmp
	cat log/sign.tmp | sort | uniq > log/shop2.tmp
	mv -vf log/shop2.tmp log/sign.tmp
	echo "从 $(cat /home/myid/all_shop.tmp | wc -l) 个店铺中，已发现 $(cat log/sign.tmp | wc -l) 个活动"
elif [ "$1" = "flush_from_old" ]; then
	flush=true
	echo "重新从 已签到的店铺中 查找新活动. 备份 log/sign.tmp --> log/sign.tmp.bak"
	if [ -f "log/sign.tmp" ]; then
		cp -rvf log/sign.tmp log/sign.tmp.bak_$(date +%s)
	fi
	rm -rvf log/sign.tmp
	
	grep -r '^venderId=' api_vender vender lzkj_sevenDay_vender/ api_vender_pre/ fq_vender/ | cut -d ':' -f 2 | cut -d '=' -f 2 | sort | uniq > log/all_shop_signed.tmp
	
	check_sign log/all_shop_signed.tmp
	cat log/sign.tmp | sort | uniq > log/shop2.tmp
	mv -vf log/shop2.tmp log/sign.tmp
	echo "从 $(cat log/all_shop_signed.tmp | wc -l) 个已签到的店铺中，已发现 $(cat log/sign.tmp | wc -l) 个新活动"
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
	
	if [ -f "/home/myid/all_shop.tmp" ]; then
		(cat /home/myid/all_shop.tmp log/shop.tmp | sort | uniq -u; cat log/shop.tmp) | sort | uniq -d > log/shop2.tmp
		mv -vf log/shop2.tmp log/shop.tmp
	else
		cp -rvf log/shop.tmp /home/myid/all_shop.tmp
	fi
	cat /home/myid/all_shop.tmp log/shop.tmp | sort | uniq > log/shop2.tmp
	mv -vf log/shop2.tmp /home/myid/all_shop.tmp
	check_sign log/shop.tmp
	
	cat log/sign.tmp | sort | uniq > log/shop2.tmp
	mv -vf log/shop2.tmp log/sign.tmp
	echo "从 $(cat /home/myid/all_shop.tmp | wc -l) 个店铺中，已发现 $(cat log/sign.tmp | wc -l) 个活动"
fi
exit 



## 
./search.sh flush_from_old
./sign_search.sh nosearch
./sign_search.sh check_pre | tee log/check_pre.log



##
将url活动链接(不能带两边引号)、h5签到的短连接(不能带两边引号)、或者店铺venderId号写入sign_list, sign_list不能有空行. 比如
https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity?activityId=36a96949aef74f239e4a8b8553518bac&venderId=10142406&sceneval=2&jxsid=16146428113866014329
https://u.jd.com/iNUDG9R
1000002423
然后执行
./search.sh sign_list
如果只处理sign_list第一行，执行
./search.sh sign_list one



##将店铺venderId号写入sign_vender_list，比如
1000002423
然后执行
./search.sh sign_vender_list


##
for i in $(grep -r 'shopId:' shop/ | sed -r -e 's,.*shopId: ,,' -e "s,',,g" -e 's,\,.*,,' | sort | uniq ); do
	curl -sS -k https://shop.m.jd.com/?shopId=$i | egrep '/sign/sevenDay/signActivity|/sign/signActivity|/babelDiy/Zeus/'
done | sed -r -e 's,.*https,https,' -e 's,"\,$,,' -e 's,"$,,' | sort | uniq > sign_list
./search.sh sign_list one  ## 一行行执行

