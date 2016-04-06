<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/fleamarket/css/mypage.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(document).ready(function(){
		$('#update').click(function (){
			$(location).attr('href','/fleamarket/member/mypage/update');
		});
		
		$('#delete').click(function (){
			result = confirm("정말로 삭제하시겠습니까 ?");
			if(result == true){
				$(location).attr('href','/fleamarket/member/mypage/delete?memId=${vo.memId}');
			} else
				return;
		});
	});
	
	
</script>
<title>:: MYPAGE INFO ::</title>
</head>
<body>	
	<div id="mypageMain">
		<div id="title">
			<span id="title_name">Mypage Manage</span>
		</div>

		<div id="top_bar">
			<a href="/fleamarket/member/mypage/board?baType=PRODUCT"><span class="mypage_type">Product Board Active</span></a>
			&nbsp / &nbsp
			<a href="/fleamarket/member/mypage/board?baType=WEAR"><span class="mypage_type">Wear Board Active</span></a>
			&nbsp / &nbsp
			<a href="/fleamarket/member/mypage/chkPwd"><span class="mypage_type">Mypage Manage</span></a>
		</div>
		<br />
		
		<div id="inner">
			<div id="content">
			<table id="mypageList" class="mypageList">
				<tr>
					<th>아이디</th>
					<td width="300">${vo.memId }</td>
				</tr>
				<tr>
					<th>이름</th>
					<td width="300">${vo.memName }</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td width="300">${vo.memPhone }</td>
				</tr>
				<tr>
					<th>E-mail</th>
					<td width="300">${vo.memEmail }</td>
				</tr>
				<tr>
					<th>가입일</th>
					<td width="300">${vo.memDate}</td>
				</tr>
				<tr>
					<th>경고횟수</th>
					<td width="300">${vo.memBlack}</td>
				</tr>
			</table>
			<br />
			<table>
				<tr>
					<td colspan="2" align="center" width="350">
						<input type="button" class="btn" id="update" value="회원수정">
						<input type="button" class="btn" id="delete" value="회원탈퇴">
					</td>
				</tr>
			</table>
		</div>
	</div>
	</div>
</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>