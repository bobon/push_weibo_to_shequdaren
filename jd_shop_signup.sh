#签到先锋  4天111+5天222+6天333+7天400豆
bash /home/myid/jd/jd_signup/xianfeng.sh > /home/myid/jd/jd_signup/xianfeng1.log 2>&1 &
bash /home/myid/jd/jd_signup/xianfeng.sh > /home/myid/jd/jd_signup/xianfeng2.log 2>&1 &
bash /home/myid/jd/jd_signup/xianfeng.sh > /home/myid/jd/jd_signup/xianfeng3.log 2>&1 &
bash /home/myid/jd/jd_signup/xianfeng.sh > /home/myid/jd/jd_signup/xianfeng4.log 2>&1 &
bash /home/myid/jd/jd_signup/xianfeng.sh > /home/myid/jd/jd_signup/xianfeng5.log 2>&1 &
bash /home/myid/jd/jd_signup/xianfeng.sh > /home/myid/jd/jd_signup/xianfeng6.log 2>&1 &
bash /home/myid/jd/jd_signup/xianfeng.sh > /home/myid/jd/jd_signup/xianfeng7.log 2>&1 &
bash /home/myid/jd/jd_signup/xianfeng.sh > /home/myid/jd/jd_signup/xianfeng8.log 2>&1 &
bash /home/myid/jd/jd_signup/xianfeng.sh > /home/myid/jd/jd_signup/xianfeng9.log 2>&1 &
bash /home/myid/jd/jd_signup/xianfeng.sh > /home/myid/jd/jd_signup/xianfeng10.log 2>&1 &

#签到十月稻田  7天(50)，14天(80)，21天(100)，29天(200) (没给豆)
bash /home/myid/jd/jd_signup/shiyuedaotian.sh > /home/myid/jd/jd_signup/shiyuedaotian.log 2>&1 &

#签到博世  每日签到：获得2京豆  连续签到7天：88京豆 (给豆)
bash /home/myid/jd/jd_signup/boshi.sh > /home/myid/jd/jd_signup/boshi.log 2>&1 &

#签到立白  每天签到3豆 连续签到10天：100店铺积分
bash /home/myid/jd/jd_signup/langjiu.sh > /home/myid/jd/jd_signup/langjiu.log 2>&1 &

#签到直隶  每日签到：获得1京豆, 7天10豆 14天20豆
bash /home/myid/jd/jd_signup/zhili.sh > /home/myid/jd/jd_signup/zhili.log 2>&1 &

#橙影  每日签到：获得2京豆   连续签到27天：100京豆
bash /home/myid/jd/jd_signup/chengying.sh > /home/myid/jd/jd_signup/chengying.log 2>&1 &

#博之轮  连续签到3天：10京豆 (给豆)
bash /home/myid/jd/jd_signup/bozhilun.sh > /home/myid/jd/jd_signup/bozhilun.log 2>&1 &

#弱水时砂  连续签到7天：5京豆 (活动取消)
bash /home/myid/jd/jd_signup/ruoshui.sh > /home/myid/jd/jd_signup/ruoshui.log 2>&1 &


for i in $(seq 1 5); do
date

echo
echo 赵签到惠氏
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
	-X POST --data-raw "actId=6523558dd92e4570a5d8844e7daa90f8&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 
sleep 5

echo
echo 王签到惠氏
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
	-X POST --data-raw "actId=6523558dd92e4570a5d8844e7daa90f8&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 
sleep 5

echo
echo 赵公牛插座京东自营旗舰店
curl -sS -k 'https://cjhy-isv.isvjcloud.com/sign/sevenDay/wx/signUp' \
  -H "Host: cjhy-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://cjhy-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Referer: https://cjhy-isv.isvjcloud.com/sign/sevenDay/signActivity" \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "actId=7b63ad5f2d354e8c9da9de9c7d4e6d8a&pin=51S2JqsypB%2Fnfj45frYeodA1Drq3za4lh6LFLfledF1cdSiqMbCx5edEEaL3RnCSkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 
