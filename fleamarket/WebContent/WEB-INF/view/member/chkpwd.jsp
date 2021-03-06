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
	$('#memPwd').keypress(clickEnter);
	$('#chkPwdBtn').click(chkPwdBtn);
}); 

function clickEnter(event){
	if(event.keyCode == 13){
		chkPwdBtn();
	}
}

function chkPwdBtn() {
	var memPwd = $("#memPwd").val();
	$.ajax({
		type:"post",
		url:'/fleamarket/member/mypage/chkPwdAction',
		data: 'memPwd='+memPwd,
		success : function(data){
		    if(data == "SUCCESS"){
		    	$(location).attr('href','/fleamarket/member/mypage/memberinfo');
		    }else {
		    	alert("비밀번호를 다시 확인해주세요.");
		    	$('#memPwd').val('');		    			
    			$('#memPwd').focus();
		    }
		},
		error : function(){
			alert("에러")
		}
	});
}


</script>
<title>:: MYPAGE ::</title>
</head>
<body>
<div id="findMain">
	<div id="title" style="margin-top: 15%;">
			<span id="title_name">MYPAGE MANAGE</span>
	</div>
	<br />
	
	<div id="inner">
		<div id="content">
			<table id="mypageList">
				<tr>
					<td><input id="memPwd" type="password" placeholder="비밀번호를 입력해주세요" size="30px" value=""></td>
					<td><input id="chkPwdBtn" class="btn" type="button" value="확인"></td>
				</tr>
			</table>
		</div>
	</div>
</div>
</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>