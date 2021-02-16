#!/bin/bash
set -e

check_res() {
	for p_f in $(find api_vender/ -type f | egrep -v '_del$|_fq$'); do
		if_chang_delay "$p_f"
	done

	for p_f in $(find vender/ -type f | egrep -v '_del$|_fq$'); do
		if_chang_delay "$p_f" #test
	done
}

source /home/myid/jd/jd_signup/common.sh
if [ ! -z "$1" ]; then
	if_chang_delay "$1"
else
	check_res >/home/myid/jd/jd_signup/log/common_$(date +"%Y%m%d_%H%M").log 2>&1
fi
