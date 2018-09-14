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
	    <div id="centerpanel" style="position: relative;" data-options="region:'center'" >
	    	<div id="enterprise-div1" style="position: absolute;left:200px;top:50px;font-size: 15px;">
				<table width="550px;" cellpadding="10">
					<tr><th width="15%">企业名称:</th><th width="70%">${enterprise.name}</th></tr>
					
					<tr><th>企业性质:</th><th>${enterprise.quality}</th></tr>
					
					<tr><th>所属行业:</th><th>${enterprise.trade}</th></tr>
					
					<tr><th>所在地区:</th><th>${enterprise.region}</th></tr>
					
					<tr><th>员工人数:</th><th>${enterprise.employnum}</th></tr>
					
					<tr><th>企业简介:</th><th>${enterprise.synopsis}</th></tr>
					
					<tr><th>联系人:</th><th>${enterprise.contact}</th></tr>
					
					<tr><th>联系电话:</th><th>${enterprise.phone}</th></tr>
					
					<tr><th>电子邮箱:</th><th>${enterprise.email}</th></tr>
					
					<tr><th>联系地址:</th><th>${enterprise.addr}</th></tr>
				</table>
			</div>
			<div id="enterprise-div2" style="position: absolute;left:600px;top:60px;font-size:15px;">
				<a id="enterprise-change" href="#" class="easyui-linkbutton" onclick="enterprisechange()">修改</a>
				<a id="enterprise-changed" href="#" style="visibility:hidden;" class="easyui-linkbutton" onclick="enterprisechanged()">修改完成</a>
			</div>
			<div id="enterprise-div3" style="visibility:hidden;position: absolute;left:200px;top:30px;">
				<form id="enterprisemsg" method="post">
					<div style="margin-bottom:20px;width:300px;">
						<input name="eid" type="hidden">
						<input class="easyui-textbox" name="name" style="width:100%" data-options="label:'企业名称',required:true">
					</div>
					<div style="margin-bottom:20px;width:300px;">
						<input class="easyui-combobox" name="quality" style="width:100%"  value="请选择"
						data-options="label:'企业性质',required:true,valueField:'value',textField:'text',data:qualityItem,editable:false">
					</div>
					<div style="margin-bottom:20px;width:300px;">
						<input class="easyui-combobox" name="trade" style="width:100%"  value="请选择"
						data-options="label:'所属行业',required:true,valueField:'value',textField:'text',data:tradeItem,editable:false">
					</div>
					<div style="margin-bottom:20px;width:300px;">
						<input class="easyui-textbox" name="region" style="width:100%" data-options="label:'所在地区',required:true">
					</div>
					<div style="margin-bottom:20px;width:300px;">
						<input class="easyui-combobox" name="employnum" style="width:100%" value="请选择"
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
						<input name="checkstate" type="hidden">
					</div>
				</form>
			</div>
        </div>		
	</div>	
		
	<script>
		var eid=<%=session.getAttribute("euserid")%>;
		function enterprisechange(){
			//获取url参数
			 $.get('/ae/enterprise/getmsg/'+eid, function(result){
				 	$('#enterprisemsg').form('load',result);
				  });
			document.getElementById("enterprise-div1").style.visibility='hidden'; 	
			document.getElementById("enterprise-change").style.visibility='hidden'; 
			document.getElementById("enterprise-changed").style.visibility='visible'; 
			document.getElementById("enterprise-div3").style.visibility='visible'; 	
		}
		function enterprisechanged(){
			//有效性验证
			if(!$('#enterprisemsg').form('validate')){
				$.messager.alert('提示','表单还未填写完成!');
			}else{
				document.getElementById("enterprise-div1").style.visibility='visible'; 	
				document.getElementById("enterprise-change").style.visibility='visible'; 
				document.getElementById("enterprise-changed").style.visibility='hidden';  
				document.getElementById("enterprise-div3").style.visibility='hidden'; 	
				$.post("/ae/enterprise/msg/save",$('#enterprisemsg').serialize());
				location.reload();
			}
		} 
	  
	</script>

</body>
</html>