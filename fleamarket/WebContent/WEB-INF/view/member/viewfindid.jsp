<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/fleamarket/css/mypage.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>:: MYPAGE MANAGE ::</title>
</head>
<body>
<div id="findMain1">
	<div id="title" style="margin-top: 12%;">
			<span id="title_name">MYPAGE MANAGE</span>
	</div>
	<br />
	
	<div id="inner">
		<div id="content">
			<span style="font-size: 4em; margin-right: 5px;">당신의 아이디는</span>
			<span style="font-size: 8em; color: red; margin-right: 5px;">${vo.memId}</span>
			<span style="font-size: 4em; margin-right: 5px;">입니다.</span>>
			<br /><br /><br/>
			<a href="/fleamarket/member/login?memId=${vo.memId}" style="text-decoration: none;cursor: pointer;">로그인 하시겠습니까?</a>
		</div>
	</div>
</div>

</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>