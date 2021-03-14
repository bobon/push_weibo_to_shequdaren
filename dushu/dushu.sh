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
readonly curl_h_oss="curl -sS -k -H 'Connection: keep-alive' \
-H \"User-Agent: $User_Agent\" \
-H 'Host: oss.weread.qq.com' \
-H 'Referer: https://servicewechat.com/wx8a5d6f9fad07544e/622/page-frame.html'"
readonly vid=12443108
readonly skey=GZTbxDE9

readonly book_base="$base_dir/book"
readonly shelf="$base_dir/shelf.json"

get_user() {
	echo ''"$curl_h"' -H "content-type: application/json" \
	"https://i.weread.qq.com/user?userVid='${vid}'&vid='${vid}'&skey='${skey}'&platform=wp"' | bash | jq > user.json
}

get_shelf() {
	echo ''"$curl_h"' -H "Content-Length: 0" -H "content-type: application/json" \
	"https://i.weread.qq.com/shelf/sync?vid='${vid}'&skey='${skey}'&platform=wp"' | bash | jq > "$shelf"
}

login() {
	echo ''"$curl_h"' -H "content-type: application/json" \
	"https://i.weread.qq.com/wplogin?code=073AQ40w3lxx0W2iQE3w3udNqE4AQ40z&type=hypo2&gettoken=1&platform=wp" \
	-X POST --data-raw '\''{
	  "isWxWork": false,
	  "isAndroid": false,
	  "Version": "7.0.9",
	  "OS": "Windows 10 x64",
	  "isLowPerformanceDevice": false,
	  "model": "microsoft",
	  "windowWidth": 414,
	  "windowHeight": 692,
	  "Platform": "wp",
	  "isIpadSize": false,
	  "statusBarHeight": 20,
	  "navigationTitleBarHeight": 44,
	  "navigationBarHeight": 64,
	  "SDKVersion": "2.13.2",
	  "unsupportedSDK": false,
	  "theme": "light",
	  "hasShownVideoFeedDot": false,
	  "skey": "",
	  "appversion": "2.1.0310.1602",
	  "nickName": "赵巍",
	  "gender": 1,
	  "language": "zh_CN",
	  "city": "",
	  "province": "",
	  "country": "China",
	  "avatarUrl": "https://thirdwx.qlogo.cn/mmopen/vi_32/zo9QSE4Hgv1ribvo9R5FfTY2B7Awk298UkibLB9CU9SxmVwYcwtVvqiawUwqxG47G1Sia6x7XoyJXIZRnnWnycfMDg/132",
	  "authorized": true
	}'\''' | bash | jq
}

if false; then
	get_user
	grep '登录超时' user.json >/dev/null && res=true || res=false
	if [ "$res" = "true" ]; then
		get_user
	fi
	get_shelf
fi

#jq '.books[],.lectureBooks[]|.title' "$shelf"

