<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.text.*" %>
<%@ page import="design.vo.*,design.factory.*" %>
<html>
	<head>
		<title>��Ϣ�޸Ľ��</title>
	</head>
	
	<body style="
		padding-top: 40px;
		padding-bottom: 40px;
		background-color: #eee;
		font-family:Arial,Microsoft YaHei,����,sans-serif;
	">
		<%
			request.setCharacterEncoding("GBK") ;

			int deptno = Integer.parseInt(request.getParameter("deptno")) ;
			String deptname = request.getParameter("deptname") ;
			String deptloc = request.getParameter("deptloc") ;
			int hno =  Integer.parseInt(request.getParameter("hno"));
			Hospital hos = DAOFactory.getIHospitalDAOInstance().findById(hno);
			String msg = "�޸�ʧ�ܣ�" ;
			if(hos != null) {
				String name = hos.getname();
				Dept dept = new Dept() ;
				dept.setdeptno(deptno) ;
				dept.setdeptname(deptname);
				dept.setdeptloc(deptloc);
				dept.sethno(hno);
				dept.setname(name);
				if(DAOFactory.getIDeptDAOInstance().doUpdate(dept)){
					msg = "�޸ĳɹ���" ;
				}
			}else{
				msg = "�޸�ʧ�ܣ�" ;
			}
		%>
		
		<script language="javascript">
			alert("<%=msg%>") ;
			window.location.href='dept.jsp';
		</script>
		
	</body>
</html>