<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<input type="hidden" id="page" value="${vo.page }" >
<input type="hidden" id="pageCnt" value="${vo.pageCnt }" >
<input type="hidden" id="totalRowCnt" value="${vo.totalRowCnt }" >
<br>
<a style="text-decoration: none;cursor: pointer;" onclick="clickWarp('doubleLeft')"><<</a>&nbsp
<a style="text-decoration: none;cursor: pointer;" onclick="clickWarp('singleLeft')"><</a>&nbsp
<c:choose>
	<c:when test="${vo.totalRowCnt == 0}">
		<a style="text-decoration: none;cursor: pointer;color: red; font-weight: bold;">1</a>
	</c:when>
	<c:when test="${vo.blockCnt == 1 }">
		<c:forEach var="p" begin="1" end="${vo.pageCnt }">
			<c:choose>
				<c:when test="${vo.page == p }">
					<a style="text-decoration: none;cursor: pointer;color: red; font-weight: bold;" onclick="clickA('${p}')">${p}</a>
				</c:when>
				<c:otherwise>
					<a style="text-decoration: none;cursor: pointer;" onclick="clickA('${p}')">${p}</a>
				</c:otherwise>
			</c:choose>
			
		</c:forEach>
	</c:when>
	<c:when test="${vo.blockCnt > 1 }">
		<c:if test="${vo.blockCnt == vo.block }">
			<c:forEach var="p" begin="${vo.block*10-9}" end="${vo.pageCnt}">
				<c:choose>
					<c:when test="${vo.page == p }">
						<a style="text-decoration: none;cursor: pointer;color: red; font-weight: bold;" onclick="clickA('${p}')">${p}</a>
					</c:when>
					<c:otherwise>
						<a style="text-decoration: none;cursor: pointer;" onclick="clickA('${p}')">${p}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:if>
		<c:if test="${vo.blockCnt != vo.block }">
			<c:forEach var="p" begin="${vo.block*10-9}" end="${vo.block*10}">
				<c:choose>
					<c:when test="${vo.page == p }">
						<a style="text-decoration: none;cursor: pointer;color: red; font-weight: bold;" onclick="clickA('${p}')">${p}</a>
					</c:when>
					<c:otherwise>
						<a style="text-decoration: none;cursor: pointer;" onclick="clickA('${p}')">${p}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:if>
	</c:when>
	
</c:choose>&nbsp
<a style="text-decoration: none;cursor: pointer;" onclick="clickWarp('singleRight')">></a>&nbsp
<a style="text-decoration: none;cursor: pointer;" onclick="clickWarp('doubleRight')">>></a>&nbsp&nbsp
