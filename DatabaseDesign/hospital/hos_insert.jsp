<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="design.vo.*"%>
<%@ page import="design.factory.*"%>
<%@ page import="java.util.*"%>

<jsp:include page="../head.jsp"/>

	<script language="javascript">
		function changeColor(obj,color){
			obj.bgColor = color ;
		}
	</script>


	<script language="javascript" src="<%=request.getContextPath()%>/js/hos_validate.js">
	</script>
<div class="container" style="color:#fff;">
<form action="hos_insert_do.jsp" method="post" onSubmit="return validate(this)">
<table border="1" cellpadding="5" cellspacing="0" id="idData" style="background-color:#F2F2F2;width:100%;height:90%">
	<tr style="background-color:white;">
		<td align="center" valign="middle"  colspan="3">
			<h1 style="float:left;">��Ϣ���</h1>		
		</td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td align="center" valign="middle"  style="background-color:white;width:30%;">��ţ�</td>
		<td align="center" valign="middle" ><input type="text" name="hno" size="5" maxlength="5" onBlur="validatehno(this.value)"></td>
		<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="hno_msg"><font color="RED">*</font></span></td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td align="center" valign="middle"  style="background-color:white;width:30%;">ҽԺ��</td>
		<td align="center" valign="middle" ><input type="text" name="name" onBlur="validatename(this.value)"></td>
		<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="name_msg"><font color="RED">*</font></span></td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td align="center" valign="middle"  style="background-color:white;width:30%;">��ַ��</td>
		<td align="center" valign="middle" ><input type="text" name="address" onBlur="validateaddress(this.value)"></td>
		<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="address_msg"><font color="RED">*</font></span></td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td align="center" valign="middle"  style="background-color:white;width:30%;">�绰��</td>
		<td align="center" valign="middle" ><input type="text" name="tel" onBlur="validatetel(this.value)" maxlength="8"></td>
		<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="tel_msg"><font color="RED">*</font></span></td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td align="center" valign="middle"  style="background-color:white;width:30%;">�ʱࣺ</td>
		<td align="center" valign="middle" ><input type="text" name="zipcode" onBlur="validatezipcode(this.value)" size="5" maxlength="5"></td>
		<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="zipcode_msg"><font color="RED">*</font></span></td>
	</tr>

	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td align="center" valign="middle"  colspan="3">
			<button type="submit" class="btn btn-primary" style="float:right;display:inline-block;margin:0 1em;">���</button>
			<button type="reset" class="btn btn-primary" style="float:right;display:inline-block;margin:0 1em;">����</button>	
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>