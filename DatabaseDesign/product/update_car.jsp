<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.util.*"%>
<html>
	<head>
		<title>���¹��ﳵ</title>
	</head>
	<body style="
		padding-top: 40px;
		padding-bottom: 40px;
		background-color: #eee;
		font-family:Arial,Microsoft YaHei,����,sans-serif;
	">
	
		<%	// Ҫ�������Ʒ���
			Enumeration allpid = request.getParameterNames() ;	// ȡ�����е��ύ����
			Map<Integer,Integer> cars = (Map<Integer,Integer>) session.getAttribute("allpid") ;	// ȡ��ȫ���Ѿ��������Ʒ
			if(cars == null){	// ����û�й����κε���Ʒ
				cars = new HashMap<Integer,Integer>() ;	// ʵ����һ���µ�Map����
			}
			while(allpid.hasMoreElements()){
				String paramName = (String) allpid.nextElement();
				try{
					int pid = Integer.parseInt(paramName) ;
					int val = Integer.parseInt(request.getParameter(paramName)) ;
					cars.put(pid,val) ;	// ����������ͬ��PID�����ʾ����
				}catch(Exception e){}
			}
			try{session.setAttribute("allpid",cars);}
			catch(Exception e){
		%>
				<script language="javascript">
					alert("�޸�ʧ��");
				</script>
		<%
			}// ���±�����ĺ������
		%>
		<script language="javascript">
			alert("�޸����");
		</script>
		<script language="javascript">
			window.location.href='product_cars.jsp';
		</script>
	</body>
</html>