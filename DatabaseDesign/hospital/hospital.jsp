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
			keyWord = "" ;	// 如果模糊查询没有关键字，则表示查询全部
		}
	%>
	<%
	
		IHospitalDAO dao = DAOFactory.getIHospitalDAOInstance() ;
		List<Hospital> all = dao.findAll(keyWord) ;
		
	%>
		<div class="container" style="color:#fff;">
			<h4 style="float:left;"><a style="color:white;cursor:pointer;" title="点击回到主页" href="<%=request.getContextPath()%>/DatabaseDesign/welcome.jsp">首页</a>>医院相关><a style="color:white;cursor:pointer;" href="hospital.jsp">医院信息</a></h4>
		
			<table border="1" cellpadding="5" cellspacing="0" id="idData" style="background-color:#F2F2F2;width:100%;height:90%">
		
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle" style="width:14.2%"><span>编号</span></td>
					<td align="center" valign="middle" style="width:14.2%"><span>医院</span></td>
					<td align="center" valign="middle" style="width:14.2%"><span>地址</span></td>
					<td align="center" valign="middle" style="width:14.2%"><span>电话</span></td>
					<td align="center" valign="middle" style="width:14.2%"><span>邮编</span></td>
					<td align="center" valign="middle" colspan="2" style="width:29%"><span>操作</span></td>
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
					<td align="center" valign="middle" style="width:14.5%"><span><a href="hos_update.jsp?hno=<%=hospital.gethno()%>">修改</a></span></td>
					<td align="center" valign="middle" style="width:14.5%"><span><a href="hos_delete_do.jsp?hno=<%=hospital.gethno()%>">删除</span></td>
				</tr>

			<%
				}
			%>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle" colspan="5" style="width:71%"></td>
					<td align="center" valign="middle" colspan="2">
						<a href='hos_insert.jsp' style="font-size:1.2em;width:29%">添加信息</a>
					</td>
				</tr>
			</table>
				
		</div>
	</body>
</html>