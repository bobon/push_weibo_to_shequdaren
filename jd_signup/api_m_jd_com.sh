#!/bin/bash

date +"%x %X %N  %s"
a=false
b=false
delay=1

if [ ! -f "$1" ]; then
	echo "not find $1"
	exit
fi
if [ ! -f "$2" ]; then
	echo "not find $2"
	exit
fi

source $1
source $2

if [ "$3" == "check" ]; then
	echo "check sign. not run sign"
else
	if [ ! -z "$3" ]; then
		RANDOM_num="$3"
	fi
	echo "RANDOM_num: $RANDOM_num"

	if [ "$4" == "force" ]; then
		echo "force to sign"
	else
		unset giftDate; unset sign_num
		unset sign_res_info
		bb=$(mktemp)
		sed -r -n '/#.* '${pt_pin1}' sign_res$/,/#.* '${pt_pin1}' sign_res_end$/p' "$2" > $bb
		source $bb
		rm -rvf $bb
		if [ "$giftDate" = "$(date +"%Y%m%d")" ] && [ "$giftRes" = "ok" ]; then
			date +"%x %X %N  %s"
			echo "$pin1_name 今天已经签到过. 签到结果: $giftRes  giftDate: $giftDate"
			echo "***********************************************"
			echo -e "$sign_res_info"
			echo "***********************************************"
			echo
			a=true
			
			if [ "$sign_num" = "" ]; then
				echo "$pin1_name 签到结果获取失败."
				a=false
			fi
		fi
		echo "$(date +"%x %X %N  %s") 检查$pt_pin1签到"
		
		if [ -z "$pt_pin2" ]; then
				b=true
		else
			unset giftDate; unset sign_num
			unset sign_res_info
			bb=$(mktemp)
			sed -r -n '/#.* '${pt_pin2}' sign_res$/,/#.* '${pt_pin2}' sign_res_end$/p' "$2" > $bb
			source $bb
			rm -rvf $bb
			if [ "$giftDate" = "$(date +"%Y%m%d")" ] && [ "$giftRes" = "ok" ]; then
				echo "$pin2_name 今天已经签到过. 签到结果: $giftRes  giftDate: $giftDate"
				echo "***********************************************"
				echo -e "$sign_res_info"
				echo "***********************************************"
				echo
				b=true
			fi
			
			if [ "$sign_num" = "" ]; then
				echo "$pin2_name 签到结果获取失败."
				b=false
			fi
		fi
		echo "$(date +"%x %X %N  %s") 检查$pt_pin2签到"
		
		if [ "$a" = "true" ] && [ "$b" = "true" ]; then
			echo "今天已全部签到过"
			cat "$2"
			exit
		fi
	fi

	v_f=$(echo $2 | sed -r -e 's,_delay$|_fq$|_del$,,')
	isover=


	for i in $(seq 1 20); do

		if [ "$a" = "false" ]; then
		echo
		echo "$(date +"%x %X %N  %s") ${pin1_name}签到$vendername"
		time t1=$(curl -sS -k "https://api.m.jd.com/api?appid=interCenter_shopSign&t=1609588867000&loginType=2&functionId=interact_center_shopSign_signCollectGift&body=\{%22token%22:%22${token}%22,%22venderId%22:${venderId},%22activityId%22:${activityId},%22type%22:56,%22actionType%22:7\}&jsonp=jsonp1004" \
		  -H 'authority: api.m.jd.com' \
		  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
		  -H 'accept: */*' \
		  -H 'sec-fetch-site: same-site' \
		  -H 'sec-fetch-mode: no-cors' \
		  -H 'sec-fetch-dest: script' \
		  -H 'referer: https://h5.m.jd.com/' \
		  -H 'accept-language: zh-CN,zh;q=0.9' \
		  -H "cookie: pt_key=${pt_key1}; pt_pin=${pt_pin1}" \
		  --compressed | sed -r -e 's,^jsonp[_]*[^(]+[(],,' -e 's,[)][;]*$,,' )
		  echo -e "$t1"
		  if [ $(echo "$t1" | jq '.success' | grep 'true'>/dev/null;echo $?) -eq 0 ]; then
		  	a=true
		  elif [ $(echo "$t1" | jq '.msg' | egrep '当前不存在有效的活动|活动已结束|活动已经结束|该活动已经不存在'>/dev/null;echo $?) -eq 0 ]; then
		  	echo "活动已结束. $2 --> ${v_f}_del"
		  	mv -vf "$2" "${v_f}_del"
		  	isover=true
		  	a=true
		  	break
		  elif [ $(echo "$t1" | jq '.msg' | egrep '当前的操作正在排队|签到用户未登录|你已经参加过该活动啦|当天只允许签到一次|用户达到签到上限'>/dev/null;echo $?) -eq 0 ]; then
		  	a=true
		  elif [ $(echo "$t1"| jq '.isOk' | grep 'true'>/dev/null;echo $?) -eq 0 ]; then
		  	a=true
		  fi
		fi
		
		if [ -z "$pt_pin2" ]; then
			b=true
		else
			if [ "$b" = "false" ]; then
			echo
			echo "$(date +"%x %X %N  %s") ${pin2_name}签到$vendername"
			time t2=$(curl -sS -k "https://api.m.jd.com/api?appid=interCenter_shopSign&t=1609588867000&loginType=2&functionId=interact_center_shopSign_signCollectGift&body=\{%22token%22:%22${token}%22,%22venderId%22:${venderId},%22activityId%22:${activityId},%22type%22:56,%22actionType%22:7\}&jsonp=jsonp1004" \
			  -H 'authority: api.m.jd.com' \
			  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
			  -H 'accept: */*' \
			  -H 'sec-fetch-site: same-site' \
			  -H 'sec-fetch-mode: no-cors' \
			  -H 'sec-fetch-dest: script' \
			  -H 'referer: https://h5.m.jd.com/' \
			  -H 'accept-language: zh-CN,zh;q=0.9' \
			  -H "cookie: pt_key=${pt_key2}; pt_pin=${pt_pin2}" \
			  --compressed | sed -r -e 's,^jsonp[_]*[^(]+[(],,' -e 's,[)][;]*$,,' )
			  echo -e "$t2"
			  if [ $(echo "$t2" | jq '.success' | grep 'true'>/dev/null;echo $?) -eq 0 ]; then
			  	b=true
			  elif [ $(echo "$t2" | jq '.msg' | egrep '当前不存在有效的活动|活动已结束|活动已经结束|该活动已经不存在'>/dev/null;echo $?) -eq 0 ]; then
			  	echo "活动已结束. $2 --> ${v_f}_del"
			  	mv -vf "$2" "${v_f}_del"
			  	isover=true
			  	b=true
			  	break
			  elif [ $(echo "$t2" | jq '.msg' | egrep '当前的操作正在排队|签到用户未登录|你已经参加过该活动啦|当天只允许签到一次|用户达到签到上限'>/dev/null;echo $?) -eq 0 ]; then
			  	b=true
			  elif [ $(echo "$t2"| jq '.isOk' | grep 'true'>/dev/null;echo $?) -eq 0 ]; then
			  	b=true
			  fi
			fi	
		fi
		date +"%x %X %N %s"
		
		if [ "$a" = "true" ] && [ "$b" = "true" ]; then
			echo "$(date +"%x %X %N %s") 签到${vendername}完成"
			break
		else
			time sleep $(echo "0.2 * $delay"|bc)
			delay=$(($delay + 1))
		fi
	done
	
	if [ "$3" = "now" ]; then 
		sleep 0.5
	elif [ $(echo "$2" | grep '_delay$'>/dev/null;echo $?) -eq 0 ]; then 
		sleep $RANDOM_num
	else
		let RANDOM_num=RANDOM_num*3
		sleep $RANDOM_num
	fi

	source /home/myid/jd/jd_signup/common.sh
