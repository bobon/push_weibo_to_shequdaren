#!/bin/bash
set -e
set +E
set +x

trap "exit 1" TERM
export TOP_PID=$$

sign_base_dir=/home/myid/jd/jd_signup

log_error() {
	echo -e "\e[0;31;3m${1}\e[0m" "\e[0;31;3m[$(date '+%Y%m%d %H:%M:%S')] [ERROR] \e[0m" >&2
	echo
}

error() {
  log_error "$1"
  kill -s TERM $TOP_PID
}

ERRTRAP() {
  log_error "RUN $u31_2_ume_sh at $1 ERROR CODE: $?"
}
trap 'ERRTRAP {$LINENO:${FUNCNAME[0]}\<--${FUNCNAME[1]}}' ERR

mkdir -vp log
mkdir -vp api_vender_pre
rm -rvf log/check_new_shop
rm -rvf log/check_new_shop.sh
touch log/check_new_shop
num=0
for i in $(find $sign_base_dir/shop/ -name shop -type f); do
	dd=$(dirname "$i")
	echo "check sign $i"
	if [ -f "$dd/checked" ]; then
		echo "checked. continue"
		continue
	fi
	
	flag=""
	if [ $(grep '^url=' "$i" | egrep 'api.m.jd.com|h5.m.jd.com'>/dev/null;echo $?) -eq 0 ]; then
		bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config_check $i now > log/tmp
		flag=api_vender_pre
	elif [ $(grep '^url=' "$i" | grep 'lzkj-isv.isvjcloud.com/sign/sevenDay'>/dev/null;echo $?) -eq 0 ]; then
		bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 $i now > log/tmp
		flag=lzkj_sevenDay_vender
	elif [ $(grep '^url=' "$i" | grep 'lzkj-isv.isvjcloud.com/sign/signActivity'>/dev/null;echo $?) -eq 0 ]; then
		bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_04 $i now > log/tmp
		flag=vender
	else
		error "not find process fun." 
	fi
	#continue
	
	if [ ! -f "$i" ]; then
		cat log/tmp
		echo "$i 已经被删除."
	elif [ $(egrep '当前不存在有效的活动|活动已结束|活动已经结束|该活动已经不存在' log/tmp>/dev/null;echo $?) -eq 0 ]; then
		mv -vf "$i" "${i}_del"
		echo "发现不存在的活动. $i --> ${i}_del"
	else
		t=$(grep '^venderId=' "$i" | cut -d ':' -f 2 | sed -r -e 's,",,g' | cut -d '=' -f 2)
		echo check $t
		if [ $(echo -e "$old_venderId" | grep "=$t">/dev/null;echo $?) -ne 0 ]; then
			echo "发现未签到的活动. $i --> $flag"
			echo "venderId=$t;cp -rvf \"$i\" \"$flag/shop_$(date '+%s')_${num}_delay\"" >> log/check_new_shop
			let num++ || true
		fi
		touch "$dd/checked"
	fi
done

old_venderId=$(grep -r '^venderId=' vender api_vender_pre api_vender lzkj_sevenDay_vender | egrep -v '_del:|_fq:' | cut -d ':' -f 2 | sed -r -e 's,",,g' | sort | uniq)
old_venderId="$old_venderId\n"$(grep -r '^venderId=' fq_vender | cut -d ':' -f 2 | sed -r -e 's,",,g' | sort | uniq)
new_venderId=$(grep -r '^venderId=' shop --include=shop | cut -d ':' -f 2 | sed -r -e 's,",,g')
echo "check find un_check:"
(echo -e "$old_venderId\n$new_venderId" | sort | uniq -u; echo -e "$new_venderId") | sort | uniq -d
echo "未签到的活动:"
find ./ -name 'shop_[0-9]*_delay'

(echo -e "$old_venderId";cat log/check_new_shop) | sort -r -t ';' -k 1,1 | sed -r -e 's,;|$,                                        ,' | uniq -w 40 -u | grep 'cp -rvf' | sed -r -e 's,.*cp,cp,' > log/check_new_shop.sh
echo "将未签到的活动移入签到目录"
bash log/check_new_shop.sh
