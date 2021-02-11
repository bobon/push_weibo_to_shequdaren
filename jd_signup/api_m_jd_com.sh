a=false
b=false
delay=1

source $1
source $2

if [ "$3" == "check" ]; then
	echo "check sign. not run sign"
else

	for i in $(seq 1 20); do

	if [ "$a" = "false" ]; then
	echo
	date +"%x %X %N  %s"
	echo "${pin1_name}签到$vendername"
	t=$(curl -sS -k "https://api.m.jd.com/api?appid=interCenter_shopSign&t=1609588867000&loginType=2&functionId=interact_center_shopSign_signCollectGift&body=\{%22token%22:%22${token}%22,%22venderId%22:${venderId},%22activityId%22:${activityId},%22type%22:56,%22actionType%22:7\}&jsonp=jsonp1004" \
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
	  echo -e "$t"
	  if [ $(echo "$t" | jq '.success' | grep 'true'>/dev/null;echo $?) -eq 0 ]; then
	  	a=true
	  elif [ $(echo "$t" | jq '.msg' | egrep '当前的操作正在排队|签到用户未登录|你已经参加过该活动啦|当天只允许签到一次|当前不存在有效的活动|活动已结束|活动已经结束|用户达到签到上限'>/dev/null;echo $?) -eq 0 ]; then
	  	a=true
	  elif [ $(echo "$t"| jq '.isOk' | grep 'true'>/dev/null;echo $?) -eq 0 ]; then
	  	a=true
	  fi
	fi
	
	if [ -z "$pt_pin2" ]; then
		b=true
	else
		if [ "$b" = "false" ]; then
		echo
		date +"%x %X %N  %s"
		echo "${pin2_name}签到$vendername"
		t=$(curl -sS -k "https://api.m.jd.com/api?appid=interCenter_shopSign&t=1609588867000&loginType=2&functionId=interact_center_shopSign_signCollectGift&body=\{%22token%22:%22${token}%22,%22venderId%22:${venderId},%22activityId%22:${activityId},%22type%22:56,%22actionType%22:7\}&jsonp=jsonp1004" \
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
		  echo -e "$t"
		  if [ $(echo "$t" | jq '.success' | grep 'true'>/dev/null;echo $?) -eq 0 ]; then
		  	b=true
		  elif [ $(echo "$t" | jq '.msg' | egrep '当前的操作正在排队|签到用户未登录|你已经参加过该活动啦|当天只允许签到一次|当前不存在有效的活动|活动已结束|活动已经结束|用户达到签到上限'>/dev/null;echo $?) -eq 0 ]; then
		  	b=true
		  elif [ $(echo "$t"| jq '.isOk' | grep 'true'>/dev/null;echo $?) -eq 0 ]; then
		  	b=true
		  fi
		fi	
	fi

	if [ "$a" = "true" ] && [ "$b" = "true" ]; then
	echo "签到${vendername}完成"
		break
	else
		time sleep $(echo "0.2 * $delay"|bc)
		delay=$(($delay + 1))
	fi
	done

	if [ $(echo "$2" | grep '_delay$'>/dev/null;echo $?) -eq 0 ] || [ "$3" = "now" ]; then 
		sleep 3
	else
		sleep 28
	fi

fi

echo
echo "${pin1_name}签到${vendername}查看结果"
s=$(curl -sS -k "https://api.m.jd.com/api?appid=interCenter_shopSign&t=1609588867000&loginType=2&functionId=interact_center_shopSign_getSignRecord&body=\{%22token%22:%22${token}%22,%22venderId%22:${venderId},%22activityId%22:${activityId},%22type%22:56\}&jsonp=jsonp1006" \
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
echo -e "$s"
echo -e "$s" | jq '{contiSignNum:.data.days}'

if [ ! -z "$pt_pin2" ]; then
	echo
	echo "${pin2_name}签到${vendername}查看结果"
	s=$(curl -sS -k "https://api.m.jd.com/api?appid=interCenter_shopSign&t=1609588867000&loginType=2&functionId=interact_center_shopSign_getSignRecord&body=\{%22token%22:%22${token}%22,%22venderId%22:${venderId},%22activityId%22:${activityId},%22type%22:56\}&jsonp=jsonp1006" \
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
	echo -e "$s"
	echo -e "$s" | jq '{contiSignNum:.data.days}'

	echo "$rule"
fi
