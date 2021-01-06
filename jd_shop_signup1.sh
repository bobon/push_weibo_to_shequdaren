
for i in $(seq 1 5); do
date

echo
echo "赵签到后京东自营官方旗舰店"
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
	-X POST --data-raw "actId=882b35752b5b4cb7b29d77d468fe85a7&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D"

echo
echo "查看结果"
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
	-X POST --data-raw "venderId=1000007502&actId=882b35752b5b4cb7b29d77d468fe85a7&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 
sleep 4

echo
echo "王签到后京东自营官方旗舰店"
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
	-X POST --data-raw "actId=882b35752b5b4cb7b29d77d468fe85a7&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 

echo
echo "查看结果"
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
	-X POST --data-raw "venderId=1000007502&actId=882b35752b5b4cb7b29d77d468fe85a7&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 
sleep 4

echo
echo "赵签到卡士京东自营旗舰店"
curl -sS -k 'https://jinggeng-isv.isvjcloud.com/ql/front/saveSignIn' \
  -H "Host: jinggeng-isv.isvjcloud.com" \
  -H "Origin: https://jinggeng-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Cookie: dfs=zjCaT3Evzluy0HWZo3ke%2BvxwtE91Ut8adrA9ExLHNhmtOzujiMcGW9evAEBIMFATIJ4fAHFD0jWYtODQqWXRErCG8YiAuHJM5iAd6K9suTHoS3RYZL2Tu2FjEZIVmqyavVsltI%2B2dT0P9v4AI5C8L1KpmGtiNxg22U7gSf6gFXTTnRINWzo5B%2F9ayTWgDFPX5WIH%2BtgzsSr2zw5%2FytILvRLYrET%2F5jy0ftd1xS6p75aL27ZlFQjaFNxyrUdrB90lc5wmlvITPcCymEvK5FK6WwtlDyveml5aUhmJQr5Vdr3EAOXPWKb9rHBXcoKkAHaUK47ZvoCs2Y%2FV3GbhuD4JGurcFm9gtkoA6HzeYt9ERBY%3D" \
  -X POST -d "act_id=2c9180847698559b0176b25b9503705e&user_id=1000147303" 
sleep 4

echo
echo "王签到卡士京东自营旗舰店"
curl -sS -k 'https://jinggeng-isv.isvjcloud.com/ql/front/saveSignIn' \
  -H "Host: jinggeng-isv.isvjcloud.com" \
  -H "Origin: https://jinggeng-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Cookie: dfs=0shmcr4siXLIHu05EqyN76i0cqRZYLGYmnKnadWWEcmaJmw6%2FNwaWU6%2Fv5N22%2B1ZuhvQaRx1GFs%2BUk3lYCzTE%2FhNlhmlbj1KGWKOq0XUUIlmwdZBXPR%2FpcjZiBU5K2aC3xs%2F1srqhCpvLzxRHBRpa5%2B%2BVqPfkRTCMFjXgvvYM5SbpDSjvwr3T6AztPgL4KoZitZoZy9MIFdAoQqiS0u02lE7BktVez%2FCiZs0LKhSLc%2FRezfC0iY4OKwWpCVEXlgZB2wExHZJnU3ddA3iE%2FArJWCUgW662Wud3y0tgM03%2BiIf1xJKh1%2B8Cp%2F3c96SGKLrqNDSqjCXHqf5e5%2Fu9D6HU%2Fu3sQ4cVzA0NflLZyjzqM4%3D" \
  -X POST -d "act_id=2c9180847698559b0176b25b9503705e&user_id=1000147303" 
sleep 4

echo
echo "赵签到燕京啤酒京东自营旗舰店"
curl -sS -k 'https://jinggeng-isv.isvjcloud.com/ql/front/saveSignIn' \
  -H "Host: jinggeng-isv.isvjcloud.com" \
  -H "Origin: https://jinggeng-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Cookie: dfs=zjCaT3Evzluy0HWZo3ke%2BvxwtE91Ut8adrA9ExLHNhmtOzujiMcGW9evAEBIMFATIJ4fAHFD0jWYtODQqWXRErCG8YiAuHJM5iAd6K9suTHoS3RYZL2Tu2FjEZIVmqyavVsltI%2B2dT0P9v4AI5C8L1KpmGtiNxg22U7gSf6gFXTTnRINWzo5B%2F9ayTWgDFPX5WIH%2BtgzsSr2zw5%2FytILvRLYrET%2F5jy0ftd1xS6p75aL27ZlFQjaFNxyrUdrB90lc5wmlvITPcCymEvK5FK6WwtlDyveml5aUhmJQr5Vdr3EAOXPWKb9rHBXcoKkAHaUK47ZvoCs2Y%2FV3GbhuD4JGurcFm9gtkoA6HzeYt9ERBY%3D" \
  -X POST -d "act_id=2c91808775fd5b770176083c5dfd60ec&user_id=1000004680" 
