<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>主页</title>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.5.4/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.5.4/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="/css/index.css">
	<script type="text/javascript" src="/js/ahead.js"></script>
	<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.easyui.min.js"></script>
</head>
<body>
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
                    <li><a href="home">主页</a></li>
                    <li><a href="myoffice">我的简历</a></li>
                    <li><a href="contact.asp">更多服务</a></li>
                    <li><a href="about.asp">帮助</a></li>
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
						
			</div>
        	<div id="pagination" style="position: absolute;left:70px;bottom: 30px;" class="easyui-pagination"/>	
        </div>
		
	</div>
	<script type="text/javascript">
		$(function(){
			$.get("../ae/quarters/msg/quarteritem/list/"+0+"/"+15,function(data){
	    		document.getElementById("recruit-msg").innerHTML =""
				for(var i in data){
					$("#recruit-msg").append("<div style='border: 1px solid #e3c56b;width:200px;position: absolute;left:"+(38+250*(i%3))+"px;top:"+(15+85*parseInt(i/3))+"px;height:50px;padding:10px;'><div width='180px'  style='position: relative;'><p hidden>"+data[i].qid+"</p><a plain='true' class='cruititem' onclick='cruititem("+data[i].qid+")'>"+data[i].name+"</a><span style='color:#a99c9a;position: absolute;right:0px;top:0px;'>"+data[i].lsalary+"-"+data[i].msalary+"元/月</span><div style='color:#a99c9a'>"+data[i].edu+" | "+data[i].experience+"经验 | "+data[i].region+"</div></div></div>");	
					$(".cruititem").linkbutton();
				}
	    		
	    	});
			$("#pagination").pagination({
				total:30,
				layout:['list','sep','first','prev','links','next','last','sep','refresh'],
				pageSize: 15,
		        pageNumber: 1,
		        pageList: [15],
		        onSelectPage: function (pageNumber, pageSize) {  
		        	$.get("../ae/quarters/msg/quarteritem/list/"+(pageNumber-1)*10+"/"+pageSize,function(data){
		        		document.getElementById("recruit-msg").innerHTML =""
						for(var i in data){
							$("#recruit-msg").append("<div style='border: 1px solid #e3c56b;width:200px;position: absolute;left:"+(38+250*(i%3))+"px;top:"+(15+85*parseInt(i/3))+"px;height:50px;padding:10px;'><div width='180px'  style='position: relative;'><p hidden>"+data[i].qid+"</p><a plain='true' class='cruititem'>"+data[i].name+"</a><span style='color:#a99c9a;position: absolute;right:0px;top:0px;'>"+data[i].lsalary+"-"+data[i].msalary+"元/月</span><div style='color:#a99c9a'>"+data[i].edu+" | "+data[i].experience+"经验 | "+data[i].region+"</div></div></div>");	
						}
		        		$(".cruititem").linkbutton();
						$(".cruititem").bind('click', function(){
							window.location.href = "/ae/quarters/getqitem/user/"+$(this).prev().text();
						})
		        	});
		        }  
			})
			
		})  
		
	</script>
</body>
</html>