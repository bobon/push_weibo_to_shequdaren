source $1

#用户进入到“签到领京豆”的活动页面，点击“签到”按钮，即可获得随机数额的京豆，用户连续签到的第3天、第7天，可获得大额的京豆。
#2) 若用户中断签到后，连续签到的天数会重新开始计算。 京豆：京豆的有效期为30天

echo "签到领京豆"
curl -k -sS "https://api.m.jd.com/client.action?functionId=userSign" \
 -H "Host: api.m.jd.com" \
 -H "Origin: https://pro.m.jd.com" \
 -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36 QBCore/4.0.1316.400 QQBrowser/9.0.2524.400 Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2875.116 Safari/537.36 NetType/WIFI MicroMessenger/7.0.20.1781(0x6700143B) WindowsWechat" \
 -H "content-type: application/x-www-form-urlencoded" \
 -H "Accept-Language: zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.5;q=0.4" \
 -H "Cookie: pt_key=${pt_key1}; pt_pin=${pt_pin1}" \
 -X POST --data-raw "body=%7B%22params%22%3A%22%7B%5C%22enActK%5C%22%3A%5C%229wKIMMJjQLbQFeZ6KQv0JbFadF%2Flq%2FxHvR8YRiEgY7okDq7OnjDWraDxULsp7w9xcRRfojzJNzLb%5C%5CnK5m75oawpzJC6LMfICwSpNOVuuKXInPyafbSIFAxunjcRb78Fk%2FtGmbP5%2BHKCzc%3D%5C%22%2C%5C%22isFloatLayer%5C%22%3Afalse%2C%5C%22ruleSrv%5C%22%3A%5C%2200854994_49341803_t1%5C%22%2C%5C%22signId%5C%22%3A%5C%22dDH6mBnsm%2BQaZs%2Fn4coLNw%3D%3D%5C%22%7D%22%2C%22riskParam%22%3A%7B%22platform%22%3A%223%22%2C%22orgType%22%3A%222%22%2C%22openId%22%3A%22-1%22%2C%22pageClickKey%22%3A%22Babel_Sign%22%2C%22eid%22%3A%226BF74ADMKHPRDMW3YAHZBRV7U4FJM6QATJQZGPVCS3UH7KJYU6GA2DONUCSE5FBTEKIIFNIJJMJUUTGNEOTKBQPFQI%22%2C%22fp%22%3A%222ab1a3e158165a55e6e6960d3e54391b%22%2C%22shshshfp%22%3A%229bd81f8f007fd9b59664b9b9455a23f9%22%2C%22shshshfpa%22%3A%22a0f05f2d-4d33-0296-8232-3866d32541cd-1611150075%22%2C%22shshshfpb%22%3A%22jvLHOS5ZUt1IBjYDWfL9LMA%3D%3D%22%2C%22childActivityUrl%22%3A%22https%253A%252F%252Fpro.m.jd.com%252Fmall%252Factive%252F43wbZf58yadB3NbARTJDGUWpZJ8F%252Findex.html%253Fgx%253DRnE3lTZfaD2MzNQUrYZ1VIHJH-BGxKO6RAO6%2526ad_od%253Dshare%2526utm_source%253Dandroidapp%2526utm_medium%253Dappshare%2526utm_campaign%253Dt_335139774%2526utm_term%253DWxfriends%22%2C%22userArea%22%3A%22-1%22%2C%22client%22%3A%22-1%22%2C%22clientVersion%22%3A%22-1%22%2C%22uuid%22%3A%22-1%22%2C%22osVersion%22%3A%22-1%22%2C%22brand%22%3A%22-1%22%2C%22model%22%3A%22-1%22%2C%22networkType%22%3A%22-1%22%2C%22jda%22%3A%22122270672.16111398382001496308501.1611139838.1611140824.1611150032.3%22%7D%2C%22mitemAddrId%22%3A%22%22%2C%22geo%22%3A%7B%22lng%22%3A%22%22%2C%22lat%22%3A%22%22%7D%2C%22addressId%22%3A%22%22%2C%22posLng%22%3A%22%22%2C%22posLat%22%3A%22%22%2C%22homeLng%22%3A%22%22%2C%22homeLat%22%3A%22%22%2C%22focus%22%3A%22%22%2C%22innerAnchor%22%3A%22%22%2C%22cv%22%3A%222.0%22%7D&screen=750*1334&client=wh5&clientVersion=1.0.0&sid=&uuid=16111398382001496308501&area=" \
| jq

