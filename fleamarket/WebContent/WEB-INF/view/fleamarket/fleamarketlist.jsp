<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
	$(document).ready(init);

	function init() {
		$('td a').click(clickA);
	}
	function clickA() {

		$(location).attr('href', '/fleamarket/fleamarket_board?baNo=' + this.innerHTML);
		/* pwd = prompt('수정/삭제 하려면 비밀번호를 넣으세요');
		//document.location.href="addrbook_control.jsp?action=edit&ab_id="+ab_id+"&upasswd="+pwd;
		document.location.href="editview.do?ab_id="+ab_id+"&upasswd="+pwd; */
	}
</script>

<title>플리 리스트1</title>
</head>
<body>
	<div id="fleamarketlist" align="center">
		<h1>fleamarketlist Contents</h1>
 
		<form>
			<table border="1">
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>id</th>
					<th>이름</th>
					<th>게시날짜</th>				
					<th>조회수</th>
					
				</tr>
				<!-- jstl -->
				<c:forEach items="${list}" var="vo">
					<tr>
						<td><a>${vo.baNo}</a></td>
						<td>${vo.baTitle}</td>
						<td>${vo.memId}</td>
						<td>${vo.memName}</td>
						<td>${vo.baDate}</td>
						<td>${vo.baCount}</td>
					</tr>
				</c:forEach>
				<!-- jstl -->
				
<!-- 				<tr>
					<td colspan=2 align=center><input type="button" value="새글등록"></td>
				</tr> -->
			</table>
		 	<a href="fleamarket_board_edit">새글등록</a>
			<P>
		</form> 
	</div>


</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>