<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>

<link rel="stylesheet" type="text/css"
	href="/fleamarket/css/adminMain.css">

<script type="text/javascript" src="/fleamarket/js/adminMain.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:: USER MANAGE ::</title>

<script type="text/javascript">
$(document).ready(function() {
	var adminMain = AdminMain();
	
	
});
</script>

</head>
<body>
	<div id="adminMain">
		<div id="title">
			<span id="title_name">USER MANAGE</span>
		</div>

		<div id="top_bar">
			<a href="/fleamarket/admin/adminMain/rate">
					<span id="admin_type">Chart Check</span></a>
			&nbsp / &nbsp
			<a href="/fleamarket/admin/userManage/manageList">
					<span id="admin_type">User Manage</span></a>
		</div>
		<br />
		<div id="content">
			<table id="memberlist" class="memberlist">
				<tr>
					<th>전체 요청수 :</th>
					<th>검색</th>
				</tr>
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>가입날짜</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>권한</th>
					<th>경고횟수</th>
					<th>비고</th>
				</tr>
				<c:forEach var="vo" items="${list}">
					<tr>
						<td>${vo.memNo}</td>
						<td>${vo.memId}</td>
						<td>${vo.memPwd}</td>
						<td>${vo.memName}</td>
						<td>${vo.memBirth}</td>
						<td>${vo.memDate}</td>
						<td>${vo.memPhone}</td>
						<td>${vo.memEmail}</td>
						<td>${vo.memGrant}</td>
						<td>${vo.memBlack}</td>
						<td>
							<input type="button" id="warning" name="warning" value="경고" />
							&nbsp;&nbsp;
							<input type="button" id="out" name="out" value="퇴출" />
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>