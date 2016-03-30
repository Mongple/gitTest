<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/join.css">
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:: MEMBER JOIN ::</title>

<script type="text/javascript">


</script>

</head>
<body>
	<div id="join">
		<div id="title">
			<span id="title_name">MEMBER JOIN</span>
		</div>
		
		<div id="content">
		<form action="/fleamarket/member/insertMember" method="post">
			<table id="form_table">
				<tr>
					<td><input type="text" name="memId" id="memId" value="" placeholder="아이디"/></td>
				</tr>
				<tr>
					<td><input type="password" name="memPwd" id="memPwd" value="" placeholder="비밀번호"/></td>
				</tr>
				<tr>
					<td><input type="password" name="memPwd2" id="memPwd2" value="" placeholder="비밀번호확인"/></td>
				</tr>
				<tr>
					<td><input type="text" name="memName" id="memName" value="" placeholder="이름"/></td>
				</tr>
				<tr>
					<td><input type="text" name="memBirth" id="memBirth" value="" placeholder="생년월일(ex:1991/03/20)"/></td>
				</tr>
				<tr>
					<td><input type="text" name="memPhone" id="memPhone" value="" placeholder="전화번호"/></td>
				</tr>
				<tr>
					<td><input type="text" name="memEmail" id="memEmail" value="" placeholder="이메일"/></td>
				</tr>
			</table>
			
			<table>
				<tr>
					<td colspan="2" align="center">
					<input type="submit" id="btn" value="가입" />
					<input type="reset" id="btn" value="다시작성" />
				</tr>
			</table>
		</form>
		
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>