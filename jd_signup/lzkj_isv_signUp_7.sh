#set -e

a=false
delay=1

unset svr
unset pin_name
unset pt_pin
unset pt_key
unset wskey
unset loop_num
unset user_Agent

source $1
source $2

if [ -z "$svr" ]; then
	svr="lzkj-isv.isvjcloud.com"
fi

if [ "${svr:0:8}" = "lzkj-isv" ]; then
	shebei="$shebei_info"
elif [ "${svr:0:8}" = "cjhy-isv" ]; then
	shebei="$shebei_cjhy_info"
else
	echo "not support: $svr"
	exit 1
fi

mkdir -vp "$pt_pin"
cd "$pt_pin"

curl -c ${venderId}_signActivity2.cookie -sS -k "https://${svr}/sign/sevenDay/signActivity?activityId=${actId}&shopid=${venderId}" \
  -H 'Connection: keep-alive' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H "User-Agent: ${user_Agent}" \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3' \
  -H 'X-Requested-With: com.jingdong.app.mall' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Accept-Language: zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7' > ${venderId}__signActivity2.html
if [ "${svr:0:8}" = "lzkj-isv" ]; then
	cat ${venderId}_signActivity2.cookie | grep 'LZ_TOKEN' || exit 1
elif [ "${svr:0:8}" = "cjhy-isv" ]; then
	echo "cjhy 忽略 LZ_TOKEN"
else
	echo "not support: $svr"
	exit 1
fi


if [ ! -z "$pt_key" ]; then
echo "use pt_key"
token=$(curl -sS -k "https://api.m.jd.com/client.action?functionId=isvObfuscator&${shebei}" \
  -H 'Connection: Keep-Alive' \
  -H "Cookie: pt_pin=${pt_pin};pt_key=${pt_key};whwswswws=foI18Q9zUaC97i6asoUmDtCfd4THnF/Hg0kQlv4wvMWHd2xpCmOPMgMdpYZmKHAqh61/QlYFcOsBjUZp7Xm8qlQ==;unionwsws={"devicefinger":"eidA71730131OWEwZDEzODE5MTUzNjliYQ==h4ZzXnuV\/hV8InouSfik8v9bERfLRGc9CC89m+eZer\/sGIDO0Nt96jztN5cRrPy3nYK1G1Oqe395sa9x","jmafinger":"foI18Q9zUaC97i6asoUmDtCfd4THnF\/Hg0kQlv4wvMWHd2xpCmOPMgMdpYZmKHAqh61\/QlYFcOsBjUZp7Xm8qlQ=="};" \
  -H 'Charset: UTF-8' \
  -H "jdc-backup: pt_pin=${pt_pin};pt_key=${pt_key};whwswswws=foI18Q9zUaC97i6asoUmDtCfd4THnF/Hg0kQlv4wvMWHd2xpCmOPMgMdpYZmKHAqh61/QlYFcOsBjUZp7Xm8qlQ==;unionwsws={"devicefinger":"eidA71730131OWEwZDEzODE5MTUzNjliYQ==h4ZzXnuV\/hV8InouSfik8v9bERfLRGc9CC89m+eZer\/sGIDO0Nt96jztN5cRrPy3nYK1G1Oqe395sa9x","jmafinger":"foI18Q9zUaC97i6asoUmDtCfd4THnF\/Hg0kQlv4wvMWHd2xpCmOPMgMdpYZmKHAqh61\/QlYFcOsBjUZp7Xm8qlQ=="};" \
  -H 'Cache-Control: no-cache' \
  -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
  -H 'User-Agent: okhttp/3.12.1' \
  -X POST --data-raw "body=%7B%22id%22%3A%22%22%2C%22url%22%3A%22https%3A%2F%2F${svr}%22%7D&" \
  | jq -j 'if(.code == "0" and .errcode == 0) then .token else error(.) end')
