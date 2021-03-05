grep -r 'shopId' ../../all_shop_info | sed -r -e 's,.*shopId" : ,,' -e "s,',,g" -e 's,\,.*,,' | sort | uniq > tt
for i in $(cat tt); do
	#echo "check $i"
	curl -sS -k https://shop.m.jd.com/?shopId=$i | egrep '/sign/sevenDay/signActivity|/sign/signActivity|/babelDiy/Zeus/' | sed -r -e 's,.*https,https,' -e 's,"\,$,,' -e 's,"$,,' 
done #> sign_list
# | sort | uniq
#./search.sh sign_list one  ## 一行行执行
