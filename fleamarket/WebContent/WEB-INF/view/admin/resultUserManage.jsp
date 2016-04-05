<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="content">
		<form action="" method="post" id="adminUpdateForm">
			<table id="memberList" class="memberList">
				<tr>
					<td style="width: 80px;">Total ${vo.totalRowCnt }</td>
				</tr>
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>가입날짜</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>권한</th>
					<th>경고횟수</th>
					<th>비고</th>
				</tr>
				<c:forEach var="vo" items="${list}">
					<tr>
						<td style="width: 30px;">${vo.memNo}</td>
						<td style="width: 80px;">${vo.memId}</td>
						<td>
							<input type="text" style="width: 60px;" value="${vo.memName}" /></td>
						<td style="width: 80px;">${vo.memBirth}</td>
						<td style="width: 100px;">${vo.memDate}</td>
						<td>
							<input type="text" style="width: 100px;" value="${vo.memPhone}" /></td>
						<td>
							<input type="text" style="width: 120px;" value="${vo.memEmail}" /></td>
						<td>
							<input type="text" style="width: 30px;" value="${vo.memGrant}" /></td>
						<td>
							<input type="text" style="width: 30px;" value="${vo.memBlack}" /></td>
						<td style="width: 100px;">
							<a><span id="updateMember" class="mgBtn" onclick="updateMember('${vo.memId}')">수정</span></a>
							<a><span id="waringMember" class="mgBtn" onclick="waringMember('${vo.memId}','${vo.memBlack}')">경고</span></a>
							<a><span id="outMember" class="mgBtn" onclick="outMember('${vo.memId}')">퇴출</span></a>
						</td>
					</tr>
				</c:forEach>
			</table>
			</form>
			
		</div>
		<div id="paging" align="center">
			<jsp:include page="/WEB-INF/view/common/paging.jsp"></jsp:include>
		</div>
		</div>