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
<link rel="stylesheet" type="text/css" href="/css/office-manager.css">
<style>


</style>
<body>
	<div id="main" class="easyui-layout" >
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
                    <li><a href="/euser/office-manager">未处理的简历</a></li>
                    <li><a href="/euser/office-haddeal">已处理的简历</a></li>
                    <li><a href="/euser/office-all">所有简历</a></li>
                    <li><a href="#">收藏夹</a></li>
                </ul>
			</div>
			<div id="centerpanel" class="easyui-panel" style="width:auto;position: absolute;top:30px;left:0px;border:0;">
				<div style="position: relative;height:600px;">
					<div>
						<div id="recruit-msg-accept" style="position: relative;width:399px;">
							
						</div>
						<div id="pagination-accept" style="position: absolute;left:0px;bottom: 50px;" class="easyui-pagination"/>
					</div>
					<div>
						<div id="recruit-msg-refuse" style="position: relative;width:399px;">
							
						</div>
						<div id="pagination-refuse" style="position: absolute;left:400px;bottom: 50px;" class="easyui-pagination"/>
					</div>
					<hr size="300" style="height: 550px;" width="1">
					
	            </div>
            </div>
        </div>		
	</div>
</body>
<script>
	var eid=<%=session.getAttribute("euserid")%>;
	$(function(){
		$.get("../ae/resume/getAccept/"+eid+"/0/5",function(data){
        		var list=data.data;
    			for(var i in list){
    				$("#recruit-msg-accept").append("<div style='border: 1px solid #e3c56b;width:190px;position: absolute;left:"+(0+200*(i%2))+"px;top:"+(15+85*parseInt(i/2))+"px;height:80px;font-size: 15px;'><div width='180px'  style='position: relative;'><p style='margin-left: 10px;margin-top:10px;'>简历者："+list[i].name+"</p><p hidden>"+list[i].qid+"</p><p style='margin-left: 10px;'>应聘职业:<a plain='true' class='quarter'>"+list[i].quartername+"</a><b style='color:#59df8c'>  接受</b></p><span style='position: relative;top:-78px;left:130px;'><b><p hidden>"+list[i].aid+"</p><a plain='true' class='checkoffice'>查看简历</a></b></span></div></div>");
    			}
    			$(".quarter").linkbutton();
    			$(".quarter").bind('click', function(){
    				window.location.href = "/ae/quarters/getqitem/et/"+$(this).parent().prev().text();
    			})
    			$(".checkoffice").linkbutton();
    			$(".checkoffice").bind('click', function(){
    				window.location.href = "/ae/resume/msg/deal/"+$(this).prev().text()+"/"+$(this).parent().parent().prev().prev().text();
    			})
    	});
		$.get("../ae/resume/getRefuse/"+eid+"/0/5",function(data){
        		var list=data.data;
    			for(var i in list){
    				$("#recruit-msg-refuse").append("<div style='border: 1px solid #e3c56b;width:190px;position: absolute;left:"+(400+200*(i%2))+"px;top:"+(15+85*parseInt(i/2))+"px;height:80px;font-size: 15px;'><div width='180px'  style='position: relative;'><p style='margin-left: 10px;margin-top:10px;'>简历者："+list[i].name+"</p><p hidden>"+list[i].qid+"</p><p style='margin-left: 10px;'>应聘职业:<a plain='true' class='quarter'>"+list[i].quartername+"</a><b style='color:#f5226c'>  拒绝</b></p><span style='position: relative;top:-78px;left:130px;'><b><p hidden>"+list[i].aid+"</p><a plain='true' class='checkoffice'>查看简历</a></b></span></div></div>");
    			}
    			$(".quarter").linkbutton();
    			$(".quarter").bind('click', function(){
    				window.location.href = "/ae/quarters/getqitem/et/"+$(this).parent().prev().text();
    			})
    			$(".checkoffice").linkbutton();
    			$(".checkoffice").bind('click', function(){
    				window.location.href = "/ae/resume/msg/deal/"+$(this).prev().text()+"/"+$(this).parent().parent().prev().prev().text();
    			})
    	});

		$("#pagination-accept").pagination({
			total:20,
			layout:['list','sep','first','prev','links','next','last','sep','refresh'],
			pageSize: 10,
	        pageNumber: 1,
	        pageList: [10],
	        onSelectPage: function (pageNumber, pageSize) {  
	        	$.get("../ae/resume/getAccept/"+eid+"/0/5",function(data){
	        		document.getElementById("recruit-msg-accept").innerHTML =""
	        		var list=data.data;
	    			for(var i in list){
	    				$("#recruit-msg-accept").append("<div style='border: 1px solid #e3c56b;width:190px;position: absolute;left:"+(0+200*(i%2))+"px;top:"+(15+85*parseInt(i/2))+"px;height:80px;font-size: 15px;'><div width='180px'  style='position: relative;'><p style='margin-left: 10px;margin-top:10px;'>简历者："+list[i].name+"</p><p hidden>"+list[i].qid+"</p><p style='margin-left: 10px;'>应聘职业:<a plain='true' class='quarter'>"+list[i].quartername+"</a><b style='color:#59df8c'>  接受</b></p><span style='position: relative;top:-78px;left:130px;'><b><p hidden>"+list[i].aid+"</p><a plain='true' class='checkoffice'>查看简历</a></b></span></div></div>");
	    			}
	    			$(".quarter").linkbutton();
	    			$(".quarter").bind('click', function(){
	    				window.location.href = "/ae/quarters/getqitem/et/"+$(this).prev().text();
	    			})
	    			$(".checkoffice").linkbutton();
	    			$(".checkoffice").bind('click', function(){
	    				window.location.href = "/ae/resume/msg/deal/"+$(this).prev().text()+"/"+$(this).parent().parent().prev().prev().text();
	    			})
	    		});
	        }  
		})
		$("#pagination-refuse").pagination({
			total:20,
			layout:['list','sep','first','prev','links','next','last','sep','refresh'],
			pageSize: 10,
	        pageNumber: 1,
	        pageList: [10],
	        onSelectPage: function (pageNumber, pageSize) {  
	        	$.get("../ae/resume/getRefuse/"+eid+"/0/5",function(data){
	        		document.getElementById("recruit-msg-refuse").innerHTML =""
	        		var list=data.data;
	    			for(var i in list){
	    				$("#recruit-msg-refuse").append("<div style='border: 1px solid #e3c56b;width:190px;position: absolute;left:"+(400+200*(i%2))+"px;top:"+(15+85*parseInt(i/2))+"px;height:80px;font-size: 15px;'><div width='180px'  style='position: relative;'><p style='margin-left: 10px;margin-top:10px;'>简历者："+list[i].name+"</p><p hidden>"+list[i].qid+"</p><p style='margin-left: 10px;'>应聘职业:<a plain='true' class='quarter'>"+list[i].quartername+"</a><b style='color:#f5226c'>  拒绝</b></p><span style='position: relative;top:-78px;left:130px;'><b><p hidden>"+list[i].aid+"</p><a plain='true' class='checkoffice'>查看简历</a></b></span></div></div>");
	    			}
	    			$(".quarter").linkbutton();
	    			$(".quarter").bind('click', function(){
	    				window.location.href = "/ae/quarters/getqitem/et/"+$(this).prev().text();
	    			})
	    			$(".checkoffice").linkbutton();
	    			$(".checkoffice").bind('click', function(){
	    				window.location.href = "/ae/resume/msg/deal/"+$(this).prev().text()+"/"+$(this).parent().parent().prev().prev().text();
	    			})
	    		});
	        }  
		})
		
	})  	
</script>
</html>