sleep 5

echo "签到领京豆"
curl -k -sS "https://api.m.jd.com/client.action?functionId=userSign" \
 -H "Host: api.m.jd.com" \
 -H "Origin: https://pro.m.jd.com" \
 -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36 QBCore/4.0.1316.400 QQBrowser/9.0.2524.400 Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2875.116 Safari/537.36 NetType/WIFI MicroMessenger/7.0.20.1781(0x6700143B) WindowsWechat" \
 -H "content-type: application/x-www-form-urlencoded" \
 -H "Accept-Language: zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.5;q=0.4" \
 -H "cookie: pt_key=${pt_key1}; pt_pin=${pt_pin1}" \
 -X POST --data-raw "body=%7B%22params%22%3A%22%7B%5C%22enActK%5C%22%3A%5C%229wKIMMJjQLbQFeZ6KQv0JbFadF%2Flq%2FxHvR8YRiEgY7okDq7OnjDWraDxULsp7w9xcRRfojzJNzLb%5C%5CnK5m75oawpzJC6LMfICwSpNOVuuKXInPyafbSIFAxunjcRb78Fk%2FtGmbP5%2BHKCzc%3D%5C%22%2C%5C%22isFloatLayer%5C%22%3Afalse%2C%5C%22ruleSrv%5C%22%3A%5C%2200854994_49341803_t1%5C%22%2C%5C%22signId%5C%22%3A%5C%22dDH6mBnsm%2BQaZs%2Fn4coLNw%3D%3D%5C%22%7D%22%2C%22riskParam%22%3A%7B%22platform%22%3A%223%22%2C%22orgType%22%3A%222%22%2C%22openId%22%3A%22-1%22%2C%22pageClickKey%22%3A%22Babel_Sign%22%2C%22eid%22%3A%226BF74ADMKHPRDMW3YAHZBRV7U4FJM6QATJQZGPVCS3UH7KJYU6GA2DONUCSE5FBTEKIIFNIJJMJUUTGNEOTKBQPFQI%22%2C%22fp%22%3A%222ab1a3e158165a55e6e6960d3e54391b%22%2C%22shshshfp%22%3A%229bd81f8f007fd9b59664b9b9455a23f9%22%2C%22shshshfpa%22%3A%22a0f05f2d-4d33-0296-8232-3866d32541cd-1611150075%22%2C%22shshshfpb%22%3A%22jvLHOS5ZUt1IBjYDWfL9LMA%3D%3D%22%2C%22childActivityUrl%22%3A%22https%253A%252F%252Fpro.m.jd.com%252Fmall%252Factive%252F43wbZf58yadB3NbARTJDGUWpZJ8F%252Findex.html%253Fgx%253DRnE3lTZfaD2MzNQUrYZ1VIHJH-BGxKO6RAO6%2526ad_od%253Dshare%2526utm_source%253Dandroidapp%2526utm_medium%253Dappshare%2526utm_campaign%253Dt_335139774%2526utm_term%253DWxfriends%22%2C%22userArea%22%3A%22-1%22%2C%22client%22%3A%22-1%22%2C%22clientVersion%22%3A%22-1%22%2C%22uuid%22%3A%22-1%22%2C%22osVersion%22%3A%22-1%22%2C%22brand%22%3A%22-1%22%2C%22model%22%3A%22-1%22%2C%22networkType%22%3A%22-1%22%2C%22jda%22%3A%22122270672.16111398382001496308501.1611139838.1611140824.1611150032.3%22%7D%2C%22mitemAddrId%22%3A%22%22%2C%22geo%22%3A%7B%22lng%22%3A%22%22%2C%22lat%22%3A%22%22%7D%2C%22addressId%22%3A%22%22%2C%22posLng%22%3A%22%22%2C%22posLat%22%3A%22%22%2C%22homeLng%22%3A%22%22%2C%22homeLat%22%3A%22%22%2C%22focus%22%3A%22%22%2C%22innerAnchor%22%3A%22%22%2C%22cv%22%3A%222.0%22%7D&screen=750*1334&client=wh5&clientVersion=1.0.0&sid=&uuid=16111398382001496308501&area=" \
| jq