sleep 5

echo
echo 王公牛插座京东自营旗舰店
curl -sS -k 'https://cjhy-isv.isvjcloud.com/sign/sevenDay/wx/signUp' \
  -H "Host: cjhy-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://cjhy-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Referer: https://cjhy-isv.isvjcloud.com/sign/sevenDay/signActivity" \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "actId=7b63ad5f2d354e8c9da9de9c7d4e6d8a&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoJ%2FaYQCF9xTRGADPBdXAeGZIc5W3Gm9rFqTMy14wk5X4TLid74kYDlVq9GcJaKyuw%3D%3D" 
sleep 5

echo
echo 赵张裕旗下巴狄士多奇葡萄酒京东自营旗店
curl -sS -k 'https://jinggeng-isv.isvjcloud.com/ql/front/saveSignIn' \
  -H "Host: jinggeng-isv.isvjcloud.com" \
  -H "Origin: https://jinggeng-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Cookie: dfs=zjCaT3Evzluy0HWZo3ke%2BvxwtE91Ut8adrA9ExLHNhmtOzujiMcGW9evAEBIMFATIJ4fAHFD0jWYtODQqWXRErCG8YiAuHJM5iAd6K9suTHoS3RYZL2Tu2FjEZIVmqyavVsltI%2B2dT0P9v4AI5C8L1KpmGtiNxg22U7gSf6gFXTTnRINWzo5B%2F9ayTWgDFPX5WIH%2BtgzsSr2zw5%2FytILvRLYrET%2F5jy0ftd1xS6p75aL27ZlFQjaFNxyrUdrB90lc5wmlvITPcCymEvK5FK6WwtlDyveml5aUhmJQr5Vdr3EAOXPWKb9rHBXcoKkAHaUK47ZvoCs2Y%2FV3GbhuD4JGurcFm9gtkoA6HzeYt9ERBY%3D" \
  -X POST -d "act_id=2c91808476b7fdb80176b85564ce1b8f&user_id=1000324022" 
sleep 5

echo
echo 王张裕旗下巴狄士多奇葡萄酒京东自营旗店
curl -sS -k 'https://jinggeng-isv.isvjcloud.com/ql/front/saveSignIn' \
  -H "Host: jinggeng-isv.isvjcloud.com" \
  -H "Origin: https://jinggeng-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Cookie: dfs=0shmcr4siXLIHu05EqyN76i0cqRZYLGYmnKnadWWEcmaJmw6%2FNwaWU6%2Fv5N22%2B1ZuhvQaRx1GFs%2BUk3lYCzTE%2FhNlhmlbj1KGWKOq0XUUIlmwdZBXPR%2FpcjZiBU5K2aC3xs%2F1srqhCpvLzxRHBRpa5%2B%2BVqPfkRTCMFjXgvvYM5SbpDSjvwr3T6AztPgL4KoZitZoZy9MIFdAoQqiS0u02lE7BktVez%2FCiZs0LKhSLc%2FRezfC0iY4OKwWpCVEXlgZB2wExHZJnU3ddA3iE%2FArJWCUgW662Wud3y0tgM03%2BiIf1xJKh1%2B8Cp%2F3c96SGKLrqNDSqjCXHqf5e5%2Fu9D6HU%2Fu3sQ4cVzA0NflLZyjzqM4%3D" \
  -X POST -d "act_id=2c91808476b7fdb80176b85564ce1b8f&user_id=1000324022" 
sleep 5

echo
echo 赵21金维他官方旗舰店
curl -sS -k 'https://cjhy-isv.isvjcloud.com/sign/sevenDay/wx/signUp' \
  -H "Host: cjhy-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://cjhy-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Referer: https://cjhy-isv.isvjcloud.com/sign/sevenDay/signActivity" \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "actId=00a40dec6b0842a28fd86298da0dd172&pin=51S2JqsypB%2Fnfj45frYeodA1Drq3za4lh6LFLfledF1cdSiqMbCx5edEEaL3RnCSkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 
