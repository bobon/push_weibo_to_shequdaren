#!/usr/bin/env bash

egrep -l -r 'jd.turinglabs.net|code.chiang.fun|api.turinglabs.net' --include=*.js /home/myid/jd/scripts/ | egrep -v 'jd_joy_run|jd_health|/activity/' | xargs -i sed -i -r -e '/jd.turinglabs.net|code.chiang.fun|api.turinglabs.net/s,http,htttp,' {}
sed -i -r -e '/JSMOBILEFESTIVAL_SHARECODES|JDNIANPK_SHARECODES|JDSGMH_SHARECODES|JDSXSY_SHARECODES|JDNIAN_SHARECODES|FRUITSHARECODES|PLANT_BEAN_SHARECODES|DREAM_FACTORY_SHARE_CODES|JXNC_SHARECODES|BOOKSHOP_SHARECODES|JD_CASH_SHARECODES/s,".*",,' /home/myid/jd/jd.sh
#sed -i -r -e '/while \(true\) \{/s,while \(true\),  for (var i = 0; i < 40; i++),' /home/myid/jd/scripts/jd_crazy_joy_coin.js

#grep jd_crazy_joy_coin /home/myid/jd/config/crontab.list || (
#	sed -i -r -e '$a0 0,8,12,16 * * * bash /home/myid/jd/jd.sh jd_crazy_joy_coin now'  /home/myid/jd/config/crontab.list
grep jd_5g /home/myid/jd/config/crontab.list || (
#	sed -i -r -e '$a0 0,6,12,18 * * * bash /home/myid/jd/jd.sh jd_5g'  /home/myid/jd/config/crontab.list
	sed -i -r -e '/git_pull.sh/s,.*[*] bash,55 7-23/2 * * * bash,'  /home/myid/jd/config/crontab.list
	crontab /home/myid/jd/config/crontab.list
) 

sed -i -r -e "/^const shareCode = /s,'[^']+',''," /home/myid/jd/scripts/jd_jxnc.js
#sed -i -r -e '/个京东账号将要助力的好友/i\$.newShareCodes = [];' /home/myid/jd/scripts/jd_nian.js
#sed -i -r -e '/个京东账号将要助力的PK好友/i\$.newShareCodesPk = [];' /home/myid/jd/scripts/jd_nian.js
sed -i -r -e "/^let joyRewardName/s,20;,[500\,500\,500\,500];let ii=0," /home/myid/jd/scripts/jd_joy_reward.js
sed -i -r -e "/rewardNum = process.env.JD_JOY_REWARD_NAME [*] 1/s,process.*,joyRewardName[ii]; ii=ii+1;," /home/myid/jd/scripts/jd_joy_reward.js

#sed -i -r -e '/gitee.com\/evine\/jd-base/aShellURL=https://gitee.com/the_king_god/jd-base' git_pull.sh
#sed -i -r -e '/git reset --hard origin\/v3/s,v3,master,' git_pull.sh
#sed -i -r -e '/Git_PullScripts2 \|\| Git_CloneScripts2/s,^,#,' git_pull.sh
#sed -i -r -e '/cp -f \$[{]Scripts2Dir[}]\/jd_/s,^,#,' git_pull.sh
sed -i -r -e '/https:\/\/gitee.com\/shylocks\/updateTeam/s,http,htttp,' /home/myid/jd/scripts/jd_dreamFactory.js

grep jd_joy_reward /home/myid/jd/config/crontab.list || (
	sed -i -r -e '$a0 0,8,12,16 * * * bash /home/myid/jd/jd.sh jd_joy_reward now'  /home/myid/jd/config/crontab.list
)

echo run dit ok