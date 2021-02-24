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
				echo "1giftRes: a$giftRes"b"$giftDate"--"$dd"
				local err_="$err_$pin1_name ${pt_pin1} 签到失败: $giftDate -- > $giftRes\n"
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
					echo "2giftRes: c$giftRes"d"$giftDate"--"$dd"
					local err_="$err_$pin2_name ${pt_pin2} 签到失败: $giftDate -- > $giftRes\n"
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
				local err_="$err_$pin_name ${pt_pin} 签到失败: $giftDate -- > $giftRes\n"
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
		log_s "\n检查是否有删除的活动\n"
	else
		log_s "\n检查是否有删除的活动\n$dd\n"
	fi
}

check_if_have_fail() {
	check_if_have_fail_h5
	#check_if_have_fail_lzkj "$1"
}

check_gift() {
	local dd=$(date +"%Y%m%d")
	log_s "\n检查今天签到获得的奖励"
	
	for i in $((grep -r 'giftDate="'$dd'"' api_vender/ lzkj_sevenDay_vender/ vender | cut -d ':' -f 1 | sort | uniq
	grep -r 'giftName=' api_vender/ lzkj_sevenDay_vender/ vender | egrep -v 'giftName="null"$|giftName=""$' | cut -d ':' -f 1 | sort | uniq) | sort | uniq -d); do
    unset vendername; unset url
    source "$i"
    if [ -z "$url" ] ; then
			log_s "签到 [$vendername] 店铺获得奖励 $i 活动链接"
		else
			log_s "签到 [$vendername] 店铺获得奖励 $i 活动链接\n$url"
		fi
    local ss=$(awk 'BEGIN {b=0} {
      if($0~/#.* sign_res$/) {a=1;b++;c=$0;sub(" sign_res", "", c)} else if($0~/#.* sign_res_end$/) {a=0}; if(a==1)
      {
        if ($0~/^giftName=/ && $0!~/^giftName=""$/ && $0!~/^giftName="null"$/) {
          s=$0;sub("giftName=", "", s)
          print c" 获得奖励: "s
        }
      }
		}' "$i")
  	log_s "$ss\n"
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
	check_del_vender
	check_gift
	
	log_s "\nh5签到总数 $(find api_vender/ -type f | egrep -v '_del$|_fq$' | wc -l)"	
}

makenow() {
	log_s "\n显示立即执行的任务"
	local ss=$(grep -r '^pt_pin1=' config_h5/ | sed -r -e 's,config_h5/(.*):pt_pin1=["](.*)["],\1|\2,')	
	local now_=$(sed '/^显示立即执行的任务/,$d' log/common_$(date +"%Y%m%d").log | egrep '[[]SHELL[]]' | sed -r -e 's,^[[]SHELL[]]\|,,')
	log_s "$now_"
	
	local now_ex=$(for kt in $(echo -e "$now_" | sed -r -e 's,^[[]SHELL[]]\|,,'); do
		local sign_ven=$(echo "$kt" | cut -d '|' -f 2)
		for ty in $(echo "$kt" | cut -d '|' -f 1 | sed -r -e 's,;,\n,g'); do
			echo "$ty|$sign_ven"
		done
		unset ty
	done	
	unset kt)
	local now_len=$(echo -e "$now_ex" | wc -l)
	
	for mt in $(echo -e "$ss"); do
		local m1=$(echo $mt | cut -d '|' -f 1)
		local m2=$(echo $mt | cut -d '|' -f 2)
		#echo $m1 $m2
		local now_ex=$(echo -e "$now_ex" | sed -r -e "s,.*$m2,$m1," )
	done
	unset mt
	log_s "\n替换成pt_pin后的任务\n$(echo -e "$now_ex")"
	if [ "$(echo -e "$now_ex" | wc -l)" != "$now_len" ]; then
		error "makenow error. 替换pt_pin的数量不一致"
	fi	
	local now_ex_h=$(echo -e "$now_ex" | sed -r -e "/\|api_vender\//s,^config04\|,config2|," \
	-e "/\|api_vender\//s,^config03\|,config2|," -e "/\|api_vender\//s,^config01\|,config|," -e "/\|api_vender\//s,^config02\|,config|," \
	-e "/\|vender\/|\|lzkj_sevenDay_vender\//s,^config01\|,config_/config_01|," -e "/\|vender\/|\|lzkj_sevenDay_vender\//s,^config02\|,config_/config_02|," \
	-e "/\|vender\/|\|lzkj_sevenDay_vender\//s,^config03\|,config_/config_03|," -e "/\|vender\/|\|lzkj_sevenDay_vender\//s,^config04\|,config_/config_04|," \
	| sort | uniq | sort -t '|' -k 2,2)
	log_s "\n合并后的立即执行的任务\n$(echo -e "$now_ex_h")"
	local vend=$(echo -e "$now_ex_h" | cut -d '|' -f 2 | sort | uniq)
	#echo
	#echo -e "$vend"
	#echo
	local all_v_all_p=$(echo -e "$vend" | sed -r -e '/api_vender\//s,^,config2|,';
	echo -e "$vend" | sed -r -e '/api_vender\//s,^,config|,';
	echo -e "$vend" | sed -r -e '/^vender\//s,^,config_/config_01|,';
	echo -e "$vend" | sed -r -e '/^vender\//s,^,config_/config_02|,';
	echo -e "$vend" | sed -r -e '/^vender\//s,^,config_/config_03|,';
	echo -e "$vend" | sed -r -e '/^vender\//s,^,config_/config_04|,';
	echo -e "$vend" | sed -r -e '/^lzkj_sevenDay_vender\//s,^,config_/config_01|,';
	echo -e "$vend" | sed -r -e '/^lzkj_sevenDay_vender\//s,^,config_/config_02|,';
	echo -e "$vend" | sed -r -e '/^lzkj_sevenDay_vender\//s,^,config_/config_03|,';
	echo -e "$vend" | sed -r -e '/^lzkj_sevenDay_vender\//s,^,config_/config_04|,')
	local delay_v=$(echo -e "$all_v_all_p\n$now_ex_h" | sort | uniq -u | sort -t '|' -k 2,2)
	log_s "\n延迟执行的任务\n$(echo -e "$delay_v")"
	
	run_shell=run_shell.sh
	cat run_header.sh > $run_shell
	echo 'log_f=$(date +"%Y%m%d_%H%M%S_%N")' >> $run_shell
	
	local RANDOM_nums=(5 10 15 20 25 30 35 40 45)
	local RANDOM_len=$(echo ${#RANDOM_nums[@]})
	local index=0
	for ii in $(echo -e "$now_ex_h"); do
		local cf=$(echo $ii | cut -d '|' -f 1)
		local vv=$(echo $ii | cut -d '|' -f 2)
		local vv_v=$(echo $vv | cut -d '/' -f 2)
		if [ "${vv:0:10}" = "api_vender" ]; then
			echo "date +\"%x %X %N %s\""
			echo "bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/$cf /home/myid/jd/jd_signup/$vv ${RANDOM_nums[$((index%RANDOM_len))]} \$1 > /home/myid/jd/jd_signup/log/now/${cf}_${vv_v}_\${log_f}.log 2>&1 &"
			let index++ || true
		elif [ "${vv:0:6}" = "vender" ]; then
			local cf_f=$(echo $cf | cut -d '/' -f 2)
			echo "date +\"%x %X %N %s\""
			echo "bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/$cf /home/myid/jd/jd_signup/$vv ${RANDOM_nums[$((index%RANDOM_len))]} \$1 > /home/myid/jd/jd_signup/log/now/${cf_f}_${vv_v}_\${log_f}.log 2>&1 &"
			let index++ || true
		elif [ "${vv:0:20}" = "lzkj_sevenDay_vender" ]; then
			local cf_f=$(echo $cf | cut -d '/' -f 2)
			echo "date +\"%x %X %N %s\""
			echo "bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/$cf /home/myid/jd/jd_signup/$vv ${RANDOM_nums[$((index%RANDOM_len))]} \$1 > /home/myid/jd/jd_signup/log/now/${cf_f}_${vv_v}_\${log_f}.log 2>&1 &"
			let index++ || true
		fi
	done >> $run_shell
	unset ii

	run_shell_delay=run_shell_delay.sh
	sed -i -r '/## add by sign_res_check.sh/,$d' $run_shell_delay
	echo "## add by sign_res_check.sh" >> $run_shell_delay
	for ii in $(echo -e "$delay_v"); do
		local cf=$(echo $ii | cut -d '|' -f 1)
		local vv=$(echo $ii | cut -d '|' -f 2)
		local vv_v=$(echo $vv | cut -d '/' -f 2)
		if [ "${vv:0:10}" = "api_vender" ]; then
			echo "sleep 1"
			echo "bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/$cf /home/myid/jd/jd_signup/$vv ${RANDOM_nums[$((index%RANDOM_len))]} \$1 > /home/myid/jd/jd_signup/log/delay/${cf}_${vv_v}_\${log_f}.log 2>&1 &"
			let index++ || true
		elif [ "${vv:0:6}" = "vender" ]; then
			local cf_f=$(echo $cf | cut -d '/' -f 2)
			echo "sleep 1"
			echo "bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/$cf /home/myid/jd/jd_signup/$vv ${RANDOM_nums[$((index%RANDOM_len))]} \$1 > /home/myid/jd/jd_signup/log/delay/${cf_f}_${vv_v}_\${log_f}.log 2>&1 &"
			let index++ || true
		elif [ "${vv:0:20}" = "lzkj_sevenDay_vender" ]; then
			local cf_f=$(echo $cf | cut -d '/' -f 2)
			echo "sleep 1"
			echo "bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/$cf /home/myid/jd/jd_signup/$vv ${RANDOM_nums[$((index%RANDOM_len))]} \$1 > /home/myid/jd/jd_signup/log/delay/${cf_f}_${vv_v}_\${log_f}.log 2>&1 &"
			let index++ || true
		fi
	done >> $run_shell_delay
	unset ii
	
	echo
	echo "show $run_shell" 
	cat $run_shell
	#echo
	#echo "show $run_shell_delay" 
	#cat $run_shell_delay
	
#	bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config2 /home/myid/jd/jd_signup/api_vender/ZJUZ 5 $1 > /home/myid/jd/jd_signup/log/now/config2_ZJUZ_${log_f}.log 2>&1 &
#  bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config2 /home/myid/jd/jd_signup/api_vender/ZJUZ 5 $1 > /home/myid/jd/jd_signup/log/now/config2_ZJUZ_${log_f}.log 2>&1 &
#  bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/mengniu 25 $1 > /home/myid/jd/jd_signup/log/now/config_01_mengniu_${log_f}.log 2>&1 &
#  bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/mengniu 25 $1 > /home/myid/jd/jd_signup/log/now/config_01_mengniu_${log_f}.log 2>&1 &
#  bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/vender/shop_1613048969_0 40 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1613048969_0_${log_f}.log 2>&1 &
#  bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/vender/shop_1613048969_0 40 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1613048969_0_${log_f}.log 2>&1 &
#	config2|api_vender/ZJUZ
}


sign_base_dir=/home/myid/jd/jd_signup
cd $sign_base_dir
source common.sh
log_s "\n\n* * * * * * * * * * * * * * * * * *\n记录时刻 $(date +"%Y%m%d_%H%M%S_%N")\n"
if [ "$1" = "makenow" ]; then
	makenow
elif [ "$1" = "checkgift" ]; then
	check_gift
elif [ "$1" = "checkfail" ]; then
	check_if_have_fail "$2"
elif [ "$1" = "-q" ]; then
	check_res
elif [ ! -z "$1" ]; then
	if_chang_delay "$1"
else
	check_res >> log/common_$(date +"%Y%m%d").log 2>&1
	makenow >> log/common_$(date +"%Y%m%d").log 2>&1
fi
