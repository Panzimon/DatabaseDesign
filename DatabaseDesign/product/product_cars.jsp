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
				function gocheck(){
					window.location = "product_order_list.jsp" ;
				}
		</script>

		<%
			Map<Integer,Integer> cars = (Map<Integer,Integer>) session.getAttribute("allpid") ;
			if(cars != null) {
				Set<Integer> key = cars.keySet() ;	
		%>

		<div class="container" style="color:#fff;"> 
			<h4 style="float:left;"><a style="color:white;cursor:pointer;" title="点击回到主页" href="<%=request.getContextPath()%>/DatabaseDesign/welcome.jsp">首页</a>><a style="color:white;cursor:pointer;" href="product.jsp">网上药店</a>><a style="color:white;cursor:pointer;" href="product_cars.jsp">购物车商品列表</a></h4>
			
			<form action="update_car.jsp" method="post">
				
				<table border="1" cellpadding="5" cellspacing="0" style="background-color:#F2F2F2;width:100%;height:90%">
					<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
						<td align="center" valign="middle"><span class="style10" style="font-size:1.1em;">编号</span></td>
						<td align="center" valign="middle"><span class="style10" style="font-size:1.1em;">名称</span></td>
						<td align="center" valign="middle"><span class="style10" style="font-size:1.1em;">价格</span></td>
						<td align="center" valign="middle"><span class="style10" style="font-size:1.1em;">数量</span></td>
						<td align="center" valign="middle"><span class="style10" style="font-size:1.1em;">简介</span></td>
						<td align="center" valign="middle"><span class="style10" style="font-size:1.1em;">购买数量</span></td>
						<td align="center" valign="middle"><span class="style10" style="font-size:1.1em;">操作</span></td>
					</tr>
				<%
					try{
						List<Product> all = DAOFactory.getIProductDAOInstance().findAll(key) ;
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
						<td align="center" valign="middle"><span class="style6">
							<input type="text" name="<%=pro.getPid()%>" value="<%=cars.get(pro.getPid())%>" size="3" maxlength="3">
						</td>
						<td align="center" valign="middle"><span class="style6"><a href="delete_car.jsp?pid=<%=pro.getPid()%>"  id="del" style="font-size:1.1em;">删除本商品</a></span></td>
					</tr>
				<%
							}
					if(all.size() == 0){
				%>
					<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
						<td align="center" valign="middle" colspan="6"><span class="style6">暂时没有购买任何商品！</span></td>
					</tr>
				<%
					} else {
				%>
					<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
						<td align="center" valign="middle" colspan="2" style="font-size:1.2em;"></td>
						<td align="center" valign="middle" colspan="3">
							<span class="style6">
								<input type="submit" value="修改数量" style="font-size:1.2em;">
								<input type="button" value="去结算" onclick="gocheck()" style="margin:0 1.2em;font-size:1.2em;">
							</span>
						</td>
						<td align="center" valign="middle" colspan="2" style="font-size:1.2em;"><span class="style6"><a href="product.jsp" style="font-size:1.3em;" id="back">返回药品列表</a></span></td>
					</tr>
				<%
					}
					
				
					}catch(Exception e){
				%>
						<script language="javascript">
							alert("操作失误，请先购物并点击‘修改数量’再进行操作");
							window.location.href='product.jsp';
						</script>
				<%
					}
				%>
				<%
				%>
				</table>
				</form>
				<%
				} else {
				%>
					<script language="javascript">
						alert("您暂时没有购买任何商品！");
						window.location.href='product.jsp';
					</script>
				<%
				}
				%>
			</form>

		</div>
	</body>
</html>