<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

			<div id="content">
				<table id="noticeList" class="noticeList">
					<tr>
						<td style="width: 80px;">Total ${vo.totalRowCnt }</td>
						<td colspan="5" align="right">
							<c:if test="${sessionId != null}">
								<input class="btn" type="button" onclick="writeBoard()" value="글등록">
							</c:if>
						</td>
						<tr>
							<th>No.</th>
							<th>Title</th>
							<th>Id</th>
							<th>Name</th>
							<th>Date</th>				
							<th>hits</th>
						</tr>
					<!-- jstl -->
					<c:forEach items="${list}" var="vo">
						<tr id="noticeListTR">
							<td style="width: 30px;">${vo.baNo}</td>
							<td style="width: 300px;"><a href="/fleamarket/market/updateBaCount?baNo=${vo.baNo}">${vo.baTitle}</a></td>
							<td style="width: 50px;">${vo.memId}</td>
							<td style="width: 50px;">${vo.memName}</td>
							<td style="width: 150px;">${vo.baDate}</td>
							<td style="width: 50px;">${vo.baCount}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<br />

<%-- <h4>${vo.totalRowCnt }</h4>
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
			<td align="center">${vo.baNo}</td>
						<td><a href="/fleamarket/market/updateBaCount?baNo=${vo.baNo}">${vo.baTitle}</a></td>
			<td>${vo.memId}</td>
			<td>${vo.memName}</td>
			<td>${vo.baDate}</td>
			<td>${vo.baCount}</td>
		</tr>
	</c:forEach>
</table> --%>
<div id="paging" align="center">
	<jsp:include page="/WEB-INF/view/common/paging.jsp"></jsp:include>
</div>

<%-- <c:if test="${sessionId != null}">		
 	<a href="/fleamarket/market/writeboard?baType=${vo.baType}">새글등록</a>
</c:if> --%>