sleep 4

echo
echo "王签到燕京啤酒京东自营旗舰店"
curl -sS -k 'https://jinggeng-isv.isvjcloud.com/ql/front/saveSignIn' \
  -H "Host: jinggeng-isv.isvjcloud.com" \
  -H "Origin: https://jinggeng-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Cookie: dfs=0shmcr4siXLIHu05EqyN76i0cqRZYLGYmnKnadWWEcmaJmw6%2FNwaWU6%2Fv5N22%2B1ZuhvQaRx1GFs%2BUk3lYCzTE%2FhNlhmlbj1KGWKOq0XUUIlmwdZBXPR%2FpcjZiBU5K2aC3xs%2F1srqhCpvLzxRHBRpa5%2B%2BVqPfkRTCMFjXgvvYM5SbpDSjvwr3T6AztPgL4KoZitZoZy9MIFdAoQqiS0u02lE7BktVez%2FCiZs0LKhSLc%2FRezfC0iY4OKwWpCVEXlgZB2wExHZJnU3ddA3iE%2FArJWCUgW662Wud3y0tgM03%2BiIf1xJKh1%2B8Cp%2F3c96SGKLrqNDSqjCXHqf5e5%2Fu9D6HU%2Fu3sQ4cVzA0NflLZyjzqM4%3D" \
  -X POST -d "act_id=2c91808775fd5b770176083c5dfd60ec&user_id=1000004680" 
sleep 4

echo
echo "赵签到卡姿兰京东自营官方旗舰店"
curl -sS -k 'https://jinggeng-isv.isvjcloud.com/ql/front/saveSignIn' \
  -H "Host: jinggeng-isv.isvjcloud.com" \
  -H "Origin: https://jinggeng-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Cookie: dfs=zjCaT3Evzluy0HWZo3ke%2BvxwtE91Ut8adrA9ExLHNhmtOzujiMcGW9evAEBIMFATIJ4fAHFD0jWYtODQqWXRErCG8YiAuHJM5iAd6K9suTHoS3RYZL2Tu2FjEZIVmqyavVsltI%2B2dT0P9v4AI5C8L1KpmGtiNxg22U7gSf6gFXTTnRINWzo5B%2F9ayTWgDFPX5WIH%2BtgzsSr2zw5%2FytILvRLYrET%2F5jy0ftd1xS6p75aL27ZlFQjaFNxyrUdrB90lc5wmlvITPcCymEvK5FK6WwtlDyveml5aUhmJQr5Vdr3EAOXPWKb9rHBXcoKkAHaUK47ZvoCs2Y%2FV3GbhuD4JGurcFm9gtkoA6HzeYt9ERBY%3D" \
  -X POST -d "act_id=2c91808476b7fdb80176b99b876b607a&user_id=1000002523" 
sleep 4

echo
echo "王签到卡姿兰京东自营官方旗舰店"
curl -sS -k 'https://jinggeng-isv.isvjcloud.com/ql/front/saveSignIn' \
  -H "Host: jinggeng-isv.isvjcloud.com" \
  -H "Origin: https://jinggeng-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Cookie: dfs=0shmcr4siXLIHu05EqyN76i0cqRZYLGYmnKnadWWEcmaJmw6%2FNwaWU6%2Fv5N22%2B1ZuhvQaRx1GFs%2BUk3lYCzTE%2FhNlhmlbj1KGWKOq0XUUIlmwdZBXPR%2FpcjZiBU5K2aC3xs%2F1srqhCpvLzxRHBRpa5%2B%2BVqPfkRTCMFjXgvvYM5SbpDSjvwr3T6AztPgL4KoZitZoZy9MIFdAoQqiS0u02lE7BktVez%2FCiZs0LKhSLc%2FRezfC0iY4OKwWpCVEXlgZB2wExHZJnU3ddA3iE%2FArJWCUgW662Wud3y0tgM03%2BiIf1xJKh1%2B8Cp%2F3c96SGKLrqNDSqjCXHqf5e5%2Fu9D6HU%2Fu3sQ4cVzA0NflLZyjzqM4%3D" \
  -X POST -d "act_id=2c91808476b7fdb80176b99b876b607a&user_id=1000002523" 
