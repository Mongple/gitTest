<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>

<link rel="stylesheet" type="text/css"
	href="/fleamarket/css/adminMain.css">

<script type="text/javascript" src="/fleamarket/js/adminMain.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:: USER MANAGE ::</title>

<script type="text/javascript">
	// var adminMain = AdminMain();

	var searchType = "SEARCHALL";
	$(document).ready(function(){
		$('#searchType').change(function () {
	      	$("#searchType option:selected").each(function () {
	      		searchType = $(this).val();
	       	});
	    })
	   
	    $('#searchbtn').click(function () {
	    	$.ajax({
				type:"post",
				url:'/fleamarket/admin/userManage/manageList.ajax',
				data: 'searchType='+searchType+'&searchData='+$('#searchData').val(),
				success : function(html){
					$('#inner').html(html);
				    if($('#totalRowCnt').val() == 0){
				    	alert("검색결과가 없습니다.");
				    	$(location).attr('href','/fleamarket/admin/userManage/manageList');
				    }
				},
				error : function(){
					alert("에러")
				}
			});
	    })
	}); 
	function clickA(p) {
		$.ajax({
			type:"post",
			url:'/fleamarket/admin/userManage/manageList.ajax',
			data: 'page='+p+'&searchType='+searchType+'&searchData='+$('#searchData').val(),
			success : function(html){
				$('#inner').html(html);
			},
			error : function(){
				alert("에러")
			}
		});
	}
	function clickWarp(warp) {
		var url = '/fleamarket/admin/userManage/manageList.ajax';
		var param;
		page = parseInt($('#page').val());
		pageCnt = parseInt($('#pageCnt').val());
		if(warp == 'doubleLeft'){
			param = 'page=1';
		}else if(warp == 'singleLeft') {
			if(page == 1)
				return;
			else
				page = page-1;
			param = 'page='+page;
		}else if(warp == 'singleRight') {
			if(page == pageCnt)
				return;
			else
				page = page+1;
			param = 'page='+page;
		}else if(warp == 'doubleRight'){
			param = 'page='+pageCnt;
		}
		
		$.ajax({
			type:"post",
			url:url,
			data: param+'&searchType='+searchType+'&searchData='+$('#searchData').val(),
			success : function(html){
				$('#inner').html(html);
			},
			error : function(){
				alert("에러")
			}
		});
	}


function waringMember(memId, memBlack) {
	if(memBlack < 3)
	{
		result = confirm("경고를 추가하시겠습니까?");
		if(result == true) {
			$(location).attr('href', '/fleamarket/admin/userManage/add?memId='+memId);	
		} else { return; }
	}
	else {
		alert("경고 2회 이상입니다.");
	}
}

function updateMember(memId) {
	result = confirm("정보를 수정하시겠습니까?");
	if(result == true) {
		
		/* 유효성 넣을 곳 */
		
		$("#adminUpdateForm").attr('action', '/fleamarket/admin/userManage/update?memId='+memId);
	} else { return; }
}

function outMember(memId) {
	result = confirm("정말로 퇴출하시겠습니까?");
	if(result = true) {
		$(location).attr('href', '/fleamarket/admin/userManage/delete?memId='+memId);
	} else { return; }
}

</script>

</head>
<body>
	<div id="adminMain">
		<div id="title">
			<span id="title_name">USER MANAGE</span>
		</div>

		<div id="top_bar">
			<a href="/fleamarket/admin/adminMain/rate">
					<span id="admin_type">Chart Check</span></a>
			&nbsp / &nbsp
			<a href="/fleamarket/admin/userManage/manageList">
					<span id="admin_type">User Manage</span></a>
			<br />
		</div>
		<br />
		<div>
			<select id="searchType">
							<option value="SEARCHALL">전체</option>
							<option value="SEARCHID">아이디</option>
							<option value="SEARCHNAME">이름</option>
							<option value="SEARCHPHONE">전화번호</option>
							<option value="SEARCHEMAIL">이메일</option>
							<option value="SEARCHGRANT">권한</option>
							<option value="SEARCHBLACK">경고횟수</option>
					</select> 
					<input type="text" id="searchData"  value="${vo.searchData }" >
					<a><span id="searchbtn" class="mgBtn" onclick="search()">조회</span></a> 
		</div>
		<div id="inner">
		<div id="content">
		<form action="" method="post" id="adminUpdateForm">
			<table id="memberList" class="memberList">
				<tr>
					<td style="width: 80px;">Total ${vo.totalRowCnt }</td>
				</tr>
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>가입날짜</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>권한</th>
					<th>경고횟수</th>
					<th>비고</th>
				</tr>
				<c:forEach var="vo" items="${list}">
					<tr>
						<td style="width: 30px;">${vo.memNo}</td>
						<td style="width: 80px;">${vo.memId}</td>
						<td>
							<input type="text" style="width: 60px;" value="${vo.memName}" /></td>
						<td style="width: 80px;">${vo.memBirth}</td>
						<td style="width: 100px;">${vo.memDate}</td>
						<td>
							<input type="text" style="width: 100px;" value="${vo.memPhone}" /></td>
						<td>
							<input type="text" style="width: 120px;" value="${vo.memEmail}" /></td>
						<td>
							<input type="text" style="width: 30px;" value="${vo.memGrant}" /></td>
						<td>
							<input type="text" style="width: 30px;" value="${vo.memBlack}" /></td>
						<td style="width: 100px;">
							<a><span id="updateMember" class="mgBtn" onclick="updateMember('${vo.memId}')">수정</span></a>
							<a><span id="waringMember" class="mgBtn" onclick="waringMember('${vo.memId}','${vo.memBlack}')">경고</span></a>
							<a><span id="outMember" class="mgBtn" onclick="outMember('${vo.memId}')">퇴출</span></a>
						</td>
					</tr>
				</c:forEach>
			</table>
			</form>
			
		</div>
		<div id="paging" align="center">
			<jsp:include page="/WEB-INF/view/common/paging.jsp"></jsp:include>
		</div>
		</div>
		
	</div>
</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>