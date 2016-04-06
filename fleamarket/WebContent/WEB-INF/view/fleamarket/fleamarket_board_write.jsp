<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/fleamarket/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">

	function cancel() {
		var baType = $("#baType").val();
		result = confirm("정말로 취소하시겠습니까 ?");

		if (result == true) {
			if (baType == "WEAR") {
				$(location).attr('href', '/fleamarket/market');
			} else {
				$(location).attr('href', '/fleamarket/market?baType='+baType);
			}
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
			
			/* if($('#baTitle').val().length==0)
			{
				alert("후기 게시글 제목을 입력해주세요.");
				return;
			}else if($('#baContent').val().length<20){
				alert("20자 이상으로 내용을 입력해주세요.");
				return;
			} */
			console.log(document.getElementById("baContent").value); 
			document.frm.submit();
			try {
				elClickedObj.frm.submit();
			} catch(e) {}
		}
</script>


<title>게시글등록</title>
</head>
<body>
	<div align="center">
		<h1>fleamarket board write</h1>
		<form name ="frm"  method="post" action="/fleamarket/market/writeboard/action">
			<input type="hidden" name="baType" id="baType" value="${vo.baType }">
			<table style="border-collapse: collapse" width="850">
				<tr>
					<td width="120" name="title">제 목</td>
					<td>
						<input type="text" style="width: 600px;"id="baTitle" name="baTitle">
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<textarea id="baContent" name="baContent" rows="10" cols="110"></textarea>
					</td>
				</tr>
				<tr><td><br></td></tr>	
				<tr>
					<td colspan="5" align="right">
						<input type="button" value="등록" onclick="submitContents(this)">
						<input type="button" value="취소" onclick="returnFeed()">
					</td>
				</tr>
			</table>
		</form>
		
		
		
		<%-- <form name="forminsertboard" method="post" action="/fleamarket/market/writeboard/action">
			<input type="hidden" name="baType" id="baType" value="${vo.baType }">
			<table border="1">
				
				<tr>
					<th>제목</th>
					<td><input type="text" name="baTitle"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><input type="text" name="baContent"></td>
				</tr>

				<tr>
					<td colspan=2 align=center>
						<input type=submit value="저장">
						<input type="button" value="뒤로" onclick="cancel()">
					</td>
				</tr>
			</table>
			

			
		</form> --%>

	</div>

</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>