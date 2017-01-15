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
	
		IDeptDAO dao = DAOFactory.getIDeptDAOInstance() ;
		List<Dept> all = dao.findAll(keyWord) ;
		
	%>
		<div class="container" style="color:#fff;">
			<h4 style="float:left;"><a style="color:white;cursor:pointer;" title="����ص���ҳ" href="<%=request.getContextPath()%>/DatabaseDesign/welcome.jsp">��ҳ</a>>ҽԺ���><a style="color:white;cursor:pointer;" href="dept.jsp">�����б�</a></h4>
		
			<table border="1" cellpadding="5" cellspacing="0" id="idData" style="background-color:#F2F2F2;width:100%;height:90%">
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle" style="width:16.6%"><span>���</span></td>
					<td align="center" valign="middle" style="width:16.6%"><span>����</span></td>
					<td align="center" valign="middle" style="width:16.6%"><span>λ��</span></td>
					<td align="center" valign="middle" style="width:16.6%"><span>����ҽԺ</span></td>
					<td align="center" valign="middle" colspan="2" style="width:33.6%"><span>����</span></td>
				</tr>
			<%
				Iterator<Dept> iter = all.iterator() ;
				while(iter.hasNext()){
					Dept dept = iter.next() ;
			%>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				
					<td align="center" valign="middle" style="width:16.6%"><span><%=dept.getdeptno()%></span></td>
					<td align="center" valign="middle" style="width:16.6%"><span><%=dept.getdeptname()%></span></td>
					<td align="center" valign="middle" style="width:16.6%"><span><%=dept.getdeptloc()%></span></td>
					<td align="center" valign="middle" style="width:16.6%"><span><%=dept.getname()%></span></td>
					<td align="center" valign="middle" style="width:16.8%"><span><a href="dept_update.jsp?deptno=<%=dept.getdeptno()%>">�޸�</a></span></td>
					<td align="center" valign="middle" style="width:16.8%"><span><a href="dept_delete_do.jsp?deptno=<%=dept.getdeptno()%>">ɾ��</span></td>
				</tr>

			<%
				}
			%>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle" colspan="4" style="width:76.4%"></td>
					<td align="center" valign="middle" colspan="2">
						<a href='dept_insert.jsp' style="margin:0 5em;font-size:1.2em;width:33.6%">�����Ϣ</a>
					</td>
				</tr>
			</table>
				
		</div>
	</body>
</html>