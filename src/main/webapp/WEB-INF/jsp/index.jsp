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
	<script type="text/javascript" src="/js/index.js"></script>
	<script type="text/javascript" src="/js/code.js"></script>
	<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.easyui.min.js"></script>
</head>
<body>
	<div id="main" class="easyui-layout">
		<div data-options="region:'north'" style="height:175px;">
        	<div id="topLR">
	        	<div id="top-login-register" style="position: absolute;right:70px;top:0px;">
		            <a href="#" class="easyui-linkbutton" plain="true" onclick="showl()">登录</a>|
		            <a href="#" class="easyui-linkbutton" plain="true" onclick="showr()">注册</a>
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
                    <li><a href="index">主页</a></li>
                    <li><a href="contact.asp">更多服务</a></li>
                    <li><a href="about.asp">帮助</a></li>
                </ul>
			</div>
            <div id="searchbox">
            <input class="easyui-searchbox" style="width:400px;height:35px"
    data-options="prompt:'请输入关键词/职位名/企业名'"></input>
    		</div>
		</div>
	    <div data-options="region:'center'">
       		<div id="recruit-msg" style="position: relative;width:800px;">
						
			</div>
        	<div id="pagination" style="position: absolute;left:70px;bottom: 30px;" class="easyui-pagination"/>	
        </div>
        
        <div id="login" class="easyui-window" title="登录" closed="true" style="width:400px;height:330px;position: relative;" data-options="collapsible:false,minimizable:false,maximizable:false">  
		    <div style="text-align: center;padding-top: 7px;">
		    	<h2>登录</h2>
		    </div>
		    <div style="position: absolute;top:40px;left:40px;">
			    <form id="alogin" style="font-size:21px">
			        <p><input id="auname" class="easyui-textbox" label="用户名:" prompt="用户名" name="username" style="width:300px;height:27px;"></p>
			        <p><input id="aupwd" class="easyui-passwordbox" label="密码:" prompt="密码" name="pwd" style="width:300px;height:27px;"></p>
			        <p>
			        	<div style="height:38px;position:relative">
				        	<div style="position: absolute;top:0px;left:0px;"><input id="canvas1-text" class="easyui-textbox" label="验证码:" style="width:150px;height:27px;"></div>
				        	<div style="position: absolute;top:-5px;left:160px;"><canvas id="canvas1" width="140px" height="38px"></canvas></div>
			        	</div>
			        </p>
			        <div style="padding:5px;text-align:center;">
			            <a href="#" class="easyui-linkbutton" style="width: 168px;hegiht:50px;" onclick="alogin()">登录</a>
			        </div>
			    </form>
		    </div>
		</div>
        
        <div id="register" class="easyui-window" title="注册" closed="true" style="width:400px;height:400px;position: relative;" data-options="collapsible:false,minimizable:false,maximizable:false">  
		    <div style="text-align: center;padding-top: 10px;">
		    	<a class="easyui-linkbutton" plain="true" onclick="showUregister()" >用户名注册</a>|
		    	<a class="easyui-linkbutton" plain="true" onclick="showEregister()">邮箱注册</a>
		    </div>
		    <div id="userregister" style="position: absolute;top:40px;left:40px;">
			    <form id="uregister" style="font-size:21px">
			        <p><input class="easyui-textbox" label="用户名:" name="username" style="width:300px;height:27px;" required="true"></p>
			        <p><input id="pwd1" class="easyui-passwordbox" label="密码:" name="pwd" style="width:300px;height:27px;" required="true"></p>
			        <p><input id="pwd2" class="easyui-passwordbox" label="确认密码:" style="width:300px;height:27px;" required="true"></p>
			        <p>
			        	<div style="height:38px;position:relative">
				        	<div style="position: absolute;top:0px;left:0px;"><input id="canvas1-text1" class="easyui-textbox" label="验证码:" style="width:150px;height:27px;" required="true"></div>
				        	<div style="position: absolute;top:-5px;left:160px;"><canvas id="canvas2" width="140px" height="38px"></canvas></div>
			        	</div>
			        </p>
			        <div style="padding:5px;text-align:center;">
			            <a href="#" class="easyui-linkbutton" onclick="uregister()" style="width: 168px;hegiht:50px;">注册</a>
			        </div>
			    </form>
		    </div>
		    <div id="emailregister" style="position: absolute;top:40px;left:40px;visibility:hidden;">
			    <form id="eregister" style="text-align: right;font-size:21px">
			        <p><input class="easyui-textbox" label="邮箱名:" name="email" style="width:300px;height:27px;labelWidth:150px;" validType="email" required="true"></p>
			        <p><input id="pwd3" class="easyui-passwordbox" label="密码:" name="pwd" style="width:300px;height:27px;labelWidth:150px;" required="true"></p>
			        <p><input id="pwd4" class="easyui-passwordbox" label="确认密码:" style="width:300px;height:27px;labelWidth:150px;" required="true"></p>
			        <p>
			        	<div style="height:38px;position:relative">
				        	<div style="position: absolute;top:0px;left:0px;"><input id="canvas1-text2" class="easyui-textbox" label="验证码:" required="true" style="width:150px;height:27px;"></div>
				        	<div style="position: absolute;top:-5px;left:160px;"><canvas id="canvas3" width="140px" height="38px"></canvas></div>
			        	</div>
			        </p>
			        <div style="padding:5px;text-align:center;">
			            <a href="#" class="easyui-linkbutton" onclick="eregister()" style="width: 168px;hegiht:50px;">注册</a>
			        </div>
			    </form>
		    </div>
		</div>
		
	</div>
	<script type="text/javascript">
    	//先阻止画布默认点击发生的行为再执行drawPic()方法
	    document.getElementById("canvas1").onclick = function(e){
	        e.preventDefault();
	        drawPic("canvas1");
	    };
	    document.getElementById("canvas2").onclick = function(e){
	        e.preventDefault();
	        drawPic("canvas2");
	    };
	    document.getElementById("canvas3").onclick = function(e){
	        e.preventDefault();
	        drawPic("canvas3");
	    };
	    $(function(){
			$.get("../ae/quarters/msg/quarteritem/list/"+0+"/"+15,function(data){
	    		document.getElementById("recruit-msg").innerHTML =""
				for(var i in data){
					$("#recruit-msg").append("<div style='border: 1px solid #e3c56b;width:200px;position: absolute;left:"+(38+250*(i%3))+"px;top:"+(15+85*parseInt(i/3))+"px;height:50px;padding:10px;'><div width='180px'  style='position: relative;'><p hidden>"+data[i].qid+"</p><a plain='true' class='cruititem'>"+data[i].name+"</a><span style='color:#a99c9a;position: absolute;right:0px;top:0px;'>"+data[i].lsalary+"-"+data[i].msalary+"元/月</span><div style='color:#a99c9a'>"+data[i].edu+" | "+data[i].experience+"经验 | "+data[i].region+"</div></div></div>");	
				}
	    		$(".cruititem").linkbutton();
				$(".cruititem").bind('click', function(){
					showl();
				})
	    	});
			$("#pagination").pagination({
				total:50,
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
							showl();
						})
		        	});
		        }  
			})
			
		})  
	</script>
</body>
</html>