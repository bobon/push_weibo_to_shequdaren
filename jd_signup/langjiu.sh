#每天签到3豆 连续签到10天：100店铺积分
#https://taou.cn/xYgWJ

a=false
b=false
delay=1

for i in $(seq 1 20); do

if [ "$a" = "false" ]; then
echo
date +"%x %X %N  %s"
echo "zhao立白"
t=$(curl -sS -k 'https://api.m.jd.com/api?appid=interCenter_shopSign&t=1609858828000&loginType=2&functionId=interact_center_shopSign_signCollectGift&body=\{%22token%22:%22FA8AED2131CECF82104859C8815EB402%22,%22venderId%22:1000338161,%22activityId%22:10233642,%22type%22:56\}&jsonp=jsonp1004' \
  -H 'authority: api.m.jd.com' \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H 'accept: */*' \
  -H 'sec-fetch-site: same-site' \
  -H 'sec-fetch-mode: no-cors' \
  -H 'sec-fetch-dest: script' \
  -H 'referer: https://h5.m.jd.com/' \
  -H 'accept-language: zh-CN,zh;q=0.9' \
  -H 'cookie: pt_key=AAJf9HGrADDwgLKAvgGsS5Vw4L3ApXkO64FgbV68Gz24G5J7I1W7v-DIq0_REW2A7ppYMb9tyTw; pt_pin=122294312-396444' \
  --compressed | sed -r -e 's,^jsonp[_]*[^(]+[(],,' -e 's,[)][;]*$,,'  )
  echo -e "$t"
  echo "$t" | jq '.success' | grep 'true' && a=true
  echo "$t" | jq '.msg' | grep '你已经参加过该活动啦' && a=true
fi

if [ "$b" = "false" ]; then
echo
date +"%x %X %N  %s"
echo
echo "wang立白"
t=$(curl -sS -k 'https://api.m.jd.com/api?appid=interCenter_shopSign&t=1609858828000&loginType=2&functionId=interact_center_shopSign_signCollectGift&body=\{%22token%22:%22FA8AED2131CECF82104859C8815EB402%22,%22venderId%22:1000338161,%22activityId%22:10233642,%22type%22:56\}&jsonp=jsonp1004' \
  -H 'authority: api.m.jd.com' \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H 'accept: */*' \
  -H 'sec-fetch-site: same-site' \
  -H 'sec-fetch-mode: no-cors' \
  -H 'sec-fetch-dest: script' \
  -H 'referer: https://h5.m.jd.com/' \
  -H 'accept-language: zh-CN,zh;q=0.9' \
  -H 'cookie: pt_key=AAJf59IjADAf50gAWSLI8lwLNy_a43t_Cd7SG-BtvW0B1mYg136OnnoXS89YyqbLqLj25m6Z8Xs;pt_pin=1309893722-164885' \
  --compressed | sed -r -e 's,^jsonp[_]*[^(]+[(],,' -e 's,[)][;]*$,,' )
	echo -e "$t"
  echo "$t" | jq '.success' | grep 'true' && b=true
  echo "$t" | jq '.msg' | grep '你已经参加过该活动啦' && b=true
fi	

if [ "$a" = "true" ] && [ "$b" = "true" ]; then
	echo 签到立白完成
	break
else
	time sleep $(echo "0.2 * $delay"|bc)
	delay=$(($delay + 1))
fi
done

echo
echo "zhao查看结果"
curl -sS -k 'https://api.m.jd.com/api?appid=interCenter_shopSign&t=1609934732000&loginType=2&functionId=interact_center_shopSign_getSignRecord&body=\{%22token%22:%22FA8AED2131CECF82104859C8815EB402%22,%22venderId%22:1000338161,%22activityId%22:10233642,%22type%22:56\}&jsonp=jsonp1002' \
  -H 'authority: api.m.jd.com' \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H 'accept: */*' \
  -H 'sec-fetch-site: same-site' \
  -H 'sec-fetch-mode: no-cors' \
  -H 'sec-fetch-dest: script' \
  -H 'referer: https://h5.m.jd.com/' \
  -H 'accept-language: zh-CN,zh;q=0.9' \
  -H 'cookie: pt_key=AAJf9HGrADDwgLKAvgGsS5Vw4L3ApXkO64FgbV68Gz24G5J7I1W7v-DIq0_REW2A7ppYMb9tyTw; pt_pin=122294312-396444' \
  --compressed | sed -r -e 's,^jsonp[_]*[^(]+[(],,' -e 's,[)][;]*$,,' 

echo
echo "wang查看结果"
curl -sS -k 'https://api.m.jd.com/api?appid=interCenter_shopSign&t=1609934732000&loginType=2&functionId=interact_center_shopSign_getSignRecord&body=\{%22token%22:%22FA8AED2131CECF82104859C8815EB402%22,%22venderId%22:1000338161,%22activityId%22:10233642,%22type%22:56\}&jsonp=jsonp1002' \
  -H 'authority: api.m.jd.com' \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H 'accept: */*' \
  -H 'sec-fetch-site: same-site' \
  -H 'sec-fetch-mode: no-cors' \
  -H 'sec-fetch-dest: script' \
  -H 'referer: https://h5.m.jd.com/' \
  -H 'accept-language: zh-CN,zh;q=0.9' \
  -H 'cookie: pt_key=AAJf59IjADAf50gAWSLI8lwLNy_a43t_Cd7SG-BtvW0B1mYg136OnnoXS89YyqbLqLj25m6Z8Xs;pt_pin=1309893722-164885' \
  --compressed | sed -r -e 's,^jsonp[_]*[^(]+[(],,' -e 's,[)][;]*$,,' 