else
echo "use wskey"
token=$(curl -sS -k "https://api.m.jd.com/client.action?functionId=isvObfuscator&${shebei}" \
  -H 'Connection: Keep-Alive' \
  -H "Cookie: pin=${pt_pin};wskey=${wskey};whwswswws=foI18Q9zUaC97i6asoUmDtCfd4THnF/Hg0kQlv4wvMWHd2xpCmOPMgMdpYZmKHAqh61/QlYFcOsBjUZp7Xm8qlQ==;unionwsws={"devicefinger":"eidA71730131OWEwZDEzODE5MTUzNjliYQ==h4ZzXnuV\/hV8InouSfik8v9bERfLRGc9CC89m+eZer\/sGIDO0Nt96jztN5cRrPy3nYK1G1Oqe395sa9x","jmafinger":"foI18Q9zUaC97i6asoUmDtCfd4THnF\/Hg0kQlv4wvMWHd2xpCmOPMgMdpYZmKHAqh61\/QlYFcOsBjUZp7Xm8qlQ=="};" \
  -H 'Charset: UTF-8' \
  -H "jdc-backup: pin=${pt_pin};wskey=${wskey};whwswswws=foI18Q9zUaC97i6asoUmDtCfd4THnF/Hg0kQlv4wvMWHd2xpCmOPMgMdpYZmKHAqh61/QlYFcOsBjUZp7Xm8qlQ==;unionwsws={"devicefinger":"eidA71730131OWEwZDEzODE5MTUzNjliYQ==h4ZzXnuV\/hV8InouSfik8v9bERfLRGc9CC89m+eZer\/sGIDO0Nt96jztN5cRrPy3nYK1G1Oqe395sa9x","jmafinger":"foI18Q9zUaC97i6asoUmDtCfd4THnF\/Hg0kQlv4wvMWHd2xpCmOPMgMdpYZmKHAqh61\/QlYFcOsBjUZp7Xm8qlQ=="};" \
  -H 'Cache-Control: no-cache' \
 -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
  -H 'User-Agent: okhttp/3.12.1' \
  -X POST --data-raw "body=%7B%22id%22%3A%22%22%2C%22url%22%3A%22https%3A%2F%2F${svr}%22%7D&" \
  | jq -j 'if(.code == "0" and .errcode == 0) then .token else error(.) end')
fi
echo "token: $token"
[ ! -z "$token" ] || exit 2


secretPin=$(curl -sS -k -b ${venderId}_signActivity2.cookie "https://${svr}/customer/getMyPing" \
  -H 'Connection: keep-alive' \
  -H 'Accept: application/json' \
  -H 'Origin: https://${svr}' \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H "User-Agent: ${user_Agent}" \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H "Referer: https://${svr}/sign/signActivity2?activityId=${actId}&venderId=${venderId}" \
  -H 'Accept-Language: zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7' \
  --data-raw "userId=${venderId}&token=${token}&fromType=APP" | jq -j 'if(.result == true and .errorMessage == "") then .data.secretPin else error(.) end')
echo "secretPin: $secretPin"
[ ! -z "$secretPin" ] || exit 2


for i in $(seq 1 $loop_num); do

if [ "$a" = "false" ]; then
echo
date +"%x %X %N  %s"
echo "${pin_name}签到$vendername"
t=$(curl -sS -k -b ${venderId}_signActivity2.cookie "https://${svr}/sign/sevenDay/wx/signUp" \
  -H 'Connection: keep-alive' \
  -H 'Accept: application/json' \
  -H "Origin: https://${svr}" \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H "User-Agent: ${user_Agent}" \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H "Referer: https://${svr}/sign/signActivity2?activityId=${actId}&venderId=${venderId}" \
  -H 'Accept-Language: zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7' \
  -X POST --data-raw "actId=${actId}" --data-urlencode "pin=${secretPin}")
  echo -e "$t" > ${venderId}_signUp.html
  echo -e "$t" | jq
  echo "$t"| jq '.isOk' | grep 'true' && a=true
  echo "$t" | jq '.msg' | egrep '当天只能签到一次|当天只允许签到一次|当前不存在有效的活动|活动已结束|活动已经结束|会员才能参加活动|该活动已经不存在|用户达到签到上限' && a=true
