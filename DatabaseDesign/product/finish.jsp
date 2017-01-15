<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>

<jsp:include page="../head.jsp"/>	
<%request.setCharacterEncoding("utf-8");%>
		<%
			session.removeAttribute("allpid");
		%>
		<div class="container" style="color:#fff;">
			<h1>感谢惠顾~</h1>
			<h3>5秒后跳转回购物页面，若没有跳转请点击<a href="product.jsp" style="color:red;">此处</a>!</h3>
		</div>
		<%
			response.setHeader("refresh"," 5; URL=product.jsp");
		%>
	</body>
</html>