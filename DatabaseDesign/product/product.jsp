<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.util.*" %>
<%@ page import="design.dao.*" %>
<%@ page import="design.vo.*" %>
<%@ page import="design.factory.*" %>

<jsp:include page="../head.jsp"/>
		<style type="text/css">
		<!--
		.style6 {font-size: 12px}
		.style10 {font-size: 14px; font-weight: bold; }
		-->
		</style>
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
		IProductDAO dao = DAOFactory.getIProductDAOInstance() ;
		List<Product> all = dao.findAll(keyWord) ;
	%>
		<div class="container" style="color:#fff;"> 
			<h4 style="float:left;"><a style="color:white;cursor:pointer;" title="����ص���ҳ" href="<%=request.getContextPath()%>/DatabaseDesign/welcome.jsp">��ҳ</a>><a style="color:white;cursor:pointer;" href="product.jsp">����ҩ��</a></h4>
			
			<table border="1" cellpadding="5" cellspacing="0" style="background-color:#F2F2F2;width:100%;height:90%">
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle"><span class="style10" style="font-size:1.1em;">���</span></td>
					<td align="center" valign="middle"><span class="style10" style="font-size:1.1em;">����</span></td>
					<td align="center" valign="middle"><span class="style10" style="font-size:1.1em;">�۸�</span></td>
					<td align="center" valign="middle"><span class="style10" style="font-size:1.1em;">����</span></td>
					<td align="center" valign="middle"><span class="style10" style="font-size:1.1em;">���</span></td>
					<td align="center" valign="middle"><span class="style10" style="font-size:1.1em;">����</span></td>
				</tr>
			<%
				Iterator<Product> iter = all.iterator() ;
				while(iter.hasNext()){
					Product pro = iter.next() ;
			%>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle"><span class="style6"><%=pro.getPid()%></span></td>
					<td align="center" valign="middle"><span class="style6"><%=pro.getName()%></span></td>
					<td align="center" valign="middle"><span class="style6"><%=pro.getPrice()%></span></td>
					<td align="center" valign="middle"><span class="style6"><%=pro.getAmount()%></span></td>
					<td align="center" valign="middle"><span class="style6"><%=pro.getNote()%></span></td>
					<td align="center" valign="middle"><span class="style6"><a href="add_car.jsp?pid=<%=pro.getPid()%>" target="_ablank" style="font-size:1.3em;">���ӵ����ﳵ</a></span></td>
				</tr>
			<%
				}
			%>
			
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td colspan="5"></td>
					<td colspan="2" align="center" valign="middle"><a href="product_cars.jsp" target="_ablank" style="font-size:1.2em;">���ﳵ</a></td>
				</tr>
				
			</table>
		</div>
	</body>
</html>