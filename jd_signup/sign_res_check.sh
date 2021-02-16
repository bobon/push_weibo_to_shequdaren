#!/bin/bash
set -e

check_if_have_fail() {
	for i in $(grep -r 'giftRes=' api_vender/ lzkj_sevenDay_vender/ vender | grep -v '"ok"' | cut -d ':' -f 1 | sort | uniq); do
		unset vendername
		source "$i"
		log_s "签到 [$vendername] 店铺失败. 活动链接 $url"
		local ss=$(awk 'BEGIN {b=0} {
			if($0~/#.* sign_res$/) {a=1;b++;c=$0;sub(" sign_res", "", c)} else if($0~/#.* sign_res_end$/) {a=0}; if(a==1) 
			{
				if ($0~/^giftRes=/ && $0!~/giftRes="ok"/) {
					s=$0;sub("giftRes=", "", s)
					print c" 签到失败: "s
				}
			} 
		}' "$i")		
		log_s "$ss\nfrom $i\n"
	done
}

check_res() {
	for p_f in $(find api_vender/ -type f | egrep -v '_del$|_fq$'); do
		if_chang_delay "$p_f"
	done
	
	for p_f in $(find vender/ -type f | egrep -v '_del$|_fq$'); do
		if_chang_delay "$p_f" #test
	done
	
	for p_f in $(find lzkj_sevenDay_vender/ -type f | egrep -v '_del$|_fq$'); do
		if_chang_delay "$p_f" #test
	done
	log_s ""
	check_if_have_fail
}

source /home/myid/jd/jd_signup/common.sh
if [ "$1" = "checkfail" ]; then
	check_if_have_fail
elif [ ! -z "$1" ]; then
	if_chang_delay "$1"
else
	check_res >/home/myid/jd/jd_signup/log/common_$(date +"%Y%m%d_%H%M%S_%N").log 2>&1
fi