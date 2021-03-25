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
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config2 /home/myid/jd/jd_signup/api_vender/shop_1614611208_105 5 $1 > /home/myid/jd/jd_signup/log/now/config2_shop_1614611208_105_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614698669_0 10 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1614698669_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614699061_0 15 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1614699061_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614699101_0 20 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1614699101_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1614776867_1 25 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1614776867_1_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1615210984_8 30 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1615210984_8_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1615906540_12 35 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1615906540_12_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1615906565_14 40 $1 > /home/myid/jd/jd_signup/log/now/config_04_shop_1615906565_14_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/vender/aoyouruye 45 $1 > /home/myid/jd/jd_signup/log/now/config_02_aoyouruye_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/vender/baierkang 5 $1 > /home/myid/jd/jd_signup/log/now/config_01_baierkang_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/vender/baierkang 10 $1 > /home/myid/jd/jd_signup/log/now/config_02_baierkang_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/vender/baierkang 15 $1 > /home/myid/jd/jd_signup/log/now/config_03_baierkang_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/vender/shop_1614611216_140 20 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1614611216_140_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/vender/shop_1614611216_140 25 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1614611216_140_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/vender/shop_1614611216_140 30 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1614611216_140_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/vender/shop_1615125912_0 35 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1615125912_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/vender/shop_1615125912_0 40 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1615125912_0_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/vender/shop_1615125912_0 45 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1615125912_0_${log_f}.log 2>&1 &
