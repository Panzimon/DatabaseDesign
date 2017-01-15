<%@ page contentType="text/html" pageEncoding="GBK"%>
<html>
	<head>
		<title>×¢Ïú</title>
	</head>
	<body>
	
	<%
		request.setCharacterEncoding("GBK") ;
	%>
	
		<center>

			<br>
			<%
				session.invalidate() ;	// ÈÃsessionÊ§Ð§
				response.sendRedirect("login.jsp") ;
			%>
		</center>
	
	</body>
</html>