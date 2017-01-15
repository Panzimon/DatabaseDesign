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
	
		IHospitalDAO dao = DAOFactory.getIHospitalDAOInstance() ;
		List<Hospital> all = dao.findAll(keyWord) ;
		
	%>
		<div class="container" style="color:#fff;">
			<h4 style="float:left;"><a style="color:white;cursor:pointer;" title="����ص���ҳ" href="<%=request.getContextPath()%>/DatabaseDesign/welcome.jsp">��ҳ</a>>ҽԺ���><a style="color:white;cursor:pointer;" href="hospital.jsp">ҽԺ��Ϣ</a></h4>
		
			<table border="1" cellpadding="5" cellspacing="0" id="idData" style="background-color:#F2F2F2;width:100%;height:90%">
		
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle" style="width:14.2%"><span>���</span></td>
					<td align="center" valign="middle" style="width:14.2%"><span>ҽԺ</span></td>
					<td align="center" valign="middle" style="width:14.2%"><span>��ַ</span></td>
					<td align="center" valign="middle" style="width:14.2%"><span>�绰</span></td>
					<td align="center" valign="middle" style="width:14.2%"><span>�ʱ�</span></td>
					<td align="center" valign="middle" colspan="2" style="width:29%"><span>����</span></td>
				</tr>
			<%
				Iterator<Hospital> iter = all.iterator() ;
				while(iter.hasNext()){
					Hospital hospital = iter.next() ;
			%>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				
					<td align="center" valign="middle" style="width:14.2%"><span><%=hospital.gethno()%></span></td>
					<td align="center" valign="middle" style="width:14.2%"><span><%=hospital.getname()%></span></td>
					<td align="center" valign="middle" style="width:14.2%"><span><%=hospital.getaddress()%></span></td>
					<td align="center" valign="middle" style="width:14.2%"><span><%=hospital.gettel()%></span></td>
					<td align="center" valign="middle" style="width:14.2%"><span><%=hospital.getzipcode()%></span></td>
					<td align="center" valign="middle" style="width:14.5%"><span><a href="hos_update.jsp?hno=<%=hospital.gethno()%>">�޸�</a></span></td>
					<td align="center" valign="middle" style="width:14.5%"><span><a href="hos_delete_do.jsp?hno=<%=hospital.gethno()%>">ɾ��</span></td>
				</tr>

			<%
				}
			%>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle" colspan="5" style="width:71%"></td>
					<td align="center" valign="middle" colspan="2">
						<a href='hos_insert.jsp' style="font-size:1.2em;width:29%">�����Ϣ</a>
					</td>
				</tr>
			</table>
				
		</div>
	</body>
</html>