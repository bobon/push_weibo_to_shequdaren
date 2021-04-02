#!/bin/bash
set -e
set +E
set +x

cd /home/myid/jd/jd_signup

##
for i in $(grep -r 'shopId:' shop/ | sed -r -e 's,.*shopId: ,,' -e "s,',,g" -e 's,\,.*,,' | sort | uniq ); do
	curl -sS -k https://shop.m.jd.com/?shopId=$i | egrep '/sign/sevenDay/signActivity|/sign/signActivity|/babelDiy/Zeus/' || true
done | sed -r -e 's,.*https,https,' -e 's,"\,$,,' -e 's,"$,,' | sort | uniq > sign_list

for i in $(cat log/all_shop_signed.tmp); do
	curl -sS -k https://shop.m.jd.com/?shopId=$i | egrep '/sign/sevenDay/signActivity|/sign/signActivity|/babelDiy/Zeus/' || true
done | sed -r -e 's,.*https,https,' -e 's,"\,$,,' -e 's,"$,,' | sort | uniq >> sign_list

rm -rf sign_list.tmp
for i in $(cat sign_list); do
	key=$(echo "$i" | sed -r -e 's,.*activityId=([^&]+).*,\1,' -e 's,.*token=([^&]+).*,\1,')	
	#echo $key from $i
	grep -r "$key" vender api_vender lzkj_sevenDay_vender >/dev/null && res=false || res=true
	if $res; then 
		echo "发现新活动 $i"
		echo "$i" >> sign_list.tmp
		echo
	fi
done
if [ -f "sign_list.tmp" ]; then
	mv -vf sign_list.tmp sign_list
fi

grep -r 'shopId' /home/myid/all_shop_info | sed -r -e 's,.*shopId" : ,,' -e "s,',,g" -e 's,\,.*,,' | sort | uniq > /home/myid/all_shopid
for i in $(cat /home/myid/all_shopid); do
	#echo "check $i"
	curl -sS -k https://shop.m.jd.com/?shopId=$i | egrep '/sign/sevenDay/signActivity|/sign/signActivity|/babelDiy/Zeus/' | sed -r -e 's,.*https,https,' -e 's,"\,$,,' -e 's,"$,,' 
done | tee /home/myid/jd/jd_signup/sign_list2
sort sign_list sign_list2 | uniq > sign_list.tmp
mv -vf sign_list.tmp sign_list

exit

./search.sh sign_list one  ## 一行行执行
./search.sh sign_list  ## 修正sign_list后，批量执行
./sign_res_check.sh  # 检查sign_list是否有签到失败



exit
## 
./search.sh flush_from_old
./sign_search.sh nosearch
./sign_search.sh check_pre | tee log/check_pre.log


##
#grep -r 'shopId' /home/myid/all_shop_info | sed -r -e 's,.*shopId" : ,,' -e "s,',,g" -e 's,\,.*,,' | sort | uniq > /home/myid/all_shopid
for i in $(cat /home/myid/all_shopid); do
	#echo "check $i"
	curl -sS -k https://shop.m.jd.com/?shopId=$i | egrep '/sign/sevenDay/signActivity|/sign/signActivity|/babelDiy/Zeus/' | sed -r -e 's,.*https,https,' -e 's,"\,$,,' -e 's,"$,,' 
done | tee /home/myid/jd/jd_signup/sign_list
sort sign_list | uniq > sign_list.tmp
mv -vf sign_list.tmp sign_list
./search.sh sign_list one  ## 一行行执行
./search.sh sign_list  ## 修正sign_list后，批量执行
./sign_res_check.sh  # 检查sign_list是否有签到失败



##
将url活动链接(不能带两边引号)、h5签到的短连接(不能带两边引号)、或者店铺venderId号写入sign_list, sign_list不能有空行. 比如
https://lzkj-isv.isvjcloud.com/sign/sevenDay/signActivity?activityId=36a96949aef74f239e4a8b8553518bac&venderId=10142406&sceneval=2&jxsid=16146428113866014329
https://u.jd.com/iNUDG9R
1000002423
然后执行
./search.sh sign_list
如果只处理sign_list第一行，执行
./search.sh sign_list one



##将店铺venderId号写入sign_vender_list，比如
1000002423
然后执行
./search.sh sign_vender_list


