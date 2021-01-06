delay=1

for i in $(seq 1 20); do
echo
date +"%x %X %N  %s"
echo 赵签到博世
curl -sS -k 'https://api.m.jd.com/api?appid=interCenter_shopSign&t=1609588867000&loginType=2&functionId=interact_center_shopSign_signCollectGift&body=\{%22token%22:%2237B57F259CEA113FC7F0D636B3DD68FF%22,%22venderId%22:1000002423,%22activityId%22:10232978,%22type%22:56,%22actionType%22:7\}&jsonp=jsonp1004' \
  -H 'authority: api.m.jd.com' \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H 'accept: */*' \
  -H 'sec-fetch-site: same-site' \
  -H 'sec-fetch-mode: no-cors' \
  -H 'sec-fetch-dest: script' \
  -H 'referer: https://h5.m.jd.com/' \
  -H 'accept-language: zh-CN,zh;q=0.9' \
  -H 'cookie: pt_key=AAJf59FhADDaW3yNgnbTMof7uKprKxlqQ-Zi9fqPO7TCRiJLgaIqlXOc5P3wK6kUjx5ULeJ7xQY; pt_pin=122294312-396444' \
  --compressed | sed -r -e 's,^jsonp[_]*[^(]+[(],,' -e 's,[)][;]*$,,' 

echo
date +"%x %X %N  %s"
echo 王签到博世
curl -sS -k 'https://api.m.jd.com/api?appid=interCenter_shopSign&t=1609588867000&loginType=2&functionId=interact_center_shopSign_signCollectGift&body=\{%22token%22:%2237B57F259CEA113FC7F0D636B3DD68FF%22,%22venderId%22:1000002423,%22activityId%22:10232978,%22type%22:56,%22actionType%22:7\}&jsonp=jsonp1004' \
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

time sleep $(echo "0.2 * $delay"|bc)
delay=$(($delay + 1))
done

echo
echo 王签到博世查看结果
curl -sS -k 'https://api.m.jd.com/api?appid=interCenter_shopSign&t=1609588867000&loginType=2&functionId=interact_center_shopSign_getSignRecord&body=\{%22token%22:%2237B57F259CEA113FC7F0D636B3DD68FF%22,%22venderId%22:1000002423,%22activityId%22:10232978,%22type%22:56\}&jsonp=jsonp1006' \
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

echo
echo 赵签到博世查看结果
curl -sS -k 'https://api.m.jd.com/api?appid=interCenter_shopSign&t=1609588867000&loginType=2&functionId=interact_center_shopSign_getSignRecord&body=\{%22token%22:%2237B57F259CEA113FC7F0D636B3DD68FF%22,%22venderId%22:1000002423,%22activityId%22:10232978,%22type%22:56\}&jsonp=jsonp1006' \
  -H 'authority: api.m.jd.com' \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H 'accept: */*' \
  -H 'sec-fetch-site: same-site' \
  -H 'sec-fetch-mode: no-cors' \
  -H 'sec-fetch-dest: script' \
  -H 'referer: https://h5.m.jd.com/' \
  -H 'accept-language: zh-CN,zh;q=0.9' \
  -H 'cookie: pt_key=AAJf59FhADDaW3yNgnbTMof7uKprKxlqQ-Zi9fqPO7TCRiJLgaIqlXOc5P3wK6kUjx5ULeJ7xQY; pt_pin=122294312-396444' \
  --compressed | sed -r -e 's,^jsonp[_]*[^(]+[(],,' -e 's,[)][;]*$,,' 
