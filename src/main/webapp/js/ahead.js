		function personal(){
	    	window.location.href = "/auser/myoffice";
	    }
	    function logout(){
	    	$.get("/user/logout/applicant");
	    	alert("已经退出！");
	    	window.location.href = "/index";
	    }
	    function etlogin(){
			window.location.href='/login'
		}
	    function searchkey(){
			var key=$('#search').searchbox('getValue');
			$('#s2').val(key);
			$.post("http://localhost:8082/quarters/msg/quarteritem/key",$('#search1').serialize(),function(data){
	    		document.getElementById("recruit-msg").innerHTML ="";
	    		var list=data.data;
				for(var i in list){
					$("#recruit-msg").append("<div style='border: 1px solid #e3c56b;width:200px;position: absolute;left:"+(38+250*(i%3))+"px;top:"+(15+85*parseInt(i/3))+"px;height:50px;padding:10px;'><div width='180px'  style='position: relative;'><p hidden>"+list[i].qid+"</p><a plain='true' class='cruititem'>"+list[i].name+"</a><span style='color:#a99c9a;position: absolute;right:0px;top:0px;'>"+list[i].lsalary+"-"+list[i].msalary+"元/月</span><div style='color:#a99c9a'>"+list[i].edu+" | "+list[i].experience+"经验 | "+list[i].region+"</div></div></div>");	
				}
	    		$(".cruititem").linkbutton();
				$(".cruititem").bind('click', function(){
					window.location.href = "/ae/quarters/getqitem/user/"+$(this).prev().text();
				})
	    	});
		}
	    function cruititem(value){
			window.location.href = "/ae/quarters/getqitem/user/"+value;
		}