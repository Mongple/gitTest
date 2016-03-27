<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="addrbook_error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/addrbook.css" type="text/css" media="screen" />

<script type="text/javascript">
	$(document).ready(init);

	function init() {
		$('td a').click(clickA);
	}
	function clickA() {

		$(location).attr('href', 'editView.do?abId=' + this.innerHTML);
		/* pwd = prompt('수정/삭제 하려면 비밀번호를 넣으세요');
		//document.location.href="addrbook_control.jsp?action=edit&ab_id="+ab_id+"&upasswd="+pwd;
		document.location.href="editview.do?ab_id="+ab_id+"&upasswd="+pwd; */
	}
</script>

<title>주소록:목록화면</title>

</head>

<body>
	<div align="center">
		<H2>주소록:목록화면</H2>
		<HR>
		<form>
			<a href="insertAddrBook.do">주소록 등록</a>
			<P>
			<table border="1">
				<tr>
					<th>번호</th>
					<th>이 름</th>
					<th>전화번호</th>
					<th>생 일</th>
					<th>회 사</th>
					<th>메 모</th>
				</tr>
				<c:forEach var="vo" items="${list}">
					<tr>
						<td><a>${vo.abId}</a></td>
						<td>${vo.abName}</td>
						<td>${vo.abTel}</td>
						<td>${vo.abBirth}</td>
						<td>${vo.abComdept}</td>
						<td>${vo.abMemo}</td>
					</tr>
				</c:forEach>
			</table>
		</form>
	</div>
</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>