sleep 5

echo
echo 王21金维他官方旗舰店
curl -sS -k 'https://cjhy-isv.isvjcloud.com/sign/sevenDay/wx/signUp' \
  -H "Host: cjhy-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://cjhy-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Referer: https://cjhy-isv.isvjcloud.com/sign/sevenDay/signActivity" \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "actId=00a40dec6b0842a28fd86298da0dd172&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoJ%2FaYQCF9xTRGADPBdXAeGZIc5W3Gm9rFqTMy14wk5X4TLid74kYDlVq9GcJaKyuw%3D%3D" 
sleep 5

echo
echo 赵第六感京东自营旗舰店
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
	-X POST --data-raw "actId=7b240f1d6d8f4949a1c4a6527bce746b&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 
sleep 5

echo
echo 王第六感京东自营旗舰店
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
	-X POST --data-raw "actId=7b240f1d6d8f4949a1c4a6527bce746b&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 
sleep 5

echo
echo 赵杰士邦京东自营旗舰店
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
	-X POST --data-raw "actId=f93fcb193c31471c8b4eeaf72b3cece2&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 
sleep 5

echo
echo 王杰士邦京东自营旗舰店
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
	-X POST --data-raw "actId=f93fcb193c31471c8b4eeaf72b3cece2&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 
sleep 5

echo
echo 赵飞利浦官方签到
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
	-X POST --data-raw "actId=3cf2566d9ecb421e80352d30759d7f87&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 
sleep 5

echo
echo 王飞利浦官方签到
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
	-X POST --data-raw "actId=3cf2566d9ecb421e80352d30759d7f87&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 
sleep 5

echo
echo 赵海澜之家官方旗舰店
curl -sS -k 'https://cjhy-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: cjhy-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://cjhy-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Referer: https://cjhy-isv.isvjcloud.com/sign/signActivity" \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "actId=6b99417f3e31492c8980dc0f4a452391&pin=51S2JqsypB%2Fnfj45frYeodA1Drq3za4lh6LFLfledF1cdSiqMbCx5edEEaL3RnCSkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 
sleep 5

echo
echo 王海澜之家官方旗舰店
curl -sS -k 'https://cjhy-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: cjhy-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://cjhy-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Referer: https://cjhy-isv.isvjcloud.com/sign/signActivity" \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "actId=6b99417f3e31492c8980dc0f4a452391&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoJ%2FaYQCF9xTRGADPBdXAeGZIc5W3Gm9rFqTMy14wk5X4TLid74kYDlVq9GcJaKyuw%3D%3D" 
sleep 5

echo
echo 赵全棉时代官方旗舰店
curl -sS -k 'https://cjhy-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: cjhy-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://cjhy-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Referer: https://cjhy-isv.isvjcloud.com/sign/signActivity" \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "actId=dc373408902f4177ae43b346b1283beb&pin=51S2JqsypB%2Fnfj45frYeodA1Drq3za4lh6LFLfledF1cdSiqMbCx5edEEaL3RnCSkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 
sleep 5

echo
echo 王全棉时代官方旗舰店
curl -sS -k 'https://cjhy-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: cjhy-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://cjhy-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Referer: https://cjhy-isv.isvjcloud.com/sign/signActivity" \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "actId=dc373408902f4177ae43b346b1283beb&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoJ%2FaYQCF9xTRGADPBdXAeGZIc5W3Gm9rFqTMy14wk5X4TLid74kYDlVq9GcJaKyuw%3D%3D" 
sleep 5

echo
echo 赵汾酒官方旗舰店
curl -sS -k 'https://cjhy-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: cjhy-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://cjhy-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Referer: https://cjhy-isv.isvjcloud.com/sign/signActivity" \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "actId=b4d9c9f6cfd147bcb108b1cabadb0e5d&pin=51S2JqsypB%2Fnfj45frYeodA1Drq3za4lh6LFLfledF1cdSiqMbCx5edEEaL3RnCSkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 
sleep 5

