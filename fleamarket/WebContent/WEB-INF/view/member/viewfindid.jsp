<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
<div align="center">
	<h6>당신의 아이디는</h6><h2>${vo.memId}</h2><h6>입니다.</h6>
	<a href="/fleamarket/member/login?memId=${vo.memId}" style="text-decoration: none;cursor: pointer;">로그인 하시겠습니까?</a>
</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>