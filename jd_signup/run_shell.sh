log_f=$(date -d next-day +"%Y%m%d_%H%M")
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config /home/myid/jd/jd_signup/api_vender/haohaizi > /home/myid/jd/jd_signup/log/now/haohaizi_${log_f}.log 2>&1 &
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config /home/myid/jd/jd_signup/api_vender/weizhi5 > /home/myid/jd/jd_signup/log/now/weizhi5_${log_f}.log 2>&1 &
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/weishi > /home/myid/jd/jd_signup/log/now/config_01_weishi_${log_f}.log 2>&1 &
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/weishi > /home/myid/jd/jd_signup/log/now/config_02_weishi_${log_f}.log 2>&1 &
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/zirantang > /home/myid/jd/jd_signup/log/now/config_01_zirantang_${log_f}.log 2>&1 &
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/zirantang > /home/myid/jd/jd_signup/log/now/config_02_zirantang_${log_f}.log 2>&1 &
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/vender/aoyouruye > /home/myid/jd/jd_signup/log/now/config_01_aoyouruye_${log_f}.log 2>&1 &
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/vender/aoyouruye > /home/myid/jd/jd_signup/log/now/config_02_aoyouruye_${log_f}.log 2>&1 &
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/vender/daisen > /home/myid/jd/jd_signup/log/now/config_01_daisen_${log_f}.log 2>&1 &
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/vender/daisen > /home/myid/jd/jd_signup/log/now/config_02_daisen_${log_f}.log 2>&1 &
sleep 0.3
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/weishi > /home/myid/jd/jd_signup/log/now/config_03_weishi_${log_f}.log 2>&1 &
sleep 0.3
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/zirantang > /home/myid/jd/jd_signup/log/now/config_03_zirantang_${log_f}.log 2>&1 &
sleep 0.3
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/vender/aoyouruye > /home/myid/jd/jd_signup/log/now/config_03_aoyouruye_${log_f}.log 2>&1 &
sleep 0.3
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/vender/daisen > /home/myid/jd/jd_signup/log/now/config_03_daisen_${log_f}.log 2>&1 &
