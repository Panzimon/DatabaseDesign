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
	
		IDocDAO dao = DAOFactory.getIDocDAOInstance() ;
		List<Doc> all = dao.findAll(keyWord) ;
		
	%>
		<div class="container" style="color:#fff;">
			<h4 style="float:left;"><a style="color:white;cursor:pointer;" title="����ص���ҳ" href="<%=request.getContextPath()%>/DatabaseDesign/welcome.jsp">��ҳ</a>>ҽԺ���><a style="color:white;cursor:pointer;" href="doc.jsp">ҽ����Ϣ</a></h4>
		
			<table border="1" cellpadding="5" cellspacing="0" id="idData" style="background-color:#F2F2F2;width:100%;height:90%">
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle" style="width:16.6%"><span>ҽ�����</span></td>
					<td align="center" valign="middle" style="width:16.6%"><span>����</span></td>
					<td align="center" valign="middle" style="width:16.6%"><span>ҽ�ο�Ŀ</span></td>
					<td align="center" valign="middle" style="width:16.6%"><span>����ʱ��</span></td>
					<td align="center" valign="middle" colspan="2" style="width:33.6%"><span>����</span></td>
				</tr>
			<%
				Iterator<Doc> iter = all.iterator() ;
				while(iter.hasNext()){
					Doc doc = iter.next() ;
			%>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				
					<td align="center" valign="middle" style="width:16.6%"><span><%=doc.getdocno()%></span></td>
					<td align="center" valign="middle" style="width:16.6%"><span><%=doc.getname()%></span></td>
					<td align="center" valign="middle" style="width:16.6%"><span><%=doc.getdeptname()%></span></td>
					<td align="center" valign="middle" style="width:16.6%"><span><%=doc.getworktime()%></span></td>
					<td align="center" valign="middle" style="width:14.5%"><span><a href="doc_update.jsp?docno=<%=doc.getdocno()%>">�޸�</a></span></td>
					<td align="center" valign="middle" style="width:14.5%"><span><a href="doc_delete_do.jsp?docno=<%=doc.getdocno()%>">ɾ��</span></td>
				</tr>

			<%
				}
			%>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle" colspan="5" style="width:71%"></td>
					<td align="center" valign="middle" colspan="2">
						<a href='doc_insert.jsp' style="font-size:1.2em;width:33.6%">�����Ϣ</a>
					</td>
				</tr>
			</table>
				
		</div>
	</body>
</html>