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
		$(location).attr('href','updateBaCount?baNo='+ this.innerHTML);
	/* 	$(location).attr('href', '/fleamarket/fleamarket_board?baNo=' + this.innerHTML); */
	}
</script>

<title>플리 리스트1</title>
</head>
<body>
	<div id="fleamarketlist" align="center">
		<h1>fleamarketlist_prod Contents</h1>
 
 		<tr>
 			<td><a href="fleamarket">WEAR</a></td>
 			<td><a href="fleamarket_prod">PRODUCT</a></td>
 		</tr>
 		
		<form>

			<tr>
				<td>
					<select name="searchKey">
							<option value="">전체</option>
							<option value="baTitle">제목</option>
							<option value="baContent">내용</option>
							<option value="memName">이름</option>
							<option value="memid">아이디</option>
					</select> 
					<input type="text" name="searchVal"  value="">
					<input type="button" id="searchbtn" value="조회"> 
				</td>
			</tr>

			<table border="1">
				<tr>
					<th width="5%">No.</th>
					<th width="40%">Title</th>
					<th width="10%">Id</th>
					<th width="10%">Name</th>
					<th width="15%">Date</th>				
					<th width="5%">hits</th>
				</tr>
				<!-- jstl -->
				<c:forEach items="${list}" var="vo">
					<tr>
						<td align="center"><a>${vo.baNo}</a></td>
						<td>${vo.baTitle}</td>
						<td>${vo.memId}</td>
						<td>${vo.memName}</td>
						<td>${vo.baDate}</td>
						<td>${vo.baCount}</td>
					</tr>
				</c:forEach>
			</table>
			<c:if test="${sessionId != null}">		
			 	<a href="fleamarket_board_write?baType=${vo.baType}">새글등록</a>
			</c:if>
			<P>
		</form> 
	</div>


</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>