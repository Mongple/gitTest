<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<meta charset="utf-8">
	<script language='javascript'>
	var hd;
	var i=5;
	$(document).ready(function(){
		clearTimeout(hd);
		fncPreView();
	})
	
	function fncPreView()
	{	
		$('#time').html(i);
	    i=i-1;
	   	if(i>=0)
	    {
	    	hd = setTimeout(fncPreView,1000);
	    }else
	    	location.href="/fleamarket/member/login";
	}
</script>
<title>:: FLEAMARKET ::</title>
</head>
<body>
	<div align="center">
		<form id="frm" action="/fleamarket/member/login" method="post">
			<div id="text2">
	      		<img alt="" src="/fleamarket/img/error.jpg" width="100%" height="600px"><br>
				<h3>접근권한이 필요한 페이지 입니다.</h3>
				<h3><span id="time">5</span>초 후 로그인창으로 이동합니다.</h3><br><br><br><br><br>
	      	</div>
		</form>
	</div>
</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>