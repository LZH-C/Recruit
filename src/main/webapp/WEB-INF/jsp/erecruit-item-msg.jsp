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
	<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery-easyui-1.5.4/jquery.easyui.min.js"></script>
</head>

<body>
	<div>
		<table id="qtable" style="text-align: left;margin-left:10%;padding-top:30px;font-size:15px;" cellpadding="10">
						<tr><th width="80px">职位名称:</th><th>${quarters.name}</th></tr>
						
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
	</div>
<script>
var time="${quarters.endtime}";
var endtime=window.parent.formatDate(time);
$("#endtime").append(endtime);
</script>
</body>
</html>