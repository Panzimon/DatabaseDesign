<%@ page contentType="text/html" pageEncoding="GBK"%>
<html>
	<head>
		<title>��½����</title>
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
	font-family:Arial,Microsoft YaHei,����,sans-serif;
	
	">
	
	<%	// ������
		request.setCharacterEncoding("GBK") ;
	%>
		<div class="container">
			
				<h1 style="color:#fff;"><strong>��ӭʹ��ҽ��ϵͳ</strong></h1>
				
				<hr style="margin-top:2.5em;margin-bottom:2.5em;border-top:1px solid #A0A5A3;">
				
			<form action="regist_do.jsp" method="post" onSubmit="return validate(this)">

				<table border="1" cellpadding="5" cellspacing="0" style="background-color:#F2F2F2;width:100%;height:90%">
					<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle"  colspan="3">
						<h1 style="float:left;">ע�����û�</h1>		
					</td>
					</tr>
					
					<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				<td align="center" valign="middle"  style="background-color:white;width:30%;">�˺ţ�</td>
				<td align="center" valign="middle" name="mid"><input type="text" name="mid" onBlur="validateMid(this.value)"></td>
				<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="mid_msg"><font color="RED">*</font></span></td>
			</tr>
			<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				<td align="center" valign="middle"  style="background-color:white;width:30%;">��¼���룺</td>
				<td align="center" valign="middle" ><input type="password" name="password" onBlur="validatePassword(this.value)"></td>
				<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="password_msg"><font color="RED">*</font></span></td>
			</tr>	
			<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				<td align="center" valign="middle"  style="background-color:white;width:30%;">ȷ�����룺</td>
				<td align="center" valign="middle" ><input type="password" name="conf" onBlur="validateConf(this.value)"></td>
				<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="conf_msg"><font color="RED">*</font></span></td>
			</tr>
			<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				<td align="center" valign="middle"  style="background-color:white;width:30%;">�û�����</td>
				<td align="center" valign="middle" ><input type="text" name="nickname" onBlur="validatenickname(this.value)" ></td>
				<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="nickname_msg"><font color="RED">*</font></span></td>
			</tr>
			<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				<td align="center" valign="middle"  style="background-color:white;width:30%;">�ܱ����⣺</td>
				<td align="center" valign="middle" ><input type="text" name="safequestion" onBlur="validatesafequestion(this.value)" ></td>
				<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="safequestion_msg"><font color="RED">*</font></span></td>
			</tr>
			<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				<td align="center" valign="middle"  style="background-color:white;width:30%;">�ܱ��𰸣�</td>
				<td align="center" valign="middle" ><input type="text" name="safestring" onBlur="validatesafestring(this.value)"></td>
				<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="safestring_msg"><font color="RED">*</font></span></td>
			</tr>
			<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				<td align="center" valign="middle"  colspan="3">
						<button type="submit" class="btn btn-primary" style="float:right;display:inline-block;margin:0 1em;">ע��</button>
						<button type="reset" class="btn btn-primary" style="float:right;display:inline-block;margin:0 1em;">����</button>	
				</td>
			</tr>
				</table>
			</form>
		</div>
	</body>
</html>