read_book() {
	local bookId=$1
	echo ''"$curl_h"' -H "content-type: application/json" \
	"https://weread.qq.com/mp/reader/index?vid='${vid}'&skey='${skey}'&platform=wp" \
	-X POST --data-raw '\''{
		"bookId":"'$bookId'"
		,"localReadChapterUid":{
			"chapterUid":24
			,"scrollTop":0
			,"ePubPageIndex":0
		}
		,"chapterUid":null
		,"userInfo":{
			"isWxWork":false
			,"isAndroid":false
			,"Version":"7.0.9"
			,"OS":"Windows 10 x64"
			,"isLowPerformanceDevice":false
			,"model":"microsoft"
			,"windowWidth":414,"windowHeight":692,"Platform":"wp","isIpadSize":false,"statusBarHeight":20,"navigationTitleBarHeight":44
			,"navigationBarHeight":64,"SDKVersion":"2.13.2","unsupportedSDK":false,"theme":"light","hasShownVideoFeedDot":false
			,"skey":"'${skey}'"
			,"appversion":"2.1.0224.2001"
			,"nickName":"赵巍","gender":1,"language":"zh_CN","city":"","province":"","country":"China"
			,"avatarUrl":"https://thirdwx.qlogo.cn/mmopen/vi_32/zo9QSE4Hgv1ribvo9R5FfTY2B7Awk298UkibLB9CU9SxmVwYcwtVvqiawUwqxG47G1Sia6x7XoyJXIZRnnWnycfMDg/132"
			,"authorized":true
			,"vid":'${vid}'
			,"openid":"oEIAe0dy24l4PXKopAWsJX4HFVVM"
			,"skeyValidTime":1615390057882
			,"name":"赵巍"
			,"avatar":"https://thirdwx.qlogo.cn/mmopen/vi_32/yuZJrSpJ8Up1NCk5QnTsDcKkfh1FlCCGksUJFLf7SWEN0vM07xutR9FN88veSuFRJnPF1KA1xHLx1uTgStbNxA/132"
			,"userActiveType":"appActive"
			,"birdBox":false,"birdBoxyw":false
			,"lastAppLoginTime":1615369498,"lastWpLoginTime":1615289410,"isWhitelisted":false
			,"userVid":'${vid}',"isHide":0,"signature":""
			,"location":"","hasShownGiftCollectionDot":true
			,"userConfig":{
				"synckey":1579182367
				,"configs":{"infiniteDayRule":[],"showShelfDownloadBtn":{"lastDigit":[8]},"showAdVids":99,"drawShareBookOnTheFly":99}}
				,"token":""}
		}'\''' | bash | jq
}

read_book_chapterinfo() {
	local bookId=$1
	echo ''"$curl_h"' -H "content-type: application/json" \
	"https://i.weread.qq.com/book/chapterinfos?vid='${vid}'&skey='${skey}'&platform=wp" \
	-X POST --data-raw '\''{
		"bookIds":["'${bookId}'"],"synckeys":[0]
	}'\''' | bash | jq
}

read_book_t() {
	local bookId=$1
	echo ''"$curl_h"' -H "content-type: application/json" \
	"https://weread.qq.com/mp/reader/index?vid='${vid}'&skey='${skey}'&platform=wp" \
	-X POST --data-raw '\''{
		"bookId":"'$bookId'"
	}'\''' | bash | jq
}

read_book_epub_contents() {
	local bookId=$1
	local chapters=$2
	echo ''"$curl_h"' -H "content-type: application/json" \
	"https://weread.qq.com/mp/reader/epub-contents?bookid='${bookId}'&chapters='${chapters}'&vid='${vid}'&skey='${skey}'&platform=wp"' | bash | jq
}

read_book_chapter() {
	local bookId=$1
	local chapters=$2
	echo ''"$curl_h"' -H "content-type: application/json" \
	"https://i.weread.qq.com/book/chapterread?bookId='${bookId}'&chapters='${chapters}'&vid='${vid}'&skey='${skey}'&platform=wp"' | bash | jq 
}

#read_book $book_Id > "$book_path/chapter.json"
#read_book_t $book_Id > "$book_path/chapter_t.json"

read_book_all_chapter() {
	local bookId=$1	
	local info=$(sed -r -n "/[\$]$bookId[\$]/p" shelf)
	if [ -z "$info" ]; then 
		error "从书架 shelf 上找不到此书籍 $bookId"
	fi
	local bookcategory=$(echo "$info" | cut -d '$' -f 1)
	if [ -z "$bookcategory" ]; then 
		bookcategory="未分类"
	fi
	
	local book_path="$book_base/$bookcategory/$bookId"
	if [ ! -d "$book_path" ]; then
		mkdir -vp "$book_path"
	elif [ -f "$book_path/over" ]; then
		echo "书籍 $bookId 已经被抓取过"
		return
	fi
	
	local chapterinfo_f="$book_path/chapterinfo.json"
	read_book_chapterinfo $bookId > "$chapterinfo_f"
	grep '登录超时' "$chapterinfo_f" >/dev/null && local res=true || local res=false
	if [ "$res" = "true" ]; then
		error "登录超时"
	fi
	
	local all_chapter=$(jq '.data[0].updated[].chapterUid' "$chapterinfo_f")
	jq -r --arg path "$book_path" '.data[0].book|("抓取 " + .title + " by " + .author + " 到文件夹 " + $path)' "$chapterinfo_f"
	
	if [ "$2" != "try" ]; then
		local chapter_base="$book_path/chapter"
		rm -rf "$chapter_base"
		mkdir -p "$chapter_base"
		for i in $(echo -e "$all_chapter"); do
			local chapter_p="$chapter_base/${i}.json"
			echo "第 $i 章"
			read_book_chapter $bookId $i > "$chapter_p"
		done
		echo -e "\n展示最后一章"
		jq '.content' "$chapter_base/${i}.json" && (
			sed -r -i "/[\$]$bookId[\$]/s,$,\$$book_path," shelf
			echo -e "\n抓取书籍 $info 成功. 放在 $book_path"
		) || (
			error "抓取书籍 $info 失败"
		)
		unset i
	fi
	touch "$book_path/over"
	echo
}

