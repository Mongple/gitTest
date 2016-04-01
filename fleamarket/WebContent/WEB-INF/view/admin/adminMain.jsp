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
<script type="text/javascript" src="/fleamarket/chartjs/jqplot.pieRenderer.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:: ADMIN MAIN ::</title>

<script type="text/javascript">

$(document).ready(function(){
    var plot1 = $.jqplot('pie1', [[['a',25],['b',14],['c',7]]], {
        gridPadding: {top:0, bottom:38, left:0, right:0},
        seriesDefaults:{
            renderer:$.jqplot.PieRenderer, 
            trendline:{ show:false }, 
            rendererOptions: { padding: 8, showDataLabels: true }
        },
        legend:{
            show:true, 
            placement: 'outside', 
            rendererOptions: {
                numberRows: 1
            }, 
            location:'s',
            marginTop: '15px'
        }       
    });
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
			<div id="pie1" style="height:800px;width:800px;"></div>
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>