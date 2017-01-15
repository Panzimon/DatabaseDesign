<%@ page contentType="text/html" pageEncoding="GBK"%>
<html>
	<head>
		<title>登陆界面</title>
		<style>
		
		</style>
	</head>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
	<script language="javascript">
		function changeColor(obj,color){
			obj.bgColor = color ;
		}
	</script>
	
	<script language="javascript" src="<%=request.getContextPath()%>/js/member_validate.js">
	</script>
	<script language="javascript" src="<%=request.getContextPath()%>/js/data.js"></script>
	
	<body style="
	padding-top: 40px;
    padding-bottom: 40px;
    background: url(<%=request.getContextPath()%>/img/rose.jpg) no-repeat center;
    background-color: #646464;
	font-family:Arial,Microsoft YaHei,宋体,sans-serif;
	
	">
	
	<%	// 乱码解决
		request.setCharacterEncoding("GBK") ;
	%>
		<div class="container">
			
				<h1 style="color:#fff;"><strong>欢迎使用医疗系统</strong></h1>
				
				<hr style="margin-top:2.5em;margin-bottom:2.5em;border-top:1px solid #A0A5A3;">
				
			<form action="regist_do.jsp" method="post" onSubmit="return validate(this)">

				<table border="1" cellpadding="5" cellspacing="0" style="background-color:#F2F2F2;width:100%;height:90%">
					<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle"  colspan="3">
						<h1 style="float:left;">注册新用户</h1>		
					</td>
					</tr>
					
					<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				<td align="center" valign="middle"  style="background-color:white;width:30%;">账号：</td>
				<td align="center" valign="middle" name="mid"><input type="text" name="mid" onBlur="validateMid(this.value)"></td>
				<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="mid_msg"><font color="RED">*</font></span></td>
			</tr>
			<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				<td align="center" valign="middle"  style="background-color:white;width:30%;">登录密码：</td>
				<td align="center" valign="middle" ><input type="password" name="password" onBlur="validatePassword(this.value)"></td>
				<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="password_msg"><font color="RED">*</font></span></td>
			</tr>	
			<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				<td align="center" valign="middle"  style="background-color:white;width:30%;">确认密码：</td>
				<td align="center" valign="middle" ><input type="password" name="conf" onBlur="validateConf(this.value)"></td>
				<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="conf_msg"><font color="RED">*</font></span></td>
			</tr>
			<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				<td align="center" valign="middle"  style="background-color:white;width:30%;">用户名：</td>
				<td align="center" valign="middle" ><input type="text" name="nickname" onBlur="validatenickname(this.value)" ></td>
				<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="nickname_msg"><font color="RED">*</font></span></td>
			</tr>
			<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				<td align="center" valign="middle"  style="background-color:white;width:30%;">密保问题：</td>
				<td align="center" valign="middle" ><input type="text" name="safequestion" onBlur="validatesafequestion(this.value)" ></td>
				<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="safequestion_msg"><font color="RED">*</font></span></td>
			</tr>
			<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				<td align="center" valign="middle"  style="background-color:white;width:30%;">密保答案：</td>
				<td align="center" valign="middle" ><input type="text" name="safestring" onBlur="validatesafestring(this.value)"></td>
				<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="safestring_msg"><font color="RED">*</font></span></td>
			</tr>
			<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				<td align="center" valign="middle"  colspan="3">
						<button type="submit" class="btn btn-primary" style="float:right;display:inline-block;margin:0 1em;">注册</button>
						<button type="reset" class="btn btn-primary" style="float:right;display:inline-block;margin:0 1em;">重置</button>	
				</td>
			</tr>
				</table>
			</form>
		</div>
	</body>
</html>