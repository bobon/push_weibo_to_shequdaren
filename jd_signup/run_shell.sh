log_f=$(date -d next-day +"%Y%m%d_%H%M")
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config /home/myid/jd/jd_signup/api_vender/huibojia > /home/myid/jd/jd_signup/log/now/huibojia_${log_f}.log 2>&1 &
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config /home/myid/jd/jd_signup/api_vender/tulaolao > /home/myid/jd/jd_signup/log/now/tulaolao_${log_f}.log 2>&1 &
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config /home/myid/jd/jd_signup/api_vender/wenchangji > /home/myid/jd/jd_signup/log/now/wenchangji_${log_f}.log 2>&1 &
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/mengniu > /home/myid/jd/jd_signup/log/now/config_01_mengniu_${log_f}.log 2>&1 &
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/mengniu > /home/myid/jd/jd_signup/log/now/config_02_mengniu_${log_f}.log 2>&1 &
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/zirantang > /home/myid/jd/jd_signup/log/now/config_01_zirantang_${log_f}.log 2>&1 &
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/zirantang > /home/myid/jd/jd_signup/log/now/config_02_zirantang_${log_f}.log 2>&1 &
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/vender/daisen > /home/myid/jd/jd_signup/log/now/config_01_daisen_${log_f}.log 2>&1 &
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/vender/daisen > /home/myid/jd/jd_signup/log/now/config_02_daisen_${log_f}.log 2>&1 &
sleep 0.3
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/mengniu > /home/myid/jd/jd_signup/log/now/config_03_mengniu_${log_f}.log 2>&1 &
sleep 0.3
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/zirantang > /home/myid/jd/jd_signup/log/now/config_03_zirantang_${log_f}.log 2>&1 &
sleep 0.3
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/vender/daisen > /home/myid/jd/jd_signup/log/now/config_03_daisen_${log_f}.log 2>&1 &

sleep 4
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/lanyueliang_del > /home/myid/jd/jd_signup/log/now/config_01_lanyueliang_${log_f}.log 2>&1 &
sleep 2
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/lanyueliang_del > /home/myid/jd/jd_signup/log/now/config_02_lanyueliang_${log_f}.log 2>&1 &
sleep 2
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/lanyueliang_del > /home/myid/jd/jd_signup/log/now/config_03_lanyueliang_${log_f}.log 2>&1 &

