/*
 *	MEMBER JOIN
 */

var MemberJoin = function() {
		
	function idCheck() {
		//아이디 중복체크를 위한 Ajax처리
		var idcon = "ccc";
		$('#memId').keyup(function() {
			$('#idresult').html("");
			var params = "memId=" + $("#memId").val();
			$.ajax({
				type : "POST",
				url : "/fleamarket/member/idCheck",
				data : params,
				success : function(args) {
					var a; // 사용자에게 보여줄 SPAN문자를 담기위해 선언한 변수
					
					if (args == "c") {
						a = "사용 가능한 아이디 입니다";
						idcon = args;
						$('#idresult').html(a);
					}

					else if (args == "cc") {
						a = "* 이미 사용 중인 아이디 입니다";
						idcon = args;
						$('#idresult').html(a);
					}

					else if (args == "ccc") {
						a = "* 아이디를 입력하세요";
						idcon = args;
						$('#idresult').html(a);
					}
				},
				error : function(e) {
					alert(e.responseText);
				}
			});
		});
	}
	
	// 실시간 비밀번호 확인
	function pwdCheck() {
		$('#memPwd2').keyup(function() {
			$('#pwdcheck2').html("");
			if ($('#memPwd').val() == $('#memPwd2').val())
			{
				$('#pwdcheck2').html("* 비밀번호가 일치합니다");
			}
			else
			{
				$('#pwdcheck2').html("* 비밀번호가 일치하지 않습니다");
			}
		});
	}
	
	// 회원가입 요청 버튼 클릭시 처리할 내용
	// 작성공간을 작성하지 않을시 경고창
	function submitCheck() {
		$(".joinBtn").click(function()
		{	
			$('#idresult').html("");
			$('#pwdcheck1').html("");
			$('#pwdcheck2').html("");
			$('#namecheck').html("");
			$('#birthcheck').html("");
			$('#phonecheck').html("");
			$('#memEmail').html("");
			
	 		if($("#memId").val()=="")
			{
				$('#idresult').html("* 아이디를 입력하세요");
				return;
			}
		
			if($("#memPwd").val()=="")
			{
				$('#pwdcheck1').html("* 비밀번호를 입력하세요");
				return;
			} 
			if($("#memPwd2").val()=="")
			{
				$('#pwdcheck2').html("* 비밀번호를 확인하세요");
				return;
			}
			
			if($("#memName").val()=="")
			{
				$('#namecheck').html("* 이름을 입력하세요");
				return;
			} 
			
			if($("#memBirth").val()=="")
			{
				$('#birthcheck').html("* 생년월일을 입력하세요");
				return;
			} 
			
			if($("#memPhone").val()=="" )
			{
				$('#phonecheck').html("* 전화번호를 입력하세요");
				return;
			} 
			
			if($("#memEmail").val()=="")
			{
				$('#emailcheck').html("* 이메일을 입력하세요");
				return;
			}
			
			$("#memberInsertForm").submit();
		});
	}
	
	
	return {
		idCheck : idCheck,
		pwdCheck : pwdCheck,
		submitCheck : submitCheck
	}
}