sleep 4

echo
echo 赵签到农夫山泉京东自营旗舰店
curl -sS -k 'https://jinggeng-isv.isvjcloud.com/ql/front/saveSignIn' \
  -H "Host: jinggeng-isv.isvjcloud.com" \
  -H "Origin: https://jinggeng-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Cookie: dfs=zjCaT3Evzluy0HWZo3ke%2BvxwtE91Ut8adrA9ExLHNhmtOzujiMcGW9evAEBIMFATIJ4fAHFD0jWYtODQqWXRErCG8YiAuHJM5iAd6K9suTHoS3RYZL2Tu2FjEZIVmqyavVsltI%2B2dT0P9v4AI5C8L1KpmGtiNxg22U7gSf6gFXTTnRINWzo5B%2F9ayTWgDFPX5WIH%2BtgzsSr2zw5%2FytILvRLYrET%2F5jy0ftd1xS6p75aL27ZlFQjaFNxyrUdrB90lc5wmlvITPcCymEvK5FK6WwtlDyveml5aUhmJQr5Vdr3EAOXPWKb9rHBXcoKkAHaUK47ZvoCs2Y%2FV3GbhuD4JGurcFm9gtkoA6HzeYt9ERBY%3D" \
  -X POST -d "act_id=2c918086766a87fe01766f19636874c4&user_id=1000008814" 
sleep 4

echo
echo 王签到农夫山泉京东自营旗舰店
curl -sS -k 'https://jinggeng-isv.isvjcloud.com/ql/front/saveSignIn' \
  -H "Host: jinggeng-isv.isvjcloud.com" \
  -H "Origin: https://jinggeng-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Cookie: dfs=0shmcr4siXLIHu05EqyN76i0cqRZYLGYmnKnadWWEcmaJmw6%2FNwaWU6%2Fv5N22%2B1ZuhvQaRx1GFs%2BUk3lYCzTE%2FhNlhmlbj1KGWKOq0XUUIlmwdZBXPR%2FpcjZiBU5K2aC3xs%2F1srqhCpvLzxRHBRpa5%2B%2BVqPfkRTCMFjXgvvYM5SbpDSjvwr3T6AztPgL4KoZitZoZy9MIFdAoQqiS0u02lE7BktVez%2FCiZs0LKhSLc%2FRezfC0iY4OKwWpCVEXlgZB2wExHZJnU3ddA3iE%2FArJWCUgW662Wud3y0tgM03%2BiIf1xJKh1%2B8Cp%2F3c96SGKLrqNDSqjCXHqf5e5%2Fu9D6HU%2Fu3sQ4cVzA0NflLZyjzqM4%3D" \
  -X POST -d "act_id=2c918086766a87fe01766f19636874c4&user_id=1000008814" 
sleep 4

echo
echo 赵签到黑人京东自营官方旗舰店
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
	-X POST --data-raw "actId=bb92eba68c994b9283e70689c2dbd504&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 
sleep 4

echo
echo 签到结果
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
	-X POST --data-raw "venderId=1000002300&actId=bb92eba68c994b9283e70689c2dbd504&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 
sleep 4

echo
echo 王签到黑人京东自营官方旗舰店
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
	-X POST --data-raw "actId=bb92eba68c994b9283e70689c2dbd504&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 

echo
echo 签到结果
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
	-X POST --data-raw "venderId=1000002300&actId=bb92eba68c994b9283e70689c2dbd504&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 
sleep 4

echo
echo 赵美赞臣京东自营官方旗舰店
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
	-X POST --data-raw "actId=4a669aaf044540ae859b472c07e472e5&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 

echo
echo 签到结果
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
	-X POST --data-raw "venderId=1000003179&actId=4a669aaf044540ae859b472c07e472e5&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 
sleep 4

echo
echo 王美赞臣京东自营官方旗舰店
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
	-X POST --data-raw "actId=4a669aaf044540ae859b472c07e472e5&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 

echo
echo 签到结果
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
	-X POST --data-raw "venderId=1000003179&actId=4a669aaf044540ae859b472c07e472e5&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 
