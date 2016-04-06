/*
 *	MEMBER JOIN
 */

var MemberJoin = function() {
	// 서브밋 가능여부 플래그
	var flag = true;
	// 키 업될때마다 실행
	function init() {
		$('#memberInsertForm input').keyup(
				function() {
					// 유효성 체크, 모든게 정상이면 true;
					flag = validate();

					// 아이디중복체크
					$.ajax({
						type : "POST",
						url : "/fleamarket/member/idCheck",
						data : "memId=" + $('#memId').val(),
						success : function(args) {
							if (args == "cc") {
								$('#idresult')
										.html(
												"<font color='red'>"
														+ "이미 가입된 아이디 입니다."
														+ "</font>");
								flag = false;
							}
						},
						error : function(e) {
							alert(e.responseText);
						}
					});
					// 이메일중복체크
					$.ajax({
						type : "POST",
						url : "/fleamarket/member/emailCheck",
						data : "memEmail=" + $('#memEmail').val(),
						success : function(args) {
							if (args == "cc") {
								$('#emailcheck')
										.html(
												"<font color='red'>"
														+ "이미 가입된 이메일 입니다."
														+ "</font>");
								flag = false;
							}
						},
						error : function(e) {
							alert(e.responseText);
						}
					});
				});
		// 서브밋
		$(".joinBtn").click(function() {

			if (flag == undefined || flag == false)
				alert("유효하지 않은 데이터입니다.");
			else
				$("#memberInsertForm").submit();
		});
	}

	// 정규식을 이용한 체크
	function chk(re, e, msg, span, type) {
		// alert(e.val().length);
		if (e.val().length == 0) {
			span.html('');
		}
		if (type == 'memBirth') {
			if (e.val().length == 1 && 1 < parseInt(e.val())
					&& parseInt(e.val()) < 10) {
				e.val('0' + e.val());
			}
		}

		// 정규식통과
		if (re.test(e.val())) {
			span.html("<font color='green'>사용가능합니다.</font>");
			return true;
		}
		span.html("<font color='red'>" + msg + "</font>");
		return false;
	}

	// 비밀번호체크
	function chkPwd(pwd1, pwd2, span, msg) {

		span.html('');
		if (pwd1.val().length < 3) {
			span.html("<font color='red'>3자리 이상 입력해주세요.</font>");
		} else if (pwd1.val() == pwd2.val()) {
			span.html("<font color='green'>사용가능합니다.</font>");
			return true;
		} else
			span.html("<font color='red'>" + msg + "</font>");
		return false;

	}

	// 유효성검사!
	function validate() {
		// span객체
		var idresult = $('#idresult');
		var pwdcheck1 = $('#pwdcheck1');
		var pwdcheck2 = $('#pwdcheck2');
		var namecheck = $('#namecheck');
		var birthcheck = $('#birthcheck');
		var phonecheck = $('#phonecheck');
		var emailcheck = $('#emailcheck');

		// 정규식
		var idReg = /^[A-Za-z0-9]{3,10}$/;
		var emailReg = /^[\w]{2,}@[\w]+(\.[\w-]+){1,3}$/;
		var nameReg = /^[가-힝]{2,10}$/;
		var birthReg1 = /^(19|20)\d{2}$/;
		var birthReg2 = /^(0[1-9]|1[012])$/;
		var birthReg3 = /^(0[1-9]|[12][0-9]|3[0-1])$/;
		var phoneReg1 = /^01([0|1|6|7|8|9]){1,3}$/;
		var phoneReg2 = /^([0-9]{3,4})$/;
		var phoneReg3 = /^([0-9]{4})$/;

		// 반환값 체크
		var submitFlag = true;

		// 유효성체크 시작!
		if (!chk(idReg, $('#memId'), "유효하지 않은 아이디 입니다.", idresult, 'memId')) {
			submitFlag = false;
			return;
		} else if (!chkPwd($('#memPwd'), $('#memPwd2'), pwdcheck2,
				"유효하지 않은 비밀번호 입니다.")) {
			submitFlag = false;
			return;
		} else if (!chk(nameReg, $('#memName'),
				"유효하지 않은 이름입니다. 한글로 2글자 이상 10자이하로 입력하세요", namecheck)) {
			submitFlag = false;
			return;
		} else if (!chk(birthReg1, $('#memBirth1'),
				"유효하지 않은 생일입니다.년도는 1900년대 이상으로 써주세요.", birthcheck)) {
			submitFlag = false;
			return;
		} else if (!chk(birthReg2, $('#memBirth2'), "유효하지 않은 생일입니다.",
				birthcheck, 'memBirth')) {
			submitFlag = false;
			return;
		} else if (!chk(birthReg3, $('#memBirth3'), "유효하지 않은 생일입니다.",
				birthcheck, 'memBirth')) {
			submitFlag = false;
			return;
		} else if (!chk(phoneReg1, $('#memPhone1'), "유효하지 않은 휴대전화 번호입니다.",
				phonecheck)) {
			submitFlag = false;
			return;
		} else if (!chk(phoneReg2, $('#memPhone2'), "유효하지 않은 휴대전화 번호입니다.",
				phonecheck)) {
			submitFlag = false;
			return;
		} else if (!chk(phoneReg3, $('#memPhone3'), "유효하지 않은 휴대전화 번호입니다.",
				phonecheck)) {
			submitFlag = false;
			return;

		} else if (!chk(emailReg, $('#memEmail'), "유효하지 않은 이메일입니다.",
				emailcheck, 'memEmail')) {
			submitFlag = false;
			return;

		}
		return submitFlag;
	}

	return {
		init : init,
		validate : validate
	}
}