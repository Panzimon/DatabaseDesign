<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="design.vo.*,design.factory.*,design.dao.*" %>

<jsp:include page="../head.jsp"/>

	<script language="javascript">
		function changeColor(obj,color){
			obj.bgColor = color ;
		}
	</script>
	
		<script language="javascript" src="<%=request.getContextPath()%>/js/hos_validate.js">
		</script>
		
		<div class="container" style="color:#fff;"> 

		<%
			int hno = 0 ;
			try {
				hno = Integer.parseInt(request.getParameter("hno")) ;
			
			} catch (Exception e){}
			Hospital hospital = DAOFactory.getIHospitalDAOInstance().findById(hno) ;
		%>
		<%
			if(hospital != null) {
		%>
		<form action="hos_update_do.jsp" method="post" onSubmit="return validate(this)">
		
		<table border="1" cellpadding="5" cellspacing="0" style="background-color:#F2F2F2;width:100%;height:90%">
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle"  colspan="3">
						<h1 style="float:left;">修改信息</h1>		
					</td>
				</tr>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle"  style="background-color:white;width:30%;">编号：</td>
					<td align="center" valign="middle" ><%=hospital.gethno()%></td>
					<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="hno_msg"><font color="RED">*</font></span></td>
				</tr>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle"  style="background-color:white;width:30%;">医院：</td>
					<td align="center" valign="middle" ><input type="text" name="name" onBlur="validatename(this.value)" value="<%=hospital.getname()%>"></td>
					<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="name_msg"><font color="RED">*</font></span></td>
				</tr>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle"  style="background-color:white;width:30%;">地址：</td>
					<td align="center" valign="middle" ><input type="text" name="address" onBlur="validateaddress(this.value)" value="<%=hospital.getaddress()%>"></td>
					<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="address_msg"><font color="RED">*</font></span></td>
				</tr>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle"  style="background-color:white;width:30%;">电话：</td>
					<td align="center" valign="middle" ><input type="text" name="tel" onBlur="validatetel(this.value)" maxlength="8" value="<%=hospital.gettel()%>"></td>
					<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="tel_msg"><font color="RED">*</font></span></td>
				</tr>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle"  style="background-color:white;width:30%;">邮编：</td>
					<td align="center" valign="middle" ><input type="text" name="zipcode" onBlur="validatezipcode(this.value)" size="5" maxlength="5" value="<%=hospital.getzipcode()%>"></td>
					<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="zipcode_msg"><font color="RED">*</font></span></td>
				</tr>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle"  colspan="3">
						<input type="hidden" name="hno" value="<%=hospital.gethno()%>">
						<button type="submit" class="btn btn-primary" style="float:right;display:inline-block;margin:0 1em;">修改</button>
						<button type="reset" class="btn btn-primary" style="float:right;display:inline-block;margin:0 1em;">重置</button>	
					</td>
				</tr>
			</table>
		</form>
		<%
			} else {
		%>
				<script language="javascript">
					alert("没有此医院的信息！") ;
				</script>
		<%		
			}
		%>
		</div>
	</body>
</html>