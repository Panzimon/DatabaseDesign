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
	<script language="javascript" src="<%=request.getContextPath()%>/js/pat_validate.js">
	</script>
	<script language="javascript" src="<%=request.getContextPath()%>/js/data.js"></script>
<div class="container" style="color:#fff;">
<form action="pat_insert_do.jsp" method="post" onSubmit="return validate(this)">
<table border="1" cellpadding="5" cellspacing="0" id="idData" style="background-color:#F2F2F2;width:100%;height:90%">
	<tr style="background-color:white;">
		<td align="center" valign="middle"  colspan="3">
			<h1 style="float:left;">信息添加</h1>		
		</td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td align="center" valign="middle"  style="background-color:white;width:30%;">编号：</td>
		<td align="center" valign="middle" ><input type="text" name="pno" size="5" maxlength="5" onBlur="validatepno(this.value)"></td>
		<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="pno_msg"><font color="RED">*</font></span></td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td align="center" valign="middle"  style="background-color:white;width:30%;">姓名：</td>
		<td align="center" valign="middle" ><input type="text" name="pname" onBlur="validatepname(this.value)"></td>
		<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="pname_msg"><font color="RED">*</font></span></td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td align="center" valign="middle"  style="background-color:white;width:30%;">年龄：</td>
		<td align="center" valign="middle" ><input type="text" name="age" onBlur="validateage(this.value)"></td>
		<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="age_msg"><font color="RED">*</font></span></td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td align="center" valign="middle"  style="background-color:white;width:30%;">最近一次看病日期：</td>
		<td align="center" valign="middle" ><input type="text" name="lastdate" onclick='popUpCalendar(this, this, "yyyy-mm-dd")' size="15" maxlength="15" readonly="true" onblur="validatelastdate(this.value)"></td>
		<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="lastdate_msg"><font color="RED">*</font></span></td>
	</tr>

	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td align="center" valign="middle"  colspan="3">
			<button type="submit" class="btn btn-primary" style="float:right;display:inline-block;margin:0 1em;">添加</button>
			<button type="reset" class="btn btn-primary" style="float:right;display:inline-block;margin:0 1em;">重置</button>	
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>