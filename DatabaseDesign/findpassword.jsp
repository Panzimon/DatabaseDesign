<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="design.vo.*,design.factory.*,design.dao.*" %>
<html>
	<head>
		<title>登陆界面</title>
		<style>
		
		</style>
	</head>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
	
	<body style="
	padding-top: 40px;
    padding-bottom: 40px;
    background: url(<%=request.getContextPath()%>/img/rose.jpg) no-repeat center;
    background-color: #646464;
	font-family:Arial,Microsoft YaHei,宋体,sans-serif;
	color:#fff;
	">
	
	<%	// 乱码解决
		request.setCharacterEncoding("UTF-8") ;
	%>
		<div class="container">
			<center>
			
				<h1><strong>欢迎使用医疗系统</strong></h1>
				
				<hr style="margin-top:2.5em;margin-bottom:5em;border-top:1px solid #A0A5A3;">
				
				<div style="margin:2.5em;color:red;">
					<%=request.getAttribute("warn")!=null?request.getAttribute("warn"):""%>
				</div>

				<form action="find_do.jsp" method="post" class="form-horizontal" style="width:60%;font-size:1.2em;">
					<div class="form-group">
						<label for="username" class="col-sm-4 control-label">请输入您的账号：</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="username" placeholder="username" name="mid">
						</div>
						<div class="col-sm-2">
							  <button type="submit" class="btn btn-primary">确定</button>
						</div>
					</div>
				</form>
			</center>
		</div>
	</body>
</html>
