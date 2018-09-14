<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" type="text/css" href="/css/personal.css">
	<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.5.4/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.5.4/themes/icon.css">
	<script type="text/javascript" src="/js/ahead.js"></script>
	<script type="text/javascript" src="/js/timeformat.js"></script>
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
            <input class="easyui-searchbox" style="width:400px;height:35px"
    data-options="prompt:'请输入关键词/职位名/企业名'"></input>
    		</div>
		</div>
	    <div data-options="region:'center'" >
            <div id="nav" style="width:450px;top:0px;left:0px;font-size: 15px;">
               	<ul>
                    <li><a href="/auser/myinterview">待面试</a></li>
                    <li><a href="/auser/myinterview-haddeal">已面试</a></li>
                    <li><a href="/auser/myinterview-all">所有面试</a></li>
                </ul>
			</div>
			<div id="centerpanel" class="easyui-panel" style="width:auto;position: absolute;top:30px;left:5px;border:0;">
				<div style="position: relative;height:550px;">
					<div id="recruit-msg" style="position: relative;width:798px;">
						
					</div>
	            	<div id="pagination" style="position: absolute;left:70px;bottom: 0px;" class="easyui-pagination"/>	
            	</div>
            </div>
        </div>
	</div>
<script>
	var aid=<%=session.getAttribute("auserid")%>;
	$(function(){
		$.get("../ae/interview/get/all/user/"+aid+"/0/15",function(data){
			document.getElementById("recruit-msg").innerHTML =""
			var list=data.data;
			for(var i in list){	
				if(list[i].result=="待面试"){
					$("#recruit-msg").append(
							"<div style='border: 1px solid #e3c56b;width:190px;position: absolute;left:"+(38+250*(i%3))+"px;top:"+(15+240*parseInt(i/3))+"px;height:230px;font-size: 15px;'>"+
							"<div width='180px'  style='position: relative;'>"+
							"<p hidden>"+list[i].qid+"</p>"+
							"<p style='margin-left: 10px;margin-top:10px;'>企业:"+list[i].enterprisename+"</p>"+
    						"<p style='margin-left: 10px;margin-top:-6px;'>面试职位:<b><a plain='true' style='margin-top:-3px;' class='quarter'>"+list[i].quartername+"</a></b></p>"+
    						"<p style='margin-left: 10px;margin-top:-6px;'>面试联系人:"+list[i].contact+"</p>"+
    						"<p style='margin-left: 10px;margin-top:-6px;'>联系电话:"+list[i].phone+"</p>"+
    						"<p style='margin-left: 10px;margin-top:-6px;'>面试地点:"+list[i].addr+"</p>"+
							"<p style='margin-left: 10px;margin-top:-6px;'>面试结果:<b style='color:#FFB90F'>"+list[i].result+"</b></p></div></div>");
				}else if(list[i].result=="面试通过"){
					$("#recruit-msg").append(
							"<div style='border: 1px solid #e3c56b;width:190px;position: absolute;left:"+(38+250*(i%3))+"px;top:"+(15+240*parseInt(i/3))+"px;height:230px;font-size: 15px;'>"+
							"<div width='180px'  style='position: relative;'>"+
							"<p hidden>"+list[i].qid+"</p>"+
							"<p style='margin-left: 10px;margin-top:10px;'>企业:"+list[i].enterprisename+"</p>"+
    						"<p style='margin-left: 10px;margin-top:-6px;'>面试职位:<b><a plain='true' style='margin-top:-3px;' class='quarter'>"+list[i].quartername+"</a></b></p>"+
    						"<p style='margin-left: 10px;margin-top:-6px;'>面试联系人:"+list[i].contact+"</p>"+
    						"<p style='margin-left: 10px;margin-top:-6px;'>联系电话:"+list[i].phone+"</p>"+
    						"<p style='margin-left: 10px;margin-top:-6px;'>面试地点:"+list[i].addr+"</p>"+
							"<p style='margin-left: 10px;margin-top:-6px;'>面试结果:<b style='color:#59df8c'>"+list[i].result+"</b></p></div></div>");
				}else{
					$("#recruit-msg").append(
							"<div style='border: 1px solid #e3c56b;width:190px;position: absolute;left:"+(38+250*(i%3))+"px;top:"+(15+240*parseInt(i/3))+"px;height:230px;font-size: 15px;'>"+
							"<div width='180px'  style='position: relative;'>"+
							"<p hidden>"+list[i].qid+"</p>"+
							"<p style='margin-left: 10px;margin-top:10px;'>企业:"+list[i].enterprisename+"</p>"+
    						"<p style='margin-left: 10px;margin-top:-6px;'>面试职位:<b><a plain='true' style='margin-top:-3px;' class='quarter'>"+list[i].quartername+"</a></b></p>"+
    						"<p style='margin-left: 10px;margin-top:-6px;'>面试联系人:"+list[i].contact+"</p>"+
    						"<p style='margin-left: 10px;margin-top:-6px;'>联系电话:"+list[i].phone+"</p>"+
    						"<p style='margin-left: 10px;margin-top:-6px;'>面试地点:"+list[i].addr+"</p>"+
							"<p style='margin-left: 10px;margin-top:-6px;'>面试结果:<b style='color:#EE0000'>"+list[i].result+"</b></p></div></div>");
				}	
			}
			$(".quarter").linkbutton();
			$(".quarter").bind('click', function(){
				window.location.href = "/ae/quarters/getqitem/user/"+$(this).parent().parent().prev().prev().text();
			})
    	});
		
		
		$("#pagination").pagination({
			total:30,
			layout:['list','sep','first','prev','links','next','last','sep','refresh'],
			pageSize: 6,
	        pageNumber: 1,
	        pageList: [6],
	        onSelectPage: function (pageNumber, pageSize) {  
        		document.getElementById("recruit-msg").innerHTML =""
	        	$.get("../ae/interview/get/all/user/"+aid+"/"+(pageNumber-1)*6+"/"+pageSize,function(data){
	        			var list=data.data;
	        			for(var i in list){	
	        				if(list[i].result=="待面试"){
	        					$("#recruit-msg").append(
	        							"<div style='border: 1px solid #e3c56b;width:190px;position: absolute;left:"+(38+250*(i%3))+"px;top:"+(15+240*parseInt(i/3))+"px;height:230px;font-size: 15px;'>"+
	        							"<div width='180px'  style='position: relative;'>"+
	        							"<p hidden>"+list[i].qid+"</p>"+
	        							"<p style='margin-left: 10px;margin-top:10px;'>企业:"+list[i].enterprisename+"</p>"+
	            						"<p style='margin-left: 10px;margin-top:-6px;'>面试职位:<b><a plain='true' style='margin-top:-3px;' class='quarter'>"+list[i].quartername+"</a></b></p>"+
	            						"<p style='margin-left: 10px;margin-top:-6px;'>面试联系人:"+list[i].contact+"</p>"+
	            						"<p style='margin-left: 10px;margin-top:-6px;'>联系电话:"+list[i].phone+"</p>"+
	            						"<p style='margin-left: 10px;margin-top:-6px;'>面试地点:"+list[i].addr+"</p>"+
	        							"<p style='margin-left: 10px;margin-top:-6px;'>面试结果:<b style='color:#FFB90F'>"+list[i].result+"</b></p></div></div>");
	        				}else if(list[i].result=="面试通过"){
	        					$("#recruit-msg").append(
	        							"<div style='border: 1px solid #e3c56b;width:190px;position: absolute;left:"+(38+250*(i%3))+"px;top:"+(15+240*parseInt(i/3))+"px;height:230px;font-size: 15px;'>"+
	        							"<div width='180px'  style='position: relative;'>"+
	        							"<p hidden>"+list[i].qid+"</p>"+
	        							"<p style='margin-left: 10px;margin-top:10px;'>企业:"+list[i].enterprisename+"</p>"+
	            						"<p style='margin-left: 10px;margin-top:-6px;'>面试职位:<b><a plain='true' style='margin-top:-3px;' class='quarter'>"+list[i].quartername+"</a></b></p>"+
	            						"<p style='margin-left: 10px;margin-top:-6px;'>面试联系人:"+list[i].contact+"</p>"+
	            						"<p style='margin-left: 10px;margin-top:-6px;'>联系电话:"+list[i].phone+"</p>"+
	            						"<p style='margin-left: 10px;margin-top:-6px;'>面试地点:"+list[i].addr+"</p>"+
	        							"<p style='margin-left: 10px;margin-top:-6px;'>面试结果:<b style='color:#59df8c'>"+list[i].result+"</b></p></div></div>");
	        				}else{
	        					$("#recruit-msg").append(
	        							"<div style='border: 1px solid #e3c56b;width:190px;position: absolute;left:"+(38+250*(i%3))+"px;top:"+(15+240*parseInt(i/3))+"px;height:230px;font-size: 15px;'>"+
	        							"<div width='180px'  style='position: relative;'>"+
	        							"<p hidden>"+list[i].qid+"</p>"+
	        							"<p style='margin-left: 10px;margin-top:10px;'>企业:"+list[i].enterprisename+"</p>"+
	            						"<p style='margin-left: 10px;margin-top:-6px;'>面试职位:<b><a plain='true' style='margin-top:-3px;' class='quarter'>"+list[i].quartername+"</a></b></p>"+
	            						"<p style='margin-left: 10px;margin-top:-6px;'>面试联系人:"+list[i].contact+"</p>"+
	            						"<p style='margin-left: 10px;margin-top:-6px;'>联系电话:"+list[i].phone+"</p>"+
	            						"<p style='margin-left: 10px;margin-top:-6px;'>面试地点:"+list[i].addr+"</p>"+
	        							"<p style='margin-left: 10px;margin-top:-6px;'>面试结果:<b style='color:#EE0000'>"+list[i].result+"</b></p></div></div>");
	        				}	
	        			}
	        			$(".quarter").linkbutton();
	        			$(".quarter").bind('click', function(){
	        				window.location.href = "/ae/quarters/getqitem/user/"+$(this).parent().parent().prev().prev().text();
	        			})
	            });
	        }  
		})
		
	})  	 	
		
</script>
</body>
</html>