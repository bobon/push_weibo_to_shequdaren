log_f=$(date -d next-day +"%Y%m%d_%H%M")
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config /home/myid/jd/jd_signup/api_vender/COMOTEK > /home/myid/jd/jd_signup/log/now/COMOTEK_${log_f}.log 2>&1 &
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config /home/myid/jd/jd_signup/api_vender/ZJUZ > /home/myid/jd/jd_signup/log/now/ZJUZ_${log_f}.log 2>&1 &
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config /home/myid/jd/jd_signup/api_vender/keleige > /home/myid/jd/jd_signup/log/now/keleige_${log_f}.log 2>&1 &
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/mengniu > /home/myid/jd/jd_signup/log/now/config_01_mengniu_${log_f}.log 2>&1 &
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/mengniu > /home/myid/jd/jd_signup/log/now/config_02_mengniu_${log_f}.log 2>&1 &
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/vender/daisen > /home/myid/jd/jd_signup/log/now/config_01_daisen_${log_f}.log 2>&1 &
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/vender/daisen > /home/myid/jd/jd_signup/log/now/config_02_daisen_${log_f}.log 2>&1 &
sleep 0.3
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/mengniu > /home/myid/jd/jd_signup/log/now/config_03_mengniu_${log_f}.log 2>&1 &
sleep 0.3
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/vender/daisen > /home/myid/jd/jd_signup/log/now/config_03_daisen_${log_f}.log 2>&1 &

sleep 0.3
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/kaxioujingjing_del > /home/myid/jd/jd_signup/log/now/config_03_kaxioujingjing_${log_f}.log 2>&1 &