sleep 4

echo
echo 赵科沃斯京东自营旗舰店
curl -sS -k 'https://cjhy-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: cjhy-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://cjhy-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Referer: https://cjhy-isv.isvjcloud.com/sign/signActivity" \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "actId=05ad133fe03849138e8521808978bd09&pin=51S2JqsypB%2Fnfj45frYeodA1Drq3za4lh6LFLfledF1cdSiqMbCx5edEEaL3RnCSkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 

echo
echo 查看结果
curl -sS -k 'https://cjhy-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: cjhy-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://cjhy-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "venderId=1000002989&actId=05ad133fe03849138e8521808978bd09&pin=51S2JqsypB%2Fnfj45frYeodA1Drq3za4lh6LFLfledF1cdSiqMbCx5edEEaL3RnCSkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 
sleep 4

echo
echo 王科沃斯京东自营旗舰店
curl -sS -k 'https://cjhy-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: cjhy-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://cjhy-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Referer: https://cjhy-isv.isvjcloud.com/sign/signActivity" \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "actId=05ad133fe03849138e8521808978bd09&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoJ%2FaYQCF9xTRGADPBdXAeGZIc5W3Gm9rFqTMy14wk5X4TLid74kYDlVq9GcJaKyuw%3D%3D" 

echo
echo 王看结果
curl -sS -k 'https://cjhy-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: cjhy-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://cjhy-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "venderId=1000002989&actId=05ad133fe03849138e8521808978bd09&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoJ%2FaYQCF9xTRGADPBdXAeGZIc5W3Gm9rFqTMy14wk5X4TLid74kYDlVq9GcJaKyuw%3D%3D" 
sleep 4

echo
echo 赵维达京东自营旗舰店
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
	-X POST --data-raw "actId=233b356760874394b26fcd2a107de6e6&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 

echo
echo 签到结果
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
	-X POST --data-raw "venderId=1000001683&actId=233b356760874394b26fcd2a107de6e6&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 
sleep 4

echo
echo 王维达京东自营旗舰店
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
	-X POST --data-raw "actId=233b356760874394b26fcd2a107de6e6&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 
	
echo
echo "查看结果"
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
	-X POST --data-raw "venderId=1000001683&actId=233b356760874394b26fcd2a107de6e6&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 
sleep 4

echo
echo 赵三只松鼠京东自营旗舰店
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
	-X POST --data-raw "actId=025b4d4a1a9c4be0a6f0db6ae6ba128c&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 

echo
echo 签到结果
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
	-X POST --data-raw "venderId=1000015268&actId=025b4d4a1a9c4be0a6f0db6ae6ba128c&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 
sleep 4

echo
echo 王三只松鼠京东自营旗舰店
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
	-X POST --data-raw "actId=025b4d4a1a9c4be0a6f0db6ae6ba128c&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 
	
echo
echo "查看结果"
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
	-X POST --data-raw "venderId=1000015268&actId=025b4d4a1a9c4be0a6f0db6ae6ba128c&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 
sleep 4

echo
echo 赵蜀国御京东自营旗舰店
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
	-X POST --data-raw "actId=1aeea7aa5bc445088ce14147964bbef8&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 

echo
echo 签到结果
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
	-X POST --data-raw "venderId=1000117122&actId=1aeea7aa5bc445088ce14147964bbef8&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 
sleep 4

echo
echo 王蜀国御京东自营旗舰店
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
	-X POST --data-raw "actId=1aeea7aa5bc445088ce14147964bbef8&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 
	
echo
echo "查看结果"
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
	-X POST --data-raw "venderId=1000117122&actId=1aeea7aa5bc445088ce14147964bbef8&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 
sleep 4

echo
echo 赵飞利浦新安怡京东自营旗舰店
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
	-X POST --data-raw "actId=f789be8655f04e2e94745234df0389e4&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 

echo
echo 签到结果
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
	-X POST --data-raw "venderId=1000002527&actId=f789be8655f04e2e94745234df0389e4&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 
sleep 4

echo
echo 王飞利浦新安怡京东自营旗舰店
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
	-X POST --data-raw "actId=f789be8655f04e2e94745234df0389e4&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 
	
echo
echo "查看结果"
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
	-X POST --data-raw "venderId=1000002527&actId=f789be8655f04e2e94745234df0389e4&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 
sleep 4

