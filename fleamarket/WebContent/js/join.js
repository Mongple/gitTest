/*
 *	MEMBER JOIN
 */
/*
 *	MEMBER JOIN
 */

var memId;
var memName;
var memPwd1;
var memPwd2;
var memBirth1;
var memBirth2;
var memBirth3;
var memPhone1;
var memPhone2;
var memPhone3;
var memEmail;
/*var idresult;
var pwdcheck1;
var pwdcheck2;
var namecheck;
var birthcheck;
var phonecheck;
var emailcheck;*/
var chkValidate =function(){
	function chk(re, e, msg, span, type) {
		if (re.test(e.value)) {
			return true;
		}
		if (type == 'memId'){
			//중복검사!
		}else if(type == 'memEmail'){
			//중복검사!
		}
		span.value=msg;
		e.value = "";
		e.focus();
		return false;
	}
	
	function setValue(){
		alert("?");
		$('#memId').keyup(function() {
			memId = $('#memId').val();
		});
		$('#memName').keyup(function() {
			memName = $('#memName').val();
		});
		$('#memPwd1').keyup(function() {
			memPwd1 = $('#memPwd1').val();
		});
		$('#memPwd2').keyup(function() {
			memPwd2 = $('#memPwd2').val();
		});
		$('#memBirth1').keyup(function() {
			memBirth1 = $('#memBirth1').val();
		});
		$('#memBirth2').keyup(function() {
			memBirth2 = $('#memBirth2').val();
		});
		$('#memBirth3').keyup(function() {
			memBirth3 = $('#memBirth3').val();
		});
		$('#memPhone1').keyup(function() {
			memPhone1 = $('#memPhone1').val();
		});
		$('#memPhone2').keyup(function() {
			memPhone2 = $('#memPhone2').val();
		});
		$('#memPhone3').keyup(function() {
			memPhone3 = $('#memPhone3').val();
		});
		$('#memEmail').keyup(function() {
			memEmail = $('#memEmail').val();
		});
	}
	
	function validate() {
		var idresult = $('#idresult');
		var pwdcheck1 = $('#pwdcheck1');
		var pwdcheck2 = $('#pwdcheck2');
		var namecheck = $('#namecheck');
		var birthcheck =$('#birthcheck');
		var phonecheck = $('#phonecheck');
		var emailcheck = $('#emailcheck');
		var submitFlag = true;
		// 아이디 검사
	    // 첫 글자는 반드시 영문 소문자, 4~12자로 이루어지고, 숫자가
	    // 하나 이상 포함되어야 한다. 영문소문자와 숫자로만 이루어져야한다.
	    // \d : [0-9]와 같다.       {n,m} : n에서 m까지 글자수
	    if(!chk(/^[a-z][a-z\d]{3,11}$/, memId, "첫글자는 영문 소문자, 4~12자 입력하세요.", idresult, 'memId')){
	    	submitFlag = false;
	    	return;
	    }else if(memPwd1.value!=memPwd2.value) {
	    	pwdcheck2.value = "비밀번호가 일치하지 않습니다.";
	    	submitFlag = false;
	        return;
		}else if(!chk(/^[\w]{4,}@[\w]+(\.[\w-]+){1,3}$/, memEmail, "이메일 형식에 어긋납니다.", emailcheck, 'memEmail')){
			submitFlag = false;
			return;
		}else if(!/^[가-힝]{2,10}$/, memName, "한글로 2글자 이상 10자이하로 입력하세요"){
			submitFlag = false;
			return;
		}else if(memPhone1.length != 4){
			submitFlag = false;
			phonecheck.value = "ex)2016 형태로 써주세요."
			return;
		}
	    return submitFlag;
	    alert(submitFlag);
	}
	function submitCheck() {
		$(".joinBtn").click(function(){
			if(validate)
				$("#memberInsertForm").submit();
			else
				return;
		});
	}
	
	return {validate : validate, submitCheck : submitCheck, setValue : setValue}
}
