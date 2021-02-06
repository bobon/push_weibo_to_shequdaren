log_f=$(date -d next-day +"%Y%m%d_%H%M")

bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/lanyueliang_del > /home/myid/jd/jd_signup/log/now/config_01_lanyueliang_20210207_1859.log 2>&1 &
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/lanyueliang_del > /home/myid/jd/jd_signup/log/now/config_02_lanyueliang_20210207_1859.log 2>&1 &
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/lanyueliang_del > /home/myid/jd/jd_signup/log/now/config_03_lanyueliang_20210207_1859.log 2>&1 &

bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config /home/myid/jd/jd_signup/api_vender/baogongwanju > /home/myid/jd/jd_signup/log/now/baogongwanju_${log_f}.log 2>&1 &
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config /home/myid/jd/jd_signup/api_vender/biyazi > /home/myid/jd/jd_signup/log/now/biyazi_${log_f}.log 2>&1 &
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config /home/myid/jd/jd_signup/api_vender/pengsongshenghuo > /home/myid/jd/jd_signup/log/now/pengsongshenghuo_${log_f}.log 2>&1 &
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config /home/myid/jd/jd_signup/api_vender/wenchangji > /home/myid/jd/jd_signup/log/now/wenchangji_${log_f}.log 2>&1 &
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config /home/myid/jd/jd_signup/api_vender/yuzhaolin > /home/myid/jd/jd_signup/log/now/yuzhaolin_${log_f}.log 2>&1 &
sleep 0.3
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/weishi > /home/myid/jd/jd_signup/log/now/config_01_weishi_${log_f}.log 2>&1 &
sleep 0.3
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/weishi > /home/myid/jd/jd_signup/log/now/config_02_weishi_${log_f}.log 2>&1 &
sleep 0.3
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/weishi > /home/myid/jd/jd_signup/log/now/config_03_weishi_${log_f}.log 2>&1 &
sleep 0.3
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/zirantang > /home/myid/jd/jd_signup/log/now/config_01_zirantang_${log_f}.log 2>&1 &
sleep 0.3
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/zirantang > /home/myid/jd/jd_signup/log/now/config_02_zirantang_${log_f}.log 2>&1 &
sleep 0.3
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/zirantang > /home/myid/jd/jd_signup/log/now/config_03_zirantang_${log_f}.log 2>&1 &
sleep 0.3
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/vender/daisen > /home/myid/jd/jd_signup/log/now/config_01_daisen_${log_f}.log 2>&1 &
sleep 0.3
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/vender/daisen > /home/myid/jd/jd_signup/log/now/config_02_daisen_${log_f}.log 2>&1 &
sleep 0.3
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/vender/daisen > /home/myid/jd/jd_signup/log/now/config_03_daisen_${log_f}.log 2>&1 &
