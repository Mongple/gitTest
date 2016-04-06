<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="/fleamarket/css/notice2.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
   $(document).ready(init);
   
   function edit() {
      var baNo = $("#baNo").val();
      $(location).attr('href', '/fleamarket/notice/editboard?baNo=' + baNo);
   }
   
   function cancel() {
         $(location).attr('href', '/fleamarket/notice/noticeList');
   }
   
   function delcheck() {
      result = confirm("정말로 삭제하시겠습니까 ?");
      var baNo = $("#baNo").val();
      if(result == true){
         $(location).attr('href','/fleamarket/notice/deleteBoard?baNo='+baNo);
      }
      else
         return;
   }
   function delcomment(rpNo, baNo) {
      result = confirm("댓글 정말로 삭제하시겠습니까 ?");
      if(result == true){
         $(location).attr('href','/fleamarket/notice/deleteComment?rpNo='+rpNo+'&baNo='+baNo);
      }
      else
         return;
   }
</script>

<title>:: NOTICE BOARD ::</title>
</head>
<body>
	<div id="noticeBoard">
		<div id="title">
			<span id="title_name">NOTICE BOARD CONTENTS</span>
		</div>
		<br />		
		
		<div id="inner">
			<div id="content">
			<form>
				<input type=hidden id="baNo" name="baNo" value="${vo.baNo}">

				<table id="noticeContent" class="noticeContent">
					<tr id="noticeContentTR1">
						<td class="noticeTH">제목</td>
						<td colspan="7">${vo.baTitle}</td>
					</tr>
					<tr id="noticeContentTR2">
						<td class="noticeTH">작성자</td>
						<td style="width: 50px;">${vo.memName}</td>
						<td class="noticeTH">아이디</td>
						<td style="width: 60px;">${vo.memId}</td>
						<td class="noticeTH">작성일</td>
						<td style="width: 120px;">${vo.baDate}</td>
						<td class="noticeTH">조회수</td>
						<td style="width: 30px;">${vo.baCount}</td>
					</tr>
					<tr>
						<td colspan="8"><textarea id="contentBox" readonly="readonly">${vo.baContent}</textarea></td>
					</tr>
			</table>
			</form>
			<table id="noticeContent2">
					<tr>
						<c:if test="${sessionId == vo.memId || sessionGrant == 'A'}">
							<td><input type="button" class="btn" value="수정" onclick="edit()"></td>
							<td><input type="button" class="btn" value="삭제" onclick="delcheck()"></td>
						</c:if>
							<td>
								<input type="button" class="btn" value="뒤로" onclick="cancel()">
							</td>
						</tr>
			</table>
		</div><br/>
		<div id="content1">
		<!-- 댓글 -->
		<c:if test="${sessionId != null }">
		<div id="title">
			<span id="title_name">COMMENT</span>
		</div>
		<br />
		</c:if>
		
		<form id="commentInsertform" name="commentInsertform" method="post" action="/fleamarket/notice/insertComment">
			<input type="hidden" name="rpNo" id="rpNo" value="${vo.rpNo}">
			<input type="hidden" id="baNo" name="baNo" value="${vo.baNo}" />

			<table id="repleTable" class="repleTable">
				<c:forEach items="${rplist}" var="vo">
					<tr>
						<td>${vo.memId}</td>
						<td>${vo.rpContent}</td>
						<td>${vo.rpDate}</td>
					<c:if test="${sessionId == vo.memId || sessionGrant == 'A'}">
						<td><a><span id="ntBtn" onclick="delcomment('${vo.rpNo}','${vo.baNo}')">삭제</span></a></td>
					</c:if>
					</tr>
				</c:forEach>

					<tr>
					<c:if test="${sessionId != null }">
						<td><input type="text" id="reID" readonly="readonly" value="${sessionId}"></td>
						<td width="300px"><textarea id="contentBox2" name="rpContent"></textarea></td>
						<td><input type="submit" class="btn" value="입력"></td>
					</c:if>
					</tr>
			</table>
		</form>
		</div>
	</div>
	</div>
</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>