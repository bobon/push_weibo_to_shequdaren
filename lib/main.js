var pageMod = require("sdk/page-mod");
var data = require("sdk/self").data;
var simpleStorage = require('sdk/simple-storage');

if (!simpleStorage.storage.pushcfg)
  simpleStorage.storage.pushcfg = { pushurl: "http://115.28.150.213/community/message/create"
  	                                , user: "user1"
  	                                , firstlabel: "咨询"
  	                                , secondlabel: "咨询"
  	                                , longitude: "23.943094"
  	                                , latitude: "29.0394"
  	                                , msgid: ""
  	                               };

var pushmsg = pageMod.PageMod({
  include: "http://weibo.cn/*",
  contentScriptFile: data.url("pushmsg.js")
  ,onAttach: function(worker) {
    worker.port.on("getpushcfg", function(msgid) {
    	simpleStorage.storage.pushcfg.msgid = msgid;
      worker.port.emit("sendpushcfg", simpleStorage.storage.pushcfg);
    });
  }
});


var pushcfg_entry = require("sdk/panel").Panel({
	width: 390,
  height: 230,
  contentURL: data.url("pushcfg.html"),
  contentScriptFile: data.url("pushcfg.js")
  ,contentScriptWhen: 'ready'
  ,onShow: function() {
      this.postMessage(simpleStorage.storage.pushcfg);
  }
});

require("sdk/ui/button/action").ActionButton({
  id: "config-shequdaren",
  label: "Configure shequdaren pushing parameters",
  icon: {
    "16": "./logo-16.png",
    "32": "./logo-32.png",
    "64": "./logo-64.png"
  },
  onClick: handleClick
});

function handleClick(state) {
  pushcfg_entry.show();
}

pushcfg_entry.on("show", function() {
  pushcfg_entry.port.emit("show");
});

pushcfg_entry.port.on("pushcfg-saved", function (pushcfg) {
  simpleStorage.storage.pushcfg = pushcfg;
  pushcfg_entry.hide();
});