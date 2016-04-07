<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/fleamarket/css/join.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:: MEMBER EDIT ::</title>

<script src="/fleamarket/js/join.js" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript">
$(document).ready(function() {
	//서브밋 가능여부 플래그
	var flag = true;
	
	//키 업될때마다 실행
	$('#memberInsertForm input').keyup(function(){
		
		//유효성 체크, 모든게 정상이면 true;
		flag = validate();
		
		//이메일중복체크
		var getMemEmail = "${vo.memEmail}";
		if(getMemEmail != $('#memEmail').val()){
			$.ajax({
				type : "POST",
				url : "/fleamarket/member/emailCheck",
				data : "memEmail="+$('#memEmail').val(),
				success : function(args) {
					if (args == "cc") {
						$('#emailcheck').html("<font color='red'>"+"이미 가입된 이메일 입니다."+"</font>");
						flag = false;
					}
				},
				error : function(e) {
					alert(e.responseText);
				}
			});
		}
		
		
	});
	//서브밋
	$(".joinBtn").click(function(){
		
		if(flag == undefined || flag == false)
			alert("유효하지 않은 데이터입니다.");
		else
			$("#memberInsertForm").submit();
	});
	$(".cancleBtn").click(function(){
		$(location).attr('href', '/fleamarket/member/mypage/memberinfo');
	});
});
//정규식을 이용한 체크
function chk(re, e, msg, span,type) {
	//alert(e.val().length);
	if(e.val().length==0){
		span.html('');			
	}
	if(type=='memBirth'){
		if(e.val().length ==1 && 1<parseInt(e.val()) && parseInt(e.val()) < 10  ){
			e.val('0'+e.val());
		}
	}
	
	//정규식통과
	if (re.test(e.val())) {
		span.html("<font color='green'>사용가능합니다.</font>");
		return true;
	}
	span.html("<font color='red'>"+msg+"</font>");
	return false;
}
//비밀번호체크
function chkPwd(pwd1, pwd2, span, msg) {
	
	span.html('');
	if(pwd1.val().length<3){
		span.html("<font color='red'>3자리 이상 입력해주세요.</font>");
	}else if(pwd1.val() == pwd2.val()){
		span.html("<font color='green'>사용가능합니다.</font>");
		return true;
	}else
		span.html("<font color='red'>"+msg+"</font>");
	return false;
	
}

//유효성검사!
function validate() {
	//span객체
	var idresult = $('#idresult');
	var pwdcheck1 = $('#pwdcheck1');
	var pwdcheck2 = $('#pwdcheck2');
	var namecheck = $('#namecheck');
	var birthcheck =$('#birthcheck');
	var phonecheck = $('#phonecheck');
	var emailcheck = $('#emailcheck');
	
	//정규식
	var idReg = /^[A-Za-z0-9]{3,10}$/;
	var emailReg = /^[\w]{4,}@[\w]+(\.[\w-]+){1,3}$/;
	var nameReg = /^[가-힝]{2,10}$/;
	var birthReg1 = /^(19|20)\d{2}$/;
	var birthReg2 = /^(0[1-9]|1[012])$/;
	var birthReg3 = /^(0[1-9]|[12][0-9]|3[0-1])$/;
	var phoneReg1 = /^01([0|1|6|7|8|9]){1,3}$/;
	var phoneReg2= /^([0-9]{3,4})$/;
	var phoneReg3 = /^([0-9]{4})$/;
	
	//반환값 체크
	var submitFlag = true;
	
	//유효성체크 시작!
    if(!chk(idReg, $('#memId'), "유효하지 않은 아이디 입니다.", idresult, 'memId')){
    	submitFlag = false;
    	return;
    }else if(!chkPwd($('#memPwd'), $('#memPwd2'), pwdcheck2, "유효하지 않은 비밀번호 입니다.")) {
    	submitFlag = false;
    	return;
	}
    else if(!chk(nameReg, $('#memName'),"유효하지 않은 이름입니다. 한글로 2글자 이상 10자이하로 입력하세요", namecheck)){
		submitFlag = false;
		return;
	}
    else if(!chk(birthReg1, $('#memBirth1'), "유효하지 않은 생일입니다.년도는 1900년대 이상으로 써주세요.", birthcheck)){
		submitFlag = false;
		return;
	}
    else if(!chk(birthReg2, $('#memBirth2'), "유효하지 않은 생일입니다.", birthcheck, 'memBirth')){
		submitFlag = false;
		return;
	}
    else if(!chk(birthReg3, $('#memBirth3'), "유효하지 않은 생일입니다.", birthcheck, 'memBirth')){
		submitFlag = false;
		return;
	}
    else if(!chk(phoneReg1,  $('#memPhone1'), "유효하지 않은 휴대전화 번호입니다.", phonecheck)){
		submitFlag = false;
		return;
	}
    else if(!chk(phoneReg2,  $('#memPhone2'), "유효하지 않은 휴대전화 번호입니다.", phonecheck)){
		submitFlag = false;
		return;
	}
    else if(!chk(phoneReg3,  $('#memPhone3'), "유효하지 않은 휴대전화 번호입니다.", phonecheck)){
		submitFlag = false;
		return;
		
	}
    else if(!chk(emailReg, $('#memEmail'), "유효하지 않은 이메일입니다.", emailcheck, 'memEmail')){
    	submitFlag = false;
    	return;
    	
    }
    return submitFlag;
}
</script>

