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

cd $sign_base_dir
./search.sh 牛奶
./search.sh 奶粉
./search.sh 计生
./search.sh 母婴
./search.sh 母婴
./search.sh 个护
./search.sh 清洁
./search.sh 酒水
./search.sh 饮料
./search.sh 运动





IFS=$old_IFS
