<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.util.*"%>
<html>
	<head>
		<title>更新购物车</title>
	</head>
	<body style="
		padding-top: 40px;
		padding-bottom: 40px;
		background-color: #eee;
		font-family:Arial,Microsoft YaHei,宋体,sans-serif;
	">
	
		<%	// 要购买的商品编号
			Enumeration allpid = request.getParameterNames() ;	// 取得所有的提交数据
			Map<Integer,Integer> cars = (Map<Integer,Integer>) session.getAttribute("allpid") ;	// 取得全部已经购买的商品
			if(cars == null){	// 现在没有购买任何的商品
				cars = new HashMap<Integer,Integer>() ;	// 实例化一个新的Map对象
			}
			while(allpid.hasMoreElements()){
				String paramName = (String) allpid.nextElement();
				try{
					int pid = Integer.parseInt(paramName) ;
					int val = Integer.parseInt(request.getParameter(paramName)) ;
					cars.put(pid,val) ;	// 重新设置相同的PID，则表示覆盖
				}catch(Exception e){}
			}
			try{session.setAttribute("allpid",cars);}
			catch(Exception e){
		%>
				<script language="javascript">
					alert("修改失败");
				</script>
		<%
			}// 重新保存更改后的数据
		%>
		<script language="javascript">
			alert("修改完毕");
		</script>
		<script language="javascript">
			window.location.href='product_cars.jsp';
		</script>
	</body>
</html>