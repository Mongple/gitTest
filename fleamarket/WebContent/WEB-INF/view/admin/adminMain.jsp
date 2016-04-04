<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>

<link rel="stylesheet" type="text/css" href="/fleamarket/css/adminMain.css">
<link rel="stylesheet" type="text/css" href="/fleamarket/css/jquery.jqplot.css" />

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/fleamarket/chartjs/jquery.jqplot.js"></script>
<script type="text/javascript" src="/fleamarket/chartjs/jqplot.barRenderer.js"></script>
<script type="text/javascript" src="/fleamarket/chartjs/jqplot.categoryAxisRenderer.js"></script>
<script type="text/javascript" src="/fleamarket/chartjs/jqplot.pointLabels.js"></script>
<script type="text/javascript" src="/fleamarket/chartjs/jqplot.pieRenderer.js"></script>

<script type="text/javascript" src="/fleamarket/js/adminMain.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:: ADMIN MAIN ::</title>

<script type="text/javascript">
$(document).ready(function() {
	var adminMain = AdminMain();
	var user = parseInt('${user.memNo}');
	var admin = parseInt('${admin.memNo}');
	var notice = parseInt('${notice.baNo}');
	var wear = parseInt('${wear.baNo}');
	var product = parseInt('${product.baNo}');
	
	adminMain.memberCountChart(user, admin);
	adminMain.boardCountChart(notice, wear, product);
});
</script>

</head>
<body>
	<div id="adminMain">
		<div id="title">
			<span id="title_name">ADMIN MAIN</span>
		</div>
		
		<div id="top_bar">
			<a href="/fleamarket/admin/adminMain/rate"><span id="admin_type">Chart Check</span></a>
			&nbsp / &nbsp
			<a href="/fleamarket/admin/userManage/manageList"><span id="admin_type">User Manage</span></a>
		</div>
		<br/>
		<div id="content">
			<div id="chart1" style="height: 300px; width: 450px;"></div>
			<div id="chart2" style="height: 300px; width: 450px;"></div>
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>