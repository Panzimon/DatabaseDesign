<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="design.factory.*,java.text.*" %>
<html>
	<head>
		<title>ɾ������</title>
	</head>
	<body style="
		padding-top: 40px;
		padding-bottom: 40px;
		background-color: #eee;
		font-family:Arial,Microsoft YaHei,����,sans-serif;
	">
		<%
			request.setCharacterEncoding("GBK") ;
		%>
		<%
			int hno = Integer.parseInt(request.getParameter("hno")) ;
		%>

		<%
			String msg = "ɾ��ʧ��";
			if(DAOFactory.getIHospitalDAOInstance().doRemove(hno)){
				msg = "ɾ���ɹ���";
			}
		%>
		
		<script language="javascript">
			alert("<%=msg%>");
			window.location.href='hospital.jsp';
		</script>
		
	</body>
</html>