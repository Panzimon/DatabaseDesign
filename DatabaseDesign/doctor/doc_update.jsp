<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="design.vo.*,design.factory.*,design.dao.*" %>

<jsp:include page="../head.jsp"/>

	<script language="javascript">
		function changeColor(obj,color){
			obj.bgColor = color ;
		}
	</script>
		
		<script language="javascript" src="<%=request.getContextPath()%>/js/doc_validate.js">
		</script>
		
		<div class="container" style="color:#fff;"> 

		<%
			int docno = 0 ;
			try {
				docno = Integer.parseInt(request.getParameter("docno")) ;
			
			} catch (Exception e){}
			Doc doc = DAOFactory.getIDocDAOInstance().findById(docno) ;
		%>
		<%
			if(doc != null) {
		%>
		<form action="doc_update_do.jsp" method="post" onSubmit="return validate(this)">
			<table border="1" cellpadding="5" cellspacing="0" style="background-color:#F2F2F2;width:100%;height:90%">
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle"  colspan="3">
						<h1 style="float:left;">修改信息</h1>		
					</td>
				</tr>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle"  style="background-color:white;width:30%;">医生编号：</td>
					<td align="center" valign="middle" ><%=doc.getdocno()%></td>
					<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="docno_msg"><font color="RED">*</font></span></td>
				</tr>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle"  style="background-color:white;width:30%;">姓名：</td>
					<td align="center" valign="middle" ><input type="text" name="name" onBlur="validatename(this.value)" value="<%=doc.getname()%>"></td>
					<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="name_msg"><font color="RED">*</font></span></td>
				</tr>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle"  style="background-color:white;width:30%;">工作时间：</td>
					<td align="center" valign="middle" ><input type="text" name="worktime" onBlur="validateworktime(this.value)" value="<%=doc.getworktime()%>"></td>
					<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="worktime_msg"><font color="RED">*</font></span></td>
				</tr>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				<td align="center" valign="middle"  style="background-color:white;width:30%;">部门信息：</td>
				<td align="center" valign="middle" >
					<select name="deptno">
						<option value="0">没有部门</option>
						<%
							Iterator<Dept> iterdept = DAOFactory.getIDeptDAOInstance().findAll("").iterator() ;
							while(iterdept.hasNext()){
								Dept d = iterdept.next() ;
							try{
						%>
							<option value="<%=d.getdeptno()%>" <%=doc.getdeptno().equals(d.getdeptno())?"SELECTED":""%>><%=d.getdeptname()%></option>
						<%	
							}
							catch(Exception ex){}
							}
						%>
					</select>
				</td>
				<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="dept_msg"><font color="RED">*</font></span></td>
			</tr>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle"  colspan="3">
						<input type="hidden" name="docno" value="<%=doc.getdocno()%>">
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