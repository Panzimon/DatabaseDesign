<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.text.*" %>
<%@ page import="design.vo.*,design.factory.*" %>

<html>
	<head>
		<title>��Ϣ��ӽ��</title>
	</head>
	
	<body style="
		padding-top: 40px;
		padding-bottom: 40px;
		background-color: #eee;
		font-family:Arial,Microsoft YaHei,����,sans-serif;
	">
		<%
			request.setCharacterEncoding("GBK") ;

			int docno = Integer.parseInt(request.getParameter("docno"));
			int deptno = Integer.parseInt(request.getParameter("deptno"));
			String name = request.getParameter("name") ;
			String worktime = request.getParameter("worktime") ;
			Dept hos = DAOFactory.getIDeptDAOInstance().findById(deptno);
			String msg = "���ʧ�ܣ�" ;
			if(hos != null) {
				String deptname = hos.getdeptname();
				Doc doc = new Doc() ;
				doc.setdocno(docno) ;
				doc.setname(name);
				doc.setworktime(worktime);
				doc.setdeptno(deptno);
				doc.setdeptname(deptname);
				if(DAOFactory.getIDocDAOInstance().doCreate(doc)){
					msg = "��ӳɹ���" ;
				}
			}else{
				msg = "���ʧ�ܣ�" ;
			}
		%>
		
		<script language="javascript">
			alert("<%=msg%>") ;
			window.location.href='doc.jsp';
		</script>
		
	</body>
</html>