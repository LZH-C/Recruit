	//注册和登录窗口的变更
	function showl(){
		$('#uregister').form('clear');
		drawPic("canvas1");
		$('#login').window('open');
		$('#register').window('close');
	}
	function showr(){
		$('#eregister').form('clear');
		drawPic("canvas2");
		$('#register').window('open');
		$('#login').window('close');
	}
	
	function etlogin(){
		window.location.href='/login'
	}
	
	//用户名注册窗口展现
	function showUregister(){
		drawPic("canvas2");
		document.getElementById("userregister").style.visibility='visible'; 
		document.getElementById("emailregister").style.visibility='hidden'; 
	}
	//邮箱注册窗口展现
	function showEregister(){
		drawPic("canvas3");
		document.getElementById("userregister").style.visibility='hidden'; 
		document.getElementById("emailregister").style.visibility='visible'; 
	}
	//登录
	function alogin(){
		//有效性验证
		if($("#auname").textbox('getValue')==""||$("#auname").textbox('getValue')==null
				||$("#aupwd").textbox('getValue')==""||$("#aupwd").textbox('getValue')==null
				||$("#canvas1-text").textbox('getValue')==""||$("#canvas1-text").textbox('getValue')==null){
			$.messager.alert('提示','表单还未填写完成!');
		}else if($("#canvas1-text").textbox('getValue')==code){
			$.post("/user/login/applicant",$('#alogin').serialize(),function(data){
				if(data.status == 200){
					window.location.href = "/auser/home";
				}else{
					alert("账户/密码错误！");
					$('#alogin').form('clear');
					drawPic("canvas1");
				}
			});
		}else{
			$.messager.alert('提示','验证码错误！');
		}
	}
	//注册
	function uregister(){
		//有效性验证
		if(!$('#uregister').form('validate')){
			$.messager.alert('提示','信息还未填写完成!');
		}else if($("#pwd1").textbox('getValue')!=$("#pwd2").textbox('getValue')){
			$.messager.alert('提示','密码不一致');
		}else if($("#canvas1-text1").textbox('getValue')==code){
			$.post("/user/aregister/u",$('#uregister').serialize(),function(data){
				if(data.status == 200){
					window.location.href = "http://localhost:8081/auser/home";
				}else{
					alert("已存在该用户名！");
					$('#uregister').form('clear')
					drawPic("canvas2");
				}
			});
		}else{
			$.messager.alert('提示','验证码错误！');
		}
		
	}
	function eregister(){
		//有效性验证
		if(!$('#eregister').form('validate')){
			$.messager.alert('提示','信息还未填写完成!');
		}else if($("#pwd3").textbox('getValue')!=$("#pwd4").textbox('getValue')){
			$.messager.alert('提示','密码不一致');
		}else if($("#canvas1-text2").textbox('getValue')==code){
			$.post("/user/aregister/e",$('#eregister').serialize(),function(data){
				if(data.status == 200){
					window.location.href = "http://localhost:8081/auser/home";
				}else{
					alert("已存在该用户名！");
					$('#uregister').form('clear')
					drawPic("canvas3");
				}
			});
		}else{
			$.messager.alert('提示','验证码错误！');
		}
		
	}