<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
<script type="text/javascript">
function Formatcontrol(form){ 
	var str1 =form.str_password.value;
	var str2 = form.str_password2.value;
	if(form.str_username.value==''){  
		alert('用户名不能为空！');   
		return false;  
	}  
	else if(form.str_password.value==''){ 
		alert('密码不能为空！');  
		return false;  
	} 
	else if(form.str_password2.value==''){  
		alert('密码不能为空！'); 
		return false;  
	}
	else if(str1!=str2){
		alert('两次密码输入不一致');
		return false;
		}
}
</script>
<link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
        <link rel="stylesheet" href="assets/css/reset.css">
        <link rel="stylesheet" href="assets/css/supersized.css">
        <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
	<center>
		<div class="page-container">
	    <h1>注册</h1>
	    <form name="regiestForm" action="ZcServlet" method="get" onSubmit="return Formatcontrol(this)">
		<input type="text" id="str_username" name="str_username" class="input" placeholder="请输入用户名">
		<input type="password" id="str_password" name="str_password"class="input" placeholder="请输入密码">
		<input type="password" id="str_password2" name="str_password2"class="input" placeholder="再次输入密码">
		<button type="submit">Sign up</button>
	    </form>
	    <div class="connect">
                <p>已经注册完毕？</p>
                <p>
                    <a class="denglu" href="start.jsp"></a>
                </p>
            </div>
	    </div>
   	</center>
   	<script src="assets/js/jquery-1.8.2.min.js"></script>
        <script src="assets/js/supersized.3.2.7.min.js"></script>
        <script src="assets/js/supersized-init.js"></script>
        <script src="assets/js/scripts.js"></script>
</body>
</html>
<script> 
//取出传回来的参数error并与yes比较
  var errori ='<%=request.getParameter("error")%>';
  if(errori=='yes'){
	  alert("用户名已存在，请重新注册用户");  
		window.location.href="zhuce.jsp";
  }
</script>