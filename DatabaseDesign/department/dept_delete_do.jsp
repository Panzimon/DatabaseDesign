<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="design.factory.*,java.text.*" %>
<html>
	<head>
		<title>É¾³ý²Ù×÷</title>
	</head>
	<body style="
		padding-top: 40px;
		padding-bottom: 40px;
		background-color: #eee;
		font-family:Arial,Microsoft YaHei,ËÎÌå,sans-serif;
	">
		<%
			request.setCharacterEncoding("GBK") ;
		%>
		<%
			int deptno = Integer.parseInt(request.getParameter("deptno")) ;
		%>

		<%
			String msg = "É¾³ýÊ§°Ü";
			if(DAOFactory.getIDeptDAOInstance().doRemove(deptno)){
				msg = "É¾³ý³É¹¦£¡";
			}
		%>
		
		<script language="javascript">
			alert("<%=msg%>");
			window.location.href='dept.jsp';
		</script>
		
	</body>
</html>