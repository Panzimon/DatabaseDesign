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
						<h1 style="float:left;">�޸���Ϣ</h1>		
					</td>
				</tr>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle"  style="background-color:white;width:30%;">���ţ�</td>
					<td align="center" valign="middle" ><%=room.getrno()%></td>
					<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="rno_msg"><font color="RED">*</font></span></td>
				</tr>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle"  style="background-color:white;width:30%;">����¥����</td>
					<td align="center" valign="middle" ><input type="text" name="loc" onBlur="validateloc(this.value)" value="<%=room.getloc()%>"></td>
					<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="loc_msg"><font color="RED">*</font></span></td>
				</tr>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle"  style="background-color:white;width:30%;">�Ƿ���ࣺ</td>
					<td align="center" valign="middle" ><input type="text" name="aval" onBlur="validateaval(this.value)" value="<%=room.getaval()%>"></td>
					<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="aval_msg"><font color="RED">*</font></span></td>
				</tr>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				<td align="center" valign="middle"  style="background-color:white;width:30%;">ҽԺ��Ϣ��</td>
				<td align="center" valign="middle" >
					<select name="hno">
						<option value="0">û��ҽԺ</option>
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
						<button type="submit" class="btn btn-primary" style="float:right;display:inline-block;margin:0 1em;">�޸�</button>
						<button type="reset" class="btn btn-primary" style="float:right;display:inline-block;margin:0 1em;">����</button>	
					</td>
				</tr>
			</table>
		</form>
		<%
			} else {
		%>
				<script language="javascript">
					alert("û�д˷������Ϣ��") ;
				</script>
		<%		
			}
		%>
		</div>
	</body>
</html>