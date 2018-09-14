function ehome(){
	window.location.href = "/euser/enterprise";
}
function emsg(){
	window.location.href = "/ae/enterprise/msg/"+eid;
}
function amanager(){
	window.location.href = "/euser/recruit-manager";
}
function omanager(){
	window.location.href = "/euser/office-manager";
}
function interviewmanager(){
	window.location.href = "/euser/interview-manager";
}
function logout(){
	$.get("/user/logout/enterprise");
	alert("已经退出！");
	window.location.href = "/login";
}
function addQuarte(){
	window.location.href = "/euser/addquarter";
}
function pwdchange(){
	window.location.href = "/euser/epwd-change";
}