<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="design.vo.*,design.factory.*,design.dao.*" %>
<html>
	<head>
		<title>����ע�ᣬ���Ժ�......</title>
		<style>
		
		</style>
	</head>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
	
	<body style="
	padding-top: 40px;
    padding-bottom: 40px;
    background: url(<%=request.getContextPath()%>/img/rose.jpg) no-repeat center;
    background-color: #646464;
	font-family:Arial,Microsoft YaHei,����,sans-serif;
	color:#fff;
	">
	
	<%	// ������
		request.setCharacterEncoding("GBK") ;
	%>
		<div class="container">
			
				<h1><strong>��ӭʹ��ҽ��ϵͳ</strong></h1>
				
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
			
					<h3><%=mem.getNickname()%>������ע��ɹ���3�����ת��ϵͳ��ҳ��</h3>
					<br>
					<h3>���û����ת���밴<a style="color:red;" href="welcome.jsp">����</a>��</h3>
					
			<%
				} else {
			%>
			
					<h3>
						�û�ע��ʧ�ܣ���ID�����ѱ���ע�ᣬ
						�뷵��
						<a style="color:red;" href="regist.jsp">ע��ҳ</a>
						����ע�ᣡ
					</h3>
					
			<%
				}
			%>
		</center>
	</body>
</html>