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
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config /home/myid/jd/jd_signup/api_vender/RIEDEL 5 $1 > /home/myid/jd/jd_signup/log/now/config_RIEDEL_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config2 /home/myid/jd/jd_signup/api_vender/RIEDEL 10 $1 > /home/myid/jd/jd_signup/log/now/config2_RIEDEL_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config /home/myid/jd/jd_signup/api_vender/chengwu 15 $1 > /home/myid/jd/jd_signup/log/now/config_chengwu_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config2 /home/myid/jd/jd_signup/api_vender/chengwu 20 $1 > /home/myid/jd/jd_signup/log/now/config2_chengwu_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config /home/myid/jd/jd_signup/api_vender/shop_1617364995_2 25 $1 > /home/myid/jd/jd_signup/log/now/config_shop_1617364995_2_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config2 /home/myid/jd/jd_signup/api_vender/shop_1617364995_2 30 $1 > /home/myid/jd/jd_signup/log/now/config2_shop_1617364995_2_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config /home/myid/jd/jd_signup/api_vender/shop_1617364996_4 35 $1 > /home/myid/jd/jd_signup/log/now/config_shop_1617364996_4_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config2 /home/myid/jd/jd_signup/api_vender/shop_1617364996_4 40 $1 > /home/myid/jd/jd_signup/log/now/config2_shop_1617364996_4_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1615906565_14 45 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1615906565_14_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1615906565_14 5 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1615906565_14_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1615906565_14 10 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1615906565_14_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1617363104_0 15 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1617363104_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1617363104_0 20 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1617363104_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1617363104_0 25 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1617363104_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1617364996_5 30 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1617364996_5_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1617364996_5 35 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1617364996_5_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1617364996_5 40 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1617364996_5_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1617365013_6 45 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1617365013_6_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1617365013_6 5 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1617365013_6_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1617365013_6 10 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1617365013_6_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1617365021_7 15 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1617365021_7_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1617365021_7 20 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1617365021_7_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1617365021_7 25 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1617365021_7_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1617365055_11 30 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1617365055_11_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1617365055_11 35 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1617365055_11_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1617365055_11 40 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1617365055_11_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1617365085_15 45 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1617365085_15_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1617365085_15 5 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1617365085_15_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1617365085_15 10 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1617365085_15_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1617365102_16 15 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1617365102_16_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1617365102_16 20 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1617365102_16_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1617365102_16 25 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1617365102_16_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/vender/shop_1614611216_140 30 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1614611216_140_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/vender/shop_1614611216_140 35 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1614611216_140_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/vender/shop_1614611216_140 40 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1614611216_140_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/vender/shop_1617287402_0 45 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1617287402_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/vender/shop_1617287402_0 5 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1617287402_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/vender/shop_1617287402_0 10 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1617287402_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/vender/shop_1617362859_0 15 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1617362859_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/vender/shop_1617362859_0 20 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1617362859_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/vender/shop_1617362859_0 25 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1617362859_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/vender/shop_1617365202_26 30 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1617365202_26_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/vender/shop_1617365202_26 35 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1617365202_26_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/vender/shop_1617365202_26 40 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1617365202_26_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/vender/shop_1617365242_28 45 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1617365242_28_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/vender/shop_1617365242_28 5 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1617365242_28_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/vender/shop_1617365242_28 10 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1617365242_28_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/vender/shop_1617365260_29 15 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1617365260_29_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/vender/shop_1617365260_29 20 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1617365260_29_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/vender/shop_1617365260_29 25 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1617365260_29_${log_f}.log 2>&1 &
echo delay start
sleep 0.3
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1615906565_14 30 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1615906565_14_${log_f}.log 2>&1 &
sleep 0.3
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1617363104_0 35 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1617363104_0_${log_f}.log 2>&1 &
sleep 0.3
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1617364996_5 40 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1617364996_5_${log_f}.log 2>&1 &
sleep 0.3
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1617365013_6 45 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1617365013_6_${log_f}.log 2>&1 &
sleep 0.3
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1617365021_7 5 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1617365021_7_${log_f}.log 2>&1 &
sleep 0.3
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1617365055_11 10 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1617365055_11_${log_f}.log 2>&1 &
sleep 0.3
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1617365085_15 15 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1617365085_15_${log_f}.log 2>&1 &
sleep 0.3
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1617365102_16 20 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1617365102_16_${log_f}.log 2>&1 &
sleep 0.3
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/vender/shop_1614611216_140 25 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1614611216_140_${log_f}.log 2>&1 &
sleep 0.3
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/vender/shop_1617287402_0 30 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1617287402_0_${log_f}.log 2>&1 &
sleep 0.3
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/vender/shop_1617362859_0 35 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1617362859_0_${log_f}.log 2>&1 &
sleep 0.3
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/vender/shop_1617365202_26 40 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1617365202_26_${log_f}.log 2>&1 &
sleep 0.3
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/vender/shop_1617365242_28 45 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1617365242_28_${log_f}.log 2>&1 &
sleep 0.3
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/vender/shop_1617365260_29 5 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1617365260_29_${log_f}.log 2>&1 &
