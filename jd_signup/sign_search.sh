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

if true; then
./search.sh 牛奶
./search.sh 奶粉
./search.sh 计生
./search.sh 母婴
./search.sh 美妆
./search.sh 个护
./search.sh 清洁
./search.sh 酒水
./search.sh 饮料
./search.sh 运动

./search.sh 手机
./search.sh 数码
./search.sh 电脑
./search.sh 办公
./search.sh 家用
./search.sh 电器
./search.sh 护肤
./search.sh 汽车
./search.sh 生活

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
fi

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


IFS=$old_IFS
