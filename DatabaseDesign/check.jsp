<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="design.vo.*"%>
<%@ page import="design.factory.*"%>
<html>
	<head>
		<title>Checking ~</title>
	</head>
	<script type="text/javascript">
		String.prototype.trim = function() { 
			return this.replace(/(^\s*)|(\s*$)/g, ''); 
		}; 
	</script>
	<body>
		<center>
		
		<%	// ������
			request.setCharacterEncoding("GBK") ;
		%>
		
			<h3 style="float:left;">������ת�����Ժ�......</h3>
			
			<hr>
			
		<%
			String mid = request.getParameter("mid") ;
			String password = request.getParameter("password") ;
			String rand = (String) session.getAttribute("rand") ;	
			String icode = request.getParameter("icode") ;
			
			if(mid.trim()=="" || password.trim()==""){
				session.setAttribute("info","�û��������벻��Ϊ�գ�") ;
				
		%>
		
			<script language="javascript">
				window.location.href='<%=request.getContextPath()%>/DatabaseDesign/login.jsp';
			</script>
				
		<%
			}
			else if(!rand.equalsIgnoreCase(icode))
			{
				session.setAttribute("info","��������ȷ����֤�룡") ;
		%>
		
				<script language="javascript">
					window.location.href='<%=request.getContextPath()%>/DatabaseDesign/login.jsp';
				</script>
				
		<%
			}
		%>
		
		<%

			
			Member member = new Member();
			
			member.setAccount(mid) ;
			member.setPassword(password) ;
		%>
		
		<%
			if(DAOFactory.getIMemberDAOInstance().findLogin(member)){	// �����Ѿ���½�ɹ�
				session.setAttribute("id",mid) ;	// ����mid
		%>
		
		<script language="javascript">
			window.location.href='welcome.jsp';
		</script>
				
		<%
			} else {
				session.setAttribute("info","������û��������룡") ;
		%>
		
				<script language="javascript">
					window.location.href='<%=request.getContextPath()%>/DatabaseDesign/login.jsp';
				</script>
				
		<% 		
			}
		%>
		
		</center>
	</body>
</html>