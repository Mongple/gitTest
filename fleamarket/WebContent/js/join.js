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
	
	return {
		idCheck : idCheck
	}
}