<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.util.*"%>
<html>
	<head>
		<title>���뵽���ﳵ</title>
	</head>
	
	<body style="
		padding-top: 40px;
		padding-bottom: 40px;
		background-color: #eee;
		font-family:Arial,Microsoft YaHei,����,sans-serif;
	">
		<%	// Ҫ�������Ʒ���
			int pid = Integer.parseInt(request.getParameter("pid")) ;
			Map<Integer,Integer> cars = (Map<Integer,Integer>) session.getAttribute("allpid") ;	// ȡ��ȫ���Ѿ��������Ʒ
			// ������ǵ�һ�ι���Ļ����϶�ȡ�ò���
			if(cars == null){	// ����û�й����κε���Ʒ
				cars = new HashMap<Integer,Integer>() ;	// ʵ����һ���µ�Map����
			}
			if(cars.get(pid) == null){	// ��û�й������Ʒ
			} else {	// �Ѿ�������
				cars.remove(pid);	// ɾ��
			}
			session.setAttribute("allpid",cars) ;	// ���±�����ĺ������
		%>
		<script language="javascript">
			window.location.href='product_cars.jsp';
		</script>
	</body>
</html>