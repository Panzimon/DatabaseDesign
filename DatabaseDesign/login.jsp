<%@ page contentType="text/html" pageEncoding="GBK"%>
<html>
	<head>
		<title>��½����</title>
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
	font-family:Arial,Microsoft YaHei,����,sans-serif;
	color:#fff;
	">
	
	<%	// ������
		request.setCharacterEncoding("GBK") ;
	%>
		<div class="container">
			<center>
			
				<h1><strong>��ӭʹ��ҽ��ϵͳ</strong></h1>
				
				<hr style="margin-top:2.5em;margin-bottom:2.5em;border-top:1px solid #A0A5A3;">
				
				<strong style="color:red;">
					<%=session.getAttribute("info")!=null?session.getAttribute("info"):""%>
				</strong>
				<br>
				<br>
				<form action="check.jsp" method="post" class="form-horizontal" style="width:60%;font-size:1.2em;">
					<div class="form-group">
						<label for="username" class="col-sm-2 control-label">�˺ţ�</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="username" placeholder="username" name="mid">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword" class="col-sm-2 control-label">��&nbsp;�룺</label>
						<div class="col-sm-10">
						  <input type="password" class="form-control" id="inputPassword" placeholder="Password" name="password"style="width:85%;display:inline-block;" >
							<a href="findpassword.jsp" style="color:#fff;width:15%;">�һ�����</a>
						</div>
					 </div>
					 <div class="form-group">
						<label for="code" class="col-sm-2 control-label">��֤�룺</label>
						<div class="col-sm-10">
						  <input type="text" class="form-control" id="code" placeholder="��֤��" name="icode" style="width:84%;display:inline-block;">
						  <img id="icode" src="icode.jsp" onclick="reload()" title="���ˢ�¶�ά��">
						</div>
					 </div>
					<div class="form-group" style="margin:1.5em auto;">
						
							<div class="col-sm-1" style="float:none;display:inline-block;margin:0 1em;">
							  <button type="submit" class="btn btn-primary">��¼</button>
							</div>

						<div class="col-sm-1" style="float:none;display:inline-block;margin:0 1em;">
						  <button type="button" class="btn btn-primary" onClick="javascript:window.location.href='regist.jsp'">ע��</button>
						</div>
						
					</div>
					<!--
					<div style="margin:1.5em auto;">
						<button type="submit" class="btn btn-lg btn-primary btn-block">��¼</button>
						<button type="button" class="btn btn-lg btn-primary btn-block" onClick="javascript:window.location.href='regist.jsp'">ע��</button>
					</div>
					-->
				</form>
				
			</center>
		</div>
	</body>
</html>
