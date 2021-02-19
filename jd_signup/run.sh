base_dir=$(dirname $0)
base_dir=$(cd $base_dir;pwd)
cd $base_dir

mkdir -vp $base_dir/log/now
mkdir -vp $base_dir/log/delay
mkdir -vp $base_dir/log/jifen

[ -d "log" ] || mkdir -vp log
log_f=$(date +"%Y%m%d_%H%M%S_%N")
cat run_header.sh > run_shell.sh
echo 'log_f=$(date +"%Y%m%d_%H%M%S_%N")' >> run_shell.sh
echo 'log_f=$(date +"%Y%m%d_%H%M%S_%N")' > run_shell_delay.sh
echo 'log_f=$(date +"%Y%m%d_%H%M%S_%N")' > run_shell_jifen.sh

RANDOM_nums=(5 10 15 20 25 30 35 40 45)
RANDOM_len=$(echo ${#RANDOM_nums[@]})
index=0

for i in $(ls -1 api_vender | grep -v '_del$' | grep -v '_fq$' | egrep -v '_delay$|_jifen$') ; do
	vender_name=$i
	echo date +\"%x %X %N  %s\"
	echo "bash $base_dir/api_m_jd_com.sh $base_dir/config $base_dir/api_vender/$vender_name ${RANDOM_nums[$((index%RANDOM_len))]} \$1 > $base_dir/log/now/config_${vender_name}_\${log_f}.log 2>&1 &"
	let index++
	echo date +\"%x %X %N  %s\"
	echo "bash $base_dir/api_m_jd_com.sh $base_dir/config2 $base_dir/api_vender/$vender_name ${RANDOM_nums[$((index%RANDOM_len))]} \$1 > $base_dir/log/now/config2_${vender_name}_\${log_f}.log 2>&1 &"
	let index++
done >> run_shell.sh

for i in $(ls -1 vender_jinggeng | grep -v '_del$' | egrep -v '_delay$|_jifen$') ; do
	vender_name=$i
	echo date +\"%x %X %N  %s\"
	echo "bash $base_dir/jinggeng_isv_signUp.sh $base_dir/config $base_dir/vender_jinggeng/$vender_name ${RANDOM_nums[$((index%RANDOM_len))]} \$1 > $base_dir/log/now/${vender_name}_\${log_f}.log 2>&1 &"
	let index++
done >> run_shell.sh

for i in $(ls -1 sevenDay_vender | grep -v '_del$' | egrep -v '_delay$|_jifen$') ; do
	vender_name=$i
	echo date +\"%x %X %N  %s\"
	echo "bash $base_dir/cjhy_isv_signUp_7.sh $base_dir/config $base_dir/sevenDay_vender/$vender_name ${RANDOM_nums[$((index%RANDOM_len))]} \$1 > $base_dir/log/now/${vender_name}_\${log_f}.log 2>&1 &"
	let index++
done >> run_shell.sh

for i in $(ls -1 lzkj_sevenDay_vender | grep -v '_del$' | egrep -v '_delay$|_jifen$') ; do
	vender_name=$i
		for j in $(ls -1 config_ | sed '$d'); do		
			conf=$j
			#echo "sleep 0.3"
			echo date +\"%x %X %N  %s\"
			echo "bash $base_dir/lzkj_isv_signUp_7.sh $base_dir/config_/$conf $base_dir/lzkj_sevenDay_vender/$vender_name ${RANDOM_nums[$((index%RANDOM_len))]} \$1 > $base_dir/log/now/${conf}_${vender_name}_\${log_f}.log 2>&1 &"
			let index++
		done
done >> run_shell.sh

#echo "sleep 1" >> run_shell.sh
for i in $(ls -1 vender | grep -v '_del$' | egrep -v '_delay$|_jifen$') ; do
	vender_name=$i
		for j in $(ls -1 config_ | sed '$d'); do		
			conf=$j
			#echo "sleep 0.3"
			echo date +\"%x %X %N  %s\"
			echo "bash $base_dir/lzkj_isv_signUp.sh $base_dir/config_/$conf $base_dir/vender/$vender_name ${RANDOM_nums[$((index%RANDOM_len))]} \$1 > $base_dir/log/now/${conf}_${vender_name}_\${log_f}.log 2>&1 &"
			let index++
		done
done >> run_shell.sh

echo "echo delay start">> run_shell.sh
for i in $(ls -1 lzkj_sevenDay_vender | grep -v '_del$' | egrep -v '_delay$|_jifen$') ; do
	vender_name=$i
		for j in $(ls -1 config_ | sed -n '$p'); do		
			conf=$j
			echo "sleep 0.3"
			echo date +\"%x %X %N  %s\"
			echo "bash $base_dir/lzkj_isv_signUp_7.sh $base_dir/config_/$conf $base_dir/lzkj_sevenDay_vender/$vender_name ${RANDOM_nums[$((index%RANDOM_len))]} \$1 > $base_dir/log/now/${conf}_${vender_name}_\${log_f}.log 2>&1 &"
			let index++
		done
done >> run_shell.sh

#echo "sleep 1" >> run_shell.sh
for i in $(ls -1 vender | grep -v '_del$' | egrep -v '_delay$|_jifen$') ; do
	vender_name=$i
		for j in $(ls -1 config_ | sed -n '$p'); do		
			conf=$j
			echo "sleep 0.3"
			echo date +\"%x %X %N  %s\"
			echo "bash $base_dir/lzkj_isv_signUp.sh $base_dir/config_/$conf $base_dir/vender/$vender_name ${RANDOM_nums[$((index%RANDOM_len))]} \$1 > $base_dir/log/now/${conf}_${vender_name}_\${log_f}.log 2>&1 &"
			let index++
		done
done >> run_shell.sh




for i in $(ls -1 api_vender | grep -v '_del$' | grep -v '_fq$' | grep '_delay$') ; do
	vender_name=$i
	echo "sleep 1"
	echo "bash $base_dir/api_m_jd_com.sh $base_dir/config $base_dir/api_vender/$vender_name ${RANDOM_nums[$((index%RANDOM_len))]} > $base_dir/log/delay/config_${vender_name}_\${log_f}.log 2>&1"
	let index++
	echo "sleep 1"
	echo "bash $base_dir/api_m_jd_com.sh $base_dir/config2 $base_dir/api_vender/$vender_name ${RANDOM_nums[$((index%RANDOM_len))]} > $base_dir/log/delay/config2_${vender_name}_\${log_f}.log 2>&1"
	let index++
done >> run_shell_delay.sh

for i in $(ls -1 vender_jinggeng | grep -v '_del$' | grep '_delay$') ; do
	vender_name=$i
	echo "bash $base_dir/jinggeng_isv_signUp.sh $base_dir/config $base_dir/vender_jinggeng/$vender_name ${RANDOM_nums[$((index%RANDOM_len))]} > $base_dir/log/delay/${vender_name}_\${log_f}.log 2>&1"
	let index++
done >> run_shell_delay.sh

for i in $(ls -1 sevenDay_vender | grep -v '_del$' | grep '_delay$') ; do
	vender_name=$i
	echo "bash $base_dir/cjhy_isv_signUp_7.sh $base_dir/config $base_dir/sevenDay_vender/$vender_name ${RANDOM_nums[$((index%RANDOM_len))]} > $base_dir/log/delay/${vender_name}_\${log_f}.log 2>&1"
	let index++
done >> run_shell_delay.sh

echo "sleep 2" >> run_shell_delay.sh
for i in $(ls -1 vender | grep -v '_del$' | grep '_delay$') ; do
	vender_name=$i
		for j in $(ls -1 config_); do		
			conf=$j
			echo "sleep 2"
			echo "bash $base_dir/lzkj_isv_signUp.sh $base_dir/config_/$conf $base_dir/vender/$vender_name ${RANDOM_nums[$((index%RANDOM_len))]} > $base_dir/log/delay/${conf}_${vender_name}_\${log_f}.log 2>&1 &"
			let index++
		done
done >> run_shell_delay.sh

echo "sleep 2" >> run_shell_delay.sh
for i in $(ls -1 lzkj_sevenDay_vender | grep -v '_del$' | grep '_delay$') ; do
	vender_name=$i
		for j in $(ls -1 config_); do		
			conf=$j
			echo "sleep 2"
			echo "bash $base_dir/lzkj_isv_signUp_7.sh $base_dir/config_/$conf $base_dir/lzkj_sevenDay_vender/$vender_name ${RANDOM_nums[$((index%RANDOM_len))]} > $base_dir/log/delay/${conf}_${vender_name}_\${log_f}.log 2>&1 &"
			let index++
		done
done >> run_shell_delay.sh




for i in $(ls -1 api_vender | grep -v '_del$' | grep -v '_fq$' | grep '_jifen$') ; do
	vender_name=$i
	echo "bash $base_dir/api_m_jd_com.sh $base_dir/config $base_dir/api_vender/$vender_name ${RANDOM_nums[$((index%RANDOM_len))]} > $base_dir/log/jifen/config_${vender_name}_\${log_f}.log 2>&1 &"
	let index++
	echo "sleep 1"
	echo "bash $base_dir/api_m_jd_com.sh $base_dir/config2 $base_dir/api_vender/$vender_name ${RANDOM_nums[$((index%RANDOM_len))]} > $base_dir/log/jifen/config2_${vender_name}_\${log_f}.log 2>&1 &"
	let index++
done >> run_shell_jifen.sh

for i in $(ls -1 vender_jinggeng | grep -v '_del$' | grep '_jifen$') ; do
	vender_name=$i
	echo "bash $base_dir/jinggeng_isv_signUp.sh $base_dir/config $base_dir/vender_jinggeng/$vender_name ${RANDOM_nums[$((index%RANDOM_len))]} > $base_dir/log/jifen/${vender_name}_\${log_f}.log 2>&1 &"
	let index++
done >> run_shell_jifen.sh

for i in $(ls -1 sevenDay_vender | grep -v '_del$' | grep '_jifen$') ; do
	vender_name=$i
	echo "bash $base_dir/cjhy_isv_signUp_7.sh $base_dir/config $base_dir/sevenDay_vender/$vender_name ${RANDOM_nums[$((index%RANDOM_len))]} > $base_dir/log/jifen/${vender_name}_\${log_f}.log 2>&1 &"
	let index++
done >> run_shell_jifen.sh

echo "sleep 2" >> run_shell_jifen.sh
for i in $(ls -1 lzkj_sevenDay_vender | grep -v '_del$' | grep '_jifen$') ; do
	vender_name=$i
		for j in $(ls -1 config_); do		
			conf=$j
			echo "sleep 2"
			echo "bash $base_dir/lzkj_isv_signUp_7.sh $base_dir/config_/$conf $base_dir/lzkj_sevenDay_vender/$vender_name ${RANDOM_nums[$((index%RANDOM_len))]} > $base_dir/log/jifen/${conf}_${vender_name}_\${log_f}.log 2>&1 &"
			let index++
		done
done >> run_shell_jifen.sh

echo "sleep 2" >> run_shell_jifen.sh
for i in $(ls -1 vender | grep -v '_del$' | grep '_jifen$') ; do
	vender_name=$i
		for j in $(ls -1 config_); do		
			conf=$j
			echo "sleep 2"
			echo "bash $base_dir/lzkj_isv_signUp.sh $base_dir/config_/$conf $base_dir/vender/$vender_name ${RANDOM_nums[$((index%RANDOM_len))]} > $base_dir/log/jifen/${conf}_${vender_name}_\${log_f}.log 2>&1 &"
			let index++
		done
done >> run_shell_jifen.sh

#echo "bash $base_dir/other.sh $base_dir/config > $base_dir/log/other_\${log_f}.log 2>&1 &" >> run_shell.sh

echo "
sleep 0.3
date +\"%x %X %N %s\"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/kaxioujingjing_del ${RANDOM_nums[$((index%RANDOM_len))]} > /home/myid/jd/jd_signup/log/now/config_04_kaxioujingjing_\${log_f}.log 2>&1 &
" >> run_shell.sh

echo "
sleep 4
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_dingzhi.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/dingzhi_vender/mengniu_delay ${RANDOM_nums[$((0%RANDOM_len))]} > /home/myid/jd/jd_signup/log/delay/config_01_mengniu_\${log_f}.log 2>&1 &
sleep 2
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_dingzhi.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/dingzhi_vender/mengniu_delay ${RANDOM_nums[$((1%RANDOM_len))]} > /home/myid/jd/jd_signup/log/delay/config_02_mengniu_\${log_f}.log 2>&1 &
sleep 2
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_dingzhi.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/dingzhi_vender/mengniu_delay ${RANDOM_nums[$((2%RANDOM_len))]} > /home/myid/jd/jd_signup/log/delay/config_03_mengniu_\${log_f}.log 2>&1 &
sleep 2
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_dingzhi.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/dingzhi_vender/mengniu_delay ${RANDOM_nums[$((3%RANDOM_len))]} > /home/myid/jd/jd_signup/log/delay/config_04_mengniu_\${log_f}.log 2>&1 &
" >> run_shell_delay.sh
