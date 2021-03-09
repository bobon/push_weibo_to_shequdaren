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
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config2 /home/myid/jd/jd_signup/api_vender/nengliduo 5 $1 > /home/myid/jd/jd_signup/log/now/config2_nengliduo_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config /home/myid/jd/jd_signup/api_vender/nengliduo 10 $1 > /home/myid/jd/jd_signup/log/now/config_nengliduo_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614116411_129 15 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1614116411_129_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614116411_129 20 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1614116411_129_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614116411_129 25 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1614116411_129_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614116411_129 30 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1614116411_129_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614698669_0 35 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1614698669_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614699061_0 40 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1614699061_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614699101_0 45 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1614699101_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614776867_1 5 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1614776867_1_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614776892_3 10 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1614776892_3_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614776892_3 15 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1614776892_3_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614776892_3 20 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1614776892_3_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614776892_3 25 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1614776892_3_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1615126461_0 30 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1615126461_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1615210965_1 35 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1615210965_1_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1615210984_8 40 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1615210984_8_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1615211020_10 45 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1615211020_10_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/vender/shop_1614116236_75 5 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1614116236_75_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/vender/shop_1614116236_75 10 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1614116236_75_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/vender/shop_1614116236_75 15 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1614116236_75_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/vender/shop_1614611215_136 20 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1614611215_136_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/vender/shop_1614611215_136 25 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1614611215_136_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/vender/shop_1614611215_136 30 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1614611215_136_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/vender/shop_1614696854_0 35 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1614696854_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/vender/shop_1614696854_0 40 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1614696854_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/vender/shop_1614696854_0 45 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1614696854_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/vender/shop_1614697710_0 5 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1614697710_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/vender/shop_1615121238_0 10 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1615121238_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/vender/shop_1615121238_0 15 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1615121238_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/vender/shop_1615121238_0 20 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1615121238_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/vender/shop_1615125912_0 25 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1615125912_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/vender/shop_1615125912_0 30 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1615125912_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/vender/shop_1615125912_0 35 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1615125912_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/vender/shop_1615211039_13 40 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1615211039_13_${log_f}.log 2>&1 &
