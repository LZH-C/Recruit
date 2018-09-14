<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>个人中心</title>
	<link rel="stylesheet" type="text/css" href="/css/set.css">
	<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.5.4/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.5.4/themes/icon.css">
	<script type="text/javascript" src="/js/code.js"></script>
	<script type="text/javascript" src="/js/ahead.js"></script>
	<link rel="stylesheet" type="text/css" href="/css/index.css">
	<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.easyui.min.js"></script>
</head>
<style>
	#applicant-div1,#applicantintention-div1,#eduexperience-div1,#workexperience-div1{
		position:absolute;
		text-align: left;
		font-size:15px;
		top:50px;
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
	<div>
		<div id="main" class="easyui-layout">
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
	    <div data-options="region:'west'" style="width:15%;font-size:15px;">
	    		<h2 style="position: absolute;left:30px;top:5px;">设置</h2>
	    
				<span style="position: absolute;left:25px;top:80px;"><a class="easyui-linkbutton" onclick="privacy()">隐私设置</a></span>
			
				<span style="position: absolute;left:25px;top:120px;"><a class="easyui-linkbutton" onclick="pwdchange()">密码修改</a></span>
				
		</div>
		<div id="centerpanel" data-options="region:'center'" class="easyui-panel">
			
		</div>
	</div>
<script>
		
		function privacy(){
			$("#centerpanel").panel({    
			    href:'private-set',    
			    onLoad:function(){    
			           
			    }    
			}); 
		}
		function pwdchange(){
			$("#centerpanel").panel({    
			    href:'pwd-change',    
			    onLoad:function(){    
			          drawPic("canvas"); 
			    }    
			}); 
		}
		
</script>
</body>
</html>