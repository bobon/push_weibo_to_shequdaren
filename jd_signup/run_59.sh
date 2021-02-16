base_dir=$(dirname $0)
base_dir=$(cd $base_dir;pwd)
cd $base_dir

mkdir -vp $base_dir/log/now

log_f=$(date -d next-day +"%Y%m%d_%H%M%S")
next_day=$(date -d next-day +%Y-%m-%d)
export date_0_f=$(date -d "$next_day 00:00:00" +%s)

bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/kaxioujingjing_del 5 > /home/myid/jd/jd_signup/log/now/config_01_kaxioujingjing_${log_f}.log 2>&1 &
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/kaxioujingjing_del 10 > /home/myid/jd/jd_signup/log/now/config_02_kaxioujingjing_${log_f}.log 2>&1 &
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/kaxioujingjing_del 15 > /home/myid/jd/jd_signup/log/now/config_03_kaxioujingjing_${log_f}.log 2>&1 &

