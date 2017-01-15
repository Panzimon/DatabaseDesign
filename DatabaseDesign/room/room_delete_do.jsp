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
			int rno = Integer.parseInt(request.getParameter("rno")) ;
		%>

		<%
			String msg = "É¾³ýÊ§°Ü";
			if(DAOFactory.getIRoomDAOInstance().doRemove(rno)){
				msg = "É¾³ý³É¹¦£¡";
			}
		%>
		
		<script language="javascript">
			alert("<%=msg%>");
			window.location.href='room.jsp';
		</script>
		
	</body>
</html>