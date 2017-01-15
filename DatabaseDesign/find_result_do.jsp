<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="design.vo.*,design.factory.*,design.dao.*" %>
<html>
	<head>
		<title>登陆界面</title>
		<style>
		
		</style>
	</head>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<!--bug解决不了。。。只要是两次密码不对或者是密码为空就不会跳转到输入密码的界面，而是直接跳转到密保问题的界面。。。好吧。。。搞定了。。。-->
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
			
				<h3 style="float:left;"><strong>正在跳转，请稍候......</strong></h3>
				
				<hr style="margin-top:2.5em;margin-bottom:5em;border-top:1px solid #A0A5A3;">
				<div style="margin:2.5em;color:red;">
					<%=request.getAttribute("warn")!=null?request.getAttribute("warn"):""%>
				</div>

	<%
		try{
		String mid = request.getParameter("mid") ;
		String answer = request.getParameter("answer");
		try{
		request.setAttribute("warn","");
		String password1 = request.getParameter("password1") ;
		String password2 = request.getParameter("password2") ;
		if(!password1.equals(password2))
		{
			request.setAttribute("warn","两次输入密码不一致！");
	%>
		<jsp:forward page="find_result.jsp">
			<jsp:param name="mid" value="<%=mid%>" />
			<jsp:param name="answer" value="<%=answer%>" />
		</jsp:forward>
	<%
		}else if(password1==""){
			request.setAttribute("warn","密码不能为空！");
	%>
		<jsp:forward page="find_result.jsp">
			<jsp:param name="mid" value="<%=mid%>" />
			<jsp:param name="answer" value="<%=answer%>" />
		</jsp:forward>
	<%
		}else{
		IMemberDAO dao = DAOFactory.getIMemberDAOInstance() ;
		if(dao.doUpdatepassword(mid,password1)){
	%>
		<script language="javascript">
			alert("操作成功");
			window.location.href='<%=request.getContextPath()%>/DatabaseDesign/login.jsp';
		</script>		
	<% 
		}else{
			request.setAttribute("warn","操作失败，请重新尝试！");
	%>
		<jsp:forward page="find_result.jsp">
			<jsp:param name="mid" value="<%=mid%>" />
			<jsp:param name="answer" value="<%=answer%>" />
		</jsp:forward>
	<%
			}
		}
	}catch(Exception e){
	%>
		<script language="javascript">
			alert("操作失败，请重新尝试！");
			window.location.href='<%=request.getContextPath()%>/DatabaseDesign/findpassword.jsp';
		</script>		
	<% 
	}
		}catch(Exception e1){
	%>
		<script language="javascript">
			alert("操作失败，请重新尝试！");
			window.location.href='<%=request.getContextPath()%>/DatabaseDesign/findpassword.jsp';
		</script>		
	<% 
		}
	%>

			</center>
		</div>
	</body>
</html>