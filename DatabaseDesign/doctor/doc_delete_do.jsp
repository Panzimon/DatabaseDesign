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
			int docno = Integer.parseInt(request.getParameter("docno")) ;
		%>

		<%
			String msg = "ɾ��ʧ��";
			if(DAOFactory.getIDocDAOInstance().doRemove(docno)){
				msg = "ɾ���ɹ���";
			}
		%>
		
		<script language="javascript">
			alert("<%=msg%>");
			window.location.href='doc.jsp';
		</script>
		
	</body>
</html>