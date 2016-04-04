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
	$('#memEmail').keypress(clickEnter);
	$('#chkEmailBtn').click(chkEmailBtn);
}); 

function clickEnter(event){
	if(event.keyCode == 13){
		chkEmailBtn();
	}
}

function chkEmailBtn() {
	var memEmail = $("#memEmail").val();
	$.ajax({
		type:"post",
		url:'/fleamarket/member/chkEmail',
		data: 'memEmail='+memEmail,
		success : function(data){
		    if(data == "-1"){
		    	alert("이메일을 다시 확인해주세요.");
		    	$('#memEmail').val('');		    			
    			$('#memEmail').focus();
		    }else {
		    	$(location).attr('href','/fleamarket/member/viewFindId?memId='+data);
		    }
		},
		error : function(){
			alert("에러")
		}
	});
}


</script>
<title>Insert title here</title>
</head>
<body>
<div align="center">
	<table>
		<tr>
			<td><input id="memEmail" type="text" placeholder="가입하신 이메일 계정을 입력해주세요" size="30px" value=""></td>
			<td><input id="chkEmailBtn" type="button" value="확인"></td>
		</tr>
	</table>
</div>
</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>