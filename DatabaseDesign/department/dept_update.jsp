<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="design.vo.*,design.factory.*,design.dao.*" %>

<jsp:include page="../head.jsp"/>
		
		<script language="javascript">
			function changeColor(obj,color){
				obj.bgColor = color ;
			}
		</script>
		
		<script language="javascript" src="<%=request.getContextPath()%>/js/dept_validate.js">
		</script>
		
		<div class="container" style="color:#fff;">

		<%
			int deptno = 0 ;
			try {
				deptno = Integer.parseInt(request.getParameter("deptno")) ;
			
			} catch (Exception e){}
			Dept dept = DAOFactory.getIDeptDAOInstance().findById(deptno) ;
		%>
		<%
			if(dept != null) {
		%>
		<form action="dept_update_do.jsp" method="post" onSubmit="return validate(this)">
			<table border="1" cellpadding="5" cellspacing="0" style="background-color:#F2F2F2;width:100%;height:90%">
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" colspan="3">
						<h1 style="float:left;margin:1em;">修改信息</h1>		
					</td>
				</tr>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle" style="background-color:white;width:30%;">编号：</td>
					<td align="center" valign="middle" ><%=dept.getdeptno()%></td>
					<td align="center" valign="middle" style="background-color:white;width:30%;"><span id="deptno_msg"><font color="RED">*</font></span></td>
				</tr>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle" style="background-color:white;width:30%;">部门：</td>
					<td align="center" valign="middle" ><input type="text" name="deptname" onBlur="validatedeptname(this.value)" value="<%=dept.getdeptname()%>"></td>
					<td align="center" valign="middle" style="background-color:white;width:30%;"><span id="deptname_msg"><font color="RED">*</font></span></td>
				</tr>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle" style="background-color:white;width:30%;">位置：</td>
					<td align="center" valign="middle" ><input type="text" name="deptloc" onBlur="validatedeptloc(this.value)" value="<%=dept.getdeptloc()%>"></td>
					<td align="center" valign="middle" style="background-color:white;width:30%;"><span id="deptloc_msg"><font color="RED">*</font></span></td>
				</tr>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				<td align="center" valign="middle" style="background-color:white;width:30%;">医院信息：</td>
				<td align="center" valign="middle" >
					<select name="hno">
						<option value="0">没有医院</option>
						<%
							Iterator<Hospital> iterhospital = DAOFactory.getIHospitalDAOInstance().findAll("").iterator() ;
							while(iterhospital.hasNext()){
								Hospital d = iterhospital.next() ;
							try{
						%>
							<option value="<%=d.gethno()%>" <%=dept.gethno().equals(d.gethno())?"SELECTED":""%>><%=d.getname()%></option>
						<%	
							}
							catch(Exception ex){}
							}
						%>
					</select>
				</td>
				<td align="center" valign="middle" style="background-color:white;width:30%;"><span id="hos_msg"><font color="RED">*</font></span></td>
			</tr>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle" colspan="3">
						<input type="hidden" name="deptno" value="<%=dept.getdeptno()%>">
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
					alert("没有此部门的信息！") ;
				</script>
		<%		
			}
		%>
		</div>
	</body>
</html>