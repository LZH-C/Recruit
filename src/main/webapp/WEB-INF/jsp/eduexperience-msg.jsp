<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>msg</title>
	<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.5.4/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.5.4/themes/icon.css">
	<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.easyui.min.js"></script>
</head>

<body>	
	<div style="position:relative;">
	<div id="eduexperience-div1">
		<table cellpadding="5">
			<tr><th>教育开始时间:</th><th id="begintime"></th></tr>
			
			<tr><th>教育结束时间:</th><th id="endtime"></th></tr>
			
			<tr><th>学位:</th><th>${eduexperience.degree}</th></tr>
			
			<tr><th>学校:</th><th>${eduexperience.school}</th></tr>
		</table>
	</div>
	<div id="eduexperience-div2">
		<a id="eduexperience-change" href="#" class="easyui-linkbutton" onclick="eduexperiencechange()">修改</a>
		<a id="eduexperience-changed" href="#" style="visibility:hidden;" class="easyui-linkbutton" onclick="eduexperiencechanged()">修改完成</a>
	</div>
	<div id="eduexperience-div3" style="visibility:hidden">
		<form id="eduexperiencemsg" method="post">
			<div style="margin-bottom:20px;width:300px;">
				<input id="aid4" name="aid" type="hidden">
				<input class="easyui-datebox" name="begintime" style="width:100%" data-options="label:'教育开始时间',required:true">
			</div>
			<div style="margin-bottom:20px;width:300px;">
				<input class="easyui-datebox" name="endtime" style="width:100%" data-options="label:'教育结束时间',required:true">
			</div>
			<div style="margin-bottom:20px;width:300px;">
				<input class="easyui-combobox" name="degree" style="width:100%"
				 data-options="label:'学位',required:true,valueField:'value',textField:'text',data:Qedu,editable:false,panelHeight:100">
			</div>
			<div style="margin-bottom:20px;width:300px;">
				<input class="easyui-textbox" name="school" style="width:100%" data-options="label:'学校',required:true">
				<input name="checkstate" type="hidden">
			</div>
		</form>
	</div>
	</div>
		<script>	
		var btime="${eduexperience.begintime}";
		var begintime=window.parent.formatDate(btime);
		$("#begintime").append(begintime);
		var etime="${eduexperience.endtime}";
		var endtime=window.parent.formatDate(etime);
		$("#endtime").append(endtime);
	function eduexperiencechange(){
		//获取url参数
		var aid=window.parent.aid;
		window.parent.setaid();
		 $.get('/ae/eduexperience/getmsg/'+aid, function(result){
			 	var begin=window.parent.formatDatebox(result["begintime"]);
			 	var end=window.parent.formatDatebox(result["endtime"]);
			 	$('#eduexperiencemsg').form('load',{
			 		begintime:begin,
			 		endtime:end,
			 		degree:result["degree"],
			 		school:result["school"],
			 		checkstate:result["checkstate"]
			 	});
			  });
		document.getElementById("eduexperience-div1").style.visibility='hidden'; 	
		document.getElementById("eduexperience-change").style.visibility='hidden'; 
		document.getElementById("eduexperience-changed").style.visibility='visible'; 
		document.getElementById("eduexperience-div3").style.visibility='visible'; 	
	}
	function eduexperiencechanged(){
		//有效性验证
		if(!$('#eduexperiencemsg').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}else{
			document.getElementById("eduexperience-div1").style.visibility='visible'; 	
			document.getElementById("eduexperience-change").style.visibility='visible'; 
			document.getElementById("eduexperience-changed").style.visibility='hidden';  
			document.getElementById("eduexperience-div3").style.visibility='hidden'; 	
			//ajax的post方式提交表单
			//$("#itemAddForm").serialize()将表单序列号为key-value形式的字符串
			//alert(JSON.stringify($("#applicantmsg").serializeObject()));
			$.post("/ae/eduexperience/msg/save",$('#eduexperiencemsg').serialize());
			location.reload(true);
		}
		
	}
	
	  
	</script>

</body>
</html>