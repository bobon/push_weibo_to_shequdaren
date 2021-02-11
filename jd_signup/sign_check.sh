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


mkdir -vp log
old_venderId=$(grep -r '^venderId=' vender api_vender lzkj_sevenDay_vender | egrep -v '_del:|_fq:' | cut -d ':' -f 2 | sed -r -e 's,",,g' | sort | uniq)

num=0
for i in $(find shop/ -name shop -type f); do
	echo "check sign $i"
	flag=""
	if [ $(grep '^url=' "$i" | egrep 'api.m.jd.com|h5.m.jd.com'>/dev/null;echo $?) -eq 0 ]; then
		bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config_check $i now > log/tmp
		flag=api_vender
	elif [ $(grep '^url=' "$i" | grep 'lzkj-isv.isvjcloud.com/sign/sevenDay'>/dev/null;echo $?) -eq 0 ]; then
		bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 $i now > log/tmp
		flag=lzkj_sevenDay_vender
	elif [ $(grep '^url=' "$i" | grep 'lzkj-isv.isvjcloud.com/sign/signActivity'>/dev/null;echo $?) -eq 0 ]; then
		bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_03 $i now > log/tmp
		flag=vender
	else
		error "not find process fun." 
	fi
	#continue
	
	#cat log/tmp
	if [ $(egrep '当前不存在有效的活动|活动已结束|活动已经结束|会员才能参加活动|该活动已经不存在' log/tmp>/dev/null;echo $?) -eq 0 ]; then
		mv -vf "$i" "${i}_del"
		echo "发现不存在的活动. $i --> ${i}_del"
	else
		t=$(grep '^venderId=' "$i" | cut -d ':' -f 2 | sed -r -e 's,",,g' | cut -d '=' -f 2)
		echo check $t
		if [ $(echo -e "$old_venderId" | grep "=$t">/dev/null;echo $?) -ne 0 ]; then
			echo "发现未签到的活动. $i --> $flag"
			cp -rvf "$i" "$flag/shop_$(date '+%s')_${num}_delay"
			let num++ || true
		fi
	fi
done

old_venderId=$(grep -r '^venderId=' vender api_vender lzkj_sevenDay_vender | egrep -v '_del:|_fq:' | cut -d ':' -f 2 | sed -r -e 's,",,g' | sort | uniq)
new_venderId=$(grep -r '^venderId=' shop --include=shop | cut -d ':' -f 2 | sed -r -e 's,",,g')
echo "check find un_check:"
(echo -e "$old_venderId\n$new_venderId" | sort | uniq -u; echo -e "$new_venderId") | sort | uniq -d
echo "未签到的活动:"
find ./ -name 'shop_[0-9]*_delay'
