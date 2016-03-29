<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주소록:작성화면</title>
<link rel="stylesheet" href="css/addrbook.css" type="text/css" media="screen" />
</head>
<body>
<div align="center">
<H2>주소록:작성화면 </H2>
<HR>
[<a href="listaddrbook.do">주소록 목록으로</a>] <P>
<form name="form1" method="post" action="insertAddrBookAction.do">
<input type="hidden" name="action" value="insert">
<table border="1">
  <tr>
    <th>이 름</th>	
    <td><input type="text" name="abName" maxlength="15"></td>
  </tr>
  <tr>
    <th>email</th>
    <td><input type="email" name="abEmail" maxlength="50"></td>
  </tr>
  <tr>
    <th>전화번호</th>
    <td><input type="text" name="abTel" maxlength="20"></td>
  </tr>
  <tr>
    <th>생 일</th>
    <td><input type="date" name="abBirth"></td>
  </tr>  
  <tr>
    <th>회 사</th>
    <td><input type="text" name="abComdept" maxlength="20"></td>
  </tr>
  <tr>
    <th>메 모</th>
    <td><input type="text" name="abMemo"></td>
  </tr>
  <tr>
    <td colspan=2 align=center>
	    <input type=submit value="저장">
	    <input type=reset value="취소">
    </td>
</tr>
</table>
</form>

</div>
</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>