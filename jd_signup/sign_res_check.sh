#!/bin/bash
set -e

check_if_have_fail_h5() {
	local dd=$(date +"%Y%m%d")	
	local configs="config\nconfig2"
		
	for tt in $(find api_vender/ -type f | egrep -v '_del$|_fq$'); do
		unset vendername; unset url
		source $tt
		if [ -z "$url" ] ; then
			local msg_="签到 [$vendername] 店铺有问题 $tt 活动链接\n"
		else
			local msg_="签到 [$vendername] 店铺有问题 $tt 活动链接\n$url\n"
		fi
		local err_=
		
		for kk in $(echo -e "$configs"); do
			unset pt_pin1; unset pin1_name; unset pt_pin2; unset pin2_name
			source $kk
						
			local bb=$(mktemp)
			sed -r -n '/#.* '${pt_pin1}' sign_res$/,/#.* '${pt_pin1}' sign_res_end$/p' "$tt" > $bb
			unset giftDate; unset giftRes; unset sign_num; unset sign_total_num
			source $bb
			rm -rf $bb
			
			if [ "$giftDate" != "$dd" ] || [ "$giftRes" != "ok" ]; then
				local err_="$err_$pin1_name ${pt_pin1} 签到失败: $giftRes\n"
			fi
			if [ "$sign_num" = "" ]; then
				local err_="$err_$pin1_name ${pt_pin1} 获取签到结果失败\n"
			fi
			
			if [ ! -z "$pt_pin2" ]; then
				local bb=$(mktemp)
				sed -r -n '/#.* '${pt_pin2}' sign_res$/,/#.* '${pt_pin2}' sign_res_end$/p' "$tt" > $bb
				unset giftDate; unset giftRes
				source $bb
				rm -rf $bb
				if [ "$giftDate" != "$dd" ] || [ "$giftRes" != "ok" ]; then
					local err_="$err_$pin2_name ${pt_pin2} 签到失败: $giftRes\n"
				fi
				if [ "$sign_num" = "" ]; then
					local err_="$err_$pin2_name ${pt_pin2} 获取签到结果失败\n"
				fi
			fi
		done
		unset kk
		if [ ! -z "$err_" ]; then
			log_s "$msg_$err_"
		fi
	done
	unset tt
}

check_if_have_fail_lzkj() {
	local dd=$(date +"%Y%m%d")
		
	for tt in $(find lzkj_sevenDay_vender/ vender/ -type f | egrep -v '_del$|_fq$'); do
		unset vendername; unset url
		source $tt
		if [ -z "$url" ] ; then
			local msg_="签到 [$vendername] 店铺有问题 $tt 活动链接\n"
		else
			local msg_="签到 [$vendername] 店铺有问题 $tt 活动链接\n$url\n"
		fi
		local err_=
		
		for kk in $(find config_/ -type f); do
			unset pt_pin; unset pin_name
			source $kk
			
			local bb=$(mktemp)
			sed -r -n '/#.* '${pt_pin}' sign_res$/,/#.* '${pt_pin}' sign_res_end$/p' "$tt" > $bb
			unset giftDate; unset giftRes; unset sign_num; unset sign_total_num
			source $bb
			rm -rf $bb
			
			if [ "$giftDate" != "$dd" ] || [ "$giftRes" != "ok" ]; then
				local err_="$err_$pin_name ${pt_pin} 签到失败: $giftRes\n"
				if [ "$1" = "batch" ]; then
					echo "[sign fail] $tt"
				fi
			fi
			if [ "${tt:0:7}" = "vender/" ]; then
				if [ "$sign_num" = "" ] || [ "$sign_total_num" = "" ]; then
					local err_="$err_$pin_name ${pt_pin} 获取签到结果失败\n"
				fi
			else
				if [ "$sign_num" = "" ]; then
					local err_="$err_$pin_name ${pt_pin} 获取签到结果失败\n"
				fi
			fi
		done
		unset kk
		if [ ! -z "$err_" ]; then
			log_s "$msg_$err_"
		fi
	done
	unset tt
}

check_del_vender() {
	local dd=$(grep -r '活动已结束' log/now log/delay log/jifen | sed -r -e 's,.*活动已结束.,,' | sort | uniq)
	if [ -z "$dd" ]; then
		log_s "\n检查是否有删除的活动"
	else
		log_s "\n检查是否有删除的活动\n$dd"
	fi
}

check_if_have_fail() {
	check_if_have_fail_h5
	check_if_have_fail_lzkj "$1"
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
	check_del_vender
	
	log_s "\nh5签到总数 $(find api_vender/ -type f | egrep -v '_del$|_fq$' | wc -l)"	
}

cd /home/myid/jd/jd_signup/
source common.sh
log_s "\n\n* * * * * * * * * * * * * * * * * *\n记录时刻 $(date +"%Y%m%d_%H%M%S_%N")\n"
if [ "$1" = "checkfail" ]; then
	check_if_have_fail "$2"
elif [ ! -z "$1" ]; then
	if_chang_delay "$1"
else
	check_res >> log/common_$(date +"%Y%m%d").log 2>&1
fi
