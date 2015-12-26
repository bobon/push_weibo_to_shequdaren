var save_button = document.getElementById("save");
var pushurl = document.getElementById("pushurl");
var user = document.getElementById("user");
var firstlabel = document.getElementById("firstlabel");
var secondlabel = document.getElementById("secondlabel");
var longitude = document.getElementById("longitude");
var latitude = document.getElementById("latitude");

self.on("message", function onMessage(pushcfg) {
	pushurl.value = pushcfg.pushurl;
	user.value = pushcfg.user;
	firstlabel.value = pushcfg.firstlabel;
	secondlabel.value = pushcfg.secondlabel;
	longitude.value = pushcfg.longitude;
	latitude.value = pushcfg.latitude;
});


save_button.addEventListener('click', function click(event) {
	document.getElementById("check").innerHTML = '&nbsp;&nbsp;';
  if (pushurl.value == '') {
  	document.getElementById("check").innerHTML = '&nbsp;&nbsp;push url can not be empty.';
  	return;
  }
  if (user.value == '') {
  	document.getElementById("check").innerHTML = '&nbsp;&nbsp;user name can not be empty.';
  	return;
  }
  if (firstlabel.value == '') {
  	document.getElementById("check").innerHTML = '&nbsp;&nbsp;labels(first) can not be empty.';
  	return;
  }
  if (secondlabel.value == '') {
  	document.getElementById("check").innerHTML = '&nbsp;&nbsp;labels(second) can not be empty.';
  	return;
  }
  if (longitude.value == '') {
  	document.getElementById("check").innerHTML = '&nbsp;&nbsp;location(longitude) can not be empty.';
  	return;
  }
  if (latitude.value == '') {
  	document.getElementById("check").innerHTML = '&nbsp;&nbsp;location(latitude) can not be empty.';
  	return;
  }
  
  var pushcfg = { pushurl: pushurl.value
                  , user: user.value
                  , firstlabel: firstlabel.value
                  , secondlabel: secondlabel.value
                  , longitude: longitude.value
                  , latitude: latitude.value
                 };
  self.port.emit("pushcfg-saved", pushcfg);
}, false);

self.port.on("show", function onShow() {
	document.getElementById("check").innerHTML = '&nbsp;&nbsp;';
  save_button.focus();
});