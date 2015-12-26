var pushurl = '';
var user = '';
var firstlabel = '';
var secondlabel = '';
var longitude = '';
var latitude = '';

self.port.on("sendpushcfg", function(pushcfg) {
	pushurl = pushcfg.pushurl;
	user = pushcfg.user;
	firstlabel = pushcfg.firstlabel;
	secondlabel = pushcfg.secondlabel;
	longitude = pushcfg.longitude;
	latitude = pushcfg.latitude;
	post_msg(document.getElementById(pushcfg.msgid));
});

var num = document.evaluate("count(//div[@class='c' and @id !=''])", document, null, XPathResult.NUMBER_TYPE, null);
var xmlhttp = new XMLHttpRequest();

for (var i=0; i<=num.numberValue; i++){
	var nodes = document.evaluate("//div[@class='c' and @id !=''][" + [i] + "]", document, null, XPathResult.ANY_TYPE, null).iterateNext();
	if(nodes) {
	  var id = document.evaluate("@id", nodes, null, XPathResult.ANY_TYPE, null).iterateNext();
    var a = document.createElement("a");
    //a.setAttribute("href", "javascript:window.deploy_msg(" + id.value + ")");
    a.setAttribute("href", "javascript:window.postMessage('" + id.value + "','http://weibo.cn/')");   //HTML5
    a.innerHTML = '<span>发布到社区达人</span>';
    var ct = document.evaluate("div/span[@class='ct']/..", nodes, null, XPathResult.ANY_TYPE, null).iterateNext();
    var span = document.evaluate("span[@class='ct']", ct, null, XPathResult.ANY_TYPE, null).iterateNext();
    ct.insertBefore(a, span);
  }
}

window.addEventListener('message', function(event) { //HTML5
	self.port.emit("getpushcfg", event.data);
}, false);


//function deploy_msg(msg) {
//	var msgid = document.evaluate("@id", msg, null, XPathResult.ANY_TYPE, null).iterateNext().value;
//	self.port.emit("getpushcfg", msgid);
//}
//exportFunction(deploy_msg, unsafeWindow, {defineAs: "deploy_msg"});

function post_msg(msg) {
	if(pushurl == '') {
		alert("error: push url is empty.");
		return;
	}
	
	var msg_text = document.evaluate("div[1]/span[@class='ctt']", msg, null, XPathResult.ANY_TYPE, null).iterateNext();
	var img = document.evaluate("div[2]/a[1]/img/@src", msg, null, XPathResult.ANY_TYPE, null).iterateNext();
	var msg_body = msg_text.innerHTML.replace(/<a [^>]*>([^<]*)<\/a>/g,"$1");
	if(img) img = img.value; else img = '';
	var contact = '{"username":"' + user 
	           + '","content":"' + msg_body 
	           + '","imgs":"' + img 
	           + '","labels":["' + firstlabel + '","' + secondlabel + '"],"location":["' + longitude + '","' + latitude + '"]}';
	
	xmlhttp.onreadystatechange=function(){
		if (xmlhttp.readyState==4){
			var a = document.evaluate("div/a/span", msg, null, XPathResult.ANY_TYPE, null).iterateNext();
			if(a){
			  if (xmlhttp.status==200){
			  	var res = eval("("+xmlhttp.responseText+")");
			  	if(res.result == "ok"){
			    	  a.setAttribute("class", "ct");
			    	  a.innerHTML = '发布到社区达人[发布成功]';
			    } else {
			    	a.setAttribute("class", "kt");
			    	a.innerHTML = '发布到社区达人[发布失败]';
			    }
			  } else {
			    a.setAttribute("class", "kt");
			    a.innerHTML = '发布到社区达人[发布失败]';
			  }
		  } else {
		  	alert("error:" + xmlhttp.readyState + "," + xmlhttp.statusText + "," + xmlhttp.status + "," + xmlhttp.responseText);
		  }
		}
	}
	xmlhttp.open("post",pushurl,true);
	xmlhttp.send(contact);
}