echo
echo 赵蒙牛官方旗舰店
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/sevenDay/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
	-X POST --data-raw "actId=34aff623e0b94cb2a3c789473c31885d&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 

echo
echo 签到结果
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/sevenDay/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
	-X POST --data-raw "venderId=182542&actId=34aff623e0b94cb2a3c789473c31885d&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 
sleep 4

echo
echo 王蒙牛官方旗舰店
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/sevenDay/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
	-X POST --data-raw "actId=34aff623e0b94cb2a3c789473c31885d&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 
	
echo
echo "查看结果"
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/sevenDay/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
	-X POST --data-raw "venderId=182542&actId=34aff623e0b94cb2a3c789473c31885d&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 
sleep 4

done


for i in $(seq 1 5); do
date

echo
echo "zhao中粮福临门米面京东自营旗舰店"
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
  -X POST --data-raw "actId=4704a5bb3af34a29a2fa257e3665cb8f&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 

echo
echo 签到结果
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "venderId=1000040105&actId=4704a5bb3af34a29a2fa257e3665cb8f&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 

echo
echo "wang中粮福临门米面京东自营旗舰店"
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
  -X POST --data-raw "actId=4704a5bb3af34a29a2fa257e3665cb8f&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 
	
echo
echo "查看结果"
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "venderId=1000040105&actId=4704a5bb3af34a29a2fa257e3665cb8f&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 

sleep 4

echo
echo "zhao实丰文化京东自营旗舰店"
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
  -X POST --data-raw "actId=f8d4b0c5dfaf4c49b415987962ee9ef4&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 

echo
echo 签到结果
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "venderId=1000300368&actId=f8d4b0c5dfaf4c49b415987962ee9ef4&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 

echo
echo "wang实丰文化京东自营旗舰店"
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
  -X POST --data-raw "actId=f8d4b0c5dfaf4c49b415987962ee9ef4&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 
	
echo
echo "查看结果"
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "venderId=1000300368&actId=f8d4b0c5dfaf4c49b415987962ee9ef4&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 

sleep 4
echo
echo "zhao红星京东自营官方旗舰店"
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
  -X POST --data-raw "actId=ce895ed405234bf794275f998e28b6b6&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 

echo
echo 签到结果
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "venderId=1000015761&actId=ce895ed405234bf794275f998e28b6b6&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 

echo
echo "wang红星京东自营官方旗舰店"
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
  -X POST --data-raw "actId=ce895ed405234bf794275f998e28b6b6&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 
	
echo
echo "查看结果"
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "venderId=1000015761&actId=ce895ed405234bf794275f998e28b6b6&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 


sleep 4
echo
echo "zhao百草味京东自营旗舰店"
curl -sS -k 'https://cjhy-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: cjhy-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://cjhy-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Referer: https://cjhy-isv.isvjcloud.com/sign/signActivity" \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "actId=2c6f9afbba6d411fa519527e597a5425&pin=51S2JqsypB%2Fnfj45frYeodA1Drq3za4lh6LFLfledF1cdSiqMbCx5edEEaL3RnCSkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 

echo
echo "wang百草味京东自营旗舰店"
curl -sS -k 'https://cjhy-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: cjhy-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://cjhy-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Referer: https://cjhy-isv.isvjcloud.com/sign/signActivity" \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "actId=2c6f9afbba6d411fa519527e597a5425&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoJ%2FaYQCF9xTRGADPBdXAeGZIc5W3Gm9rFqTMy14wk5X4TLid74kYDlVq9GcJaKyuw%3D%3D" 

sleep 4
echo
echo "zhao坚果手机京东自营旗舰店"
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
  -X POST --data-raw "actId=b5fa82501292433fabf33e8d058d3b57&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 

echo
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "venderId=1000212464&actId=b5fa82501292433fabf33e8d058d3b57&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 

echo
echo "wang坚果手机京东自营旗舰店"
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
  -X POST --data-raw "actId=b5fa82501292433fabf33e8d058d3b57&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 
	
echo
echo "查看结果"
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "venderId=1000212464&actId=b5fa82501292433fabf33e8d058d3b57&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 

sleep 4

echo
echo "zhao英氏YeeHoO旗舰店"
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/sevenDay/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
  -X POST --data-raw "actId=4343349d20c84656aef1520d093a7fa5&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 

echo
echo "查看结果"
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/sevenDay/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "venderId=16732&actId=4343349d20c84656aef1520d093a7fa5&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 

