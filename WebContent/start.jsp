<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); 
  session.invalidate();%> 
<!DOCTYPE html>
<html lang="en" class="no-js">
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>登陆</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
        <link rel="stylesheet" href="assets/css/reset.css">
        <link rel="stylesheet" href="assets/css/supersized.css">
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

    </head>

    <body>

        <div class="page-container">
            <h1>登陆</h1>
            <form action="YanzhengServlet" method="get">
                <input type="text" name="username" class="username" placeholder="Username">
                <input type="password" name="password" class="password" placeholder="Password">
                <table align="center">
                <tr>
				<td><input type="radio" name="choice"value="user" style="width:20px;height:15px" checked="true">普通用户</td>
				<td><input type="radio" name="choice"value="administrator" style="width:20px;height:15px">管理员</td>
				</tr>
                </table>
                <button type="submit">Sign me in</button>
                <div class="error"><span>+</span></div>
            </form>
            <div class="connect">
                <p>还没有账号？</p>
                <p>
                    <a class="zhuce" href="zhuce.jsp"></a>
                </p>
            </div>
        </div>
        <!-- Javascript -->
        <script src="assets/js/jquery-1.8.2.min.js"></script>
        <script src="assets/js/supersized.3.2.7.min.js"></script>
        <script src="assets/js/supersized-init.js"></script>
        <script src="assets/js/scripts.js"></script>

    </body>

</html>
