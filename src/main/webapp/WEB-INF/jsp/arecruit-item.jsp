<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.5.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.5.4/themes/icon.css">
<link rel="stylesheet" type="text/css" href="/css/index.css">
<script type="text/javascript" src="/js/ahead.js"></script>
<script type="text/javascript" src="/js/index.js"></script>
<script type="text/javascript" src="/js/timeformat.js"></script>
<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.min.js"></script>
<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.easyui.min.js"></script>
<style>

</style>
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
            <div id="nav">
                <ul>
                    <li><a href="/auser/home">主页</a></li>
                    <li><a href="/auser/myoffice">我的简历</a></li>
                    <li><a href="/auser/contact.asp">更多服务</a></li>
                    <li><a href="/auser/about.asp">帮助</a></li>
                </ul>
			</div>
            <div id="searchbox">
            <input class="easyui-searchbox" style="width:400px;height:35px" data-options="prompt:'请输入关键词/职位名/企业名'"></input>
    		</div>
		</div>
	    <div style="width:800px;height:auto;" data-options="region:'center'" >
	    	<div style="position: relative;height:500px;">
		    	<div style="position: absolute;top:20px;left:50px;color:#63B8FF">
		    	<h1>${quarters.name}</h1>
		    	</div>
				<div style="position: absolute;top:30px;right:240px;border:1px solid #EE7621;width:100px;height:40px;text-align:center">
				</div>
				<div style="position: absolute;top:20px;right:267px;color:#EE7621;">
					<h1><a style="cursor: pointer;">收藏</a></h1>
				</div>
				<div style="position: absolute;top:30px;right:90px;border:1px solid #EE7621;background-color:#EE7621;width:120px;height:40px;text-align:center">	
				</div>
				<div style="position: absolute;top:20px;right:105px;color:#FFFFFF;">
					<h1><a style="cursor: pointer" onclick="applyQuarter()">立即应聘</a></h1>
				</div>
				<div style="width:auto;position: absolute;top:50px;left:0px;">
					<table style="text-align: left;margin-left:10%;padding-top:50px;font-size:15px;" cellspacing="10">
						<tr><th width="70px;">职位类型:</th><th>${quarters.type}</th></tr>
						
						<tr><th>月薪范围:</th><th>${quarters.lsalary}-${quarters.msalary}元</th></tr>
						
						<tr><th>工作地区:</th><th>${quarters.region}</th></tr>
						
						<tr><th>职位描述:</th><th>${quarters.synopsis}</th></tr>
						
						<tr><th>工作性质:</th><th>${quarters.quality}</th></tr>
						
						<tr><th>学历要求:</th><th>${quarters.edu}</th></tr>
						
						<tr><th>工作经验:</th><th>${quarters.experience}</th></tr>
						
						<tr><th>招聘人数:</th><th>${quarters.num}</th></tr>
						
						<tr><th>截至日期:</th><th>${quarters.endtime}</th></tr>
							
					</table>		
	            </div>
            </div>
	        <div id="disuser" style="height: 100px;">
	        	<div id="dismain">
		        		
	            </div>
	            <div id="pagination" style="margin-top: 5px;" class="easyui-pagination"/>	
	        </div>
	        <div>
	        	<h3>发表评论</h3>
	        	<form id="dismsg">
	        		<input name="content" class="easyui-textbox" data-options="multiline:true"style="width: 780px;height: 200px;"/>
	        	</form>
	        	<button onclick="addDiscussMsg()">发表</button>
	        </div>		
         </div>		
	</div>
</body>
<script type="text/javascript">
	var aid=<%=session.getAttribute("auserid")%>;
	var qid="${quarters.qid}";
	function addQuarte(){
		window.location.href = "/euser/addquarter";
	}
	function applyQuarter(){
		var qid=${quarters.qid};
		$.get("/ae/resume/inresume/"+<%=session.getAttribute("auserid")%>+"/"+qid,function(data){
			if(data.status == 200){
				alert("成功投递简历！");
				window.location.href = "/auser/home";
			}else if(data.status == 300){
				alert("请先完善简历！");
				window.location.href = "/auser/myoffice";
			}else{
				alert("请勿重复投递简历！");
			}
		})
	}
	
	$(function(){
		$.get("http://localhost:8082/discuss/get/topic/"+qid,function(data){
		if(data.status == 200){
				var list=data.data;
				for(var i in list){
					$("#dismain").append("<div style='position: relative;height: 100px;border-top:2px solid #a79e9c;border-bottom:2px solid #a79e9c'><div style='position: absolute;width:100px;height:100px;border-right:2px solid #a79e9c'><img alt='' src='/images/userhead.png' width='50px' height='50px' style='margin-left: 25px;margin-top: 10px;'><p style='text-align: center;'>"+list[i].username+"</p></div><div class='"+list[i].id+"' style='position: absolute;width:640px;left:120px;top:0px;'><p>"+list[i].content+"</p></div><div style='position:absolute;left:120px;bottom:10px;display: none;'><form ><input name='content' class='e-textbox' data-options='multiline:true' style='width: 500px;height: 25px;'/><a plain='true' class='e-button"+i+"'>发表</a><p style='display:none'>"+list[i].id+"</p></form></div><p style='position: absolute;right:50px;top:10px;'>"+formattinyDate(list[i].time)+"</p><a plain='true' class='replay' style='position: absolute;right:50px;bottom:10px;'>我也说一句</a></div>")
					$(".e-button"+i).linkbutton();
					$(".e-button"+i).bind('click',function(){
						$.post("http://localhost:8082/discuss/insert/second/"+aid+"/"+$(this).next().text(),$(this).parent().serialize(),function(data){
							if(data.status == 200){
								alert("评论成功！");
							}
						})
						window.location.href = "/ae/quarters/getqitem/user/"+qid;
					})
					$(".e-textbox").textbox();
					$(".replay").linkbutton();
					$(".replay").bind('click', function(event){
						$(this).prev().prev().show();
					})
					addDismsg(list[i].id);
				}	
			}
		})
	})
	//回复添加评论
	function addDismsg(id){
		$.get("http://localhost:8082/discuss/get/second/"+id,function(data){
			if(data.status == 200){
				var list=data.data;
				for(var k in list){
					$("."+id).append("<p style='display:inline'>"+list[k].username+":</p><p style='display:inline'>"+list[k].content+"</p><p style='text-align: right;'>"+formattinyDate(list[k].time)+"</p>");
					$("."+id).prev().height($("."+id).prev().height()+50);
					$("."+id).parent().parent().parent().height($("."+id).parent().parent().parent().height()+50);
					$("."+id).parent().height($("."+id).parent().height()+50);
				}	
			}
		})
	}

	
	function addDiscussMsg(){
		$.post("http://localhost:8082/discuss/insert/topic/"+aid+"/"+qid,$("#dismsg").serialize(),function(data){
			if(data.status == 200){
				alert("评论成功！");
				window.location.href = "/ae/quarters/getqitem/user/"+qid;
			}
		})
	}
	 
</script>
</html>