<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(document).ready(function(){
		$('#update').click(function (){
			$(location).attr('href','/fleamarket/member/mypage/update');
		});
		
		$('#delete').click(function (){
			result = confirm("정말로 삭제하시겠습니까 ?");
			if(result == true){
				$(location).attr('href','/fleamarket/member/mypage/delete');
			} else
				return;
		});
	});
	
	
</script>
<title>Insert title here</title>
</head>
<body>	
	<div align="center">
		<a href="/fleamarket/member/mypage/board?baType=PRODUCT">가전제품 게시판 활동내역</a>&nbsp&nbsp//&nbsp&nbsp
		<a href="/fleamarket/member/mypage/board?baType=WEAR">의류 게시판 활동내역</a>&nbsp&nbsp//&nbsp&nbsp
		<a href="/fleamarket/member/mypage/chkPwd">나의정보</a>
		
	</div>
	<div align="center">
		<table border="1">
			<tr>
				<td>ID</td>
				<td>${vo.memId }</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${vo.memName }</td>
			</tr>
			<tr>
				<td>Phone-Number</td>
				<td>${vo.memPhone }</td>
			</tr>
			<tr>
				<td>E-mail</td>
				<td>${vo.memEmail }</td>
			</tr>
			<tr>
				<td>가입날짜</td>
				<td>${vo.memDate}</td>
			</tr>
			<tr>
				<td>경고횟수</td>
				<td>${vo.memBlack}</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="button" id="update" value="회원수정">
					<input type="button" id="delete" value="회원탈퇴">
				</td>
			</tr>
		</table>
	</div>
</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>