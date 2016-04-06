<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/fleamarket/css/notice.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/fleamarket/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
 	function cancel() {
		var baNo = $("#baNo").val();
		result = confirm("정말로 취소하시겠습니까 ?");

		if (result == true) {
			$(location).attr('href', '/fleamarket/notice/board?baNo='+baNo);
		} else
			return;
	} 
	var oEditors = [];
	$(document).ready(function(){
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "baContent",
			sSkinURI : "/fleamarket/se2/SmartEditor2Skin.html",
			fCreator : "createSEditor2"
		});
		
	})
	
	function submitContents(elClickedObj) {
		    oEditors.getById["baContent"].exec("UPDATE_CONTENTS_FIELD", []);
			
			document.editform.submit();
			try {
				elClickedObj.editform.submit();
			} catch(e) {}
		}
</script>


<title>:: Notice Board EDIT::</title>
</head>
<body>
	<div id="noticeBoard">
		<div id="title">
			<span id="title_name">NOTICE BOARD EDIT</span>
	</div>
	<br />

		<div id="inner">
			<div id="content">
				<form name="editform" method="post" action="/fleamarket/notice/updateBoard">
					<input type=hidden id="baNo" name="baNo" value="${vo.baNo}">
					<input type=hidden id="memNo" name="memNo" value="${vo.memNo}">
					<table id="noticeWrite" class="noticeWrite">
						<tr class="noticeWriteTR">
							<th width="120px;" style="border-right: 1px solid #e1e1e1;">Title</th>
							<td width="490px;"><input type="text" id="baTitle" name="baTitle" value="${vo.baTitle}"></td>
						</tr>
						<tr class="noticeWriteTR2">
							<td colspan="2">
								<textarea id="baContent" name="baContent">${vo.baContent}</textarea>
							</td>
						</tr>
						
						<tr>
							<td colspan=2 align=center>
								<input type="button" class="btn" value="수정" onclick="submitContents(this)">
								<input type="button" class="btn" value="취소" onclick="cancel()">
							</td>
						</tr>
					</table>
				</form>

			</div>
		</div>
		
	</div>
</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>