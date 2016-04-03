<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
총 ${vo.totalRowCnt }개의 게시물</td>
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

<div id="paging" align="center">
	<jsp:include page="/WEB-INF/view/common/paging.jsp"></jsp:include>
</div>