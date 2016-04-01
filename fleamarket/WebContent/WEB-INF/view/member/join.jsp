<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/fleamarket/css/join.css">
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:: MEMBER JOIN ::</title>

<script src="/fleamarket/js/join.js" type="text/javascript" charset="utf-8"></script>

<!-- 비밀번호 확인 -->
<script src="http://code.jquery.com/jquery-1.7.2.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		var memberJoin = MemberJoin();
		memberJoin.idCheck();
		memberJoin.pwdCheck();
		memberJoin.submitCheck();
	});
</script>

</head>
<body>
	<div id="join">
		<div id="title">
			<span id="title_name">MEMBER JOIN</span>
		</div>
		
		<div id="content">
		<form action="/fleamarket/member/insertMember" method="post" id="memberInsertForm">
			<table id="form_table">
				<tr>
					<td>
						<input type="text" name="memId" id="memId" value="" placeholder="아이디"/><br />
						<span id="idresult"></span>
					</td>
				</tr>
				<tr>
					<td>
						<input type="password" name="memPwd" id="memPwd" value="" placeholder="비밀번호"/><br />
						<span id="pwdcheck1"></span>
					</td>
				</tr>
				<tr>
					<td>
						<input type="password" name="memPwd2" id="memPwd2" value="" placeholder="비밀번호확인"/><br />
						<span id="pwdcheck2"></span>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="memName" id="memName" value="" placeholder="이름"/><br />
						<span id="namecheck"></span>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="memBirth" id="memBirth" value="" maxlength="10"
							placeholder="생년월일(ex:1991/03/20)"/><br />
						<span id="birthcheck"></span>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="memPhone" id="memPhone" value="" maxlength="13"
					 		placeholder="전화번호(ex:010-0000-0000)"/><br />
					 	<span id="phonecheck"></span>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="memEmail" id="memEmail" value="" placeholder="이메일"/><br />
						<span id="emailcheck"></span>
					</td>
				</tr>
			</table>
			
			<table>
				<tr>
					<td colspan="2" align="center">
					<input type="button" id="btn" class="joinBtn" value="가입" />
					<input type="reset" id="btn" class="cancleBtn" value="다시작성" />
				</tr>
			</table>
		</form>
		
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>