<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.util.*"%>
<html>
	<head>
		<title>加入到购物车</title>
	</head>
	
	<body style="
		padding-top: 40px;
		padding-bottom: 40px;
		background-color: #eee;
		font-family:Arial,Microsoft YaHei,宋体,sans-serif;
	">
		<%	// 要购买的商品编号
			int pid = Integer.parseInt(request.getParameter("pid")) ;
			Map<Integer,Integer> cars = (Map<Integer,Integer>) session.getAttribute("allpid") ;	// 取得全部已经购买的商品
			// 但如果是第一次购买的话，肯定取得不到
			if(cars == null){	// 现在没有购买任何的商品
				cars = new HashMap<Integer,Integer>() ;	// 实例化一个新的Map对象
			}
			if(cars.get(pid) == null){	// 还没有购买此商品
			} else {	// 已经购买了
				cars.remove(pid);	// 删除
			}
			session.setAttribute("allpid",cars) ;	// 重新保存更改后的数据
		%>
		<script language="javascript">
			window.location.href='product_cars.jsp';
		</script>
	</body>
</html>