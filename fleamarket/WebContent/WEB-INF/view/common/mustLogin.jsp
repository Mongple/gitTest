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
<body style="padding-top: 0px;">
	<div style="height: 89.5vh;">
		<div align="center" class="image-bg-fluid-height">
	        <img src="/fleamarket/img/error.jpg" style="width: 100%; height: 670px;">
	    </div>
	    
	    <div>
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12" align="center">
	                    <h1 class="section-heading">접근권한이 필요한 페이지 입니다.</h1>
	                    <p class="lead section-lead"><span id="time">5</span>초 후 로그인창으로 이동합니다.</p>
	            
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>