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
		$("#editbtn").click(edit);
	}
	function edit() {
		var baNo = $("#baNo").val();
		$(location).attr('href', 'fleamarket_board_edit?baNo=' + baNo);
	}
	function cancel() {
		var baType = $("#baType").val();
		if(baType=="WEAR"){
			$(location).attr('href', 'fleamarket');
		}else{
			$(location).attr('href', 'fleamarket_prod');
		}
	}
	function delcheck() {
		result = confirm("정말로 삭제하시겠습니까 ?");
		var baNo = $("#baNo").val();
		var baType = $("#baType").val();
			
		if(result == true){
			$(location).attr('href','deleteBoard?baNo='+baNo);
		}
		else
			return;
	}
	function delcomment() {
		result = confirm("댓글 정말로 삭제하시겠습니까 ?");
		var rpNo = $("#rpNo").val();
		alert(rpNo);
		if(result == true){
			$(location).attr('href','deleteComment?rpNo='+rpNo);
		}
		else
			return;
	}

	
</script>

<title>플리보드</title>
</head>
<body>
	<div align="center">
		<h1>fleamarket board Contents</h1>

		<form name=form1 action="/fleamarket_board">
			<input type=hidden id="baNo" name="baNo" value="${vo.baNo}">
			<input type="hidden" name="baType" id="baType" value="${vo.baType}">
			<table border="1">
				<tr>
					<th>제목</th>
					<td>${vo.baTitle}</td>
				</tr>
				<tr>
					<th>게시날짜</th>
					<td>${vo.baDate}</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>${vo.baCount}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${vo.memId}</td>
					<td>${vo.memName}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${vo.baContent}</td>
				</tr>
				<tr>
					<c:if test="${sessionId == vo.memId || sessionGrant == 'A'}">					
						<td colspan=2 align=center>
							<input type="button" value="수정" id="editbtn" onclick="edit">
							<input type="button" value="삭제" onclick="delcheck()" >
						</td>
					</c:if>
					<td><input type="button" value="뒤로" onclick="cancel()"></td>
				</tr>
			</table>
			</form>
			
			<!-- 댓글 -->
			<form name=commentform method="post">
				<input type="hidden" name="rpNo" id="rpNo" value="${vo.rpNo}">  
				<table border="1">
					<tr>
						 <!-- <th width="10%">rpNo.</th>   -->
						<th width="50%">comment</th>
						<th width="10%">id</th>
						<th width="20%">Date</th>				
					</tr>
					<c:forEach items="${rplist}" var="vo">
						<tr>
							 <td>${vo.rpNo}</td> 
							<td>${vo.rpContent}</td>
							<td>${vo.memId}</td>
							<td>${vo.rpDate}</td>
							<c:if test="${sessionId == vo.memId }">	
		 						<td><input type="button" value="삭제" onclick="delcomment()"/> </td>
							</c:if>
						</tr>
					</c:forEach>
					</table>
				</form>
				
				<form name=commentInsertform  method="post" action="insertComment">
					<table border="1">
					<tr>
						<td>댓글 쓰기</td>
						<td colspan="2">
							<input type="hidden" id="baNo" name="baNo" value="${vo.baNo}" />
							<input type="hidden" id="rpNo" name="rpNo" value="${vo.rpNo}" />
							<input type="hidden" id="memId" name="memId" value="${vo.memId}" />
							<input type="text" id="rpContent" name="rpContent"/>
							<c:if test="${sessionId != null }">	
	 							<input type="submit" value="확인" /> 
							</c:if>

						</td>
					</tr>			
					</table>	
				</form>

	</div>

</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>