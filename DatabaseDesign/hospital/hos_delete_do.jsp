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
			int hno = Integer.parseInt(request.getParameter("hno")) ;
		%>

		<%
			String msg = "É¾³ýÊ§°Ü";
			if(DAOFactory.getIHospitalDAOInstance().doRemove(hno)){
				msg = "É¾³ý³É¹¦£¡";
			}
		%>
		
		<script language="javascript">
			alert("<%=msg%>");
			window.location.href='hospital.jsp';
		</script>
		
	</body>
</html>