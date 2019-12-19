<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<%@page import="domain.*"%>
<%@page import="domain.Question"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"> 
	<title>Bootstrap 实例 - 折叠面板</title>
	<link href="css/iconfont.css" rel="stylesheet" type="text/css" />
	<link href="css/test.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
function xiugai(id)
{ 	document.getElementById("f"+id+"").action="XiugaiServlet";
	document.getElementById("f"+id+"").submit();
}
function shanchu(id)
{ 
	var str = id;
	str = str.slice(1);
	document.getElementById("f"+str+"").action="ShanchuServlet";
	document.getElementById("f"+str+"").submit();
}
function tianjia(){
	window.location.href="tianjia.jsp";
}
function quit(){
	window.location.href="QuitServlet";
}
</script>
</head>
<body>
<%
if(session.getAttribute("administrator") == null)  
{  
	   %><script>alert('请先登陆或注册');window.location.href='start.jsp'</script><%
	}  
Administrator admin = new Administrator();
admin = (Administrator)session.getAttribute("administrator");
ArrayList<Question> qes = (ArrayList<Question>)request.getAttribute("questions");
%> <p>欢迎管理员： <span><%=admin.getUsername() %></span></p>
<div class="test_title">
							<a class="btn btn-primary" name="tianjia" role="button" onclick="tianjia();">添加</a>
							<a class="btn btn-warning" name="tuichu" role="button" onclick="quit();">退出</a>
					</div>
<div class="panel-group" id="accordion">
<%for(int i=0;i<qes.size();i++) {%>
<form action="" id="f<%=i+""%>" method="get">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion" 
				   href="#collapse<%=i+""%>">
					<i id="<%=i+500+""%>" ><input type="text" class="btn btn-primary" name="index" value="<%=i+1+"" %>">：</i> 
					<%=qes.get(i).getQuestion() %></a>
					<input type="submit" class="btn btn-primary" role="button" id="<%=i+""%>" name="shanchu<%=i+""%>" value="修改" onclick="return xiugai(this.id)">
					<a class="btn btn-warning" role="button" id="b<%=i+""%>" name="b<%=i+""%>" value="删除" onclick="return shanchu(this.id)">删除</a>
				
			</h4>
		</div>
		<div id="collapse<%=i+""%>"  class="panel-collapse collapse in">
			<div class="panel-body">
			<%=i+1+"."%><input type="text" name="q<%=i+"" %>" class="username" value="<%=qes.get(i).getQuestion() %>"><br/>
			A.<input type="text" name="o1<%=i+"" %>" value="<%=qes.get(i).getChoice_a()%>"><br />
			
			B.<input type="text" name="o2<%=i+"" %>" value="<%=qes.get(i).getChoice_b()%>"><br />
			
			C.<input type="text" name="o3<%=i+"" %>" value="<%=qes.get(i).getChoice_c()%>"><br />
			
			D.<input type="text" name="o4<%=i+"" %>" value="<%=qes.get(i).getChoice_d()%>"><br />
			
			正确答案：A<input type="radio" name="r<%=i+"" %>" value="A" <%= qes.get(i).getRight().equals("A")?"checked":"" %>>
			B<input type="radio" name="r<%=i+"" %>" value="B" <%= qes.get(i).getRight().equals("B")?"checked":"" %>>
			C<input type="radio" name="r<%=i+"" %>" value="C" <%= qes.get(i).getRight().equals("C")?"checked":"" %>>
			D<input type="radio" name="r<%=i+"" %>" value="D" <%= qes.get(i).getRight().equals("D")?"checked":"" %>>
			</div>
		</div>
	</div>
	</form>
	<%} %>
</div>
<br/>
<br/>
<br/>
<br/>
</body>
</html>