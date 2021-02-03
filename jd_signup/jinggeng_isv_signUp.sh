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
t=$(curl -sS -k 'https://jinggeng-isv.isvjcloud.com/ql/front/saveSignIn' \
  -H "Host: jinggeng-isv.isvjcloud.com" \
  -H "Origin: https://jinggeng-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Cookie: dfs=${dfs1}" \
  -X POST -d "act_id=${actId}&user_id=${user_id}" )
  echo -e "$t"
  echo "$t"| jq '.isOk' | grep 'true' && a=true
  echo "$t" | jq '.msg' | egrep '今天已经签到过|只有部分会员才可以参加活动|当前不存在有效的活动|活动已结束|活动已经结束' && a=true
fi

if [ "$b" = "false" ]; then
echo
date +"%x %X %N  %s"
echo "${pin2_name}签到$vendername"
t=$(curl -sS -k 'https://jinggeng-isv.isvjcloud.com/ql/front/saveSignIn' \
  -H "Host: jinggeng-isv.isvjcloud.com" \
  -H "Origin: https://jinggeng-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Cookie: dfs=${dfs2}" \
  -X POST -d "act_id=${actId}&user_id=${user_id}" )
	echo -e "$t"
  echo "$t"| jq '.isOk' | grep 'true' && b=true
  echo "$t" | jq '.msg' | egrep '今天已经签到过|只有部分会员才可以参加活动|当前不存在有效的活动|活动已结束|活动已经结束' && b=true
fi	

if [ "$a" = "true" ] && [ "$b" = "true" ]; then
echo "签到${vendername}完成"
	break
else
	time sleep $(echo "0.2 * $delay"|bc)
	delay=$(($delay + 1))
fi
done

echo "$rule"
