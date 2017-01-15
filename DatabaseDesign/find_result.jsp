<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="design.vo.*,design.factory.*,design.dao.*" %>
<html>
	<head>
		<title>登陆界面</title>
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
		request.setCharacterEncoding("UTF-8") ;
	%>
		<div class="container">
			<center>
			
				<h1><strong>欢迎使用医疗系统</strong></h1>
				
				<hr style="margin-top:2.5em;margin-bottom:5em;border-top:1px solid #A0A5A3;">
				<div style="margin:2.5em;color:red;">
					<%=request.getAttribute("warn")!=null?request.getAttribute("warn"):""%>
				</div>
	<%
		String mid = request.getParameter("mid") ;
		try{
		request.setAttribute("warn","");
		String answer = request.getParameter("answer");
		IMemberDAO dao = DAOFactory.getIMemberDAOInstance();	
		if(dao.findByString(mid,answer)) {
	%>
				<form action="find_result_do.jsp" method="post" class="form-horizontal" style="width:60%;font-size:1.2em;">
					<div class="form-group">
						<label for="password1" class="control-label">请输入新的密码：</label>
						<div style="margin:1em;">
							<input type="text" class="form-control" id="password1" placeholder="password" name="password1">
						</div>
					</div>
					<div class="form-group">	
						<label for="password2" class="control-label">请确认密码：</label>
						<div style="margin:1em;">
							<input type="text" class="form-control" id="password2" placeholder="password" name="password2">
						</div>
					</div>
						<button type="submit" class="btn btn-primary">确定</button>
						<input type="hidden" name="mid" value="<%=mid%>">
						<input type="hidden" name="answer" value="<%=answer%>">
				</form>
	<% 
		}else{
		request.setAttribute("warn","密保问题回答错误！");
	%>
	 	<jsp:forward page="find_do.jsp">
			<jsp:param name="mid" value="<%=mid%>" />
		</jsp:forward>
	<%
		}
	}catch(Exception e){
		request.setAttribute("warn","请输入有效回答！");
	%>
	 	<jsp:forward page="find_do.jsp">
			<jsp:param name="mid" value="<%=mid%>" />
		</jsp:forward>
	<%
	 	}
	%>

			</center>
		</div>
	</body>
</html>