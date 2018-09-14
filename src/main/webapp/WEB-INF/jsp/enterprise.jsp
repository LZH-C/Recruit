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
<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.min.js"></script>
<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.easyui.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/enterprise.css">
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
			            <a href="#" plain="true" class="easyui-linkbutton" onclick="pwdchange()">密码修改</a>
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
	    	<div style="position: absolute;top: 40px;left:105px;width:260px;height:200px; border:1px solid #e3c56b;font-size: 20px;">
	            <div style="width:auto;position: relative;">
	                <div style="position: absolute;top: 0px;left:0px;height:50px;width:260px;background-color: #b6aba8">	                
	               		<div style="position: absolute;top: 25px;left:130px;width:100px;height:30px;margin-top:-15px;margin-left:-50px; ">
	               		 	收到的简历
 						</div>
	                </div>
	                <div style="position: absolute;top: 50px;left:0px;width:115px;text-align: center;">
	                    <p>未查看简历</p>
	                    <a id="notResumeCount" href="/euser/office-manager" >0</a>
	                </div>
	                <div style="position: absolute;top: 50px;left:140px;width:115px;text-align: center;">
	                    <p>共收到简历</p>
	                    <a id="allResumeCount" href="/euser/office-all" >0</a>
	                </div>
	                <div style="position: absolute;top: 160px;left:0px;width:260px;text-align: center;">
	                	<a href="/euser/office-manager">查看简历</a>
	                </div>
	            </div>
	        </div>
	        <div style="position: absolute;top: 40px;left:425px;width:260px;height:200px; border:1px solid #e3c56b;font-size: 20px;">
	            <div style="width:auto;position: relative;">
	                <div style="position: absolute;top: 0px;left:0px;height:50px;width:260px;background-color: #b6aba8;">	                
	               		<div style="position: absolute;top: 25px;left:130px;width:100px;height:30px;margin-top:-15px;margin-left:-50px; ">
	               		 	招聘的职位
 						</div>
	                </div>
	                <div style="position: absolute;top: 50px;left:0px;width:115px;text-align: center;">
	                    <p>正在招聘</p>
	                    <a id="QuarterCount" href="/euser/recruit-manager" >0</a>
	                </div>
	                <div style="position: absolute;top: 50px;left:140px;width:115px;text-align: center;">
	                    <p>待处理</p>
	                    <a href="#" >0</a>
	                </div>
	                <div style="position: absolute;top: 160px;left:0px;width:260px;text-align: center;">
	                	<a href="/euser/recruit-manager">查看职位</a>
	                </div>
	            </div>
	        </div>

        </div>		
	</div>
</body>
<script type="text/javascript">
	var eid=<%=session.getAttribute("euserid")%>;
	$(function(){
		$.get("/ae/resume/getCount/resume/"+eid,function(data){
			$("#notResumeCount").text(data.data);
		})
	})
	$(function(){
		$.get("/ae/resume/getAllCount/resume/"+eid,function(data){
			$("#allResumeCount").text(data.data);
		})
	})
	$(function(){
		$.get("/ae/quarters/getCount/quarter/"+eid,function(data){
			$("#QuarterCount").text(data.data);
		})
	})
</script>
</html>