log_f=$(date -d next-day +"%Y%m%d_%H%M")

bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/kaxioujingjing_del > /home/myid/jd/jd_signup/log/now/config_01_kaxioujingjing_${log_f}.log 2>&1 &
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/kaxioujingjing_del > /home/myid/jd/jd_signup/log/now/config_02_kaxioujingjing_${log_f}.log 2>&1 &

bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config /home/myid/jd/jd_signup/api_vender/dishini > /home/myid/jd/jd_signup/log/now/dishini_${log_f}.log 2>&1 &
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/vender/daisen > /home/myid/jd/jd_signup/log/now/config_01_daisen_${log_f}.log 2>&1 &
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/vender/daisen > /home/myid/jd/jd_signup/log/now/config_02_daisen_${log_f}.log 2>&1 &
sleep 0.3
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/vender/daisen > /home/myid/jd/jd_signup/log/now/config_03_daisen_${log_f}.log 2>&1 &

sleep 0.3
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/kaxioujingjing_del > /home/myid/jd/jd_signup/log/now/config_03_kaxioujingjing_${log_f}.log 2>&1 &

