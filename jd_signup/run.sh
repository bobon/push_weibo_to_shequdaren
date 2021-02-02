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


#签到先锋  4天111+5天222+6天333+7天400豆
#echo "
#bash /home/myid/jd/jd_signup/xianfeng.sh > /home/myid/jd/jd_signup/xianfeng1_\${log_f}.log 2>&1 &
#bash /home/myid/jd/jd_signup/xianfeng.sh > /home/myid/jd/jd_signup/xianfeng2_\${log_f}.log 2>&1 &
#bash /home/myid/jd/jd_signup/xianfeng.sh > /home/myid/jd/jd_signup/xianfeng3_\${log_f}.log 2>&1 &
#bash /home/myid/jd/jd_signup/xianfeng.sh > /home/myid/jd/jd_signup/xianfeng4_\${log_f}.log 2>&1 &
#bash /home/myid/jd/jd_signup/xianfeng.sh > /home/myid/jd/jd_signup/xianfeng5_\${log_f}.log 2>&1 &
#bash /home/myid/jd/jd_signup/xianfeng.sh > /home/myid/jd/jd_signup/xianfeng6_\${log_f}.log 2>&1 &
#bash /home/myid/jd/jd_signup/xianfeng.sh > /home/myid/jd/jd_signup/xianfeng7_\${log_f}.log 2>&1 &
#bash /home/myid/jd/jd_signup/xianfeng.sh > /home/myid/jd/jd_signup/xianfeng8_\${log_f}.log 2>&1 &
#bash /home/myid/jd/jd_signup/xianfeng.sh > /home/myid/jd/jd_signup/xianfeng9_\${log_f}.log 2>&1 &
#bash /home/myid/jd/jd_signup/xianfeng.sh > /home/myid/jd/jd_signup/xianfeng10_\${log_f}.log 2>&1 &
#" >> run_shell.sh

for i in $(ls -1 api_vender | grep -v '_del$' | egrep -v '_delay$|_jifen$') ; do
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

echo "sleep 1" >> run_shell.sh
for i in $(ls -1 vender | grep -v '_del$' | egrep -v '_delay$|_jifen$') ; do
	vender_name=$i
		for j in $(ls -1 config_); do		
			conf=$j
			echo "sleep 0.3"
			echo "bash $base_dir/lzkj_isv_signUp.sh $base_dir/config_/$conf $base_dir/vender/$vender_name > $base_dir/log/now/${conf}_${vender_name}_\${log_f}.log 2>&1 &"
		done
done >> run_shell.sh




for i in $(ls -1 api_vender | grep -v '_del$' | grep '_delay$') ; do
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




for i in $(ls -1 api_vender | grep -v '_del$' | grep '_jifen$') ; do
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
