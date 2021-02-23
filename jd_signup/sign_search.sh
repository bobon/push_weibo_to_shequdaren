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

ERRTRAP() {
  log_error "RUN $u31_2_ume_sh at $1 ERROR CODE: $?"
}
trap 'ERRTRAP {$LINENO:${FUNCNAME[0]}\<--${FUNCNAME[1]}}' ERR

log_d() {
	if [ "$1" = "-" ]; then
    cat $1 >&2
  else
		echo -e "$1" >&2
	fi
}

cd $sign_base_dir

if [ "$1" != "nosearch" ]; then
./search.sh 牛奶 || true
./search.sh 奶粉 || true
./search.sh 计生 || true
./search.sh 母婴 || true
./search.sh 美妆 || true
./search.sh 个护 || true
./search.sh 清洁 || true
./search.sh 酒水 || true
./search.sh 饮料 || true
./search.sh 运动 || true

./search.sh 手机 || true
./search.sh 数码 || true
./search.sh 电脑 || true
./search.sh 办公 || true
./search.sh 家用 || true
./search.sh 电器 || true
./search.sh 护肤 || true
./search.sh 汽车 || true
./search.sh 生活 || true
./search.sh 服装 || true
./search.sh 鞋 || true
./search.sh 童装 || true
./search.sh 图书 || true
./search.sh 音像 || true
./search.sh 运动 || true
./search.sh 户外 || true
./search.sh 内衣 || true
./search.sh 配饰 || true
./search.sh 食品 || true
./search.sh 生鲜 || true
fi

cat log/sign.tmp | sed -r -e 's,^",,' -e 's,"$,,' >> locations/locations
rm -rvf $sign_base_dir/log/batch_parse_find_new_vender.tmp
for s_f in $(cat log/sign.tmp | sed -r -e 's,^",,' -e 's,"$,,' | egrep '/sign/sevenDay/signActivity|/sign/signActivity|/babelDiy/Zeus/'); do
	./parse.sh "$s_f" batch_pro || true
done
unset s_f
echo "批量处理发现的新活动汇总"
if [ -f "$sign_base_dir/log/batch_parse_find_new_vender.tmp" ]; then
	cat $sign_base_dir/log/batch_parse_find_new_vender.tmp
fi
echo "所有活动数量(locations): $(cat locations/locations | wc -l)"

./sign_check.sh | tee log/sign_check

for kk in $(find api_vender_pre/ -type f); do
	unset actRule
	source $kk
	if [ $(echo -e "$actRule" | grep '京豆' >/dev/null;echo $?) -eq 0 ]; then
		echo -e "$kk\n$actRule"
	else
		#rm -rvf $kk
		echo "没京豆的店 $kk"
	fi
done
unset kk

for jt in $(./sign_res_check.sh checkfail batch | grep '[[]sign fail[]]' | sed -r -e 's,^\[sign fail\] ,,' | sort | uniq); do
	echo $jt
	if [ "${jt:0:7}" = "vender/" ]; then
		bash lzkj_isv_signUp.sh config_/config_01 "$sign_base_dir/$jt" now
		bash lzkj_isv_signUp.sh config_/config_02 "$sign_base_dir/$jt" now
		bash lzkj_isv_signUp.sh config_/config_03 "$sign_base_dir/$jt" now
		bash lzkj_isv_signUp.sh config_/config_04 "$sign_base_dir/$jt" now
	elif [ "${jt:0:21}" = "lzkj_sevenDay_vender/" ]; then
		bash lzkj_isv_signUp_7.sh config_/config_01 "$sign_base_dir/$jt" now
		bash lzkj_isv_signUp_7.sh config_/config_02 "$sign_base_dir/$jt" now
		bash lzkj_isv_signUp_7.sh config_/config_03 "$sign_base_dir/$jt" now
		bash lzkj_isv_signUp_7.sh config_/config_04 "$sign_base_dir/$jt" now
	else
		error "not support sign $jt"
	fi
done
unset jt
./sign_res_check.sh checkfail

IFS=$old_IFS
