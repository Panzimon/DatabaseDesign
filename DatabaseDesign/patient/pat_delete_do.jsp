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
			int pno = Integer.parseInt(request.getParameter("pno")) ;
		%>

		<%
			String msg = "ɾ��ʧ�ܣ�" ;
			if(DAOFactory.getIPatDAOInstance().doRemove(pno)){
				msg = "ɾ���ɹ���" ;
			}
		%>
		
		<script language="javascript">

			alert("<%=msg%>") ;
			window.location.href='patient.jsp';

		</script>
		
	</body>
</html>