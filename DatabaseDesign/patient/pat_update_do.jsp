<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.text.*" %>
<%@ page import="design.vo.*,design.factory.*" %>
<html>
	<head>
		<title>�޸��У����Ժ�......</title>
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
			String pname = request.getParameter("pname") ;
			int age = Integer.parseInt(request.getParameter("age")) ;
			java.util.Date lastdate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("lastdate")) ;
		%>
		
		<%
			String msg = "�޸�ʧ�ܣ�" ;
			Pat pat = new Pat() ;
			pat.setpno(pno) ;
			pat.setpname(pname) ;
			pat.setage(age);
			pat.setlastdate(lastdate) ;
			if(DAOFactory.getIPatDAOInstance().doUpdate(pat)){
				msg = "�޸ĳɹ���" ;
			}
		%>
		
		<script language="javascript">
			alert("<%=msg%>") ;
			window.location.href='patient.jsp';
		</script>
		
	</body>
</html>