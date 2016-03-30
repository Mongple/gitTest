<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/login.css">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(init);

	function init() {
		$('a').click(clickA);
	}
	function clickA() {
		var type = $(this).attr('id');
		if(type == 'login')
		{	
		/* 	var memId = $('#memId').val();
			var memPwd = $('#memPwd').val(); */
			$.ajax({
				type:"post",
				url:"/fleamarket/member/loginSign?memId="+$('#memId').val()+"&memPwd="+$('#memPwd').val(),
				success : function(data){
		    		alert(data);
		    		/* if(data == 'SUCCESS')
		    			$(location).attr('href', '/flea'); */
				},
				error : function(){
				}
			});
		}else if(type == 'join'){
				
		}else if(type == 'idSearch'){
				
		}else if(type == 'passSearch'){
				
		}
		/* $(location).attr('href', 'editView.do?abId=' + this.innerHTML); */
		/* pwd = prompt('수정/삭제 하려면 비밀번호를 넣으세요');
		//document.location.href="addrbook_control.jsp?action=edit&ab_id="+ab_id+"&upasswd="+pwd;
		document.location.href="editview.do?ab_id="+ab_id+"&upasswd="+pwd; */
	}
</script>
</head>
<body>
	<div class="login-screen" align="center" >
		<div class="app-title">
			<h1>Login</h1>
		</div>
		
		<div class="login-form">
			<div class="control-group">
				<input type="text" id="memId" class="login-field" value="" placeholder="username" > 
				<label class="login-field-icon fui-user" for="login-name"></label>
			</div>

			<div class="control-group">
				<input type="password" id="memPwd" class="login-field" value="" placeholder="password" > 
				<label class="login-field-icon fui-lock" for="login-pass"></label>
				
			</div>
			<div class="control-group">
				<div align="center">
					<table>
						<tr>
							<td><a id="login" class="btn btn-primary btn-large btn-block" >login</a> </td>
							<td>&nbsp&nbsp&nbsp</td>
							<td><a id="join" class="btn btn-primary btn-large btn-block" >join</a> </td>
						</tr>
					</table>
				</div>
			</div>
			<a id="idSearch" class="login-link" href="#">아이디 찾기</a>
			<a id="passSearch"class="login-link" href="#">비밀번호 찾기</a>
			
		</div>
	</div>
	
</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>