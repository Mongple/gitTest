<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
	$(document).ready(function(){
		
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
					<input type="text" id="searchData"  value="${vo.searchData }" >
					<a><span id="searchbtn" class="mgBtn" onclick="search()">조회</span></a> 
		</div>
	
		<div id="inner" align="center">
		총 ${vo.totalRowCnt }개의 게시물
			<table border="1">
				<tr>			
					<td>게시물번호</td>
					<td>게시글작성자</td>
					<td>게시글제목</td>
					<td>게시글작성날짜</td>
					<td>조회수</td>
				</tr>
			<c:forEach items="${list }" var="vo">
				<tr>
					<td>${vo.baNo }</td>	
					<td>${vo.memId}</td>	
					<td>${vo.baTitle}</td>
					<td>${vo.baDate}</td>
					<td>${vo.baCount}</td>
				</tr>
			</c:forEach>
		</table>
		
		<c:if test="${sessionGrant == 'A'}">
			<input id="insertBtn" type="button" value="글등록">
		</c:if>
		
		<div id="paging" align="center">
			<jsp:include page="/WEB-INF/view/common/paging.jsp"></jsp:include>
		</div>
	</div>
</div>

</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>