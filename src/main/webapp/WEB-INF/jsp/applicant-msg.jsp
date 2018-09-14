<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.5.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.5.4/themes/icon.css">
<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.min.js"></script>
<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.easyui.min.js"></script>
</head>
<body>
	<div style="position:relative;">
	<div id="applicant-div1">
		<table cellpadding="5">
			<tr><th>用户名称:</th><th>${applicant.name}</th></tr>
			
			<tr><th>性别:</th><th>${applicant.gender}</th></tr>
			
			<tr><th>生日日期:</th><th id="birth"></th></tr>
			
			<tr><th>工作年限:</th><th>${applicant.wtime}</th></tr>
			
			<tr><th>地址:</th><th>${applicant.addr}</th></tr>
			
			<tr><th>邮箱:</th><th>${applicant.email}</th></tr>
			
			<tr><th>手机号:</th><th>${applicant.phone}</th></tr>
			
			<tr><th>目前状态:</th><th>${applicant.status}</th></tr>		
		</table>
	</div>
	<div id="applicant-div2">
		<a id="applicant-change" href="#" class="easyui-linkbutton" onclick="applicantchange()">修改</a>
		<a id="applicant-changed" href="#" style="visibility:hidden;" class="easyui-linkbutton" onclick="applicantchanged()">修改完成</a>
	</div>
	<div id="applicant-div3" style="visibility:hidden">
		<form id="applicantmsg" method="post">
			<div style="margin-bottom:20px;width:300px;">
				<input id="aid1" name="aid" type="hidden">
				<input class="easyui-textbox" name="name" style="width:100%" data-options="label:'用户名称',required:true">
			</div>
			<div style="margin-bottom:20px;width:300px;">
				<input class="easyui-combobox" name="gender" style="width:100%"
				data-options="label:'性别',required:true,valueField:'value',textField:'text',data:gender,editable:false,panelHeight:50">
			</div>
			<div style="margin-bottom:20px;width:300px;">
				<input class="easyui-datebox" name="birth" style="width:100%" data-options="label:'生日日期',required:true">
			</div>
			<div style="margin-bottom:20px;width:300px;">
				<input class=easyui-numberbox name="wtime" style="width:100%" data-options="label:'工作年限',required:true,min:0,max:100">
			</div>
			<div style="margin-bottom:20px;width:300px;">
				<input class="easyui-textbox" name="addr" style="width:100%" data-options="label:'地址',required:true">
			</div>
			<div style="margin-bottom:20px;width:300px;">
				<input class="easyui-textbox" name="email" style="width:100%" data-options="label:'邮箱',validType:'email',required:true">
			</div>
			<div style="margin-bottom:20px;width:300px;">
				<input id="phone" class="easyui-numberbox" name="phone" style="width:100%" data-options="label:'手机号',required:true">
			</div>
			<div style="margin-bottom:20px;width:300px;">
				<input class="easyui-combobox" name="status" style="width:100%" 
				data-options="label:'目前状态',required:true,valueField:'value',textField:'text',data:wstatus,editable:false,panelHeight:75"">
				<input name="checkstate" type="hidden">
			</div>
		</form>
	</div>
	</div>
		<script>
		var time="${applicant.birth}";
		var birth=window.parent.formatDate(time);
		$("#birth").append(birth);
	function applicantchange(){
		$(function () {
	        $('#phone').numberbox('textbox').attr('maxlength', 11);
	    });
		//获取url参数
		var aid=window.parent.aid;
		window.parent.setaid();
		$.get('/ae/applicant/getmsg/'+aid, function(result){
			 	var bir=window.parent.formatDatebox(result["birth"]);
			 	$('#applicantmsg').form('load',{
			 		name:result["name"],
			 		gender:result["gender"],
			 		birth:bir,
			 		wtime:result["wtime"],
			 		addr:result["addr"],
			 		email:result["email"],
			 		phone:result["phone"],
			 		status:result["status"],
			 		checkstate:result["checkstate"]
			 	});
			  });
		document.getElementById("applicant-div1").style.visibility='hidden'; 	
		document.getElementById("applicant-change").style.visibility='hidden'; 
		document.getElementById("applicant-changed").style.visibility='visible'; 
		document.getElementById("applicant-div3").style.visibility='visible'; 	
	}
	function applicantchanged(){
		//有效性验证
		if(!$('#applicantmsg').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}else{
			document.getElementById("applicant-div1").style.visibility='visible'; 	
			document.getElementById("applicant-change").style.visibility='visible'; 
			document.getElementById("applicant-changed").style.visibility='hidden';  
			document.getElementById("applicant-div3").style.visibility='hidden'; 	
			//ajax的post方式提交表单
			//$("#itemAddForm").serialize()将表单序列号为key-value形式的字符串
			//alert(JSON.stringify($("#applicantmsg").serializeObject()));
			$.post("/ae/applicant/msg/save",$('#applicantmsg').serialize());
			location.reload(true);
		}
	} 
	  
	</script>
</body>
</html>