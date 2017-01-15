<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="design.vo.*,design.factory.*,design.dao.*" %>
<%@ page import="java.util.*" %>

<jsp:include page="../head.jsp"/>

	<script language="javascript">
		function changeColor(obj,color){
			obj.bgColor = color ;
		}
	</script>
		
		<div class="container" style="color:#fff;">
			<div class="container" style="margin-bottom:1em;">
				<div style="float:left;">
					<a style="color:white;cursor:pointer;" title="点击回到主页" href="<%=request.getContextPath()%>/DatabaseDesign/welcome.jsp">首页</a>><a style="color:white;cursor:pointer;" href="patient.jsp">挂号登记</a>
				</div>
			</div>
			<div class="container">
				<form action="registration.jsp" method="post" class="form-horizontal" style="width:60%;font-size:1.2em;">
					<div class="form-group">
						<label for="question" class="control-label">请输入病人名字或号码：</label>
						<div style="margin:1em;">
							<input type="text" class="form-control" id="question" placeholder="Patient's Name or Number" name="kw">
						</div>
						<div>
							<a href="../patient/pat_insert.jsp" style="color:white;cursor:pointer;">
								若找不到病人信息请点击此处添加
							</a>
						</div>
						<button type="submit" class="btn btn-primary">确定</button>
					</div>
				</form>
			</div>
	<%
		try{
			String keyWord = request.getParameter("kw") ;
			if(keyWord == null){
				keyWord = "" ;	// 如果模糊查询没有关键字，则表示查询全部
			}
			IPatDAO dao = DAOFactory.getIPatDAOInstance() ;
			List<Pat> all = dao.findAll(keyWord);
	%>
		<form action="doRegist.jsp" method="post">
			<table border="1" cellpadding="5" cellspacing="0" id="idData" style="background-color:#F2F2F2;width:100%;height:90%">
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle" style="width:16.7%"><span>编号</span></td>
					<td align="center" valign="middle" style="width:16.7%"><span>姓名</span></td>
					<td align="center" valign="middle" style="width:16.7%"><span>年龄</span></td>
					<td align="center" valign="middle" style="width:16.7%"><span>最近一次看病日期</span></td>
					<td align="center" valign="middle" colspan="2" style="width:33.3%"><span>操作</span></td>
				</tr>
			<%
				Iterator<Pat> iter = all.iterator() ;
				while(iter.hasNext()){
					Pat pat = iter.next() ;
			%>
				<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
					<td align="center" valign="middle" style="width:16.7%"><span><%=pat.getpno()%></span></td>
					<td align="center" valign="middle" style="width:16.7%"><span><%=pat.getpname()%></span></td>
					<td align="center" valign="middle" style="width:16.7%"><span><%=pat.getage()%></span></td>
					<td align="center" valign="middle" style="width:16.7%"><span><%=pat.getlastdate()%></span></td>
					<td align="center" valign="middle" style="width:16.7%"><span><a href="../patient/pat_insert.jsp?pno=<%=pat.getpno()%>">修改</a></span></td>
					<td align="center" valign="middle" style="width:16.7%">
					<button type="submit" class="btn btn-primary" style="margin:0 1em;">挂号</button></td>
				</tr>
			<%
				}
			%>
			</table>
		</form>
			<%
		}catch(Exception e){
			%>
					
				<script language="javascript">
					alert("请检查您当前电脑配置！");
					window.location.href='<%=request.getContextPath()%>/DatabaseDesign/welcome.jsp';
				</script>
							
			<%
		}
			%>
		</div>
	</body>
</html>