</head>
<body>
	
	<div id="join">
		<div id="title">
			<span id="title_name">MEMBER EDIT</span>
		</div>
		<div id="top_bar">
			<a href="/fleamarket/member/mypage/board?baType=PRODUCT"><span class="mypage_type">Product Board Active</span></a>
			&nbsp / &nbsp
			<a href="/fleamarket/member/mypage/board?baType=WEAR"><span class="mypage_type">Wear Board Active</span></a>
			&nbsp / &nbsp
			<a href="/fleamarket/member/mypage/chkPwd"><span class="mypage_type">Mypage Manage</span></a>
		</div>
		<div id="content">
		<form action="/fleamarket/member/mypage/updateAction" method="post" id="memberInsertForm">
			<table id="form_table">
				<tr>
					<td>
						<input type="text" name="memId" id="memId" value="${vo.memId }" readonly="readonly" placeholder="아이디"/><br />
						<span id="idresult"></span>
					</td>
				</tr>
				<tr>
					<td>
						<input type="password" name="memPwd" id="memPwd" value="" placeholder="비밀번호"/><br />
						<span id="pwdcheck1"></span>
					</td>
				</tr>
				<tr>
					<td>
						<input type="password" name="memPwd2" id="memPwd2" value="" placeholder="비밀번호확인"/><br />
						<span id="pwdcheck2"></span>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="memName" id="memName" value="${vo.memName }"placeholder="이름"/><br />
						<span id="namecheck"></span>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="memBirth1" id="memBirth1" class="inputThree" readonly="readonly" value="${fn:split(vo.memBirth,'/')[0] }" maxlength="4" placeholder="생년(ex 1990)"/>
						<input type="text" name="memBirth2" id="memBirth2" class="inputThree" readonly="readonly" value="${fn:split(vo.memBirth,'/')[1] }" maxlength="2" placeholder="월"/>
						<input type="text" name="memBirth3" id="memBirth3" class="inputThree" readonly="readonly" value="${fn:split(vo.memBirth,'/')[2] }" maxlength="2" placeholder="일"/><br>
						<span id="birthcheck"></span>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="memPhone1" id="memPhone1" class="inputThree" value="${fn:split(vo.memPhone,'-')[0] }" maxlength="3" placeholder="전화번호"/>
						<input type="text" name="memPhone2" id="memPhone2" class="inputThree" value="${fn:split(vo.memPhone,'-')[1] }" maxlength="4" size="1"/>
						<input type="text" name="memPhone3" id="memPhone3" class="inputThree" value="${fn:split(vo.memPhone,'-')[2] }" maxlength="4" size="1"/><br>
					 	<span id="phonecheck"></span>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="memEmail" id="memEmail" value="${vo.memEmail}" placeholder="이메일"/><br />
						<span id="emailcheck"></span>
					</td>
				</tr>
			</table>
			
			<table>
				<tr>
					<td colspan="2" align="center">
						<input type="button" id="btn" class="joinBtn" value="수정" />
						<input type="button" id="btn" class="cancleBtn" value="취소" />
					</td>
				</tr>	
			</table>
		</form>
		
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>