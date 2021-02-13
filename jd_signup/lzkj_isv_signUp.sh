#set -e

if [ ! -f "$1" ]; then
	echo "not find $1"
	exit
fi
if [ ! -f "$2" ]; then
	echo "not find $2"
	exit
fi

a=false
delay=1

unset pin_name
unset pt_pin
unset pt_key
unset wskey
unset loop_num
unset user_Agent

source $1
source $2
unset giftDate
unset sign_res_info
b=$(mktemp)
sed -r -n '/#.* '${pt_pin}' sign_res$/,/#.* '${pt_pin}' sign_res_end$/p' "$2" > $b
source $b
rm -rvf $b
if [ "$giftDate" = "$(date +"%Y%m%d")" ]; then
	date +"%x %X %N  %s"
	echo "$pin_name 今天已经签到过. giftDate: $giftDate"
	echo "***********************************************"
	echo -e "$sign_res_info"
	echo "***********************************************"
	echo
	cat "$2"
	exit
fi

v_f=$(echo $2 | sed -r -e 's,_delay$|_fq$|_del$,,')
isover=

mkdir -vp "$pt_pin"
cd "$pt_pin"

curl -c ${venderId}_signActivity2.cookie -sS -k "https://lzkj-isv.isvjcloud.com/sign/signActivity2?activityId=${actId}&venderId=${venderId}" \
  -H 'Connection: keep-alive' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H "User-Agent: ${user_Agent}" \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3' \
  -H 'X-Requested-With: com.jingdong.app.mall' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Accept-Language: zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7' > ${venderId}__signActivity2.html
cat ${venderId}_signActivity2.cookie | grep 'LZ_TOKEN' || exit 1


if [ ! -z "$pt_key" ]; then
echo "use pt_key"
token=$(curl -sS -k "https://api.m.jd.com/client.action?functionId=isvObfuscator&${shebei_info}" \
  -H 'Connection: Keep-Alive' \
  -H "Cookie: pt_pin=${pt_pin};pt_key=${pt_key};whwswswws=foI18Q9zUaC97i6asoUmDtCfd4THnF/Hg0kQlv4wvMWHd2xpCmOPMgMdpYZmKHAqh61/QlYFcOsBjUZp7Xm8qlQ==;unionwsws={"devicefinger":"eidA71730131OWEwZDEzODE5MTUzNjliYQ==h4ZzXnuV\/hV8InouSfik8v9bERfLRGc9CC89m+eZer\/sGIDO0Nt96jztN5cRrPy3nYK1G1Oqe395sa9x","jmafinger":"foI18Q9zUaC97i6asoUmDtCfd4THnF\/Hg0kQlv4wvMWHd2xpCmOPMgMdpYZmKHAqh61\/QlYFcOsBjUZp7Xm8qlQ=="};" \
  -H 'Charset: UTF-8' \
  -H "jdc-backup: pt_pin=${pt_pin};pt_key=${pt_key};whwswswws=foI18Q9zUaC97i6asoUmDtCfd4THnF/Hg0kQlv4wvMWHd2xpCmOPMgMdpYZmKHAqh61/QlYFcOsBjUZp7Xm8qlQ==;unionwsws={"devicefinger":"eidA71730131OWEwZDEzODE5MTUzNjliYQ==h4ZzXnuV\/hV8InouSfik8v9bERfLRGc9CC89m+eZer\/sGIDO0Nt96jztN5cRrPy3nYK1G1Oqe395sa9x","jmafinger":"foI18Q9zUaC97i6asoUmDtCfd4THnF\/Hg0kQlv4wvMWHd2xpCmOPMgMdpYZmKHAqh61\/QlYFcOsBjUZp7Xm8qlQ=="};" \
  -H 'Cache-Control: no-cache' \
  -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
  -H 'User-Agent: okhttp/3.12.1' \
  -X POST --data-raw "body=%7B%22id%22%3A%22%22%2C%22url%22%3A%22https%3A%2F%2Flzkj-isv.isvjcloud.com%22%7D&" \
  | jq -j 'if(.code == "0" and .errcode == 0) then .token else error(.) end')
else
echo "use wskey"
token=$(curl -sS -k "https://api.m.jd.com/client.action?functionId=isvObfuscator&${shebei_info}" \
  -H 'Connection: Keep-Alive' \
  -H "Cookie: pin=${pt_pin};wskey=${wskey};whwswswws=foI18Q9zUaC97i6asoUmDtCfd4THnF/Hg0kQlv4wvMWHd2xpCmOPMgMdpYZmKHAqh61/QlYFcOsBjUZp7Xm8qlQ==;unionwsws={"devicefinger":"eidA71730131OWEwZDEzODE5MTUzNjliYQ==h4ZzXnuV\/hV8InouSfik8v9bERfLRGc9CC89m+eZer\/sGIDO0Nt96jztN5cRrPy3nYK1G1Oqe395sa9x","jmafinger":"foI18Q9zUaC97i6asoUmDtCfd4THnF\/Hg0kQlv4wvMWHd2xpCmOPMgMdpYZmKHAqh61\/QlYFcOsBjUZp7Xm8qlQ=="};" \
  -H 'Charset: UTF-8' \
  -H "jdc-backup: pin=${pt_pin};wskey=${wskey};whwswswws=foI18Q9zUaC97i6asoUmDtCfd4THnF/Hg0kQlv4wvMWHd2xpCmOPMgMdpYZmKHAqh61/QlYFcOsBjUZp7Xm8qlQ==;unionwsws={"devicefinger":"eidA71730131OWEwZDEzODE5MTUzNjliYQ==h4ZzXnuV\/hV8InouSfik8v9bERfLRGc9CC89m+eZer\/sGIDO0Nt96jztN5cRrPy3nYK1G1Oqe395sa9x","jmafinger":"foI18Q9zUaC97i6asoUmDtCfd4THnF\/Hg0kQlv4wvMWHd2xpCmOPMgMdpYZmKHAqh61\/QlYFcOsBjUZp7Xm8qlQ=="};" \
  -H 'Cache-Control: no-cache' \
 	-H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
  -H 'User-Agent: okhttp/3.12.1' \
  -X POST --data-raw "body=%7B%22id%22%3A%22%22%2C%22url%22%3A%22https%3A%2F%2Flzkj-isv.isvjcloud.com%22%7D&" \
  | jq -j 'if(.code == "0" and .errcode == 0) then .token else error(.) end')