echo
echo 王汾酒官方旗舰店
curl -sS -k 'https://cjhy-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: cjhy-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://cjhy-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Referer: https://cjhy-isv.isvjcloud.com/sign/signActivity" \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "actId=b4d9c9f6cfd147bcb108b1cabadb0e5d&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoJ%2FaYQCF9xTRGADPBdXAeGZIc5W3Gm9rFqTMy14wk5X4TLid74kYDlVq9GcJaKyuw%3D%3D" 
sleep 5

done

date



echo
echo 赵第六感京东自营旗舰店签到结果
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
	-X POST --data-raw "venderId=1000007024&actId=7b240f1d6d8f4949a1c4a6527bce746b&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 

echo
echo "王第六感京东自营旗舰店查看结果"
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
	-X POST --data-raw "venderId=1000007024&actId=7b240f1d6d8f4949a1c4a6527bce746b&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 

echo
echo 赵杰士邦京东自营旗舰店签到结果
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
	-X POST --data-raw "venderId=1000001485&actId=f93fcb193c31471c8b4eeaf72b3cece2&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 

echo
echo "王杰士邦京东自营旗舰店查看结果"
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
	-X POST --data-raw "venderId=1000001485&actId=f93fcb193c31471c8b4eeaf72b3cece2&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 

echo
echo 赵飞利浦官方签到签到结果
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
	-X POST --data-raw "venderId=1000003691&actId=3cf2566d9ecb421e80352d30759d7f87&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 

echo
echo "王飞利浦官方签到查看结果"
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
	-X POST --data-raw "venderId=1000003691&actId=3cf2566d9ecb421e80352d30759d7f87&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 


sleep 5
for i in $(seq 1 5); do
date

echo
echo "zhao认养一头牛官方旗舰店"
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
  -X POST --data-raw "actId=adc8aba5f4f64f16988eb39b8586b3b9&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 

curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "venderId=691399&actId=adc8aba5f4f64f16988eb39b8586b3b9&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 

echo
echo "wang认养一头牛官方旗舰店"
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
  -X POST --data-raw "actId=adc8aba5f4f64f16988eb39b8586b3b9&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 
	
echo
echo "查看结果"
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "venderId=691399&actId=adc8aba5f4f64f16988eb39b8586b3b9&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 


sleep 5

echo 赵签到郎酒
curl -sS -k 'https://cjhy-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: cjhy-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://cjhy-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Referer: https://cjhy-isv.isvjcloud.com/sign/signActivity" \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "actId=d840a8b717e84d5eb5741904434efe33&pin=51S2JqsypB%2Fnfj45frYeodA1Drq3za4lh6LFLfledF1cdSiqMbCx5edEEaL3RnCSkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 


echo
date +"%x %X %N  %s"
echo 王签到郎酒
curl -sS -k 'https://cjhy-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: cjhy-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://cjhy-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Referer: https://cjhy-isv.isvjcloud.com/sign/signActivity" \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "actId=d840a8b717e84d5eb5741904434efe33&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoJ%2FaYQCF9xTRGADPBdXAeGZIc5W3Gm9rFqTMy14wk5X4TLid74kYDlVq9GcJaKyuw%3D%3D" 

echo
echo 赵签到郎酒查看结果
curl -sS -k 'https://cjhy-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: cjhy-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://cjhy-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "venderId=1000014485&actId=d840a8b717e84d5eb5741904434efe33&pin=51S2JqsypB%2Fnfj45frYeodA1Drq3za4lh6LFLfledF1cdSiqMbCx5edEEaL3RnCSkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 

echo
echo 王签到郎酒结果
curl -sS -k 'https://cjhy-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: cjhy-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://cjhy-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "venderId=1000014485&actId=d840a8b717e84d5eb5741904434efe33&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoJ%2FaYQCF9xTRGADPBdXAeGZIc5W3Gm9rFqTMy14wk5X4TLid74kYDlVq9GcJaKyuw%3D%3D" 


sleep 5

done
date

exit 
