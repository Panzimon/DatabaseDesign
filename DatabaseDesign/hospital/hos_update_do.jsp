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
		%>
		
		<%
			int hno = Integer.parseInt(request.getParameter("hno")) ;
			String name = request.getParameter("name") ;
			String address = request.getParameter("address") ;
			int tel =  Integer.parseInt(request.getParameter("tel"));
			int zipcode =  Integer.parseInt(request.getParameter("zipcode"));
		%>
		
		<%
			String msg = "修改失败！" ;
			Hospital hospital = new Hospital() ;
			hospital.sethno(hno) ;
			hospital.setname(name) ;
			hospital.setaddress(address);
			hospital.settel(tel);
			hospital.setzipcode(zipcode);
			if(DAOFactory.getIHospitalDAOInstance().doUpdate(hospital)){
				msg = "修改成功！" ;
			}
		%>
		
		<script language="javascript">
			alert("<%=msg%>") ;
			window.location.href='hospital.jsp';
		</script>
		
	</body>
</html>