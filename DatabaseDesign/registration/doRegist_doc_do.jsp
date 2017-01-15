<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="design.vo.*,design.factory.*,design.dao.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>

	<jsp:include page="../head.jsp"/>
		<div class="container" style="color:#fff;">
			<%	
				try{
					int docno = Integer.parseInt(request.getParameter("docno"));
					java.util.Date date = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date"));
					session.setAttribute("docno",docno);
					session.setAttribute("date",date);
					int pno = Integer.parseInt(session.getAttribute("pno").toString());
					String pname = session.getAttribute("pname").toString();
					int age = Integer.parseInt(session.getAttribute("age").toString());
					int deptno = Integer.parseInt(session.getAttribute("deptno").toString());
					String msg = "挂号失败！" ;
					int num = 0;
					Booking bk = new Booking();
					bk.setpno(pno);
					bk.setpname(pname);
					bk.setage(age);
					bk.setdeptno(deptno);
					bk.setdocno(docno);
					bk.setdate(date);
					num = DAOFactory.getIBookingDAOInstance().doCount(bk.getdate());
					if(num < 10){
						if(DAOFactory.getIBookingDAOInstance().doCreate(bk)){
							num+=1;
							msg = "挂号成功！"+bk.getpname()+"是该医生的第"+num+"个病人" ;
						}	
					}
			%>
					<script language="javascript">
						alert("<%=msg%>") ;
						window.location.href='<%=request.getContextPath()%>/DatabaseDesign/registration/registration.jsp';
					</script>
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