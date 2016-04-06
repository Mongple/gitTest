<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/fleamarket/css/notice.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">

	function writeBoard() {
		$(location).attr('href', '/fleamarket/notice/noticeList/write');
	}
	
</script>
<title>:: Notice Board ::</title>
</head>
<body>
	<div id="noticeBoard">
		<div id="title">
			<span id="title_name">NOTICE BOARD</span>
		</div>
		<br />

		<div>
			<select id="searchType">
				<option value="SEARCHALL">전체</option>
				<option value="SEARCHTITLE">제목</option>
				<option value="SEARCHCONTENT">내용</option>
			</select>
			<input type="text" id="searchData" value="${vo.searchData }">
			<a><span id="searchbtn" class="mgBtn" onclick="search()">조회</span></a>
		</div>
		
		<div id="inner">
			<div id="content">
				<table id="noticeList" class="noticeList">
					<tr>
						<td style="width: 80px;">Total ${vo.totalRowCnt }</td>
						<td colspan="4" align="right">
							<c:if test="${sessionGrant == 'A'}">
								<input class="btn" type="button" onclick="writeBoard()" value="글등록">
							</c:if>
						</td>
					</tr>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성날짜</th>
						<th>조회수</th>
					</tr>
					<c:forEach items="${list }" var="vo">
						<tr id="noticeListTR">
							<td style="width: 30px;">${vo.baNo}</td>
							<td style="width: 330px;">${vo.baTitle}</td>
							<td style="width: 70px;">${vo.memId}</td>
							<td style="width: 150px;">${vo.baDate}</td>
							<td style="width: 50px;">${vo.baCount}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<br />			

			<div id="paging" align="center">
				<jsp:include page="/WEB-INF/view/common/paging.jsp"></jsp:include>
			</div>
		</div>
		
	</div>
</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>