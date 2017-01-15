<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.text.*" %>
<%@ page import="design.vo.*,design.factory.*" %>
<html>
	<head>
		<title>信息修改结果</title>
	</head>
	
	<body style="
		padding-top: 40px;
		padding-bottom: 40px;
		background-color: #eee;
		font-family:Arial,Microsoft YaHei,宋体,sans-serif;
	">
		<%
			request.setCharacterEncoding("GBK") ;

			int docno = Integer.parseInt(request.getParameter("docno"));
			int deptno = Integer.parseInt(request.getParameter("deptno"));
			String name = request.getParameter("name") ;
			String worktime = request.getParameter("worktime") ;
			Dept hos = DAOFactory.getIDeptDAOInstance().findById(deptno);
			String msg = "修改失败！" ;
			if(hos != null) {
				String deptname = hos.getdeptname();
				Doc doc = new Doc() ;
				doc.setdocno(docno) ;
				doc.setname(name);
				doc.setworktime(worktime);
				doc.setdeptno(deptno);
				doc.setdeptname(deptname);
				if(DAOFactory.getIDocDAOInstance().doUpdate(doc)){
					msg = "修改成功！" ;
				}
			}else{
				msg = "修改失败！" ;
			}
		%>
		
		<script language="javascript">
			alert("<%=msg%>") ;
			window.location.href='doc.jsp';
		</script>
		
	</body>
</html>