fi

if [ "$a" = "true" ]; then
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
	sleep 38
fi

echo
echo "${pin_name}签到${vendername}查看结果, 活动规则"
s=$(curl -sS -k -b ${venderId}_signActivity2.cookie "https://${svr}/sign/sevenDay/wx/getSignInfo" \
  -H 'Connection: keep-alive' \
  -H 'Accept: application/json' \
  -H "Origin: https://${svr}" \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H "User-Agent: ${user_Agent}" \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H "Referer: https://${svr}/sign/signActivity2?activityId=${actId}&venderId=${venderId}" \
  -H 'Accept-Language: zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7' \
  -X POST --data-raw "venderId=${venderId}" --data-urlencode "pin=${secretPin}" --data-raw "actId=${actId}")
echo -e "$s"
#echo -e "$s" | jq '{signDetail, contiSignNum: .signRecord.contiSignNum, totalSignNum: .signRecord.totalSignNum}'

exit








a=false
b=false
delay=1

source $1
source $2

for i in $(seq 1 $loop_num); do

if [ "$a" = "false" ]; then
echo
date +"%x %X %N  %s"
echo "${pin1_name}签到$vendername"

t=$(curl -sS -k 'https://${svr}/sign/sevenDay/wx/signUp' \
  -H "Host: ${svr}" \
  -H "Accept: application/json" \
  -H "Origin: https://${svr}" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://${svr}/sign/sevenDay/signActivity" \
	-X POST --data-raw "actId=${actId}&pin=${pin1_7}")  
  echo -e "$t"
  echo "$t"| jq '.isOk' | grep 'true' && a=true
  echo "$t" | jq '.msg' | egrep '当天只能签到一次|当天只允许签到一次|当前不存在有效的活动|活动已结束|活动已经结束' && a=true
fi

if [ "$b" = "false" ]; then
echo
date +"%x %X %N  %s"
echo "${pin2_name}签到$vendername"
t=$(curl -sS -k 'https://${svr}/sign/sevenDay/wx/signUp' \
  -H "Host: ${svr}" \
  -H "Accept: application/json" \
  -H "Origin: https://${svr}" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://${svr}/sign/sevenDay/signActivity" \
  -X POST --data-raw "actId=${actId}&pin=${pin2_7}")
	echo -e "$t"
  echo "$t"| jq '.isOk' | grep 'true' && b=true
  echo "$t" | jq '.msg' | egrep '当天只能签到一次|当天只允许签到一次|当前不存在有效的活动|活动已结束|活动已经结束' && b=true
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
	sleep 45
fi

echo
echo "${pin1_name}签到${vendername}查看结果"
s=$(curl -sS -k 'https://${svr}/sign/sevenDay/wx/getSignInfo' \
  -H "Host: ${svr}" \
  -H "Accept: application/json" \
  -H "Origin: https://${svr}" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
	-X POST --data-raw "venderId=${venderId}&actId=${actId}&pin=${pin1_7}" )  
echo -e "$s"
echo -e "$s" | jq '{contiSignNum: .signRecord.contiSignNum, totalSignNum: .signRecord.totalSignNum}'

echo
echo "${pin2_name}签到${vendername}查看结果"
s=$(curl -sS -k 'https://${svr}/sign/sevenDay/wx/getSignInfo' \
  -H "Host: ${svr}" \
  -H "Accept: application/json" \
  -H "Origin: https://${svr}" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "venderId=${venderId}&actId=${actId}&pin=${pin2_7}" )
echo -e "$s"
echo -e "$s" | jq '{contiSignNum: .signRecord.contiSignNum, totalSignNum: .signRecord.totalSignNum}'

echo "$rule"
