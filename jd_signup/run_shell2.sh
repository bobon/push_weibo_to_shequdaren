if [ "$2" = "precise" ]; then
	next_day=$(date -d next-day +%Y-%m-%d)
	date_0_f=$(date -d "$next_day 00:00:00" +%s)
	d=$(date -d @$date_0_f +"%Y%m%d_%H:%M:%S %s")
	echo "$(date +"%x %X %N %s") $d 时间未到"
	for j in $(seq 1 240); do
		if [ $(date '+%s') -ge $date_0_f ]; then
			echo "$(date +"%x %X %N %s") $d 时间到"
			break
		else
			sleep 0.5
			#echo "$(date +"%x %X %N %s") sleep 0.5 继续等待"
		fi
	done
	unset date_0_f
fi
log_f=$(date +"%Y%m%d_%H%M%S_%N")
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config /home/myid/jd/jd_signup/api_vender/haohaizi 5 $1 > /home/myid/jd/jd_signup/log/now/config_haohaizi_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config2 /home/myid/jd/jd_signup/api_vender/haohaizi 10 $1 > /home/myid/jd/jd_signup/log/now/config2_haohaizi_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614698669_0 15 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1614698669_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614698669_0 20 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1614698669_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614698669_0 25 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1614698669_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614699061_0 30 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1614699061_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614699061_0 35 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1614699061_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614699061_0 40 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1614699061_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614699101_0 45 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1614699101_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614699101_0 5 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1614699101_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614699101_0 10 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1614699101_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614776867_1 15 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1614776867_1_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614776867_1 20 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1614776867_1_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614776867_1 25 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1614776867_1_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1615210984_8 30 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1615210984_8_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1615210984_8 35 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1615210984_8_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1615210984_8 40 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1615210984_8_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1615906540_12 45 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1615906540_12_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1615906540_12 5 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1615906540_12_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1615906540_12 10 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1615906540_12_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1615906565_14 15 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1615906565_14_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1615906565_14 20 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1615906565_14_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1615906565_14 25 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1615906565_14_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/vender/shop_1614701379_0 30 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1614701379_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/vender/shop_1614701379_0 35 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1614701379_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/vender/shop_1614701379_0 40 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1614701379_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/vender/shop_1615692991_1 45 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1615692991_1_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/vender/shop_1615692991_1 5 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1615692991_1_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/vender/shop_1615692991_1 10 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1615692991_1_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/vender/shop_1615906725_24 15 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1615906725_24_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/vender/shop_1615906725_24 20 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1615906725_24_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/vender/shop_1615906725_24 25 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1615906725_24_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/vender/shop_1615906764_26 30 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1615906764_26_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/vender/shop_1615906764_26 35 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1615906764_26_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/vender/shop_1615906764_26 40 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1615906764_26_${log_f}.log 2>&1 &
echo delay start
sleep 0.3
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614698669_0 45 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1614698669_0_${log_f}.log 2>&1 &
sleep 0.3
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614699061_0 5 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1614699061_0_${log_f}.log 2>&1 &
sleep 0.3
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614699101_0 10 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1614699101_0_${log_f}.log 2>&1 &
sleep 0.3
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614776867_1 15 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1614776867_1_${log_f}.log 2>&1 &
sleep 0.3
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1615210984_8 20 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1615210984_8_${log_f}.log 2>&1 &
sleep 0.3
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1615906540_12 25 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1615906540_12_${log_f}.log 2>&1 &
sleep 0.3
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1615906565_14 30 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1615906565_14_${log_f}.log 2>&1 &
sleep 0.3
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/vender/shop_1614701379_0 35 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1614701379_0_${log_f}.log 2>&1 &
sleep 0.3
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/vender/shop_1615692991_1 40 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1615692991_1_${log_f}.log 2>&1 &
sleep 0.3
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/vender/shop_1615906725_24 45 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1615906725_24_${log_f}.log 2>&1 &
sleep 0.3
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/vender/shop_1615906764_26 5 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1615906764_26_${log_f}.log 2>&1 &