fi


echo
date +"%x %X %N  %s"
if [ ! -z "$t1" ]; then
	echo "${pin1_name}签到${vendername}查看结果"
	s1=$(curl -sS -k "https://api.m.jd.com/api?appid=interCenter_shopSign&t=1609588867000&loginType=2&functionId=interact_center_shopSign_getSignRecord&body=\{%22token%22:%22${token}%22,%22venderId%22:${venderId},%22activityId%22:${activityId},%22type%22:56\}&jsonp=jsonp1006" \
	  -H 'authority: api.m.jd.com' \
	  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
	  -H 'accept: */*' \
	  -H 'sec-fetch-site: same-site' \
	  -H 'sec-fetch-mode: no-cors' \
	  -H 'sec-fetch-dest: script' \
	  -H 'referer: https://h5.m.jd.com/' \
	  -H 'accept-language: zh-CN,zh;q=0.9' \
	  -H "cookie: pt_key=${pt_key1}; pt_pin=${pt_pin1}" \
	  --compressed | sed -r -e 's,^jsonp[_]*[^(]+[(],,' -e 's,[)][;]*$,,' )
	if [ -z "$isover" ]; then
		if [ "$3" != "check" ]; then
			write_sign_res "${pt_pin1}" ${2} "$s1" "$t1" "$pin1_name"
		fi
	fi
fi

if [ ! -z "$t2" ]; then
	if [ ! -z "$pt_pin2" ]; then
		echo
		echo "${pin2_name}签到${vendername}查看结果"
		s2=$(curl -sS -k "https://api.m.jd.com/api?appid=interCenter_shopSign&t=1609588867000&loginType=2&functionId=interact_center_shopSign_getSignRecord&body=\{%22token%22:%22${token}%22,%22venderId%22:${venderId},%22activityId%22:${activityId},%22type%22:56\}&jsonp=jsonp1006" \
		  -H 'authority: api.m.jd.com' \
		  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
		  -H 'accept: */*' \
		  -H 'sec-fetch-site: same-site' \
		  -H 'sec-fetch-mode: no-cors' \
		  -H 'sec-fetch-dest: script' \
		  -H 'referer: https://h5.m.jd.com/' \
		  -H 'accept-language: zh-CN,zh;q=0.9' \
		  -H "cookie: pt_key=${pt_key2}; pt_pin=${pt_pin2}" \
		  --compressed | sed -r -e 's,^jsonp[_]*[^(]+[(],,' -e 's,[)][;]*$,,' )
		if [ -z "$isover" ]; then
			if [ "$3" != "check" ]; then
				write_sign_res "${pt_pin2}" ${2} "$s2" "$t2" "$pin2_name"
			fi
		fi
	fi
fi

echo
echo
echo "$rule"
echo "${pin1_name}签到${vendername}日志"
echo -e "$s1"
echo -e "$s1" | jq '{contiSignNum:.data.days}'
echo "${pin2_name}签到${vendername}日志"
echo -e "$s2"
echo -e "$s2" | jq '{contiSignNum:.data.days}'
if [ -z "$isover" ]; then
	cat "$2"
else
	cat "${v_f}_del"
fi
