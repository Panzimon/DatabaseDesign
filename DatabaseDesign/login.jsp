<%@ page contentType="text/html" pageEncoding="GBK"%>
<html>
	<head>
		<title>登陆界面</title>
		<style>
		
		</style>
	</head>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
	<script language="javascript">
		function reload(){
			var change=document.getElementById('icode');
			change.src="icode.jsp?"+Math.random();
		}
	</script>
	<body style="
	padding-top: 40px;
    padding-bottom: 40px;
    background: url(<%=request.getContextPath()%>/img/rose.jpg) no-repeat center;
    background-color: #646464;
	font-family:Arial,Microsoft YaHei,宋体,sans-serif;
	color:#fff;
	">
	
	<%	// 乱码解决
		request.setCharacterEncoding("GBK") ;
	%>
		<div class="container">
			<center>
			
				<h1><strong>欢迎使用医疗系统</strong></h1>
				
				<hr style="margin-top:2.5em;margin-bottom:2.5em;border-top:1px solid #A0A5A3;">
				
				<strong style="color:red;">
					<%=session.getAttribute("info")!=null?session.getAttribute("info"):""%>
				</strong>
				<br>
				<br>
				<form action="check.jsp" method="post" class="form-horizontal" style="width:60%;font-size:1.2em;">
					<div class="form-group">
						<label for="username" class="col-sm-2 control-label">账号：</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="username" placeholder="username" name="mid">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword" class="col-sm-2 control-label">密&nbsp;码：</label>
						<div class="col-sm-10">
						  <input type="password" class="form-control" id="inputPassword" placeholder="Password" name="password"style="width:85%;display:inline-block;" >
							<a href="findpassword.jsp" style="color:#fff;width:15%;">找回密码</a>
						</div>
					 </div>
					 <div class="form-group">
						<label for="code" class="col-sm-2 control-label">验证码：</label>
						<div class="col-sm-10">
						  <input type="text" class="form-control" id="code" placeholder="验证码" name="icode" style="width:84%;display:inline-block;">
						  <img id="icode" src="icode.jsp" onclick="reload()" title="点击刷新二维码">
						</div>
					 </div>
					<div class="form-group" style="margin:1.5em auto;">
						
							<div class="col-sm-1" style="float:none;display:inline-block;margin:0 1em;">
							  <button type="submit" class="btn btn-primary">登录</button>
							</div>

						<div class="col-sm-1" style="float:none;display:inline-block;margin:0 1em;">
						  <button type="button" class="btn btn-primary" onClick="javascript:window.location.href='regist.jsp'">注册</button>
						</div>
						
					</div>
					<!--
					<div style="margin:1.5em auto;">
						<button type="submit" class="btn btn-lg btn-primary btn-block">登录</button>
						<button type="button" class="btn btn-lg btn-primary btn-block" onClick="javascript:window.location.href='regist.jsp'">注册</button>
					</div>
					-->
				</form>
				
			</center>
		</div>
	</body>
</html>
