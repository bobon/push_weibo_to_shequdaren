a=false
b=false
delay=1

for i in $(seq 1 20); do

if [ "$a" = "false" ]; then
echo
date +"%x %X %N  %s"
echo 王签到十月稻田
t=$(curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36 MicroMessenger/7.0.9.501 NetType/WIFI MiniProgramEnv/Windows WindowsWechat' \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "actId=1836e0f513c14a78a02c92bf012a1d3f&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D")
  echo -e "$t"
  echo "$t"| jq '.isOk' | grep 'true' && a=true
  echo "$t" | jq '.msg' | grep '当天只能签到一次' && a=true
fi

if [ "$b" = "false" ]; then
echo
date +"%x %X %N  %s"
echo 赵签到十月稻田
t=$(curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/signUp' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "actId=1836e0f513c14a78a02c92bf012a1d3f&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D")
	echo -e "$t"
  echo "$t"| jq '.isOk' | grep 'true' && b=true
  echo "$t" | jq '.msg' | grep '当天只能签到一次' && b=true
fi	

if [ "$a" = "true" ] && [ "$b" = "true" ]; then
	echo 签到十月稻田完成
	break
else
	time sleep $(echo "0.2 * $delay"|bc)
	delay=$(($delay + 1))
fi
done

echo
echo 赵签到十月稻田查看结果
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "venderId=1000014142&actId=1836e0f513c14a78a02c92bf012a1d3f&pin=51S2JqsypB%2Fnfj45frYeoU7oeVP9kq2pYSH90mYt4m3fwcJlClpxrfmVYaGKuquQkdK3rLBQpEQH9V4tdrrh0w%3D%3D" 

echo
echo 王签到十月稻田查看结果
curl -sS -k 'https://lzkj-isv.isvjcloud.com/sign/wx/getSignInfo' \
  -H "Host: lzkj-isv.isvjcloud.com" \
  -H "Accept: application/json" \
  -H "Origin: https://lzkj-isv.isvjcloud.com" \
  -H 'user-agent: jdapp;iPhone;9.2.2;14.2;%E4%BA%AC%E4%B8%9C/9.2.2 CFNetwork/1206 Darwin/20.1.0' \
  -H "Accept-Language: en-us,en" \
  -X POST --data-raw "venderId=1000014142&actId=1836e0f513c14a78a02c92bf012a1d3f&pin=8zfoIjWIu%2FDcpxQNzAV7%2FoVPSWy1B8D%2BG4s%2BfJIFDfWHSnwnXFQKK9yQco%2FOGmHebU48Dr07k%2B7%2Bk1UaXRbZKg%3D%3D" 

