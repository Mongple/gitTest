<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h4>${vo.totalRowCnt }</h4>
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
<div id="paging" align="center">
	<jsp:include page="/WEB-INF/view/common/paging.jsp"></jsp:include>
</div>

<c:if test="${sessionId != null}">		
 	<a href="/fleamarket/market/writeboard?baType=${vo.baType}">새글등록</a>
</c:if>