echo
echo "wang英氏YeeHoO旗舰店"
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/sevenDay/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
  -X POST --data-raw "actId=4343349d20c84656aef1520d093a7fa5&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 
	
echo
echo "查看结果"
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/sevenDay/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "venderId=16732&actId=4343349d20c84656aef1520d093a7fa5&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 

sleep 4
echo
echo "zhao佳贝艾特京东自营官方旗舰店"
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/sevenDay/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
  -X POST --data-raw "actId=3f6c151718844239b7be3ecca403cd70&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 

echo
echo "查看结果"
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/sevenDay/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "venderId=1000002710&actId=3f6c151718844239b7be3ecca403cd70&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 

echo
echo "wang佳贝艾特京东自营官方旗舰店"
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/sevenDay/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
  -X POST --data-raw "actId=3f6c151718844239b7be3ecca403cd70&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 
	
echo
echo "查看结果"
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/sevenDay/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "venderId=1000002710&actId=3f6c151718844239b7be3ecca403cd70&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 

sleep 4

echo
echo "zhao滋源京东自营官方旗舰店"
curl -sS -k 'https://cjhy-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: cjhy-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://cjhy-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Referer: https://cjhy-isv.isvjcloud.com/sign/signActivity" \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "actId=4202149ea24543f8af39a5ad3f60c343&pin=51S2JqsypB%2Fnfj45frYeodA1Drq3za4lh6LFLfledF1cdSiqMbCx5edEEaL3RnCSkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 

echo
echo "wang滋源京东自营官方旗舰店"
curl -sS -k 'https://cjhy-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: cjhy-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://cjhy-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Referer: https://cjhy-isv.isvjcloud.com/sign/signActivity" \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "actId=4202149ea24543f8af39a5ad3f60c343&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoJ%2FaYQCF9xTRGADPBdXAeGZIc5W3Gm9rFqTMy14wk5X4TLid74kYDlVq9GcJaKyuw%3D%3D" 

sleep 4

done
date

exit 

#用户信息 pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D
#获取用户信息
#curl -sS -k 'https://lzkj-isv.isvjcloud.com/wxActionCommon/getUserInfo' \
#	-H "Host: lzkj-isv.isvjcloud.com" \
#  -H "Accept: application/json" \
#  -H "Origin: https://lzkj-isv.isvjcloud.com" \
#  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
#  -H "Accept-Language: en-us,en" \
#  -H "Referer: https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity" \
#	-X POST --data-raw "pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 

#获取签到结果
#店铺id  venderId=1000007502
#店铺激活码  actId=882b35752b5b4cb7b29d77d468fe85a7
#curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/getSignInfo' \
#  -H "Host: lzkj-isv.isvjcloud.com" \
#  -H "Accept: application/json" \
#  -H "Origin: https://lzkj-isv.isvjcloud.com" \
#  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
#  -H "Accept-Language: en-us,en" \
#	-X POST --data-raw "venderId=1000007502&actId=882b35752b5b4cb7b29d77d468fe85a7&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 


#https://cjhy-isv.isvjcloud.com/sign/signActivity?activityId=d840a8b717e84d5eb5741904434efe33&venderId=1000014485&EA_PTAG=17078.34.60
curl -sS -k 'https://neptune.jd.com/log/m?std=JA2019_5112348' \
  -H "Host: neptune.jd.com" \
  -H "Accept: application/json" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Referer: https://servicewechat.com/wx91d27dbf599dff74/494/page-frame.html" \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw '
  {
  "cli": "wx-app",
  "std": "JA2019_5112348",
  "uuid": "16095742811501375273088",
  "scr": "414x632",
  "dvc": "microsoft",
  "lang": "zh_CN",
  "appkey": "",
  "appid": "wx91d27dbf599dff74",
  "openid": "oTGnpnJRmetl0cRzPU3xzX3pdH6U",
  "unionid": "oCwKwuImNWvG01xlmDDnEcjRT07I",
  "gender": "",
  "city": "",
  "province": "",
  "country": "",
  "wxver": "7.0.9",
  "data": [
    {
      "ctp": "pages/index/index",
      "par": "",
      "ref": "",
      "rpr": "",
      "seq": 1,
      "vts": 7,
      "pin": "122294312-396444",
      "fst": "1609574281150",
      "pst": "1609659290",
      "vct": 1609663961,
      "jsver": "WX1.0.0",
      "net": "wifi",
      "lat": "",
      "lon": "",
      "speed": "",
      "accuracy": "",
      "pixelRatio": "1",
      "jdv": "1|weixin|t_1000578832_xcx_1008_qlxxkp|xcx|-|1609663961480",
      "customerInfo": "",
      "unpl": "",
      "scene": 1008,
      "sdkver": "2.13.2",
      "ext": {
        "chan_type": 5,
        "wxapp_type": 1
      },
      "sku": "",
      "shp": "",
      "tit": "",
      "ldt": "",
      "page_id": "JDShopping_Home",
      "pname": "pages/index/index",
      "pparam": "open_url=https%253A%252F%252Fcjhy-isv.isvjcloud.com%252Fsign%252FsignActivity%253FactivityId%253Dd840a8b717e84d5eb5741904434efe33%2526venderId%253D1000014485%2526EA_PTAG%253D17078.34.60",
      "typ": "pv"
    }
  ],
  "tpc": "wx_app.000000",
  "report_ts": 1609663961.525,
  "token": "c0d8c248fdf86b350bdb643936720a62"
}'


