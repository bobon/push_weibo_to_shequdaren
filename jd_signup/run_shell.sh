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
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config2 /home/myid/jd/jd_signup/api_vender/ZJUZ 5 $1 > /home/myid/jd/jd_signup/log/now/config2_ZJUZ_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config2 /home/myid/jd/jd_signup/api_vender/miyuan 10 $1 > /home/myid/jd/jd_signup/log/now/config2_miyuan_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config2 /home/myid/jd/jd_signup/api_vender/shop_1613567513_20 15 $1 > /home/myid/jd/jd_signup/log/now/config2_shop_1613567513_20_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config2 /home/myid/jd/jd_signup/api_vender/shop_1613569746_51 20 $1 > /home/myid/jd/jd_signup/log/now/config2_shop_1613569746_51_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config /home/myid/jd/jd_signup/api_vender/shop_1613569771_127 25 $1 > /home/myid/jd/jd_signup/log/now/config_shop_1613569771_127_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config2 /home/myid/jd/jd_signup/api_vender/shop_1613569773_134 30 $1 > /home/myid/jd/jd_signup/log/now/config2_shop_1613569773_134_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config /home/myid/jd/jd_signup/api_vender/shop_1613569773_134 35 $1 > /home/myid/jd/jd_signup/log/now/config_shop_1613569773_134_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config2 /home/myid/jd/jd_signup/api_vender/shop_1613569789_154 40 $1 > /home/myid/jd/jd_signup/log/now/config2_shop_1613569789_154_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config /home/myid/jd/jd_signup/api_vender/shop_1613569789_154 45 $1 > /home/myid/jd/jd_signup/log/now/config_shop_1613569789_154_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config2 /home/myid/jd/jd_signup/api_vender/shop_1613569799_167 5 $1 > /home/myid/jd/jd_signup/log/now/config2_shop_1613569799_167_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config /home/myid/jd/jd_signup/api_vender/shop_1613569799_167 10 $1 > /home/myid/jd/jd_signup/log/now/config_shop_1613569799_167_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config2 /home/myid/jd/jd_signup/api_vender/shop_1613569811_180 15 $1 > /home/myid/jd/jd_signup/log/now/config2_shop_1613569811_180_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config2 /home/myid/jd/jd_signup/api_vender/shop_1613703056_30 20 $1 > /home/myid/jd/jd_signup/log/now/config2_shop_1613703056_30_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config /home/myid/jd/jd_signup/api_vender/shop_1613703056_30 25 $1 > /home/myid/jd/jd_signup/log/now/config_shop_1613703056_30_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config2 /home/myid/jd/jd_signup/api_vender/shop_1613703193_86 30 $1 > /home/myid/jd/jd_signup/log/now/config2_shop_1613703193_86_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/api_m_jd_com.sh /home/myid/jd/jd_signup/config /home/myid/jd/jd_signup/api_vender/shop_1613703193_86 35 $1 > /home/myid/jd/jd_signup/log/now/config_shop_1613703193_86_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_04 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/mengniu 40 $1 > /home/myid/jd/jd_signup/log/now/config_04_mengniu_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1613569736_23 45 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1613569736_23_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1613569736_23 5 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1613569736_23_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1613569736_23 10 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1613569736_23_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1613569740_34 15 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1613569740_34_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1613569740_34 20 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1613569740_34_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1613569740_34 25 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1613569740_34_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_01 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1613569768_117 30 $1 > /home/myid/jd/jd_signup/log/now/config_01_shop_1613569768_117_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_02 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1613569768_117 35 $1 > /home/myid/jd/jd_signup/log/now/config_02_shop_1613569768_117_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp_7.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/lzkj_sevenDay_vender/shop_1613569768_117 40 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1613569768_117_${log_f}.log 2>&1 &
date +"%x %X %N %s"
bash /home/myid/jd/jd_signup/lzkj_isv_signUp.sh /home/myid/jd/jd_signup/config_/config_03 /home/myid/jd/jd_signup/vender/shop_1613048969_0 45 $1 > /home/myid/jd/jd_signup/log/now/config_03_shop_1613048969_0_${log_f}.log 2>&1 &
