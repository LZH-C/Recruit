<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>msg</title>
<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.5.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.5.4/themes/icon.css">
<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.min.js"></script>
<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.easyui.min.js"></script>
</head>
<body>	
	<div style="position:relative;">
	<div id="applicantintention-div1">
		<table cellpadding="5">
			<tr><th>工作类型:</th><th>${applicantintention.worktype}</th></tr>
			
			<tr><th>工作区域:</th><th>${applicantintention.region}</th></tr>
			
			<tr><th>工作职位:</th><th>${applicantintention.job}</th></tr>
			
			<tr><th>工作待遇:</th><th>${applicantintention.deal}</th></tr>
			
		</table>
	</div>
	<div id="applicantintention-div2">
		<a id="applicantintention-change" href="#" class="easyui-linkbutton" onclick="applicantintentionchange()">修改</a>
		<a id="applicantintention-changed" href="#" style="visibility:hidden;" class="easyui-linkbutton" onclick="applicantintentionchanged()">修改完成</a>
	</div>
	<div id="applicantintention-div3" style="visibility:hidden">
		<form id="applicantintentionmsg" method="post">
			<div style="margin-bottom:20px;width:300px;">
				<input id="aid2" name="aid" type="hidden">
				<input class="easyui-combobox" name="worktype" style="width:100%" 
				data-options="label:'工作类型',required:true,valueField:'value',textField:'text',data:Qquality,editable:false,panelHeight:75">
			</div>
			<div style="margin-bottom:20px;width:300px;">
				<input class="easyui-textbox" name="region" style="width:100%" data-options="label:'工作区域',required:true">
			</div>
			<div style="margin-bottom:20px;width:300px;">
				<input class="easyui-combobox" name="job" style="width:100%" 
				data-options="label:'工作职位',required:true,valueField:'value',textField:'text',data:quarters">
			</div>
			<div style="margin-bottom:20px;width:300px;">
				<input class="easyui-combobox" name="deal" style="width:100%" 
				data-options="label:'工作待遇',required:true,valueField:'value',textField:'text',data:wdeal,editable:false">
				<input name="checkstate" type="hidden">
			</div>
		</form>
	</div>
	</div>
		<script>		
	function applicantintentionchange(){
		//获取url参数
		var aid=window.parent.aid;
		 $.get('/ae/applicantintention/getmsg/'+aid, function(result){
			 	$('#applicantintentionmsg').form('load',result);
			  });
		 window.parent.setaid();
		document.getElementById("applicantintention-div1").style.visibility='hidden'; 	
		document.getElementById("applicantintention-change").style.visibility='hidden'; 
		document.getElementById("applicantintention-changed").style.visibility='visible'; 
		document.getElementById("applicantintention-div3").style.visibility='visible'; 	
	}
	function applicantintentionchanged(){
		//有效性验证
		if(!$('#applicantintentionmsg').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}else{
			document.getElementById("applicantintention-div1").style.visibility='visible'; 	
			document.getElementById("applicantintention-change").style.visibility='visible'; 
			document.getElementById("applicantintention-changed").style.visibility='hidden';  
			document.getElementById("applicantintention-div3").style.visibility='hidden'; 	
			//ajax的post方式提交表单
			//$("#itemAddForm").serialize()将表单序列号为key-value形式的字符串
			//alert(JSON.stringify($("#applicantmsg").serializeObject()));
			$.post("/ae/applicantintention/msg/save",$('#applicantintentionmsg').serialize());
			location.reload(true);
		}
	}
	  
	</script>
			
</body>
</html>