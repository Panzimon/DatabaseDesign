<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="design.vo.*,design.factory.*,design.dao.*" %>
<%@ page import="java.util.*" %>

	<jsp:include page="../head.jsp"/>
		<div class="container" style="color:#fff;">
			<div class="container">
				<h4 style="float:left;"><a style="color:white;cursor:pointer;" title="点击回到主页" href="<%=request.getContextPath()%>/DatabaseDesign/welcome.jsp">首页</a>><a style="color:white;cursor:pointer;" href="registration.jsp">挂号登记</a>><a style="color:white;cursor:pointer;" href="doRegist.jsp">选择部门</a>><a style="color:white;cursor:pointer;" href="doRegist_doc.jsp">选择医生、时间</a></h4>
			</div>
			<%	
				try{
					int deptno = Integer.parseInt(request.getParameter("deptno"));
					session.setAttribute("deptno",deptno);
			%>
		<form action="doRegist_doc_do.jsp" method="post">
			<div class="form-group">
			<label class="col-sm-5" style="font-size:1.5em;">请选择医生：</label>
			<select name="docno" class="form-control col-sm-7" style="font-size:1.1em;margin:1em;">
				<%
					Iterator<Doc> iterdoc = DAOFactory.getIDocDAOInstance().findBydeptno(deptno).iterator() ;
					while(iterdoc.hasNext()){
							Doc d = iterdoc.next() ;
					try{
				%>
					<option value="<%=d.getdocno()%>"><%=d.getname()%> 工作时间：<%=d.getworktime()%></option>
				<%	
					}catch(Exception ex){
				%>
				<script language="javascript">
					alert("请检查您当前电脑配置！");
					window.location.href='<%=request.getContextPath()%>/DatabaseDesign/registration/registration.jsp';
				</script>
							
				<%
			}
				}
				%>
			</select>
			</div>
			<div class="form-group">
				<label for="date" class="col-sm-5 control-label" style="font-size:1.5em;">请输入看病日期：</label>
				<div>
					<input type="text" class="form-control" id="date" placeholder="Date example: YYYY-MM-DD" name="date" style="font-size:1.1em;margin:1em;">
				</div>
			</div>
			<div class="form-group" style="margin:1.5em auto;float:right;margin:1em 4em;">
				 <button type="submit" class="btn btn-primary">确定</button>
			</div>
		</form>
			<%
				}catch(Exception e){
			%>
					
				<script language="javascript">
					alert("请重新挂号！");
					window.location.href='<%=request.getContextPath()%>/DatabaseDesign/registration/registration.jsp';
				</script>
							
			<%
				}
			%>
		</div>
	</body>
</html>