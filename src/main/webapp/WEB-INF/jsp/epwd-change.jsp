<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.5.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.5.4/themes/icon.css">
<script type="text/javascript" src="/js/code.js"></script>
<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.min.js"></script>
<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.easyui.min.js"></script>
</head>
<style>
	body{text-align:center} 
	#main{
		margin:0 auto;
		width:800px;
		height:800px;
		position:relative
	}
</style>
<body>
	<div id="main" style="font-size: 16px;position:relative;">
		<h1>企业用户密码修改</h1>
		<div style="margin-left: 240px;">
			<form id="pwdchange" method="post">
					<table cellpadding="8px;" cellspacing="0">
						<input type="hidden" name="id" value="<%=session.getAttribute("euserid")%>"/>
					  <tr>
						<td><input style="width: 300px;" label="当前密码" class="easyui-passwordbox" name="pwd" id="oldPassword" />
						</td>
					  </tr>
					  <tr>
						<td>
						   <input  style="width: 300px;" label="新密码"  class="easyui-passwordbox" name="newpwd" id="newpassword1" />
						  </td>
					  </tr>
					  <tr>
						<td>
						   <input  style="width: 300px;" label="确认新密码"  class="easyui-passwordbox" id="newpassword2"/>
						  </td>
					  </tr>
					</table>
			</form>
			<div style="height:38px;position:relative">
				<div style="position: absolute;top:10px;left:7px;"><input class="easyui-textbox" label="验证码" style="width:150px;height:27px;"></div>
				<div style="position: absolute;top:5px;left:167px;"><canvas id="canvas" width="140px" height="38px"></canvas></div>
			</div>
		</div>
		<div style="padding:5px;margin-top:15px;">
			<a href="#" class="easyui-linkbutton" style="width:100px;hegiht:50px;" onclick="pwdchange()">确认修改</a>
		</div>
	</div>
	<script>
	 	document.getElementById("canvas").onclick = function(e){
	        e.preventDefault();
	        drawPic("canvas");
	    };
	    drawPic("canvas");
	    function pwdchange(){
	    	if($("#oldPassword").textbox('getValue')==""||$("#oldPassword").textbox('getValue')==null
					||$("#newpassword1").textbox('getValue')==""||$("#newpassword1").textbox('getValue')==null
					||$("#newpassword2").textbox('getValue')==""||$("#newpassword2").textbox('getValue')==null){
	    		$.messager.alert('提示','请填写完整!');
	    	}else if($("#newpassword1").textbox('getValue')!=$("#newpassword2").textbox('getValue')){
	    		$.messager.alert('提示','新密码不一致');
	    	}else{
	    		$.post("/user/pwdchange",$('#pwdchange').serialize(),function(data){
		    		if(data.status == 200){
		    			alert("密码修改成功！");
		    			window.location.href="/euser/enterprise"
		    		}else{
		    			alert("密码错误！")
		    		}
		    	});
	    	}
	    }
	</script>
	
</body>
</html>