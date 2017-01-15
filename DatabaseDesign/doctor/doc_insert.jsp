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


	<script language="javascript" src="<%=request.getContextPath()%>/js/doc_validate.js">
	</script>
	
<div class="container" style="color:#fff;">
<form action="doc_insert_do.jsp" method="post" onSubmit="return validate(this)">
<table border="1" cellpadding="5" cellspacing="0" id="idData" style="background-color:#F2F2F2;width:100%;height:90%">
	<tr style="background-color:white;">
		<td align="center" valign="middle"  colspan="3">
			<h1 style="float:left;">��Ϣ���</h1>			
		</td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td align="center" valign="middle"  style="background-color:white;width:30%;">ҽ����ţ�</td>
		<td align="center" valign="middle" ><input type="text" name="docno" size="5" maxlength="5" onBlur="validatedocno(this.value)"></td>
		<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="docno_msg"><font color="RED">*</font></span></td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td align="center" valign="middle"  style="background-color:white;width:30%;">������</td>
		<td align="center" valign="middle" ><input type="text" name="name" onBlur="validatename(this.value)"></td>
		<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="name_msg"><font color="RED">*</font></span></td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td align="center" valign="middle"  style="background-color:white;width:30%;">����ʱ�䣺</td>
		<td align="center" valign="middle" ><input type="text" name="worktime" onBlur="validateworktime(this.value)"></td>
		<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="worktime_msg"><font color="RED">*</font></span></td>
	</tr>

			<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				<td align="center" valign="middle"  style="background-color:white;width:30%;">����������Ϣ��</td>
				<td align="center" valign="middle" >
					<select name="deptno">
						<option value="0">û�в���</option>
						<%
							Iterator<Dept> iterdept = DAOFactory.getIDeptDAOInstance().findAll("").iterator() ;
							while(iterdept.hasNext()){
								Dept d = iterdept.next() ;
							try{
						%>
							<option value="<%=d.getdeptno()%>"><%=d.getdeptname()%></option>
						<%	
							}
							catch(Exception ex){}
							}
						%>
					</select>
				</td>
				<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="dept_msg"><font color="RED">*</font></span></td>
			</tr>	
<!-- 	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td align="center" valign="middle"  style="background-color:white;width:30%;">����ҽԺ��ţ�</font></td>
		<td align="center" valign="middle" ><input type="text" name="hno" onBlur="validatehno(this.value)"></td>
		<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="hno_msg"><font color="RED">*</font></span></td>
	</tr>
	<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
		<td align="center" valign="middle"  style="background-color:white;width:30%;">����ҽԺ��</font></td>
		<td align="center" valign="middle" ><input type="text" name="name" onBlur="validatename(this.value)"></td>
		<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="name_msg"><font color="RED">*</font></span></td>
	</tr> -->

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