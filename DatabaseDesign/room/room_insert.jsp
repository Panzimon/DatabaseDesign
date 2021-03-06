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
		
	<script language="javascript" src="<%=request.getContextPath()%>/js/room_validate.js">
	</script>
<div class="container" style="color:#fff;">
<form action="room_insert_do.jsp" method="post" onSubmit="return validate(this)">
<table border="1" cellpadding="5" cellspacing="0" id="idData" style="background-color:#F2F2F2;width:100%;height:90%">
	<tr style="background-color:white;">
		<td align="center" valign="middle"  align="center" valign="middle"  colspan="3">
			<h1 style="float:left;">信息添加</h1>			
		</td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td align="center" valign="middle"  style="background-color:white;width:30%;">房号：</td>
		<td align="center" valign="middle" ><input type="text" name="rno" size="5" maxlength="5" onBlur="validaterno(this.value)"></td>
		<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="rno_msg"><font color="RED">*</font></span></td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td align="center" valign="middle"  style="background-color:white;width:30%;">所属楼区：</td>
		<td align="center" valign="middle" ><input type="text" name="loc" onBlur="validateloc(this.value)"></td>
		<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="loc_msg"><font color="RED">*</font></span></td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td align="center" valign="middle"  style="background-color:white;width:30%;">是否空余：</td>
		<td align="center" valign="middle" ><input type="text" name="aval" onBlur="validateaval(this.value)"></td>
		<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="aval_msg"><font color="RED">*</font></span></td>
	</tr>

			<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				<td align="center" valign="middle"  style="background-color:white;width:30%;">医院信息：</td>
				<td align="center" valign="middle" >
					<select name="hno">
						<option value="0">没有医院</option>
						<%
							Iterator<Hospital> iterhospital = DAOFactory.getIHospitalDAOInstance().findAll("").iterator() ;
							while(iterhospital.hasNext()){
								Hospital d = iterhospital.next() ;
							try{
						%>
							<option value="<%=d.gethno()%>"><%=d.getname()%></option>
						<%	
							}
							catch(Exception ex){}
							}
						%>
					</select>
				</td>
				<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="hos_msg"><font color="RED">*</font></span></td>
			</tr>	
<!-- 	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td align="center" valign="middle"  style="background-color:white;width:30%;"><font size="2">所属医院编号：</font></td>
		<td align="center" valign="middle" ><input type="text" name="hno" onBlur="validatehno(this.value)"></td>
		<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="hno_msg"><font color="RED">*</font></span></td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td align="center" valign="middle"  style="background-color:white;width:30%;"><font size="2">所属医院：</font></td>
		<td align="center" valign="middle" ><input type="text" name="name" onBlur="validatename(this.value)"></td>
		<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="name_msg"><font color="RED">*</font></span></td>
	</tr> -->

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