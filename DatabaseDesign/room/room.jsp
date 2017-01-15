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
	
		IRoomDAO dao = DAOFactory.getIRoomDAOInstance() ;
		List<Room> all = dao.findAll(keyWord) ;
		
	%>
		<div class="container" style="color:#fff;">
			<h4 style="float:left;"><a style="color:white;cursor:pointer;" title="点击回到主页" href="<%=request.getContextPath()%>/DatabaseDesign/welcome.jsp">首页</a>>医院相关><a style="color:white;cursor:pointer;" href="room.jsp">病房信息</a></h4>
		
			<table border="1" cellpadding="5" cellspacing="0" id="idData" style="background-color:#F2F2F2;width:100%;height:90%">
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle" style="width:16.6%"><span>房号</span></td>
					<td align="center" valign="middle" style="width:16.6%"><span>所属楼区</span></td>
					<td align="center" valign="middle" style="width:16.6%"><span>是否空余</span></td>
					<td align="center" valign="middle" style="width:16.6%"><span>所属医院</span></td>
					<td align="center" valign="middle" colspan="2" style="width:33.6%"><span>操作</span></td>
				</tr>
			<%
				Iterator<Room> iter = all.iterator() ;
				while(iter.hasNext()){
					Room room = iter.next() ;
			%>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				
					<td align="center" valign="middle" style="width:16.6%"><span><%=room.getrno()%></span></td>
					<td align="center" valign="middle" style="width:16.6%"><span><%=room.getloc()%></span></td>
					<td align="center" valign="middle" style="width:16.6%"><span><%=room.getaval()%></span></td>
					<td align="center" valign="middle" style="width:16.6%"><span><%=room.getname()%></span></td>
					<td align="center" valign="middle" style="width:16.8%"><span><a href="room_update.jsp?rno=<%=room.getrno()%>">修改</a></span></td>
					<td align="center" valign="middle" style="width:16.8%"><span><a href="room_delete_do.jsp?rno=<%=room.getrno()%>">删除</span></td>
				</tr>

			<%
				}
			%>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle" colspan="4" style="width:76.4%"></td>
					<td align="center" valign="middle" colspan="2">
						<a href='room_insert.jsp' style="font-size:1.2em;width:33.6%">添加信息</a>
					</td>
				</tr>
			</table>
				
		</div>
	</body>
</html>