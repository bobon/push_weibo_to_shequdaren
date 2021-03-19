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
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1613569740_34 5 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1613569740_34_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614116411_129 10 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1614116411_129_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614698669_0 15 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1614698669_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614699061_0 20 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1614699061_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614699101_0 25 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1614699101_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614776867_1 30 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1614776867_1_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1615126461_0 35 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1615126461_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1615126461_0 40 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1615126461_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1615126461_0 45 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1615126461_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1615126461_0 5 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1615126461_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1615692971_0 10 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1615692971_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1615692971_0 15 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1615692971_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1615692971_0 20 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1615692971_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1615692971_0 25 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1615692971_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1615906458_7 30 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1615906458_7_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1615906475_8 35 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1615906475_8_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1615906540_12 40 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1615906540_12_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1615906565_14 45 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1615906565_14_${log_f}.log 2>&1 &
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
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/vender/shop_1615125912_0 40 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1615125912_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/vender/shop_1615126563_0 45 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1615126563_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/vender/shop_1615126563_0 5 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1615126563_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/vender/shop_1615126563_0 10 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1615126563_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/vender/shop_1615126563_0 15 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1615126563_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/vender/shop_1615126735_0 20 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1615126735_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/vender/shop_1615126735_0 25 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1615126735_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/vender/shop_1615126735_0 30 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1615126735_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/vender/shop_1615126735_0 35 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1615126735_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/vender/shop_1615211001_9 40 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1615211001_9_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/vender/shop_1615211001_9 45 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1615211001_9_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/vender/shop_1615211001_9 5 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1615211001_9_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/vender/shop_1615906668_21 10 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1615906668_21_${log_f}.log 2>&1 &
