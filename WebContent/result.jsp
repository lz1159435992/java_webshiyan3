<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>结果</title>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
int a = (int)request.getAttribute("result");
		out.print("<h1>你一共得了了"+a+"分</h1>");
	%>
	<p><a class="btn btn-primary btn-lg" role="button" href="QuitServlet">
			退出</a>
	<img src="assets/img/body.jpg" class="img-responsive" alt="Cinque Terre" width=100% height=90%> 
</body>
</html>