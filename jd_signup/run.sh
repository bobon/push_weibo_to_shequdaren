base_dir=$(dirname $0)
base_dir=$(cd $base_dir;pwd)
cd $base_dir

mkdir -vp $base_dir/log/now
mkdir -vp $base_dir/log/delay
mkdir -vp $base_dir/log/jifen

[ -d "log" ] || mkdir -vp log
echo 'log_f=$(date -d next-day +"%Y%m%d_%H%M")' > run_shell.sh
echo 'log_f=$(date -d next-day +"%Y%m%d_%H%M")' > run_shell_delay.sh
echo 'log_f=$(date -d next-day +"%Y%m%d_%H%M")' > run_shell_jifen.sh


#Ç©µ½À¶ÔÂÁÁ
echo "
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/lanyueliang_del > /home/myid/jd/jd_signup/log/now/config_01_lanyueliang_${log_f}.log 2>&1 &
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/lanyueliang_del > /home/myid/jd/jd_signup/log/now/config_02_lanyueliang_${log_f}.log 2>&1 &
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/lanyueliang_del > /home/myid/jd/jd_signup/log/now/config_03_lanyueliang_${log_f}.log 2>&1 &
" >> run_shell.sh

for i in $(ls -1 api_vender | grep -v '_del$' | grep -v '_fq$' | egrep -v '_delay$|_jifen$') ; do
	vender_name=$i
	echo "bash $base_dir/api_m_jd_com.sh $base_dir/config $base_dir/api_vender/$vender_name > $base_dir/log/now/${vender_name}_\${log_f}.log 2>&1 &"
done >> run_shell.sh

for i in $(ls -1 vender_jinggeng | grep -v '_del$' | egrep -v '_delay$|_jifen$') ; do
	vender_name=$i
	echo "bash $base_dir/jinggeng_isv_signUp.sh $base_dir/config $base_dir/vender_jinggeng/$vender_name > $base_dir/log/now/${vender_name}_\${log_f}.log 2>&1 &"
done >> run_shell.sh

for i in $(ls -1 sevenDay_vender | grep -v '_del$' | egrep -v '_delay$|_jifen$') ; do
	vender_name=$i
	echo "bash $base_dir/cjhy_isv_signUp_7.sh $base_dir/config $base_dir/sevenDay_vender/$vender_name > $base_dir/log/now/${vender_name}_\${log_f}.log 2>&1 &"
done >> run_shell.sh

for i in $(ls -1 lzkj_sevenDay_vender | grep -v '_del$' | egrep -v '_delay$|_jifen$') ; do
	vender_name=$i
		for j in $(ls -1 config_); do		
			conf=$j
			echo "sleep 0.3"
			echo "bash $base_dir/lzkj_isv_signUp_7.sh $base_dir/config_/$conf $base_dir/lzkj_sevenDay_vender/$vender_name > $base_dir/log/now/${conf}_${vender_name}_\${log_f}.log 2>&1 &"
		done
done >> run_shell.sh

#echo "sleep 1" >> run_shell.sh
for i in $(ls -1 vender | grep -v '_del$' | egrep -v '_delay$|_jifen$') ; do
	vender_name=$i
		for j in $(ls -1 config_); do		
			conf=$j
			echo "sleep 0.3"
			echo "bash $base_dir/lzkj_isv_signUp.sh $base_dir/config_/$conf $base_dir/vender/$vender_name > $base_dir/log/now/${conf}_${vender_name}_\${log_f}.log 2>&1 &"
		done
done >> run_shell.sh




for i in $(ls -1 api_vender | grep -v '_del$' | grep -v '_fq$' | grep '_delay$') ; do
	vender_name=$i
	echo "bash $base_dir/api_m_jd_com.sh $base_dir/config $base_dir/api_vender/$vender_name > $base_dir/log/delay/${vender_name}_\${log_f}.log 2>&1"
done >> run_shell_delay.sh

for i in $(ls -1 vender_jinggeng | grep -v '_del$' | grep '_delay$') ; do
	vender_name=$i
	echo "bash $base_dir/jinggeng_isv_signUp.sh $base_dir/config $base_dir/vender_jinggeng/$vender_name > $base_dir/log/delay/${vender_name}_\${log_f}.log 2>&1"
done >> run_shell_delay.sh

for i in $(ls -1 sevenDay_vender | grep -v '_del$' | grep '_delay$') ; do
	vender_name=$i
	echo "bash $base_dir/cjhy_isv_signUp_7.sh $base_dir/config $base_dir/sevenDay_vender/$vender_name > $base_dir/log/delay/${vender_name}_\${log_f}.log 2>&1"
