set -e

curl -sS -k 'https://u.jd.com/ISzeawC'
curl -sS -k -I 'https://u.jd.com/jda?e=1000156367&p=AyIGZRprFDJWWA1FBCVbV0IUWVALHEsDSkdETlcNVQtHRUZSQVMIbgNdHHlTEVlFFmNidwIdXkV0EHJSGxtSVWhjKR8OXGZQRS57UwtaTVIBUkRMR05aW14FT1ZNC1MSWR0FE3BWby5ldmYPXBspFApicCESL2cCEwdVHlkXMkV8IlwGdllNZB4BLWdiTRlLXB5Qf0QLWStaJQETB1UbUxMKEQNlK1sVMllpVCtZFAMRAlIYUh0EIgdSG1gQBhEPVB5dHQIiB10cayUyEzdWK1sUAxMHURxZEgQiN1QrWCVcfAYGG1MSV0EFO0EBVgNXRVYcNRcBEgNSE1wSMhAGVBlZ&a=fCg9UgoiAwwHO1BcXkQYFFljd3pxeV5dSF4zVRBSUll%2bAQAPDSwjLw%3d%3d&refer=norefer&d=ISzeawC' | grep '^location:'
curl -sS -k 'https://h5.m.jd.com/babelDiy/Zeus/2PAAf74aG3D61qvfKUM5dxUssJQ9/index.html?token=783960F2EDAEE981C09AFE8EC1011433&cu=true&utm_source=kong&utm_medium=jingfen&utm_campaign=t_2011197925_&utm_term=a0c3335083f34af899975574642b95a9'


curl -sS -k 'https://api.m.jd.com/api?appid=interCenter_shopSign&t=1612537158000&loginType=2&functionId=interact_center_shopSign_getActivityInfo&body=\{%22token%22:%22783960F2EDAEE981C09AFE8EC1011433%22,%22venderId%22:%22%22\}&jsonp=jsonp1000' \
  -H 'Connection: keep-alive' \
  -H 'User-Agent: Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Mobile Safari/537.36' \
  -H 'Accept: */*' \
  -H 'Sec-Fetch-Site: same-site' \
  -H 'Sec-Fetch-Mode: no-cors' \
  -H 'Sec-Fetch-Dest: script' \
  -H 'Referer: https://h5.m.jd.com/' \
  -H 'Accept-Language: zh-CN,zh;q=0.9' | sed -r -e 's,^jsonp[0-9]+\(,,' -e 's,\);$,,' | jq
