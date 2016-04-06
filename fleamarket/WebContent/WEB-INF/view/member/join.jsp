<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/fleamarket/css/join.css">
<script type="text/javascript" src="<c:url value="/js/join.js" />"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:: MEMBER JOIN ::</title>

<script type="text/javascript">
	$(document).ready(function() {
		var memberJoin = MemberJoin();
		memberJoin.init();
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
						<input type="text" name="memBirth1" id="memBirth1" class="inputThree"  value="" maxlength="4" placeholder="생년(ex 1990)"/>
						<input type="text" name="memBirth2" id="memBirth2" class="inputThree"  value="" maxlength="2" placeholder="월"/>
						<input type="text" name="memBirth3" id="memBirth3" class="inputThree"  value="" maxlength="2" placeholder="일"/><br>
						<span id="birthcheck"></span>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="memPhone1" id="memPhone1" class="inputThree" value="" maxlength="3" placeholder="전화번호"/>
						<input type="text" name="memPhone2" id="memPhone2" class="inputThree" value="" maxlength="4" size="1"/>
						<input type="text" name="memPhone3" id="memPhone3" class="inputThree" value="" maxlength="4" size="1"/><br>
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