done >> run_shell_delay.sh

echo "sleep 2" >> run_shell_delay.sh
for i in $(ls -1 vender | grep -v '_del$' | grep '_delay$') ; do
	vender_name=$i
		for j in $(ls -1 config_); do		
			conf=$j
			echo "sleep 2"
			echo "bash $base_dir/lzkj_isv_signUp.sh $base_dir/config_/$conf $base_dir/vender/$vender_name > $base_dir/log/delay/${conf}_${vender_name}_\${log_f}.log 2>&1 &"
		done
done >> run_shell_delay.sh

echo "sleep 2" >> run_shell_delay.sh
for i in $(ls -1 lzkj_sevenDay_vender | grep -v '_del$' | grep '_delay$') ; do
	vender_name=$i
		for j in $(ls -1 config_); do		
			conf=$j
			echo "sleep 2"
			echo "bash $base_dir/lzkj_isv_signUp_7.sh $base_dir/config_/$conf $base_dir/lzkj_sevenDay_vender/$vender_name > $base_dir/log/delay/${conf}_${vender_name}_\${log_f}.log 2>&1 &"
		done
done >> run_shell_delay.sh




for i in $(ls -1 api_vender | grep -v '_del$' | grep -v '_fq$' | grep '_jifen$') ; do
	vender_name=$i
	echo "bash $base_dir/api_m_jd_com.sh $base_dir/config $base_dir/api_vender/$vender_name > $base_dir/log/jifen/${vender_name}_\${log_f}.log 2>&1 &"
done >> run_shell_jifen.sh

for i in $(ls -1 vender_jinggeng | grep -v '_del$' | grep '_jifen$') ; do
	vender_name=$i
	echo "bash $base_dir/jinggeng_isv_signUp.sh $base_dir/config $base_dir/vender_jinggeng/$vender_name > $base_dir/log/jifen/${vender_name}_\${log_f}.log 2>&1 &"
done >> run_shell_jifen.sh

for i in $(ls -1 sevenDay_vender | grep -v '_del$' | grep '_jifen$') ; do
	vender_name=$i
	echo "bash $base_dir/cjhy_isv_signUp_7.sh $base_dir/config $base_dir/sevenDay_vender/$vender_name > $base_dir/log/jifen/${vender_name}_\${log_f}.log 2>&1 &"
done >> run_shell_jifen.sh

echo "sleep 2" >> run_shell_jifen.sh
for i in $(ls -1 lzkj_sevenDay_vender | grep -v '_del$' | grep '_jifen$') ; do
	vender_name=$i
		for j in $(ls -1 config_); do		
			conf=$j
			echo "sleep 2"
			echo "bash $base_dir/lzkj_isv_signUp_7.sh $base_dir/config_/$conf $base_dir/lzkj_sevenDay_vender/$vender_name > $base_dir/log/jifen/${conf}_${vender_name}_\${log_f}.log 2>&1 &"
		done
done >> run_shell_jifen.sh

echo "sleep 2" >> run_shell_jifen.sh
for i in $(ls -1 vender | grep -v '_del$' | grep '_jifen$') ; do
	vender_name=$i
		for j in $(ls -1 config_); do		
			conf=$j
			echo "sleep 2"
			echo "bash $base_dir/lzkj_isv_signUp.sh $base_dir/config_/$conf $base_dir/vender/$vender_name > $base_dir/log/jifen/${conf}_${vender_name}_\${log_f}.log 2>&1 &"
		done
done >> run_shell_jifen.sh

#echo "bash $base_dir/other.sh $base_dir/config > $base_dir/log/other_\${log_f}.log 2>&1 &" >> run_shell.sh


if [ -z "$1" ]; then
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_dingzhi.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/dingzhi_vender/mengniu_delay >$base_dir/log/delay/config_01_mengniu_$(date -d next-day +"%Y%m%d_%H%M").log 2>&1 &
sleep 1
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_dingzhi.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/dingzhi_vender/mengniu_delay >$base_dir/log/delay/config_02_mengniu_$(date -d next-day +"%Y%m%d_%H%M").log 2>&1 &
sleep 2
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_dingzhi.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/dingzhi_vender/mengniu_delay >$base_dir/log/delay/config_03_mengniu_$(date -d next-day +"%Y%m%d_%H%M").log 2>&1 &
fi