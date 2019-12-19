<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="domain.*"%>
<% request.setCharacterEncoding("utf-8"); %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"> 
	<title>欢迎管理员页面</title>
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%if(session.getAttribute("administrator") == null)  
{  
	   %><script>alert('请先登陆或注册');window.location.href='start.jsp'</script><%
	}  
Administrator admin = new Administrator();
admin = (Administrator)session.getAttribute("administrator");
%> <p>欢迎管理员： <span><%=admin.getUsername() %></span></p>
<div class="jumbotron">
	<div class="container">
		<h1>管理员登陆页面！</h1>
		<p>选择你的操作。</p>
		<p><a class="btn btn-primary btn-lg" role="button" href="DatiServlet">
			在线答题</a>
		<p><a class="btn btn-primary btn-lg" role="button" href="QeServlet">
			修改题目</a>
		<p><a class="btn btn-warning btn-lg" role="button" href="QuitServlet">
			退出</a>
		</p>
	</div>
</div>

</body>
</html>