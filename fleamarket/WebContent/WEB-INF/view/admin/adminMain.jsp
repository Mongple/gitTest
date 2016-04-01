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

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:: ADMIN MAIN ::</title>

<script type="text/javascript">
$(document).ready(function() {
	memberCountChart();
	boardCountChart();
});

function memberCountChart() {
	$(document).ready(function(){
	    var line1 = [['Nissan', 4],['Porche', 6],['Acura', 2],['Aston Martin', 5],['Rolls Royce', 6]];
	 
	    $('#chart1').jqplot([line1], {
	        title:'Total Member Count',
	        seriesDefaults:{
	            renderer:$.jqplot.BarRenderer,
	            rendererOptions: {
	                // Set the varyBarColor option to true to use different colors for each bar.
	                // The default series colors are used.
	                varyBarColor: true
	            }
	        },
	        axes:{
	            xaxis:{
	                renderer: $.jqplot.CategoryAxisRenderer
	            }
	        }
	    });
	});
}

function boardCountChart() {
	var data = [ [ '의류게시판', 12 ], [ '가전제품게시판', 9 ] ];
	var plot2 = jQuery.jqplot('chart2', [ data ], {
		title:'Board Type Rate',
		seriesDefaults : {
			renderer : jQuery.jqplot.PieRenderer,
			rendererOptions : {
				// Turn off filling of slices.
				fill : false,
				showDataLabels : true,
				// Add a margin to seperate the slices.
				sliceMargin : 4,
				// stroke the slices with a little thicker line.
				lineWidth : 5
			}
		},
		legend : {
			show : true,
			location : 'e'
		}
	});
}

</script>

</head>
<body>
	<div id="adminMain">
		<div id="title">
			<span id="title_name">ADMIN MAIN</span>
		</div>

		<div id="content">
			<a href="/fleamarket/admin/adminMain"><span id="admin_type">통계
					확인</span></a> &nbsp / &nbsp <a href=""><span id="admin_type">유저 관리</span></a>
			<br />
			<div id="chart1" style="height: 300px; width: 500px;"></div>
			<div id="chart2" style="height: 300px; width: 500px;"></div>
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>