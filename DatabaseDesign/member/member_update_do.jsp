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
			String account = request.getParameter("account") ;
			String nickname = request.getParameter("nickname") ;
			String password = request.getParameter("password");
			String safequestion = request.getParameter("safequestion");
			String safestring = request.getParameter("safestring");
		%>
		
		<%
			String msg = "�޸�ʧ�ܣ�" ;
			Member member = new Member();
			member.setAccount(account);
			member.setPassword(password);
			member.setNickname(nickname);
			member.setSafequestion(safequestion);
			member.setSafestring(safestring);
			if(DAOFactory.getIMemberDAOInstance().doUpdate(member)){
				msg = "�޸ĳɹ���" ;
			}
		%>
		
		<script language="javascript">
			alert("<%=msg%>") ;
			window.location.href='member.jsp';
		</script>
		
	</body>
</html>