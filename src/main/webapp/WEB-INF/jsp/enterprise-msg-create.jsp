<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>msg</title>
	<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.5.4/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.5.4/themes/icon.css">
	<script type="text/javascript" src="/js/enterprise.js"></script>
	<script type="text/javascript" src="/js/qualityItem.js"></script>
	<script type="text/javascript" src="/js/tradeItem.js"></script>
	<script type="text/javascript" src="/js/employnumItem.js"></script>
	<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.easyui.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/css/enterprise.css">
</head>
<body>
	<div id="main" class="easyui-layout">
		<div data-options="region:'north'" style="height:135px;">
            <div id="topLR">
	        	<div id="top-login-register" style="position: absolute;left:0px;top:0px;">
		            <p style='margin-top:0px;margin-left:-40px;font-size:15px'>
			            <a href="#" plain="true" class="easyui-linkbutton" ><b>欢迎:</b><%=session.getAttribute("eusername")%></a>
			            <a href="#" plain="true" class="easyui-linkbutton" onclick="logout()">退出</a>
		            </p>
	            </div>               
            </div>
            <div id="nav">
               	<ul>
                    <li><a href="#" onclick="ehome()">首页</a></li>
                    <li><a href="#" onclick="emsg()">企业信息</a></li>
                    <li><a href="#" onclick="amanager()">招聘管理</a></li>
                    <li><a href="#" onclick="omanager()">简历管理</a></li>
                    <li><a href="#" onclick="interviewmanager()">面试管理</a></li>
                </ul>
			</div>
		</div>
	    <div id="centerpanel" style="position: relative;height:665px;" data-options="region:'center'" >
			<div style="position: absolute;left:400px;top:10px;margin-left:-150px;">
				<form id="enterprisemsg" method="post">
					<div style="margin-bottom:20px;width:300px;">
						<input name="eid" value="<%=session.getAttribute("euserid")%>" type="hidden">
						<input class="easyui-textbox" name="name" style="width:100%" data-options="label:'企业名称',required:true">
					</div>
					<div style="margin-bottom:20px;width:300px;">
						<input id="quality" class="easyui-combobox" name="quality" style="width:100%"  value="请选择"
						data-options="label:'企业性质',required:true,valueField:'value',textField:'text',data:qualityItem,editable:false">
					</div>
					<div style="margin-bottom:20px;width:300px;">
						<input id="trade" class="easyui-combobox" name="trade" style="width:100%"  value="请选择"
						data-options="label:'所属行业',required:true,valueField:'value',textField:'text',data:tradeItem,editable:false">
					</div>
					<div style="margin-bottom:20px;width:300px;">
						<input class="easyui-textbox" name="region" style="width:100%" data-options="label:'所在地区',required:true">
					</div>
					<div style="margin-bottom:20px;width:300px;">
						<input id="employnum" class="easyui-combobox" name="employnum" style="width:100%" value="请选择"
						data-options="label:'员工人数',required:true,valueField:'value',textField:'text',data:employnumItem,editable:false,panelHeight:100">
					</div>
					<div style="margin-bottom:20px;width:300px;">
						<input class="easyui-textbox" name="synopsis" style="width:100%;height:100px;" data-options="label:'企业简介',multiline:true,required:true">
					</div>
					<div style="margin-bottom:20px;width:300px;">
						<input class="easyui-textbox" name="contact" style="width:100%" data-options="label:'联系人',required:true">
					</div>
					<div style="margin-bottom:20px;width:300px;">
						<input class="easyui-numberbox" name="phone" style="width:100%" data-options="label:'联系电话',required:true">
					</div>
					<div style="margin-bottom:20px;width:300px;">
						<input class="easyui-textbox" name="email" style="width:100%" data-options="label:'电子邮箱',validType:'email',required:true">
					</div>
					<div style="margin-bottom:20px;width:300px;">
						<input class="easyui-textbox" name="addr" style="width:100%" data-options="label:'联系地址',required:true">
					</div>
				</form>
				<div style="position: absolute;left:150px;top:510px;width:100px;margin-left:-50px;font-size:15px;">
					<a style="width: 100px;" href="#" class="easyui-linkbutton" onclick="enterpriseSave()">保存</a>
				</div>
			</div>
			
        </div>		
	</div>	
		
	<script>
		var eid=<%=session.getAttribute("euserid")%>;
		function enterpriseSave(){
			//有效性验证
			if($("#quality").textbox('getValue')=="请选择"||$("#trade").textbox('getValue')=="请选择"
					||$("#employnum").textbox('getValue')=="请选择"){
				$.messager.alert('提示','表单还未填写完成!');
			}else if(!$('#enterprisemsg').form('validate')){
				$.messager.alert('提示','表单还未填写完成!');
			}else{	
				$.post("/ae/enterprise/msg/insert",$('#enterprisemsg').serialize());
				emsg();
			}
		} 
	  
	</script>

</body>
</html>