read_from_shelf() {
	local line=$1
	local book_line=$(sed -n "${line}p" shelf | grep -v '^#' || true)
	if [ -z "$book_line" ]; then
		echo "未发现第 $line 行的书籍"
	else
		local book_Id=$(echo "$book_line" | cut -d '$' -f 4)
		local bookStatus=$(echo "$book_line" | cut -d '$' -f 5)
		local bookType=$(echo "$book_line" | cut -d '$' -f 6)
		local bookformat=$(echo "$book_line" | cut -d '$' -f 7)
		if [ "$bookStatus" = "5" ]; then
			echo "有声读物不能读取 $book_line"
			sed -i -r "/[\$]$book_Id[\$]/s,^,#," shelf
			return
		fi
		if [ "$bookType" = "3" ]; then
			echo "公众号不能读取 $book_line"
			sed -i -r "/[\$]$book_Id[\$]/s,^,#," shelf
			return
		fi	
		if [ "$bookformat" = "json" ]; then
			echo "漫画不能读取 $book_line"
			sed -i -r "/[\$]$book_Id[\$]/s,^,#," shelf
			return
		fi		
		read_book_all_chapter "$book_Id" "$2"
	fi	
}

flush_shelf() {
	get_shelf
	jq -r '.books[],.lectureBooks[]|(
		.category + "$" + .title + "$" + .author + "$" + .bookId + "$" + (.bookStatus|tostring) + "$" + (.type|tostring)
		+ "$" + .format
	)' "$shelf" > shelf
	sort -t '$' -k 1,1 -k 2,2 shelf | uniq > shelf.tmp
	(find $(pwd)/book -type f -name over | sed -r -e 's,^(.*/book/)([^/]+/)([^/]+)(/over)$,\$\$\$\3\$\1\2\3,'
	cat shelf.tmp) | sort -t '$' -k 4,4 -k 2r,2r | awk -F '$' 'BEGIN {f="";s="";p=""} {
		n=$4
		if(f != n) {
			if( s != "") {
				print s""p
			}
			f=n;p=""
			if($5 == "5" || $6 == "3" || $7 == "json") {
				s="#"$0
			} else {
				s=$0
			}			
		} else {
			p="$"$5
		}
	} END {
		print s""p
	}' | sort -t '$' -k 1,1 -k 2,2 > shelf
	rm -rf shelf.tmp
}

if [ "$1" = "shelf" ]; then
	flush_shelf
elif [ "$1" = "line" ]; then
	read_from_shelf "$2" "$3"
elif [ ! -z "$1" ]; then
	#read_book_all_chapter $book_Id try
	read_book_all_chapter "$1" "$2"
fi


#login

#echo ''"$curl_h_oss"' -H "Host: oss.weread.qq.com" -H "content-type: application/json" \
# "https://oss.weread.qq.com/hera/logkv?key=78503281&itemName=Wp_source_mpmenu&value=1&vid='${vid}'&skey='${skey}'&platform=wp"' | bash

#read_book_epub_contents $book_Id 39 > "$book_path/epub_contents.json"

