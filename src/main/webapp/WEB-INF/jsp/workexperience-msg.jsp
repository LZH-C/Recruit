<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.5.4/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.5.4/themes/icon.css">
	<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.easyui.min.js"></script>
</head>

<body>	
	<div style="position:relative;">
	<div id="workexperience-div1">
		<table cellpadding="5">
			<tr><th width="100px;">工作开始时间:</th><th id="wbegintime"></th></tr>
			
			<tr><th>工作结束时间:</th><th id="wendtime"></th></tr>
			
			<tr><th>组织/单位:</th><th>${workexperience.organization}</th></tr>
			
			<tr><th>行业:</th><th>${workexperience.trade}</th></tr>
			
			<tr><th>部门:</th><th>${workexperience.department}</th></tr>
			
			<tr><th>职位:</th><th>${workexperience.job}</th></tr>
			
			<tr><th>工作描述:</th><th>${workexperience.synopsis}</th></tr>
		</table>
	</div>
	<div id="workexperience-div2">
		<a id="workexperience-change" href="#" class="easyui-linkbutton" onclick="workexperiencechange()">修改</a>
		<a id="workexperience-changed" href="#" style="visibility:hidden;" class="easyui-linkbutton" onclick="workexperiencechanged()">修改完成</a>
	</div>
	<div id="workexperience-div3" style="visibility:hidden">
		<form id="workexperiencemsg" method="post">
			<div style="margin-bottom:20px;width:300px;">
				<input id="aid3" name="aid" type="hidden" >
				<input class="easyui-datebox" name="begintime" style="width:100%" data-options="label:'工作开始时间',required:true">
			</div>
			<div style="margin-bottom:20px;width:300px;">
				<input class="easyui-datebox" name="endtime" style="width:100%" data-options="label:'工作结束时间',required:true">
			</div>
			<div style="margin-bottom:20px;width:300px;">
				<input class="easyui-textbox" name="organization" style="width:100%" data-options="label:'组织/单位',required:true">
			</div>
			<div style="margin-bottom:20px;width:300px;">
				<input class="easyui-combobox" name="trade" style="width:100%" 
				data-options="label:'行业',required:true,valueField:'value',textField:'text',data:tradeItem,editable:false">
			</div>
			<div style="margin-bottom:20px;width:300px;">
				<input class="easyui-textbox" name="department" style="width:100%" data-options="label:'部门',required:true">
			</div>
			<div style="margin-bottom:20px;width:300px;">
				<input class="easyui-combobox" name="job" style="width:100%" 
				data-options="label:'职位',required:true,valueField:'value',textField:'text',data:quarters">
			</div>
			<div style="margin-bottom:20px;width:300px;">
				<input class="easyui-textbox" name="synopsis" style="width:100%;height:100px;" data-options="label:'工作描述',required:true,multiline:true,">
				<input name="checkstate" type="hidden">
			</div>
		</form>
	</div>
	</div>
		<script>
		var wbtime="${workexperience.begintime}";
		var wbegintime=window.parent.formatDate(wbtime);
		$("#wbegintime").append(wbegintime);
		var wetime="${workexperience.endtime}";
		var wendtime=window.parent.formatDate(wetime);
		$("#wendtime").append(wendtime);
	function workexperiencechange(){
		//获取url参数
		var aid=window.parent.aid;
		window.parent.setaid();
		 $.get('/ae/workexperience/getmsg/'+aid, function(result){
			 	var begin=window.parent.formatDatebox(result["begintime"]);
			 	var end=window.parent.formatDatebox(result["endtime"]);
			 	$('#workexperiencemsg').form('load',{
			 		begintime:begin,
			 		endtime:end,
			 		organization:result["organization"],
			 		trade:result["trade"],
			 		department:result["department"],
			 		job:result["job"],
			 		synopsis:result["synopsis"],
			 		checkstate:result["checkstate"]
			 	});
			  });
		document.getElementById("workexperience-div1").style.visibility='hidden'; 	
		document.getElementById("workexperience-change").style.visibility='hidden'; 
		document.getElementById("workexperience-changed").style.visibility='visible'; 
		document.getElementById("workexperience-div3").style.visibility='visible'; 	
	}
	function workexperiencechanged(){
		//有效性验证
		if(!$('#workexperiencemsg').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}else{
			document.getElementById("workexperience-div1").style.visibility='visible'; 	
			document.getElementById("workexperience-change").style.visibility='visible'; 
			document.getElementById("workexperience-changed").style.visibility='hidden';  
			document.getElementById("workexperience-div3").style.visibility='hidden'; 	
			//ajax的post方式提交表单
			//$("#itemAddForm").serialize()将表单序列号为key-value形式的字符串
			//alert(JSON.stringify($("#applicantmsg").serializeObject()));
			$.post("/ae/workexperience/msg/save",$('#workexperiencemsg').serialize());
			location.reload(true);
		}
	}
	  
	</script>
		
</body>
</html>