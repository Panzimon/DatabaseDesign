<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="design.factory.*,java.text.*" %>
<html>
	<head>
		<title>����ɾ�������Ժ�......</title>
	</head>
	<body style="
		padding-top: 40px;
		padding-bottom: 40px;
		background-color: #eee;
		font-family:Arial,Microsoft YaHei,����,sans-serif;
	">
		<%
			request.setCharacterEncoding("GBK") ;
			int pno = Integer.parseInt(request.getParameter("pno")) ;
			int deptno = Integer.parseInt(request.getParameter("deptno"));
			String msg = "ɾ��ʧ�ܣ�";
			if(DAOFactory.getIBookingDAOInstance().doRemove(pno,deptno)){
				msg = "ɾ���ɹ���" ;
			}
		%>
		
		<script language="javascript">

			alert("<%=msg%>") ;
			window.location.href='regist_list.jsp';

		</script>
		
	</body>
</html>