fi
echo "token: $token"
[ ! -z "$token" ] || exit 2


secretPin=$(curl -sS -k -b ${venderId}_signActivity2.cookie 'https://lzkj-isv.isvjcloud.com/customer/getMyPing' \
  -H 'Connection: keep-alive' \
  -H 'Accept: application/json' \
  -H 'Origin: https://lzkj-isv.isvjcloud.com' \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H "User-Agent: ${user_Agent}" \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/signActivity2?activityId=${actId}&venderId=${venderId}" \
  -H 'Accept-Language: zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7' \
  --data-raw "userId=${venderId}&token=${token}&fromType=APP" | jq -j 'if(.result == true and .errorMessage == "") then .data.secretPin else error(.) end')
echo "secretPin: $secretPin"
[ ! -z "$secretPin" ] || exit 2


if [ "$3" == "check" ]; then
	echo "check sign. not run sign"
else

	for i in $(seq 1 $loop_num); do

	if [ "$a" = "false" ]; then
	echo
	date +"%x %X %N  %s"
	echo "${pin_name}签到$vendername"
	t=$(curl -sS -k -b ${venderId}_signActivity2.cookie 'https://lzkj-isv.isvjcloud.com/sign/wx/signUp' \
	  -H 'Connection: keep-alive' \
	  -H 'Accept: application/json' \
	  -H 'Origin: https://lzkj-isv.isvjcloud.com' \
	  -H 'X-Requested-With: XMLHttpRequest' \
	  -H "User-Agent: ${user_Agent}" \
	  -H 'Sec-Fetch-Mode: cors' \
	  -H 'Content-Type: application/x-www-form-urlencoded' \
	  -H 'Sec-Fetch-Site: same-origin' \
	  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/signActivity2?activityId=${actId}&venderId=${venderId}" \
	  -H 'Accept-Language: zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7' \
	  -X POST --data-raw "actId=${actId}" --data-urlencode "pin=${secretPin}")
	  echo -e "$t" > ${venderId}_signUp.html
	  echo -e "$t" | jq
	  echo "$t"| jq '.isOk' | grep 'true' && a=true
	  
	  if [ $(echo "$t" | jq '.msg' | egrep '当前不存在有效的活动|活动已结束|活动已经结束|该活动已经不存在'>/dev/null;echo $?) -eq 0 ]; then
	  	echo "活动已结束. $2 --> ${v_f}_del"
	  	mv -vf "$2" "${v_f}_del"
	  	isover=true
	  	a=true
	  	break
	  fi
	  echo "$t" | jq '.msg' | egrep '您已完成当天签到|当天只能签到一次|当天只允许签到一次|会员才能参加活动|该活动已经不存在|用户达到签到上限' && a=true
	fi

	if [ "$a" = "true" ]; then
	echo "签到${vendername}完成"
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
		let RANDOM_num=RANDOM_num*2
		sleep $RANDOM_num
	fi

fi

source /home/myid/jd/jd_signup/common.sh
if [ -z "$isover" ]; then
	sed -i -r '/#.* '${pt_pin}' sign_res$/,/#.* '${pt_pin}' sign_res_end$/d' $2
fi

s=$(curl -sS -k -b ${venderId}_signActivity2.cookie 'https://lzkj-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H 'Connection: keep-alive' \
  -H 'Accept: application/json' \
  -H 'Origin: https://lzkj-isv.isvjcloud.com' \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H "User-Agent: ${user_Agent}" \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/signActivity2?activityId=${actId}&venderId=${venderId}" \
  -H 'Accept-Language: zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7' \
  -X POST --data-raw "venderId=${venderId}" --data-urlencode "pin=${secretPin}" --data-raw "actId=${actId}")
if [ -z "$isover" ]; then
	write_sign_res_lzkj "$pin_name ${pt_pin}" ${2} "$s" "$t"
fi

p=$(curl -sS -k -b ${venderId}_signActivity2.cookie 'https://lzkj-isv.isvjcloud.com/sign/wx/getActivity' \
  -H 'Connection: keep-alive' \
  -H 'Accept: application/json' \
  -H 'Origin: https://lzkj-isv.isvjcloud.com' \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H "User-Agent: ${user_Agent}" \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/signActivity2" \
  -H 'Accept-Language: zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7' \
  -X POST --data-raw "venderId=${venderId}&actId=${actId}")


echo
echo "${pin_name}签到${vendername}查看结果"
echo -e "$s"
echo
echo -e "$s" | jq '{signDetail, contiSignNum: .signRecord.contiSignNum, totalSignNum: .signRecord.totalSignNum}'
echo
echo "${vendername}活动规则"
echo -e "$p" 
echo
echo "$p" | jq '{actUrl: .act.actUrl, shortUrl: .act.shortUrl, actRule: .act.actRule}'
if [ -z "$isover" ]; then
	cat "$2"
else
	cat "${v_f}_del"
fi