curl -o o.dat -sS -k 'https://wq.jd.com/pinbind/pinTokenRedirect?biz=jm-business-center&url=https%3A%2F%2Fcjhy-isv.isvjcloud.com%2Fcommon%2FsaveWqToken%3Furl%3Dhttps%3A%2F%2Fcjhy-isv.isvjcloud.com%2Fsign%2FsignActivity%3FactivityId%3Dd840a8b717e84d5eb5741904434efe33%26venderId%3D1000014485%26EA_PTAG%3D17078.34.60%26cookie%3D%257B%2522visitkey%2522%253A%252259171940210201609574280981%2522%252C%2522__wga%2522%253A%25221609663961963.1609663961963.1609659291015.1609574282034.1.7%2522%252C%2522PPRD_P%2522%253A%2522CT.138570.1.1-EA.17078.5.1-LOGID.1609663962225.686396095%2522%252C%2522__jda%2522%253A%2522122270672.4cd94579e8b27d21596c844db14b8bac.1609574281622.1609574281622.1609574281622.1%2522%252C%2522__jdv%2522%253A%2522122270672%257Cweixin%257Ct_1000578832_xcx_1008_qlxxkp%257Cxcx%257C-%257C1609663962891%2522%252C%2522unpl%2522%253A%2522%2522%252C%2522wxapp_type%2522%253A1%252C%2522cd_eid%2522%253A%2522%2522%252C%2522pinStatus%2522%253A0%252C%2522wxapp_openid%2522%253A%2522oA1P50I2alBnw-L4EWEQ5OsD9hjU%2522%252C%2522wxapp_version%2522%253A%25226.12.280%2522%252C%2522buildtime%2522%253A20201228%252C%2522md5_pin%2522%253A%25229faca4f20b960eb0779bf56cf9a10b9f%2522%257D' \
  -H "Host: wq.jd.com" \
  -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H 'Referer: https://cjhy-isv.isvjcloud.com/sign/signActivity?activityId=d840a8b717e84d5eb5741904434efe33&venderId=1000014485&EA_PTAG=17078.34.60&cookie=%7B%22visitkey%22%3A%2259171940210201609574280981%22%2C%22__wga%22%3A%221609663961963.1609663961963.1609659291015.1609574282034.1.7%22%2C%22PPRD_P%22%3A%22CT.138570.1.1-EA.17078.5.1-LOGID.1609663962225.686396095%22%2C%22__jda%22%3A%22122270672.4cd94579e8b27d21596c844db14b8bac.1609574281622.1609574281622.1609574281622.1%22%2C%22__jdv%22%3A%22122270672%7Cweixin%7Ct_1000578832_xcx_1008_qlxxkp%7Cxcx%7C-%7C1609663962891%22%2C%22unpl%22%3A%22%22%2C%22wxapp_type%22%3A1%2C%22cd_eid%22%3A%22%22%2C%22pinStatus%22%3A0%2C%22wxapp_openid%22%3A%22oA1P50I2alBnw-L4EWEQ5OsD9hjU%22%2C%22wxapp_version%22%3A%226.12.280%22%2C%22buildtime%22%3A20201228%2C%22md5_pin%22%3A%229faca4f20b960eb0779bf56cf9a10b9f%22%7D' \
  -H "Accept-Language: en-us,en" 
