<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="design.vo.*,design.factory.*,design.dao.*" %>

<jsp:include page="../head.jsp"/>

	<script language="javascript">
		function changeColor(obj,color){
			obj.bgColor = color ;
		}
	</script>
	
		<script language="javascript" src="<%=request.getContextPath()%>/js/member_validate.js">
		</script>
		<script language="javascript" src="<%=request.getContextPath()%>/js/data.js"></script>
		
		<div class="container" style="color:#fff;"> 

		<%
			String account = "" ;
			try {
				account = request.getParameter("account") ;
			
			} catch (Exception e){}
			Member member = DAOFactory.getIMemberDAOInstance().findById(account) ;
		%>
		<%
			if(member != null) {
		%>
		<form action="member_update_do.jsp" method="post" onSubmit="return validate(this)">
		<table border="1" cellpadding="5" cellspacing="0" style="background-color:#F2F2F2;width:100%;height:90%">
			<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				<td align="center" valign="middle"  colspan="3">
					<h1 style="float:left;">�޸���Ϣ</h1>		
				</td>
			</tr>
			<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				<td align="center" valign="middle"  style="background-color:white;width:30%;">�˺ţ�</td>
				<td align="center" valign="middle" name="mid"><%=member.getAccount()%></td>
				<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="mid_msg"><font color="RED">*</font></span></td>
			</tr>
			<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				<td align="center" valign="middle"  style="background-color:white;width:30%;">��¼���룺</td>
				<td align="center" valign="middle" ><input type="password" name="password" onBlur="validatePassword(this.value)"></td>
				<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="password_msg"><font color="RED">*</font></span></td>
			</tr>	
			<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				<td align="center" valign="middle"  style="background-color:white;width:30%;">ȷ�����룺</td>
				<td align="center" valign="middle" ><input type="password" name="conf" onBlur="validateConf(this.value)"></td>
				<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="conf_msg"><font color="RED">*</font></span></td>
			</tr>
			<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				<td align="center" valign="middle"  style="background-color:white;width:30%;">�û�����</td>
				<td align="center" valign="middle" ><input type="text" name="nickname" onBlur="validatenickname(this.value)" value="<%=member.getNickname()%>"></td>
				<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="nickname_msg"><font color="RED">*</font></span></td>
			</tr>
			<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				<td align="center" valign="middle"  style="background-color:white;width:30%;">�ܱ����⣺</td>
				<td align="center" valign="middle" ><input type="text" name="safequestion" onBlur="validatesafequestion(this.value)" value="<%=member.getSafequestion()%>"></td>
				<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="safequestion_msg"><font color="RED">*</font></span></td>
			</tr>
			<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				<td align="center" valign="middle"  style="background-color:white;width:30%;">�ܱ��𰸣�</td>
				<td align="center" valign="middle" ><input type="text" name="safestring" onBlur="validatesafestring(this.value)" value="<%=member.getSafestring()%>"></td>
				<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="safestring_msg"><font color="RED">*</font></span></td>
			</tr>
			<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				<td align="center" valign="middle"  style="background-color:white;width:30%;">ע�����ڣ�</td>
				<td align="center" valign="middle" ><input type="text" name="signdate" size="15" maxlength="15" readonly="true" onblur="validatesigndate(this.value)"  value="<%=member.getSigndate()%>"></td>
				<td align="center" valign="middle"  style="background-color:white;width:30%;"><span id="signdate_msg"><font color="RED">*</font></span></td>
			</tr>
			<tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
				<td align="center" valign="middle"  colspan="3">
					<input type="hidden" name="account" value="<%=member.getAccount()%>">
						<button type="submit" class="btn btn-primary" style="float:right;display:inline-block;margin:0 1em;">�޸�</button>
						<button type="reset" class="btn btn-primary" style="float:right;display:inline-block;margin:0 1em;">����</button>	
				</td>
			</tr>
		</table>
		<%
			} else {
		%>
				<script language="javascript">
					alert("û�д��û���Ϣ�������µ�½��");
					window.location.href='<%=request.getContextPath()%>/DatabaseDesign/login.jsp';
				</script>
		<%		
			}
		%>
		</div>
	</body>
</html>