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
	
		IDeptDAO dao = DAOFactory.getIDeptDAOInstance() ;
		List<Dept> all = dao.findAll(keyWord) ;
		
	%>
		<div class="container" style="color:#fff;">
			<h4 style="float:left;"><a style="color:white;cursor:pointer;" title="点击回到主页" href="<%=request.getContextPath()%>/DatabaseDesign/welcome.jsp">首页</a>>医院相关><a style="color:white;cursor:pointer;" href="dept.jsp">部门列表</a></h4>
		
			<table border="1" cellpadding="5" cellspacing="0" id="idData" style="background-color:#F2F2F2;width:100%;height:90%">
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle" style="width:16.6%"><span>编号</span></td>
					<td align="center" valign="middle" style="width:16.6%"><span>部门</span></td>
					<td align="center" valign="middle" style="width:16.6%"><span>位置</span></td>
					<td align="center" valign="middle" style="width:16.6%"><span>所属医院</span></td>
					<td align="center" valign="middle" colspan="2" style="width:33.6%"><span>操作</span></td>
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
					<td align="center" valign="middle" style="width:16.8%"><span><a href="dept_update.jsp?deptno=<%=dept.getdeptno()%>">修改</a></span></td>
					<td align="center" valign="middle" style="width:16.8%"><span><a href="dept_delete_do.jsp?deptno=<%=dept.getdeptno()%>">删除</span></td>
				</tr>

			<%
				}
			%>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle" colspan="4" style="width:76.4%"></td>
					<td align="center" valign="middle" colspan="2">
						<a href='dept_insert.jsp' style="margin:0 5em;font-size:1.2em;width:33.6%">添加信息</a>
					</td>
				</tr>
			</table>
				
		</div>
	</body>
</html>