<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/join.css">
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
	<div id="join">
		<div id="title">
			<span id="title_name">MEMBER JOIN</span>
		</div>
		
		<div id="content">
		<form action="">
			<table id="form_table">
				<tr>
					<td><input type="text" name="id" id="id" value="" placeholder="아이디"/></td>
				</tr>
				<tr>
					<td><input type="password" name="pwd1" id="pwd1" value="" placeholder="비밀번호"/></td>
				</tr>
				<tr>
					<td><input type="password" name="pwd2" id="pwd2" value="" placeholder="비밀번호확인"/></td>
				</tr>
				<tr>
					<td><input type="text" name="name" id="name" value="" placeholder="이름"/></td>
				</tr>
				<tr>
					<td><input type="text" name="birth" id="birth" value="" placeholder="생년월일(ex:1991/03/20)"/></td>
				</tr>
				<tr>
					<td><input type="text" name="phone" id="phone" value="" placeholder="전화번호"/></td>
				</tr>
				<tr>
					<td><input type="text" name="email" id="email" value="" placeholder="이메일"/></td>
				</tr>
			</table>
		</form>
		
		<a href=""><div id="btn">가입하기</div></a>
		<a href="join"><div id="btn">다시작성</div></a>
		
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>