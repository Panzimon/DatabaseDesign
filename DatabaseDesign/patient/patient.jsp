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
		IPatDAO dao = DAOFactory.getIPatDAOInstance() ;
		List<Pat> all = dao.find();
		
	%>
		<div class="container" style="color:#fff;">
			<h4 style="float:left;"><a style="color:white;cursor:pointer;" title="����ص���ҳ" href="<%=request.getContextPath()%>/DatabaseDesign/welcome.jsp">��ҳ</a>><a style="color:white;cursor:pointer;" href="patient.jsp">������Ϣ</a></h4>
		
			<table border="1" cellpadding="5" cellspacing="0" id="idData" style="background-color:#F2F2F2;width:100%;height:90%">
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle" style="width:16.7%"><span>���</span></td>
					<td align="center" valign="middle" style="width:16.7%"><span>����</span></td>
					<td align="center" valign="middle" style="width:16.7%"><span>����</span></td>
					<td align="center" valign="middle" style="width:16.7%"><span>���һ�ο�������</span></td>
					<td align="center" valign="middle" colspan="2" style="width:33.3%"><span>����</span></td>
				</tr>
			<%
				Iterator<Pat> iter = all.iterator() ;
				while(iter.hasNext()){
					Pat pat = iter.next() ;
			%>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				
					<td align="center" valign="middle" style="width:16.7%"><span><%=pat.getpno()%></span></td>
					<td align="center" valign="middle" style="width:16.7%"><span><%=pat.getpname()%></span></td>
					<td align="center" valign="middle" style="width:16.7%"><span><%=pat.getage()%></span></td>
					<td align="center" valign="middle" style="width:16.7%"><span><%=pat.getlastdate()%></span></td>
					<td align="center" valign="middle" style="width:16.7%"><span><a href="pat_update.jsp?pno=<%=pat.getpno()%>">�޸�</a></span></td>
					<td align="center" valign="middle" style="width:16.7%"><span><a href="pat_delete_do.jsp?pno=<%=pat.getpno()%>">ɾ��</span></td>
				</tr>

			<%
				}
			%>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle" colspan="4" style="width:66.7%"></td>
					<td align="center" valign="middle" colspan="2">
						<a href='pat_insert.jsp' style="font-size:1.2em;width:33.3%">�����Ϣ</a>
					</td>
				</tr>
			</table>
			<%
				}catch(Exception e){
			%>
					
				<script language="javascript">
					alert("����������ã�");
					window.location.href='<%=request.getContextPath()%>/DatabaseDesign/patient/patient.jsp';
				</script>		
			<%
				}
			%>
		</div>
	</body>
</html>