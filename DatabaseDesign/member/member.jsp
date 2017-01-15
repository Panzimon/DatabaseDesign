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
			if(session.getAttribute("id") != null){
			String testid = session.getAttribute("id").toString();
			IMemberDAO dao = DAOFactory.getIMemberDAOInstance() ;
			Member member = dao.findById(testid);
		
	%>
		<div class="container" style="color:#fff;">
			<h4 style="float:left;"><a style="color:white;cursor:pointer;" title="����ص���ҳ" href="<%=request.getContextPath()%>/DatabaseDesign/welcome.jsp">��ҳ</a>><a style="color:white;cursor:pointer;" href="member.jsp">������Ϣ</a></h4>
		
			<table border="1" cellpadding="5" cellspacing="0" id="idData" style="background-color:#F2F2F2;width:100%;height:50%">
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle" style="width:16.66%"><span>�˺�</span></td>
					<td align="center" valign="middle" style="width:16.66%"><span>�û���</span></td>
					<td align="center" valign="middle" style="width:16.66%"><span>�ܱ�����</span></td>
					<td align="center" valign="middle" style="width:16.66%"><span>�ܱ���</span></td>
					<td align="center" valign="middle" style="width:16.66%"><span>ע������</span></td>
					<td align="center" valign="middle" colspan="2" style="width:16.66%"><span>����</span></td>
				</tr>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				
					<td align="center" valign="middle" style="width:16.66%"><span><%=member.getAccount()%></span></td>
					<td align="center" valign="middle" style="width:16.66%"><span><%=member.getNickname()%></span></td>
					<td align="center" valign="middle" style="width:16.66%"><span><%=member.getSafequestion()%></span></td>
					<td align="center" valign="middle" style="width:16.66%"><span><%=member.getSafestring()%></span></td>
					<td align="center" valign="middle" style="width:16.66%"><span><%=member.getSigndate()%></span></td>
					<td align="center" valign="middle" style="width:16.66%"><span><a href="member_update.jsp?account=<%=member.getAccount()%>">�޸�</a></span></td>
				</tr>

			<%
				}
			%>
			</table>
				
		</div>
		<%
			}catch(Exception exc){
		%>
			<script language="javascript">
				alert("��ر�����������µ�¼��");
				window.location.href='<%=request.getContextPath()%>/DatabaseDesign/member/member.jsp';
			</script>			
		<%
			}
		%>
	</body>
</html>