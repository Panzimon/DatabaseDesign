<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="design.vo.*,design.factory.*,design.dao.*" %>
<%@ page import="java.util.*" %>

<jsp:include page="../head.jsp"/>

	<script language="javascript">
		function changeColor(obj,color){
			obj.bgColor = color ;
		}
	</script>
		

	<%
		try{
		IBookingDAO dao1 = DAOFactory.getIBookingDAOInstance() ;
		List<Booking> all = dao1.findAll();
	%>
		<div class="container" style="color:#fff;">
			<h4 style="float:left;"><a style="color:white;cursor:pointer;" title="点击回到主页" href="<%=request.getContextPath()%>/DatabaseDesign/welcome.jsp">首页</a>><a style="color:white;cursor:pointer;" href="regist_list.jsp">挂号信息</a></h4>
		
			<table border="1" cellpadding="5" cellspacing="0" id="idData" style="background-color:#F2F2F2;width:100%;height:90%">
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle" style="width:14.28%"><span>病人编号</span></td>
					<td align="center" valign="middle" style="width:14.28%"><span>病人姓名</span></td>
					<td align="center" valign="middle" style="width:14.28%"><span>病人年龄</span></td>
					<td align="center" valign="middle" style="width:14.28%"><span>挂号部门</span></td>
					<td align="center" valign="middle" style="width:14.28%"><span>挂号医生</span></td>
					<td align="center" valign="middle" style="width:14.28%"><span>预约日期</span></td>
					<td align="center" valign="middle" colspan="2" style="width:14.28%"><span>操作</span></td>
				</tr>
			<%
				Iterator<Booking> iter = all.iterator() ;
				while(iter.hasNext()){
					Booking booking = iter.next() ;
					IDocDAO dao2 = DAOFactory.getIDocDAOInstance() ;
					Doc doc = dao2.findById(new Integer(booking.getdocno()));
			%>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				
					<td align="center" valign="middle" style="width:14.28%"><span><%=booking.getpno()%></span></td>
					<td align="center" valign="middle" style="width:14.28%"><span><%=booking.getpname()%></span></td>
					<td align="center" valign="middle" style="width:14.28%"><span><%=booking.getage()%></span></td>
					<td align="center" valign="middle" style="width:14.28%"><span><%=doc.getdeptname()%></span></td>
					<td align="center" valign="middle" style="width:14.28%"><span><%=doc.getname()%></span></td>
					<td align="center" valign="middle" style="width:14.28%"><span><%=booking.getdate()%></span></td>
					<td align="center" valign="middle" style="width:14.28%"><span><a href="regist_delete_do.jsp?pno=<%=booking.getpno()%>&deptno=<%=booking.getdeptno()%>">删除</span></td>
				</tr>
			<%
				}
			%>
			</table>
			<%
				}catch(Exception e){
			%>
					
				<script language="javascript">
					alert("请检查电脑配置！");
					window.location.href='<%=request.getContextPath()%>/DatabaseDesign/patient/patient.jsp';
				</script>		
			<%
				}
			%>
		</div>
	</body>
</html>