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
<script type="text/javascript" src="/js/timeformat.js"></script>
<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.min.js"></script>
<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.easyui.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/office-manager.css">
<script type="text/javascript">

</script>
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
			<div id="centerpanel" class="easyui-panel" style="width:auto;position: absolute;top:30px;left:0px;border:0;height: 650px">
				<div style="position:relative;">
					<table id="qtable" style="text-align: left;margin-left:10%;padding-top:30px;font-size:15px;" cellpadding="10">
						<tr><th width="65px;">职位名称:</th><th>${quarters.name}</th></tr>
						
						<tr><th>职位类型:</th><th>${quarters.type}</th></tr>
						
						<tr><th>工作性质:</th><th>${quarters.quality}</th></tr>
						
						<tr><th>工作地区:</th><th>${quarters.region}</th></tr>
						
						<tr><th>薪资下限:</th><th>${quarters.lsalary}</th></tr>
						
						<tr><th>薪资上限:</th><th>${quarters.msalary}</th></tr>
						
						<tr><th>截至日期:</th><th id="endtime"></th></tr>
						
						<tr><th>招聘人数:</th><th>${quarters.num}</th></tr>
						
						<tr><th>工作经验:</th><th>${quarters.experience}</th></tr>
						
						<tr><th>学历要求:</th><th>${quarters.edu}</th></tr>
						
						<tr><th>职位描述:</th><th>${quarters.synopsis}</th></tr>
					</table>
					<a id="qa1" style="position: absolute;left:500px;top:35px;" class="easyui-linkbutton" onclick="replace()">修改</a>
					<a id="qa2" style="position: absolute;left:550px;top:35px;" class="easyui-linkbutton" onclick="qdelete()">删除</a>
					<div id="qreplace" style="margin-left:150px;margin-top:20px;position: absolute;left:0px;top:0px;visibility:hidden">
						<form id="replacequarter" method="post">
							<div style="margin-bottom:20px;width:300px;">
								<input name="qid" type="hidden">
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
								<a href="#" style="width:100px;margin-left:100px;" class="easyui-linkbutton" onclick="qreplace()">修改 </a>
							</div>
					</div>
				</div>	
            </div>
        </div>		
	</div>
</body>
<script>
	var eid=<%=session.getAttribute("euserid")%>;
	var qid=${qid};
	var time="${quarters.endtime}";
	var endtime=window.parent.formatDate(time);
	$("#endtime").append(endtime);
	function addQuarte(){
		window.location.href = "/euser/addquarter";
	}
	function replace(){
		$.get("/ae/quarters/getmsg/"+qid,function(data){
			var etime=window.parent.formatDatebox(data["endtime"]);
			$('#replacequarter').form('load',{
				qid:data["qid"],
		 		name:data["name"],
		 		type:data["type"],
		 		quality:data["quality"],
		 		region:data["region"],
		 		lsalary:data["lsalary"],
		 		msalary:data["msalary"],
		 		endtime:etime,
		 		num:data["num"],
		 		experience:data["experience"],
		 		edu:data["edu"],
		 		synopsis:data["synopsis"]
		 	});
		})
		document.getElementById("qtable").style.visibility='hidden'; 	
		document.getElementById("qa1").style.visibility='hidden'; 
		document.getElementById("qa2").style.visibility='hidden'; 
		document.getElementById("qreplace").style.visibility='visible'; 
	}
	function qdelete(){
		$.get("/ae/quarters/delete/"+qid,function(data){
			if(data.status == 200){
				alert("删除成功！");
				window.location.href = "/euser/recruit-manager";
			}
		})
	}
	function qreplace(){
		$.post("/ae/quarters/replace",$('#replacequarter').serialize(),function(data){
			if(data.status == 200){
				alert("修改成功！");
				window.location.href = "/euser/recruit-manager";
			}
		});
	}
	
	
	 
	
</script>
</html>