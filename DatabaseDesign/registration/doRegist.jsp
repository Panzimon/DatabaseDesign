<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="design.vo.*,design.factory.*,design.dao.*" %>
<%@ page import="java.util.*" %>

	<jsp:include page="../head.jsp"/>
		<div class="container" style="color:#fff;">
			<div class="container">
				<h4 style="float:left;"><a style="color:white;cursor:pointer;" title="点击回到主页" href="<%=request.getContextPath()%>/DatabaseDesign/welcome.jsp">首页</a>><a style="color:white;cursor:pointer;" href="registration.jsp">挂号登记</a>><a style="color:white;cursor:pointer;" href="doRegist.jsp">选择部门</a></h4>
			</div>
			<%	
				try{
					int pno = Integer.parseInt(request.getParameter("pno"));
					String pname = request.getParameter("pname");
					int age = Integer.parseInt(request.getParameter("age"));
					session.setAttribute("pno",pno);
					session.setAttribute("pname",pname);
					session.setAttribute("age",age);
			%>
		<form action="doRegist_doc.jsp" method="post">
			<label class="col-sm-5 control-label" style="font-size:1.5em;">请选择看病部门：</label>
			<select name="deptno" class="form-control" style="width:80%;font-size:1.2em;float:left;margin:1em;">
				<%
					Iterator<Dept> iterdept = DAOFactory.getIDeptDAOInstance().findAll("").iterator() ;
					while(iterdept.hasNext()){
							Dept d = iterdept.next() ;
					try{
				%>
					<option value="<%=d.getdeptno()%>"><%=d.getname()%>+<%=d.getdeptname()%></option>
				<%	
					}catch(Exception ex){
				%>
					<script language="javascript">
						alert("请重新挂号！");
						window.location.href='<%=request.getContextPath()%>/DatabaseDesign/registration/registration.jsp';
					</script>			
				<%
			}
				}
				%>
			</select>
			<div style="float:right;margin:1em 4em;">
				<button type="submit" class="btn btn-primary">确定</button>
			</div>
		</form>
			<%
				}catch(Exception e){
			%>
					
				<script language="javascript">
					alert("请您先输入病人号码或名字进行查找并选择或是检查电脑配置！");
					window.location.href='<%=request.getContextPath()%>/DatabaseDesign/registration/registration.jsp';
				</script>
							
			<%
				}
			%>
		</div>
	</body>
</html>