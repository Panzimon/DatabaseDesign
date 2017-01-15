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
		String keyWord = request.getParameter("kw") ;
		if(keyWord == null){
			keyWord = "" ;	// ���ģ����ѯû�йؼ��֣����ʾ��ѯȫ��
		}
	%>
	<%
	
		IRoomDAO dao = DAOFactory.getIRoomDAOInstance() ;
		List<Room> all = dao.findAll(keyWord) ;
		
	%>
		<div class="container" style="color:#fff;">
			<h4 style="float:left;"><a style="color:white;cursor:pointer;" title="����ص���ҳ" href="<%=request.getContextPath()%>/DatabaseDesign/welcome.jsp">��ҳ</a>>ҽԺ���><a style="color:white;cursor:pointer;" href="room.jsp">������Ϣ</a></h4>
		
			<table border="1" cellpadding="5" cellspacing="0" id="idData" style="background-color:#F2F2F2;width:100%;height:90%">
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle" style="width:16.6%"><span>����</span></td>
					<td align="center" valign="middle" style="width:16.6%"><span>����¥��</span></td>
					<td align="center" valign="middle" style="width:16.6%"><span>�Ƿ����</span></td>
					<td align="center" valign="middle" style="width:16.6%"><span>����ҽԺ</span></td>
					<td align="center" valign="middle" colspan="2" style="width:33.6%"><span>����</span></td>
				</tr>
			<%
				Iterator<Room> iter = all.iterator() ;
				while(iter.hasNext()){
					Room room = iter.next() ;
			%>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				
					<td align="center" valign="middle" style="width:16.6%"><span><%=room.getrno()%></span></td>
					<td align="center" valign="middle" style="width:16.6%"><span><%=room.getloc()%></span></td>
					<td align="center" valign="middle" style="width:16.6%"><span><%=room.getaval()%></span></td>
					<td align="center" valign="middle" style="width:16.6%"><span><%=room.getname()%></span></td>
					<td align="center" valign="middle" style="width:16.8%"><span><a href="room_update.jsp?rno=<%=room.getrno()%>">�޸�</a></span></td>
					<td align="center" valign="middle" style="width:16.8%"><span><a href="room_delete_do.jsp?rno=<%=room.getrno()%>">ɾ��</span></td>
				</tr>

			<%
				}
			%>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle" colspan="4" style="width:76.4%"></td>
					<td align="center" valign="middle" colspan="2">
						<a href='room_insert.jsp' style="font-size:1.2em;width:33.6%">�����Ϣ</a>
					</td>
				</tr>
			</table>
				
		</div>
	</body>
</html>