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

		<div class="container" style="color:#fff;"> 
			<h4 style="float:left;"><a style="color:white;cursor:pointer;" title="点击回到主页" href="<%=request.getContextPath()%>/DatabaseDesign/welcome.jsp">首页</a>><a style="color:white;cursor:pointer;" href="product.jsp">网上药店</a>><a style="color:white;cursor:pointer;" href="product_order_list.jsp">结算清单</a></h4>
		<%
			Map<Integer,Integer> cars = (Map<Integer,Integer>) session.getAttribute("allpid") ;
			if(cars != null) {
				Set<Integer> key = cars.keySet() ;	// 取得全部的key
		%>
			<form action="finish.jsp" method="post">
				<table border="1" cellpadding="5" cellspacing="0" style="background-color:#F2F2F2;width:100%;height:90%">
					<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
						<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')" >
							<td colspan="6">购买商品信息</td>
						</tr>
					</tr>
					<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
						<td align="center" valign="middle"><span class="style10" style="font-size:1.1em;">编号</span></td>
						<td align="center" valign="middle"><span class="style10" style="font-size:1.1em;">名称</span></td>
						<td align="center" valign="middle"><span class="style10" style="font-size:1.1em;">价格</span></td>
						<td align="center" valign="middle"><span class="style10" style="font-size:1.1em;">数量</span></td>
						<td align="center" valign="middle"><span class="style10" style="font-size:1.1em;">简介</span></td>
						<td align="center" valign="middle"><span class="style10" style="font-size:1.1em;">数量</span></td>
					</tr>
				<%
					double sum = 0.0 ;
					List<Product> all = DAOFactory.getIProductDAOInstance().findAll(key) ;
					Iterator<Product> iter = all.iterator() ;
					while(iter.hasNext()){
						Product pro = iter.next() ;
						sum += pro.getPrice() * cars.get(pro.getPid()) ;
				%>
					<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
						<td align="center" valign="middle"><span class="style6"><%=pro.getPid()%></span></td>
						<td align="center" valign="middle"><span class="style6"><%=pro.getName()%></span></td>
						<td align="center" valign="middle"><span class="style6"><%=pro.getPrice()%></span></td>
						<td align="center" valign="middle"><span class="style6"><%=pro.getAmount()%></span></td>
						<td align="center" valign="middle"><span class="style6"><%=pro.getNote()%></span></td>
						<td align="center" valign="middle">
							<span class="style6" name="<%=pro.getPid()%>" style="font-size:1.1em;">
								<%=cars.get(pro.getPid())%>
							</span>
						</td>
					</tr>
				<%
					}
				%>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
						<td align="center" valign="middle" colspan="3"><span class="style6" style="font-size:1.2em;">总价钱：<%=MyMath.round(sum,2)%></td>
						<td align="center" valign="middle" colspan="3"><input type="submit" value="交易完成~" style="font-size:1.2em;"></td> 
					</tr>
				</table>
			</form>
		<%
			}
		%>
		</div>
	</body>
</html>