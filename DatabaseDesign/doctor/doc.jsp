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
	
		IDocDAO dao = DAOFactory.getIDocDAOInstance() ;
		List<Doc> all = dao.findAll(keyWord) ;
		
	%>
		<div class="container" style="color:#fff;">
			<h4 style="float:left;"><a style="color:white;cursor:pointer;" title="点击回到主页" href="<%=request.getContextPath()%>/DatabaseDesign/welcome.jsp">首页</a>>医院相关><a style="color:white;cursor:pointer;" href="doc.jsp">医生信息</a></h4>
		
			<table border="1" cellpadding="5" cellspacing="0" id="idData" style="background-color:#F2F2F2;width:100%;height:90%">
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle" style="width:16.6%"><span>医生编号</span></td>
					<td align="center" valign="middle" style="width:16.6%"><span>姓名</span></td>
					<td align="center" valign="middle" style="width:16.6%"><span>医治科目</span></td>
					<td align="center" valign="middle" style="width:16.6%"><span>工作时间</span></td>
					<td align="center" valign="middle" colspan="2" style="width:33.6%"><span>操作</span></td>
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
					<td align="center" valign="middle" style="width:14.5%"><span><a href="doc_update.jsp?docno=<%=doc.getdocno()%>">修改</a></span></td>
					<td align="center" valign="middle" style="width:14.5%"><span><a href="doc_delete_do.jsp?docno=<%=doc.getdocno()%>">删除</span></td>
				</tr>

			<%
				}
			%>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle" colspan="5" style="width:71%"></td>
					<td align="center" valign="middle" colspan="2">
						<a href='doc_insert.jsp' style="font-size:1.2em;width:33.6%">添加信息</a>
					</td>
				</tr>
			</table>
				
		</div>
	</body>
</html>