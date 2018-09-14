<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.5.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.5.4/themes/icon.css">
<script type="text/javascript" src="/js/enterprise.js"></script>
<script type="text/javascript" src="/js/quarterItem.js"></script>
<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.min.js"></script>
<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.easyui.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/office-manager.css">
<style>


</style>
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
	    <div style="width:auto;position: relative;" data-options="region:'center'" >
	    	<div id="nav" style="width:450px;top:0px;left:0px;font-size: 15px;">
               	<ul>
                    <li><a href="#" onclick="addQuarte()">发布职位</a></li>
                    <li><a href="#" onclick="amanager()">正在招聘</a></li>
                    <li><a href="#">待处理职位</a></li>
                    <li><a href="#">回收站</a></li>
                </ul>
			</div>
			<div id="centerpanel" class="easyui-panel" style="width:auto;position: absolute;top:30px;left:0px;border:0;">
            	<div style="margin-left:150px;margin-top:20px;">
					<form id="addquarter" method="post">
						<div style="margin-bottom:20px;width:300px;">
							<input name="eid" value="<%=session.getAttribute("euserid")%>"  type="hidden">
							<input class="easyui-textbox" name="name" style="width:100%" data-options="label:'职位名称',required:true">
						</div>
						<div style="margin-bottom:20px;width:300px;">
							<input class="easyui-combobox" name="type" style="width:100%" value="请选择"
							data-options="label:'职位类别',required:true,valueField:'value',textField:'text',data:Qtype,editable:false">
						</div>
						<div style="margin-bottom:20px;width:300px;">
							<input class="easyui-combobox" name="quality" style="width:100%" value="请选择"
							data-options="label:'工作性质',required:true,valueField:'value',textField:'text',data:Qquality,editable:false,panelHeight:80">
						</div>
						<div style="margin-bottom:20px;width:300px;">
							<input class="easyui-textbox" name="region" style="width:100%" data-options="label:'工作地点',required:true">
						</div>
						<div style="margin-bottom:20px;width:300px;">
							<input class="easyui-numberbox" name="lsalary" style="width:100%" data-options="label:'薪资下限',required:true">
						</div>
						<div style="margin-bottom:20px;width:300px;">
							<input class="easyui-numberbox" name="msalary" style="width:100%" data-options="label:'薪资上限',required:true">
						</div>
						<div style="margin-bottom:20px;width:300px;">
							<input class="easyui-datebox" name="endtime" style="width:100%" data-options="label:'截止日期',required:true">
						</div>
						<div style="margin-bottom:20px;width:300px;">
							<input class="easyui-numberbox" name="num" style="width:100%" data-options="label:'招聘人数',required:true">
						</div>
						<div style="margin-bottom:20px;width:300px;">
							<input class="easyui-combobox" name="experience" style="width:100%" value="请选择"
							data-options="label:'工作经验',required:true,valueField:'value',textField:'text',data:Qexperience,editable:false,panelHeight:80">
						</div>
						<div style="margin-bottom:20px;width:300px;">
							<input class="easyui-combobox" name="edu" style="width:100%" value="请选择"
							data-options="label:'学历要求',required:true,valueField:'value',textField:'text',data:Qedu,editable:false,panelHeight:80">
						</div>
						<div style="margin-bottom:20px;width:300px;">
							<input class="easyui-textbox" name="synopsis" style="width:100%;height:90px;" data-options="label:'职位描述',multiline:true,required:true">
						</div>
					</form>
						<div style="margin-bottom:20px;width:300px;">
							<a href="#" style="width:100px;margin-left:100px;" class="easyui-linkbutton" onclick="addQ()">发布职位 </a>
						</div>
				</div>
            </div>
        </div>		
	</div>
</body>
<script>
	var eid=<%=session.getAttribute("euserid")%>;
	function addQuarte(){
		window.location.href = "/euser/addquarter";
	}
	function addQ(){
		$.post("/ae/quarters/add",$('#addquarter').serialize());
		alert("发布成功！")
		window.location.href = "/euser/recruit-manager";
	}	
</script>
</html>