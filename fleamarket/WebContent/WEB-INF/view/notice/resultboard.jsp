<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>

<div id="content">
	<table id="noticeList" class="noticeList">
		<tr>
			<td style="width: 80px;">Total ${vo.totalRowCnt }</td>
			<td colspan="4" align="right"><c:if
					test="${sessionGrant == 'A'}">
					<input class="btn" type="button" onclick="writeBoard()" value="글등록">
				</c:if></td>
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
				<td style="width: 330px;">
					<a href="/fleamarket/notice/updateBaCount?baNo=${vo.baNo}">
					<c:set var="kk" value="${vo.baTitle}" />
						<c:choose>
							<c:when test="${fn:length(kk) > 25}">${fn:substring(kk, 0, 25)}...</c:when>
							<c:otherwise>${kk}</c:otherwise>
						</c:choose>
					</a>
				</td>
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