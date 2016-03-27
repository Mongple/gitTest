<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="addrbook_error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="css/addrbook.css" type="text/css" media="screen" />
<script type="text/javascript">
	function delcheck() {
		result = confirm("정말로 삭제하시겠습니까 ?");
		var abId = $("#abId").val();
		if(result == true){
			$(location).attr('href','deleteAddrBook.do?abId='+abId);
		}
		else
			return;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주소록:수정화면</title>
</head>

<body>
<div align="center">
<H2>주소록:수정화면 </H2>
<HR>
[<a href="listaddrbook.do">주소록 목록으로</a>]
<form name=form1 method=post action="updateAddrBook.do">
	<input type=hidden id="abId" name="abId" value="${vo.abId}">
	<input type=hidden name="action" value="update">
	
	<table border="1">
	  <tr>
	    <th>이 름</th>
	    <td><input type="text" name="abName" value="${vo.abName}"></td>
	  </tr>
	  <tr>
	    <th>email</th>
	    <td><input type="text" name="abEmail" value="${vo.abEmail}"></td>
	  </tr>
	    <tr>
	    <th>전화번호</th>
	    <td><input type="text" name="abTel" value="${vo.abTel}"></td>
	  </tr>
	      <tr>
	    <th>생 일</th>
	    <td><input type="date" name="abBirth" value="${vo.abBirth}"></td>
	  </tr>
	  <tr>
	    <th>회 사</th>
	    <td><input type="text" name="abComdept" value="${vo.abComdept}"></td>
	  </tr>
	  <tr>
	    <th>메 모</th>
	    <td><input type="text" name="abMemo" value="${vo.abMemo}"></td>
	  </tr>
	  <tr>
	    <td colspan=2 align=center>
	    	<input type=submit value="저장">
	    	<input type=reset value="취소">
	    	<input type="button" onclick="delcheck()"  value="삭제" >
	    </td>
	</tr>
	</table>
</form>

</div>
</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>