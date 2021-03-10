#!/bin/bash
set -e
set +E
set +x

trap "exit 1" TERM
export TOP_PID=$$

base_dir=/home/myid/push_weibo_to_shequdaren/dushu
cd $base_dir

log_error() {
	echo -e "\e[0;31;3m${1}\e[0m" "\e[0;31;3m[$(date '+%Y%m%d %H:%M:%S')] [ERROR] \e[0m" >&2
	echo
}

error() {
  log_error "$1"
  kill -s TERM $TOP_PID
}

ERRTRAP() {
  log_error "RUN $u31_2_ume_sh at $1 ERROR CODE: $?"
}
trap 'ERRTRAP {$LINENO:${FUNCNAME[0]}\<--${FUNCNAME[1]}}' ERR

readonly User_Agent='Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36 MicroMessenger/7.0.9.501 NetType/WIFI MiniProgramEnv/Windows WindowsWechat'
readonly curl_h="curl -sS -k -H 'Connection: keep-alive' \
-H \"User-Agent: $User_Agent\" \
-H 'Host: i.weread.qq.com' \
-H 'Referer: https://servicewechat.com/wx8a5d6f9fad07544e/622/page-frame.html'"

echo ''"$curl_h"' -H "Content-Length: 0" -H "content-type: application/json" \
"https://i.weread.qq.com/shelf/sync?vid=12443108&skey=w7Ooe855&platform=wp"' | bash | jq > shelf.json

echo ''"$curl_h"' -H "content-type: application/json" \
"https://i.weread.qq.com/user?userVid=12443108&vid=12443108&skey=w7Ooe855&platform=wp"' | bash | jq > user.json

#jq '.books[],.lectureBooks[]|.title' shelf.json

echo ''"$curl_h"' -H "content-type: application/json" \
"https://weread.qq.com/mp/reader/index?vid=12443108&skey=w7Ooe855&platform=wp" \
-X POST --data-raw '\''{"bookId":"718468","localReadChapterUid":{"chapterUid":24,"scrollTop":0,"ePubPageIndex":0},"chapterUid":null,"userInfo":{"isWxWork":false,"isAndroid":false,"Version":"7.0.9","OS":"Windows 10 x64","isLowPerformanceDevice":false,"model":"microsoft","windowWidth":414,"windowHeight":692,"Platform":"wp","isIpadSize":false,"statusBarHeight":20,"navigationTitleBarHeight":44,"navigationBarHeight":64,"SDKVersion":"2.13.2","unsupportedSDK":false,"theme":"light","hasShownVideoFeedDot":false,"skey":"w7Ooe855","appversion":"2.1.0224.2001","nickName":"赵巍","gender":1,"language":"zh_CN","city":"","province":"","country":"China","avatarUrl":"https://thirdwx.qlogo.cn/mmopen/vi_32/zo9QSE4Hgv1ribvo9R5FfTY2B7Awk298UkibLB9CU9SxmVwYcwtVvqiawUwqxG47G1Sia6x7XoyJXIZRnnWnycfMDg/132","authorized":true,"vid":12443108,"openid":"oEIAe0dy24l4PXKopAWsJX4HFVVM","skeyValidTime":1615390057882,"name":"赵巍","avatar":"https://thirdwx.qlogo.cn/mmopen/vi_32/yuZJrSpJ8Up1NCk5QnTsDcKkfh1FlCCGksUJFLf7SWEN0vM07xutR9FN88veSuFRJnPF1KA1xHLx1uTgStbNxA/132","userActiveType":"appActive","birdBox":false,"birdBoxyw":false,"lastAppLoginTime":1615369498,"lastWpLoginTime":1615289410,"isWhitelisted":false,"userVid":12443108,"isHide":0,"signature":"","location":"","hasShownGiftCollectionDot":true,"userConfig":{"synckey":1579182367,"configs":{"infiniteDayRule":[],"showShelfDownloadBtn":{"lastDigit":[8]},"showAdVids":99,"drawShareBookOnTheFly":99}},"token":""}}'\''' \
| bash | jq
