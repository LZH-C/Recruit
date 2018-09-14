<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>个人中心</title>
	<link rel="stylesheet" type="text/css" href="/css/personal.css">
	<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.5.4/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.5.4/themes/icon.css">
	<script type="text/javascript" src="/js/ahead.js"></script>
	<script type="text/javascript" src="/js/timeformat.js"></script>
	<script type="text/javascript" src="/js/resumeItem.js"></script>
	<script type="text/javascript" src="/js/tradeItem.js"></script>
	<script type="text/javascript" src="/js/quarterItem.js"></script>
	<link rel="stylesheet" type="text/css" href="/css/index.css">
	<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.easyui.min.js"></script>
</head>
<script type="text/javascript">

</script>
<style>
	#applicant-div1,#applicantintention-div1,#eduexperience-div1,#workexperience-div1{
		position:absolute;
		text-align: left;
		font-size:15px;
		top:35px;
		left:150px;
	}
	#applicant-div2,#applicantintention-div2,#eduexperience-div2,#workexperience-div2{
		position:absolute;
		top:50px;
		left:600px;
	}
	#applicant-div3,#applicantintention-div3,#eduexperience-div3,#workexperience-div3{
		padding-left: 200px;
	}
</style>
<body>
	<div id="main" class="easyui-layout" style="height:1351px;">
		<div data-options="region:'north'" style="height:175px;">
        	<div id="topLR">
	        	<div id="top-login-register" style="position: absolute;right:70px;top:0px;">
		            <p style='margin-top:0px;margin-left:-40px;font-size:15px'>
			            <a href="#" plain="true" class="easyui-linkbutton" onclick="personal()"><b>欢迎:</b><%=session.getAttribute("ausername")%></a>
			            <a href="#" plain="true" class="easyui-linkbutton" onclick="logout()">退出</a>
		            </p>
	            </div>               
                <div style="position: absolute;right:0px;top:0px;">
                	<a href="#" class="easyui-linkbutton" onclick="etlogin()">企业入口</a>
                </div>
            </div>
            <div style="position: absolute;left:30px;top:30px;">
            	<img alt="" src="/images/logo.png" width="120px" height="120px;" onclick="javascript:window.location.href='/auser/home'">
            </div>
            <div id="nav">
                <ul>
                    <li><a href="myapply">我的求职</a></li>
                    <li><a href="myoffice">我的简历</a></li>
                    <li><a href="myinterview">我的面试</a></li>
                    <li><a href="set">设置</a></li>  
                </ul>
			</div>
            <div id="searchbox">
            <form id="search1">
            	<input id="s2" name="name" type="hidden"></input>
    		</form>
    		<input id="search" class="easyui-searchbox" style="width:400px;height:35px" data-options="prompt:'请输入关键词/职位名/企业名',searcher:searchkey"></input>
    		</div>
		</div>
	    <div data-options="region:'center'">
	    	<div id="recruit-msg" style="position: relative;width:800px;">
			<div style="position:relative;height:30px;">
		    	<div id="time"></div>
		    	<div style="position:absolute;top:0px;right:20px;">
		    		<a class="easyui-linkbutton" onclick="deleteResume()">删除当前简历</a>
		    	</div>
	    	</div>
            <div id="applicantMsg" style="width:780px;" class="easyui-panel" data-options="collapsible:true,href:'/ae/applicant/msg/<%=session.getAttribute("auserid")%>'" title="基本信息" style="width:auto;">
            	
            </div>
            <div id="applicantintentionMsg" style="width:780px;" class="easyui-panel" data-options="collapsible:true,href:'/ae/applicantintention/msg/<%=session.getAttribute("auserid")%>'" title="求职意向" style="width:auto;">
            	
            </div>
            
            <div id="eduexperienceMsg" style="width:780px;" class="easyui-panel" data-options="collapsible:true,href:'/ae/eduexperience/msg/<%=session.getAttribute("auserid")%>'" title="教育经历" style="width:auto;">
            	
            </div>
            <div id="workexperienceMsg" style="width:780px;" class="easyui-panel" data-options="collapsible:true,href:'/ae/workexperience/msg/<%=session.getAttribute("auserid")%>'" title="工作经验/社会实践" style="width:auto;">
            	
            </div>	
			</div>
	    	
            
        </div>
	</div>
<script>
		setInterval("time.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
		var aid=<%=session.getAttribute("auserid")%>;
		function getApplicantMsg(){
			$("#applicantMsg").panel({    
			    href:'/ae/applicant/msg/'+aid,    
			    onLoad:function(){  
			    	
			    }    
			}); 
		}
		function getApplicantintentionMsg(){
			$("#applicantintentionMsg").panel({    
			    href:'/ae/applicantintention/msg/'+aid,    
			    onLoad:function(){
			    	 
			    }    
			}); 
		}
		function getEduexperienceMsg(){
			$("#eduexperienceMsg").panel({    
			    href:'/ae/eduexperience/msg/'+aid,    
			    onLoad:function(){  
			         
			    }    
			}); 
		}
		function getWorkexperienceMsg(){
			$("#workexperienceMsg").panel({    
			    href:'/ae/workexperience/msg/'+aid,    
			    onLoad:function(){  
			         
			    }    
			}); 
		}
		function setaid(){
			document.getElementById("aid1").value=<%=session.getAttribute("auserid")%>;
			document.getElementById("aid2").value=<%=session.getAttribute("auserid")%>;
			document.getElementById("aid3").value=<%=session.getAttribute("auserid")%>;
			document.getElementById("aid4").value=<%=session.getAttribute("auserid")%>;
		}
		function deleteResume(){
			$.get("/ae/resume/msg/delete/auser/"+<%=session.getAttribute("auserid")%>,function(data){
				if(data.status == 200){
					alert("简历信息已清空！");
					window.location.href = "/auser/myoffice";
				}
			})
		}
		
</script>
</body>
</html>