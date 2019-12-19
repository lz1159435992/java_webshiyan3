<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<%@page import="domain.*"%>
<%@page import="domain.Question"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>在线答题</title>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<link href="css/iconfont.css" rel="stylesheet" type="text/css" />
<link href="css/test.css" rel="stylesheet" type="text/css" />
<style>
.hasBeenAnswer {
	background: #5d9cec;
	color:#fff;
}
</style>
<script type="text/javascript">
function myCheck()
{
    for(var i=0;i<document.form.elements.length-1;i++)
    {
        if(document.form.elements[i].value=="")
        {
            alert("请选择选项");
            document.form.elements[i].focus();
            return false;
        }
    }
    return true;

}
function submit(){
	  document.getElementById("formid").submit();
	}
function quit(){
		window.location.href="QuitServlet";
}
</script>
</head>
<body>
<%if(session.getAttribute("user") == null&&session.getAttribute("administrator") == null)  
{  
	   %><script>alert('请先登陆或注册');window.location.href='start.jsp'</script><%
	}
else if(session.getAttribute("user") != null){
User user = new User();
user = (User)session.getAttribute("user");
%> <p>欢迎： <span><%=user.getUsername() %></span></p>
<%}
else if(session.getAttribute("administrator") != null){
Administrator administrator = new Administrator();
administrator = (Administrator)session.getAttribute("administrator");
%> <p>欢迎： <span><%=administrator.getUsername() %></span></p>
<%}
ArrayList<Question> qes = (ArrayList<Question>)request.getAttribute("questions");
	%>
<div class="main">
	<!--nr start-->
	<div class="test_main">
		<div class="nr_left">
			<div class="test">
					<div class="test_title">
						<p class="test_time">
							<i class="icon iconfont">&#xe6fb;</i><b id="time" class="alt-1"></b>
						</p>

						<font><input type="button" name="test_jiaojuan" value="交卷" onclick="submit();"></font>
						<font><input type="button" name="test_tuichu" value="退出" onclick="quit();"></font>
					</div>
					
						<div class="test_content">
							<div class="test_content_title">
								<h2>单选题</h2>
								<p>
									<span>共</span><i class="content_lit"><%= qes.size()+"" %></i><span>题</span>
								</p>
							</div>
						</div>
						<div class="test_content_nr">
							<ul>
							<form id="formid" name="form" action="QuestionServlet" method="get" onSubmit="return myCheck()">
						<%for(int i=0;i<qes.size();i++){%>		
									<li id="q<%=i+1+""%>">
										<div class="test_content_nr_tt">
											<i><%=i+1 +"" %></i><span>(1分)</span><font><%=qes.get(i).getQuestion() %></font><b class="icon iconfont">&#xe881;</b>
										</div>

										<div class="test_content_nr_main">
											<ul>
												
													<li class="option">
														
															<input type="radio" class="radioOrCheck" name="<%=i+1+""%>"
																id="answer_<%=i+1+""%>+_option_1" value="A"
															/>
														
														
														<label for="answer_<%=i+1+""%>+_option_1">
															A.
															<p class="ue" style="display: inline;"><%=qes.get(i).getChoice_a()%></p>
														</label>
													</li>
												
													<li class="option">
														
															<input type="radio" class="radioOrCheck" name="<%=i+1+""%>"
																id="answer_<%=i+1+""%>+_option_2" value="B"
															/>
														
														
														<label for="answer_<%=i+1+""%>+_option_2">
															B.
															<p class="ue" style="display: inline;"><%=qes.get(i).getChoice_b()%></p>
														</label>
													</li>
												
													<li class="option">
														
															<input type="radio" class="radioOrCheck" name="<%=i+1+""%>"
																id="answer_<%=i+1+""%>+_option_3" value="C"
															/>
														
														
														<label for="answer_<%=i+1+""%>+_option_3">
															C.
															<p class="ue" style="display: inline;"><%=qes.get(i).getChoice_c()%></p>
														</label>
													</li>
												
													<li class="option">
														
															<input type="radio" class="radioOrCheck" name="<%=i+1+""%>"
																id="answer_<%=i+1+""%>+_option_4" value="D"
															/>
														
														
														<label for="answer_<%=i+1+""%>+_option_4">
															D.
															<p class="ue" style="display: inline;"><%=qes.get(i).getChoice_d()%></p>
														</label>
													</li>
												
											</ul>
										</div>
									</li>
								<%} %>
										</form>
					
				</ul>
				</div>
				</div>
				</div>
				
		<div class="nr_right">
			<div class="nr_rt_main">
				<div class="rt_nr1">
					<div class="rt_nr1_title">
						<h1>
							<i class="icon iconfont">&#xe692;</i>答题卡
						</h1>
						<p class="test_time">
							<i class="icon iconfont">&#xe6fb;</i><b class="alt-1"></b>
						</p>
					</div>
					
						<div class="rt_content">
							<div class="rt_content_tt">
								<h2>单选题</h2>
								<p>
									<span>共</span><i class="content_lit"><%=qes.size() %></i><span>题</span>
								</p>
							</div>
							<div class="rt_content_nr answerSheet">
								<ul>
									<%for(int i=0;i<qes.size();i++){%>
										<li><a href="#q<%=i+1+""%>"><%=i+1+""%></a></li>
										<%} %>
									
								</ul>
							</div>
						</div>

						</div>
				</div>
			</div>
		</div>
	</div>
	<!--nr end-->
	<div class="foot"></div>
</div>

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery.easy-pie-chart.js"></script>
<!--时间js-->
<script src="js/jquery.countdown.js"></script>
<script>
	window.jQuery(function($) {
		"use strict";
		
		$('time').countDown({
			with_separators : false
		});
		$('.alt-1').countDown({
			css_class : 'countdown-alt-1'
		});
		
	});
	$(function() {
		$('li.option label').click(function() {
		debugger;
			var examId = $(this).closest('.test_content_nr_main').closest('li').attr('id'); // 得到题目ID
			var cardLi = $('a[href=#' + examId + ']'); // 根据题目ID找到对应答题卡
			// 设置已答题
			if(!cardLi.hasClass('hasBeenAnswer')){
				cardLi.addClass('hasBeenAnswer');
			}
			
		});
	});
	
</script>

</body>
</html>
