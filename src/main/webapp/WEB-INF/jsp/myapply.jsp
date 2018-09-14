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
	<link rel="stylesheet" type="text/css" href="/css/index.css">
	<script type="text/javascript" src="/js/ahead.js"></script>
	<script type="text/javascript" src="/js/timeformat.js"></script>
	<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.easyui.min.js"></script>
</head>

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
		    <div data-options="region:'west'" style="width:20%;font-size:15px;">
		    		<h2 style="position: absolute;left:30px;top:5px;">我的求职</h2>
		    
					<span style="position: absolute;left:25px;top:80px;"><a class="easyui-linkbutton" style="width:100px" onclick="hadinvated()">谁邀请我面试</a></span>
					
					<span style="position: absolute;left:25px;top:160px;"><a class="easyui-linkbutton" style="width:100px" onclick="hadcollect()">职位收藏夹</a></span>
					
			</div>
			<div id="centerpanel" class="easyui-panel" style="position:relative" data-options="region:'center'">
				
			</div>

	</div>
<script>
		function hadinvated(){
			$("#centerpanel").panel({    
			    href:'interview-invited',    
			    onLoad:function(){  
			    	var aid=<%=session.getAttribute("auserid")%>;
					$.get("../ae/interview/get/invated/user/"+aid+"/"+0+"/"+4,function(data){
						var list=data.data;
						for(var i in list){
							$("#interview").append("<div style='border: 1px solid #e3c56b;width:200px;height:200px;font-size: 15px;padding-left:10px;position: absolute;left:"+(70+270*(i%2))+"px;top:"+(30+250*parseInt(i/2))+"px;'><p hidden>"+list[i].eid+"</p>"+
							"<p style='margin-top:3px;'>企业名：<a plain='true' class='enterprisename' >"+list[i].enterprisename+"</a></p><p hidden>"+list[i].qid+"</p>"+
							"<p style='margin-top:-6px;'>面试的职位：<a plain='true' class='quartername' >"+list[i].quartername+"</a></p></p>"+
							"<p style='margin-top:-6px;'>联系人："+list[i].contact+"</p>"+
							"<p style='margin-top:-6px;'>电话："+list[i].phone+"</p>"+
							"<p style='margin-top:-6px;'>面试的地点："+list[i].addr+"</p></div>");	
						}
						$(".enterprisename").linkbutton();
						
						$(".quartername").linkbutton();
						$(".quartername").bind('click', function(){
							$('#centerpanel').panel({
							    href:"/ae/quarters/getqitem/et1/"+$(this).parent().prev().text(),
							    onLoad:function(){
									
							    }
							});
						})
					});
			        $("#pagination").pagination({
						total:20,
						layout:['list','sep','first','prev','links','next','last','sep','refresh'],
						pageSize: 4,
				        pageNumber: 1,
				        pageList: [4],
				        onSelectPage: function (pageNumber, pageSize) {  
				        	document.getElementById("interview").innerHTML =""
				        	$.get("../ae/interview/get/invated/user/"+aid+"/"+(pageNumber-1)*4+"/"+pageSize,function(data){
								var list=data.data;
								for(var i in list){
									$("#interview").append("<div style='border: 1px solid #e3c56b;width:200px;height:200px;font-size: 15px;padding-left:10px;position: absolute;left:"+(70+270*(i%2))+"px;top:"+(30+250*parseInt(i/2))+"px;'><p hidden>"+list[i].eid+"</p>"+
									"<p style='margin-top:3px;'>企业名：<a plain='true' class='enterprisename' >"+list[i].enterprisename+"</a></p><p hidden>"+list[i].qid+"</p>"+
									"<p style='margin-top:-6px;'>面试的职位：<a plain='true' class='quartername' >"+list[i].quartername+"</a></p></p>"+
									"<p style='margin-top:-6px;'>联系人："+list[i].contact+"</p>"+
									"<p style='margin-top:-6px;'>电话："+list[i].phone+"</p>"+
									"<p style='margin-top:-6px;'>面试的地点："+list[i].addr+"</p></div>");	
								}
								$(".enterprisename").linkbutton();
								
								$(".quartername").linkbutton();
								$(".quartername").bind('click', function(){
									$('#centerpanel').panel({
									    href:"/ae/quarters/getqitem/et1/"+$(this).parent().prev().text(),
									    onLoad:function(){
											
									    }
									});
								})
							});
				        }  
					})
			    }    
			}); 
		}
		
		function hadcollect(){
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