<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="design.vo.*,design.factory.*,design.dao.*,java.util.*" %>
<html>

	<%	request.setCharacterEncoding("utf-8") ;%>
	
	<head>
		<title>Welcome~</title>
	</head>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
	<script language="javascript">
		window.onload=function(){
			var re = document.getElementById('relative');
			re.onclick=function(){
				var cln=re.className;
				if(cln=="dropdown"){
					re.className="dropdown open";
				}
				else{
					re.className="dropdown";
				}
			};
		}
	</script>
	<body style="
	padding-top: 40px;
    padding-bottom: 40px;
	background: url(<%=request.getContextPath()%>/img/rose.jpg) no-repeat center;
    background-color: #646464;
	font-family:Arial,Microsoft YaHei,宋体,sans-serif;
	
	">
			<div class="container">
				<div>
					<%
						try{
							if(session.getAttribute("id") != null){
							session.setAttribute("info","");
							String testid = session.getAttribute("id").toString();
							IMemberDAO dao = DAOFactory.getIMemberDAOInstance() ;
							Member member = dao.findById(testid);	
							String nickname = member.getNickname();
					%>
					
					<h1 style="display:inline-block;color:#fff;">
							Welcome ~ <%=nickname%>
					</h1>

					<h5 style="margin :1em ;display:inline-block;"><a style="color:white;" href="<%=request.getContextPath()%>/DatabaseDesign/logout.jsp">注销</a></h5>
							
					<hr style="margin-top:2.5em;">
							

					<nav class="navbar navbar-inverse navbar-static-top" role="navigation" style="border-width:0px;">
					  <div class="container">
						<div class="navbar-header" style="background-color: #7D0909;">
						  <a class="navbar-brand" href="<%=request.getContextPath()%>/DatabaseDesign/welcome.jsp" style="background-color: #7D0909;">医疗系统</a>
						</div>
						<div id="navbar" class="navbar-collapse">
						  <ul class="nav navbar-nav">
							<li class=" "><a href="/example/DatabaseDesign/member/member.jsp">个人信息</a></li>
						  <%
							if(testid.equals("test")){
						  %>
						  	<li class=" "><a href="/example/DatabaseDesign/registration/registration.jsp">挂号登记</a></li>
							<li class=" "><a href="/example/DatabaseDesign/registration/regist_list.jsp">挂号信息</a></li>
							<li class=" "><a href="/example/DatabaseDesign/patient/patient.jsp">病人信息</a></li>
						<%
							}
						%>	
							<li class="dropdown" id="relative">
							  <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">医院相关<span class="caret"></span></a>
							  <ul class="dropdown-menu" role="menu" style="background-color:#080808;">
								<li><a href="/example/DatabaseDesign/hospital/hospital.jsp" style="color:#fff;">医院信息</a></li>
								<li><a href="/example/DatabaseDesign/doctor/doc.jsp" style="color:#fff;">医生信息</a></li>
								<li class="divider"></li>
								<li class="dropdown-header" style="color:#fff;">详细</li>
								<li><a href="/example/DatabaseDesign/department/dept.jsp" style="color:#fff;">医院部门</a></li>
								<li><a href="/example/DatabaseDesign/room/room.jsp" style="color:#fff;">病房信息</a></li>
							  </ul>
							</li>
							<li class=" "><a href="/example/DatabaseDesign/product/product.jsp">网上药店</a></li>
						  </ul>
						</div>
					  </div>
					</nav>

				</div>
					<%			
						} else {
							session.setAttribute("info","请先登录再进行相关操作");
					%>
					
							<script language="javascript">
								window.location.href='<%=request.getContextPath()%>/DatabaseDesign/login.jsp';
							</script>
							
					<%
							}
						}catch(Exception exc){
					%>
					
						<script language="javascript">
							alert("请检查您的配置并重新登录！");
							window.location.href='<%=request.getContextPath()%>/DatabaseDesign/login.jsp';
						</script>
							
					<%
						}
					%>
			</div>