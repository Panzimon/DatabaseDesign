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

			int rno = Integer.parseInt(request.getParameter("rno")) ;
			String loc = request.getParameter("loc") ;
			String aval = request.getParameter("aval") ;
			int hno =  Integer.parseInt(request.getParameter("hno"));
			Hospital hos = DAOFactory.getIHospitalDAOInstance().findById(hno);
			String msg = "修改失败！" ;
			if(hos != null) {
				String name = hos.getname();
				Room room = new Room() ;
				room.setrno(rno) ;
				room.setloc(loc);
				room.setaval(aval);
				room.sethno(hno);
				room.setname(name);
				if(DAOFactory.getIRoomDAOInstance().doUpdate(room)){
					msg = "修改成功！" ;
				}
			}else{
				msg = "修改失败！" ;
			}
		%>
		
		<script language="javascript">
			alert("<%=msg%>") ;
			window.location.href='room.jsp';
		</script>
		
	</body>
</html>