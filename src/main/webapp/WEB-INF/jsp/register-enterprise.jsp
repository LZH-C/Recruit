<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.5.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.5.4/themes/icon.css">
<script type="text/javascript" src="/js/code.js"></script>
<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.min.js"></script>
<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.easyui.min.js"></script>
<style>
	body{text-align:center}
	#main{
		margin:0 auto;
		width:800px;
		height:500px;
		position:relative
	}
</style>
<body>
		<div id="main"">  
		    <div style="text-align: center;padding-top: 10px;">
		    	<h1>企业用户注册</h1>
		    </div>
		    <div style="position: absolute;top:80px;left:240px;">
			    <form id="registerform" style="font-size:21px">
			        <p><input id="username" class="easyui-textbox" label="用户名:" name="username" style="width:300px;height:27px;"></p>
			        <p><input id="pwd1" class="easyui-passwordbox" label="密码:" name="pwd" style="width:300px;height:27px;"></p>
			        <p><input id="pwd2" class="easyui-passwordbox" label="再次密码:" style="width:300px;height:27px;"></p>
			        <p><input id="email" class="easyui-textbox" label="邮箱:" name="email" data-options="validType:'email'" style="width:300px;height:27px;"></p>
			        <p>
			        	<div style="height:38px;position:relative">
				        	<div style="position: absolute;top:0px;left:0px;"><input id="canvas1" class="easyui-textbox" label="验证码:" style="width:150px;height:27px;"></div>
				        	<div style="position: absolute;top:-5px;left:160px;"><canvas id="canvas" width="140px" height="38px"></canvas></div>
			        	</div>
			        </p>
			        <div style="padding:5px;text-align:center;">
			            <a href="#" class="easyui-linkbutton" onclick="register()" style="width: 168px;hegiht:50px;">注册</a>
			        </div>
			    </form>
		    </div>
		</div>
</body>
	<script>
	 	document.getElementById("canvas").onclick = function(e){
	        e.preventDefault();
	        drawPic("canvas");
	    };
	    drawPic("canvas");
	    
	    function register(){
	    	if($("#username").textbox('getValue')==""||$("#username").textbox('getValue')==null
					||$("#pwd1").textbox('getValue')==""||$("#pwd1").textbox('getValue')==null
					||$("#pwd2").textbox('getValue')==""||$("#pwd2").textbox('getValue')==null
					||$("#email").textbox('getValue')==""||$("#email").textbox('getValue')==null
	    			||$("#canvas1").textbox('getValue')==""||$("#canvas1").textbox('getValue')==null){
				$.messager.alert('提示','表单还未填写完成!');
			}else if(!$('#registerform').form('validate')){
				$.messager.alert('提示','邮箱格式不正确!');
			}else if($("#pwd1").textbox('getValue')!=$("#pwd2").textbox('getValue')){
				$.messager.alert('提示','密码不一致');
			}else if($("#canvas1").textbox('getValue')==code){
				$.post("/user/eregister",$('#registerform').serialize(),function(data){
					if(data.status == 200){
						alert("注册成功!");
						window.location.href = "/euser/enterprise"
					}else{
						alert("已存在相同的用户！");
						$('#registerform').form('clear')
					}
	    		});
			}else{
				$.messager.alert('提示','验证码错误！');
			}
	    }
	    
	</script>
</html>