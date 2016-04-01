<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>

<link rel="stylesheet" type="text/css" href="/fleamarket/css/adminMain.css">
<link rel="stylesheet" type="text/css" href="/fleamarket/css/jquery.jqplot.css" />

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/fleamarket/js/jquery.jqplot.js"></script>
<script type="text/javascript" src="/fleamarket/js/jqplot.pieRenderer.js"></script>
<script type="text/javascript" src="/fleamarket/js/jqplot.donutRenderer.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:: ADMIN MAIN ::</title>

<script type="text/javascript">

$(document).ready(function(){
	  var data = [
	    ['Heavy Industry', 12],['Retail', 9], ['Light Industry', 14], 
	    ['Out of home', 16],['Commuting', 7], ['Orientation', 9]
	  ];
	  var plot2 = jQuery.jqplot ('chart2', [data], 
	    {
	      seriesDefaults: {
	        renderer: jQuery.jqplot.PieRenderer, 
	        rendererOptions: {
	          // Turn off filling of slices.
	          fill: false,
	          showDataLabels: true, 
	          // Add a margin to seperate the slices.
	          sliceMargin: 4, 
	          // stroke the slices with a little thicker line.
	          lineWidth: 5
	        }
	      }, 
	      legend: { show:true, location: 'e' }
	    }
	  );
});

</script>

</head>
<body>
	<div id="adminMain">
		<div id="title">
			<span id="title_name">ADMIN MAIN</span>
		</div>
		
		<div id="content">
			<a href="/fleamarket/admin/adminMain"><span id="admin_type">통계 확인</span></a>
			&nbsp / &nbsp
			<a href=""><span id="admin_type">유저 관리</span></a>
			<br />
			<div id="chartdiv" style="height:400px;width:300px; "></div>
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>