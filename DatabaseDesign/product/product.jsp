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
			keyWord = "" ;	// 如果模糊查询没有关键字，则表示查询全部
		}
	%>
	<%
		IProductDAO dao = DAOFactory.getIProductDAOInstance() ;
		List<Product> all = dao.findAll(keyWord) ;
	%>
		<div class="container" style="color:#fff;"> 
			<h4 style="float:left;"><a style="color:white;cursor:pointer;" title="点击回到主页" href="<%=request.getContextPath()%>/DatabaseDesign/welcome.jsp">首页</a>><a style="color:white;cursor:pointer;" href="product.jsp">网上药店</a></h4>
			
			<table border="1" cellpadding="5" cellspacing="0" style="background-color:#F2F2F2;width:100%;height:90%">
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle"><span class="style10" style="font-size:1.1em;">编号</span></td>
					<td align="center" valign="middle"><span class="style10" style="font-size:1.1em;">名称</span></td>
					<td align="center" valign="middle"><span class="style10" style="font-size:1.1em;">价格</span></td>
					<td align="center" valign="middle"><span class="style10" style="font-size:1.1em;">数量</span></td>
					<td align="center" valign="middle"><span class="style10" style="font-size:1.1em;">简介</span></td>
					<td align="center" valign="middle"><span class="style10" style="font-size:1.1em;">购买</span></td>
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
					<td align="center" valign="middle"><span class="style6"><a href="add_car.jsp?pid=<%=pro.getPid()%>" target="_ablank" style="font-size:1.3em;">增加到购物车</a></span></td>
				</tr>
			<%
				}
			%>
			
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td colspan="5"></td>
					<td colspan="2" align="center" valign="middle"><a href="product_cars.jsp" target="_ablank" style="font-size:1.2em;">购物车</a></td>
				</tr>
				
			</table>
		</div>
	</body>
</html>