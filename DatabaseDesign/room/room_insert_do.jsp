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

			int rno = Integer.parseInt(request.getParameter("rno")) ;
			String loc = request.getParameter("loc") ;
			String aval = request.getParameter("aval") ;
			int hno =  Integer.parseInt(request.getParameter("hno"));
			Hospital hos = DAOFactory.getIHospitalDAOInstance().findById(hno);
			String msg = "���ʧ�ܣ�" ;
			if(hos != null) {
				String name = hos.getname();
				Room room = new Room() ;
				room.setrno(rno) ;
				room.setloc(loc);
				room.setaval(aval);
				room.sethno(hno);
				room.setname(name);
				if(DAOFactory.getIRoomDAOInstance().doCreate(room)){
					msg = "��ӳɹ���" ;
				}
			}else{
				msg = "���ʧ�ܣ�" ;
			}
		%>
		
		<script language="javascript">
			alert("<%=msg%>") ;
			window.location.href='room.jsp';
		</script>
		
	</body>
</html>