sleep 5

echo "签到领京豆"
curl -k -sS "https://api.m.jd.com/client.action?functionId=userSign" \
 -H "Host: api.m.jd.com" \
 -H "Origin: https://pro.m.jd.com" \
 -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36 QBCore/4.0.1316.400 QQBrowser/9.0.2524.400 Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2875.116 Safari/537.36 NetType/WIFI MicroMessenger/7.0.20.1781(0x6700143B) WindowsWechat" \
 -H "content-type: application/x-www-form-urlencoded" \
 -H "Accept-Language: zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.5;q=0.4" \
 -H "cookie: pt_key=${pt_key1}; pt_pin=${pt_pin1}" \
 -X POST --data-raw "body=%7B%22params%22%3A%22%7B%5C%22enActK%5C%22%3A%5C%229wKIMMJjQLbQFeZ6KQv0JbFadF%2Flq%2FxHvR8YRiEgY7okDq7OnjDWraDxULsp7w9xcRRfojzJNzLb%5C%5CnK5m75oawpzJC6LMfICwSpNOVuuKXInPyafbSIFAxunjcRb78Fk%2FtGmbP5%2BHKCzc%3D%5C%22%2C%5C%22isFloatLayer%5C%22%3Afalse%2C%5C%22ruleSrv%5C%22%3A%5C%2200854994_49341803_t1%5C%22%2C%5C%22signId%5C%22%3A%5C%22dDH6mBnsm%2BQaZs%2Fn4coLNw%3D%3D%5C%22%7D%22%2C%22riskParam%22%3A%7B%22platform%22%3A%223%22%2C%22orgType%22%3A%222%22%2C%22openId%22%3A%22-1%22%2C%22pageClickKey%22%3A%22Babel_Sign%22%2C%22eid%22%3A%226BF74ADMKHPRDMW3YAHZBRV7U4FJM6QATJQZGPVCS3UH7KJYU6GA2DONUCSE5FBTEKIIFNIJJMJUUTGNEOTKBQPFQI%22%2C%22fp%22%3A%222ab1a3e158165a55e6e6960d3e54391b%22%2C%22shshshfp%22%3A%229bd81f8f007fd9b59664b9b9455a23f9%22%2C%22shshshfpa%22%3A%22a0f05f2d-4d33-0296-8232-3866d32541cd-1611150075%22%2C%22shshshfpb%22%3A%22jvLHOS5ZUt1IBjYDWfL9LMA%3D%3D%22%2C%22childActivityUrl%22%3A%22https%253A%252F%252Fpro.m.jd.com%252Fmall%252Factive%252F43wbZf58yadB3NbARTJDGUWpZJ8F%252Findex.html%253Fgx%253DRnE3lTZfaD2MzNQUrYZ1VIHJH-BGxKO6RAO6%2526ad_od%253Dshare%2526utm_source%253Dandroidapp%2526utm_medium%253Dappshare%2526utm_campaign%253Dt_335139774%2526utm_term%253DWxfriends%22%2C%22userArea%22%3A%22-1%22%2C%22client%22%3A%22-1%22%2C%22clientVersion%22%3A%22-1%22%2C%22uuid%22%3A%22-1%22%2C%22osVersion%22%3A%22-1%22%2C%22brand%22%3A%22-1%22%2C%22model%22%3A%22-1%22%2C%22networkType%22%3A%22-1%22%2C%22jda%22%3A%22122270672.16111398382001496308501.1611139838.1611140824.1611150032.3%22%7D%2C%22mitemAddrId%22%3A%22%22%2C%22geo%22%3A%7B%22lng%22%3A%22%22%2C%22lat%22%3A%22%22%7D%2C%22addressId%22%3A%22%22%2C%22posLng%22%3A%22%22%2C%22posLat%22%3A%22%22%2C%22homeLng%22%3A%22%22%2C%22homeLat%22%3A%22%22%2C%22focus%22%3A%22%22%2C%22innerAnchor%22%3A%22%22%2C%22cv%22%3A%222.0%22%7D&screen=750*1334&client=wh5&clientVersion=1.0.0&sid=&uuid=16111398382001496308501&area=" \
| jq
