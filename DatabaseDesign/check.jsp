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
		
		<%	// 乱码解决
			request.setCharacterEncoding("GBK") ;
		%>
		
			<h3 style="float:left;">正在跳转，请稍后......</h3>
			
			<hr>
			
		<%
			String mid = request.getParameter("mid") ;
			String password = request.getParameter("password") ;
			String rand = (String) session.getAttribute("rand") ;	
			String icode = request.getParameter("icode") ;
			
			if(mid.trim()=="" || password.trim()==""){
				session.setAttribute("info","用户名或密码不能为空！") ;
				
		%>
		
			<script language="javascript">
				window.location.href='<%=request.getContextPath()%>/DatabaseDesign/login.jsp';
			</script>
				
		<%
			}
			else if(!rand.equalsIgnoreCase(icode))
			{
				session.setAttribute("info","请输入正确的验证码！") ;
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
			if(DAOFactory.getIMemberDAOInstance().findLogin(member)){	// 现在已经登陆成功
				session.setAttribute("id",mid) ;	// 保存mid
		%>
		
		<script language="javascript">
			window.location.href='welcome.jsp';
		</script>
				
		<%
			} else {
				session.setAttribute("info","错误的用户名或密码！") ;
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