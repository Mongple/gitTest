<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/fleamarket/css/login.css">
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(init);

	function init() {
		$('a').click(clickA);
		$('input').click(clickBtn);
		$('#memId, #memPwd').keypress(clickEnter);
	}
	
	function clickEnter(event){
		if(event.keyCode == 13){
		  $('#login').click();
		}
	}
	function clickBtn() {
		var type = $(this).attr('id');
		if(type == 'login')
		{	
			$.ajax({
				type:"post",
				url:"/fleamarket/member/loginSign?memId="+$('#memId').val()+"&memPwd="+$('#memPwd').val(),
				success : function(data){
		    		if(data == 'SUCCESS')
		    			$(location).attr('href', '/fleamarket/');
		    		else if(data == 'FAIL') {
		    			alert("아이디 또는 비밀번호가 올바르지 않습니다.");
		    			$('#memId').val('');	
		    			$('#memPwd').val('');		    			
		    			$('#memId').focus();	
		    		}
				},
				error : function(){
				}
			});
		}else if(type == 'join'){
			$(location).attr('href', '/fleamarket/member/join');
		}
	}
	function clickA() {
		var type = $(this).attr('id');
		if(type == 'idSearch'){
				
		}else if(type == 'passSearch'){
				
		}
	}
</script>
</head>
<body>
	<div id="div_login">
		<div id="title">	
			<span id="title_name">MEMBER LOGIN</span>
		</div>
		
		<div id="content">
		
			<table id="form_table">
				<tr>
					<td><input type="text" name="memId" id="memId" value="" placeholder="아이디"/></td>
				</tr>
				<tr>
					<td><input type="password" name="memPwd" id="memPwd" value="" placeholder="비밀번호"/></td>
				</tr>
			</table>
			
			<table>
				<tr>
					<td colspan="2" align="center">
						<input type="button" id="login" class="btn" value="로그인" />
						<input type="button" id="join" class="btn" value="회원가입" />
					</td>
				</tr>
			</table>
			<div align="left">
				<a id="idSearch" href="#" class="a" style="text-decoration: none;">아이디를 찾으시겠습니까?</a><br>
				<a id="passSearch" href="#" class="a" style="text-decoration: none;">비밀번호를 찾으시겠습니까?</a>
			</div>
		</div>
	</div>
	
	
</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>