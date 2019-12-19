<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加题目</title>
<script type="text/javascript">
function Formatcontrol(form){ 
	var str1 =form.str_qes.value;
	var str2 =form.str_choice_a.value;
	var str3 =form.str_choice_b.value;
	var str4 =form.str_choice_c.value;
	var str5 =form.str_choice_d.value;
	if(form.str_qes.value==''){  
		alert('题干不能为空！');   
		return false;  
	}  
	else if(form.str_choice_a.value==''||form.str_choice_b.value==''||form.str_choice_c.value==''||form.str_choice_d.value==''){ 
		alert('选项不能为空！');  
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
	    <h1>添加题目</h1>
	    <form name="tianjiaForm" action="AddServlet" method="get" onSubmit="return Formatcontrol(this)">
		<input type="text" id="str_qes" name="str_qes" class="input" placeholder="请输入题干">
		<input type="text" id="str_choice_a" name="str_choice_a" class="input" placeholder="请输入A选项">
		<input type="text" id="str_choice_b" name="str_choice_b" class="input" placeholder="请输入B选项">
		<input type="text" id="str_choice_c" name="str_choice_c" class="input" placeholder="请输入C选项">
		<input type="text" id="str_choice_d" name="str_choice_d" class="input" placeholder="请输入D选项">
		正确答案：A<input type="radio" name="right" style="width:20px;height:15px"value="A" checked="true">
			B<input type="radio" name="right" style="width:20px;height:15px"value="B" >
			C<input type="radio" name="right" style="width:20px;height:15px"value="C" >
			D<input type="radio" name="right" style="width:20px;height:15px"value="D" >
		<button type="submit">添加</button>
	    </form>
	    <div class="connect">
                <p>已经完毕？</p>
                <p>
                    <a class="tuichu" href="QeServlet"></a>
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
  if(errori=='error'){
	  alert("题目已存在，请重新添加");  
		window.location.href="tianjia.jsp";
  }
</script>