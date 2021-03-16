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
