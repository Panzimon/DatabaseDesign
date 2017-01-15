<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="design.vo.*,design.factory.*,design.dao.*" %>
<html>
	<head>
		<title>正在注册，请稍候......</title>
		<style>
		
		</style>
	</head>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
	
	<body style="
	padding-top: 40px;
    padding-bottom: 40px;
    background: url(<%=request.getContextPath()%>/img/rose.jpg) no-repeat center;
    background-color: #646464;
	font-family:Arial,Microsoft YaHei,宋体,sans-serif;
	color:#fff;
	">
	
	<%	// 乱码解决
		request.setCharacterEncoding("GBK") ;
	%>
		<div class="container">
			
				<h1><strong>欢迎使用医疗系统</strong></h1>
				
				<hr style="margin-top:2.5em;margin-bottom:2.5em;border-top:1px solid #A0A5A3;">
		<center>
			
			<%
				Member mem = new Member();
				mem.setAccount(request.getParameter("mid"));
				mem.setPassword(request.getParameter("password"));
				mem.setNickname(request.getParameter("nickname"));
				mem.setSafequestion(request.getParameter("safequestion"));
				mem.setSafestring(request.getParameter("safestring"));
				mem.setSigndate(new java.util.Date());
			%>
			
			<%
				if(DAOFactory.getIMemberDAOInstance().doCreate(mem)){	
					response.setHeader("refresh","3;URL=welcome.jsp") ;
			%>
			
					<h3><%=mem.getNickname()%>，您已注册成功，3秒后将跳转到系统主页！</h3>
					<br>
					<h3>如果没有跳转，请按<a style="color:red;" href="welcome.jsp">这里</a>！</h3>
					
			<%
				} else {
			%>
			
					<h3>
						用户注册失败，此ID或许已被人注册，
						请返回
						<a style="color:red;" href="regist.jsp">注册页</a>
						重新注册！
					</h3>
					
			<%
				}
			%>
		</center>
	</body>
</html>