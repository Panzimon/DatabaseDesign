<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="design.vo.*,design.factory.*,design.dao.*" %>

<jsp:include page="../head.jsp"/>

	<script language="javascript">
		function changeColor(obj,color){
			obj.bgColor = color ;
		}
	</script>
		
		
		<script language="javascript" src="<%=request.getContextPath()%>/js/room_validate.js">
		</script>
		
		<div class="container" style="color:#fff;"> 

		<%
			int rno = 0 ;
			try {
				rno = Integer.parseInt(request.getParameter("rno")) ;
			
			} catch (Exception e){}
			Room room = DAOFactory.getIRoomDAOInstance().findById(rno) ;
		%>
		<%
			if(room != null) {
		%>
		<form action="room_update_do.jsp" method="post" onSubmit="return validate(this)">
			<table border="1" cellpadding="5" cellspacing="0" style="background-color:#F2F2F2;width:100%;height:90%">
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle"  align="center" valign="middle"  colspan="3">
						<h1 style="float:left;">修改信息</h1>		
					</td>
				</tr>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle"  style="background-color:white;width:30%;">房号：</td>
					<td align="center" valign="middle" ><%=room.getrno()%></td>
					<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="rno_msg"><font color="RED">*</font></span></td>
				</tr>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle"  style="background-color:white;width:30%;">所属楼区：</td>
					<td align="center" valign="middle" ><input type="text" name="loc" onBlur="validateloc(this.value)" value="<%=room.getloc()%>"></td>
					<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="loc_msg"><font color="RED">*</font></span></td>
				</tr>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle"  style="background-color:white;width:30%;">是否空余：</td>
					<td align="center" valign="middle" ><input type="text" name="aval" onBlur="validateaval(this.value)" value="<%=room.getaval()%>"></td>
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
							<option value="<%=d.gethno()%>" <%=room.gethno().equals(d.gethno())?"SELECTED":""%>><%=d.getname()%></option>
						<%	
							}
							catch(Exception ex){}
							}
						%>
					</select>
				</td>
				<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="hos_msg"><font color="RED">*</font></span></td>
			</tr>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle"  colspan="3">
						<input type="hidden" name="rno" value="<%=room.getrno()%>">
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
					alert("没有此房间的信息！") ;
				</script>
		<%		
			}
		%>
		</div>
	</body>
</html>