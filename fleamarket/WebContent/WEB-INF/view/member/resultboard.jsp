<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<input type="hidden" id="page" value="${vo.page }" >
	<input type="hidden" id="pageCnt" value="${vo.pageCnt }" >
			<table border="1">
			<tr>			
				<td>게시물번호</td>
				<td>활동유형</td>
				<td>게시글작성자</td>
				<td>게시글제목</td>
				<td>게시글작성날짜</td>
				<td>조회수</td>
			</tr>
			<c:forEach items="${list }" var="vo">
				<tr>
					<td>${vo.baNo }</td>	
					<c:if test="${sessionId == vo.memId}">
						<td>게시글작성</td>
					</c:if>
					<c:if test="${sessionId != vo.memId}">
						<td>댓글작성</td>
					</c:if>
					<td>${vo.memId}</td>	
					<td>${vo.baTitle}</td>
					<td>${vo.baDate}</td>
					<td>${vo.baCount}</td>
				</tr>
			</c:forEach>
		</table>
		
		<div id="paging" align="center">
			<a onclick="clickWarp('doubleLeft')"><<</a>
			<a onclick="clickWarp('singleLeft')"><</a>
			<c:choose>
				<c:when test="${vo.blockCnt == 1 }">
					<c:forEach var="p" begin="1" end="${vo.pageCnt }">
						<a onclick="clickA('${p}')">${p}</a>
					</c:forEach>
				</c:when>
				<c:when test="${vo.blockCnt > 1 }">
					<c:if test="${vo.blockCnt == vo.block }">
						<c:forEach var="p" begin="${vo.block*10-9}" end="${vo.pageCnt}">
							<a onclick="clickA('${p}')">${p}</a>
						</c:forEach>
					</c:if>
					<c:if test="${vo.blockCnt != vo.block }">
						<c:forEach var="p" begin="${vo.block*10-9}" end="${vo.block*10}">
							<a onclick="clickA('${p}')">${p}</a>
						</c:forEach>
					</c:if>
				</c:when>
			</c:choose>
			<a onclick="clickWarp('singleRight')">></a>
			<a onclick="clickWarp('doubleRight')">>></a>
		</div>