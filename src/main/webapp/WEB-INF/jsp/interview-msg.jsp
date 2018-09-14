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
<script type="text/javascript" src="/js/timeformat.js"></script>
<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.min.js"></script>
<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.easyui.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/office-manager.css">
<style>


</style>
<body>
	<div id="main" class="easyui-layout" style="height: 1050px;">
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
                    <li><a href="/euser/interview-manager">未处理的面试</a></li>
                    <li><a href="/euser/interview-haddeal">已处理的面试</a></li>
                    <li><a href="/euser/interview-all">所有面试</a></li>
                </ul>
			</div>
			<div id="centerpanel" class="easyui-panel" style="width:auto;position: absolute;top:30px;left:0px;border:0;">
				<div style="position: relative;height:850px;margin-left: 60px;">
					<table cellpadding="5">
						<tr><th style="color: red;font-size: 20px;width:80px;">基本信息</th></tr>
						
						<tr><th>姓名:</th><th>${applicant.name}</th></tr>
						
						<tr><th>性别:</th><th>${applicant.gender}</th></tr>
						
						<tr><th>生日日期:</th><th id="birth"></th></tr>
						
						<tr><th>工作年限:</th><th id="wtime"></th></tr>
						
						<tr><th>地址:</th><th>${applicant.addr}</th></tr>
						
						<tr><th>邮箱:</th><th>${applicant.email}</th></tr>
						
						<tr><th>手机号:</th><th>${applicant.phone}</th></tr>
						
						<tr><th>目前状态:</th><th>${applicant.status}</th></tr>	
						
						<tr><th style="color: red;font-size: 20px;">求职意向</th></tr>	
						
						<tr><th>工作类型:</th><th>${applicantintention.worktype}</th></tr>
			
						<tr><th>工作区域:</th><th>${applicantintention.region}</th></tr>
						
						<tr><th>工作职位:</th><th>${applicantintention.job}</th></tr>
						
						<tr><th>工作待遇:</th><th>${applicantintention.deal}</th></tr>
						
						<tr><th style="color: red;font-size: 20px;">教育经历</th></tr>
						
						<tr><th>教育开始时间:</th><th id="begintime"></th></tr>
			
						<tr><th>教育结束时间:</th><th id="endtime"></th></tr>
						
						<tr><th>学位:</th><th>${eduexperience.degree}</th></tr>
						
						<tr><th>学校:</th><th>${eduexperience.school}</th></tr>
						
						<tr><th style="color: red;font-size: 20px;">工作经验</th></tr>
						
						<tr><th>工作开始时间:</th><th id="wbegintime"></th></tr>
			
						<tr><th>工作结束时间:</th><th id="wendtime"></th></tr>
						
						<tr><th>组织/单位:</th><th>${workexperience.organization}</th></tr>
						
						<tr><th>行业:</th><th>${workexperience.trade}</th></tr>
						
						<tr><th>部门:</th><th>${workexperience.department}</th></tr>
						
						<tr><th>职位:</th><th>${workexperience.job}</th></tr>
						
						<tr><th>工作描述:</th><th>${workexperience.synopsis}</th></tr>
					</table>
					<div style="font-size: 15px;">
						<h3>面试结果</h3>
						<form id="conment">
			        		<input name="comment" class="easyui-textbox" data-options="multiline:true,prompt:'面试评语'"style="width: 500px;height: 200px;"/>
			        	</form>
	            		<button style="margin-left:10%;margin-right:20px;background-color: #76EE00;" onclick="accept()">面试成功</button>
	   					<button style="margin-left:20px;background-color: #FF3030;" onclick="refuse()">面试失败</button>
            		</div>
            	</div>
            	
            </div>
        </div>		
	</div>
</body>
<script>
	var birth="${applicant.birth}";
	var birthtime=window.parent.formatDate(birth);
	$("#birth").append(birthtime);
	var wtime="${applicant.wtime}";
	var wtime1=window.parent.formatDate(wtime);
	$("#wtime").append(wtime1);
	var begin="${eduexperience.begintime}";
	var begintime=window.parent.formatDate(begin);
	$("#begintime").append(begintime);
	var end="${eduexperience.endtime}";
	var endtime=window.parent.formatDate(end);
	$("#endtime").append(endtime);
	var wbegin="${workexperience.begintime}";
	var wbegintime=window.parent.formatDate(wbegin);
	$("#wbegintime").append(wbegintime);
	var wend="${workexperience.endtime}";
	var wendtime=window.parent.formatDate(wend);
	$("#wendtime").append(wendtime);
	function accept(){
		var aid=${applicant.aid};
		var qid=${qid};
		$.post("/ae/interview/success/"+aid+"/"+qid,$("#conment").serialize(),function(data){
			if(data.status == 200){
				alert("面试成功");
				window.location.href = "/euser/interview-manager";
			}
		});
	}
	function refuse(){
		var aid=${applicant.aid};
		var qid=${qid}
		$.get("/ae/interview/fail/"+aid+"/"+qid,$("#conment").serialize(),function(data){
			if(data.status == 200){
				alert("面试失败");
				window.location.href = "/euser/interview-manager";
			}
		});
	}
	
</script>
</html>