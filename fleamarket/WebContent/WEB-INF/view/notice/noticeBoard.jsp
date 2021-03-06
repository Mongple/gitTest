<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/fleamarket/css/notice.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
	
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
			url:'/fleamarket/notice/noticeList.ajax',
			data: 'searchType='+searchType+'&searchData='+$('#searchData').val(),
			success : function(html){
				$('#inner').html(html);
			    if($('#totalRowCnt').val() == 0){
			    	alert("검색결과가 없습니다.");
			    	$(location).attr('href','/fleamarket/notice/noticeList');
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
		url:'/fleamarket/notice/noticeList.ajax',
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
	var url = '/fleamarket/notice/noticeList.ajax';
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


function writeBoard() {
	$(location).attr('href', '/fleamarket/notice/noticeList/write');
}
	
</script>
<title>:: Notice Board ::</title>
</head>
<body>
	<div id="noticeBoard">
		<div id="title">
			<span id="title_name">NOTICE BOARD</span>
		</div>
		<br />

		<div>
			<select id="searchType">
				<option value="SEARCHALL">전체</option>
				<option value="SEARCHTITLE">제목</option>
				<option value="SEARCHCONTENT">내용</option>
			</select>
			<input type="text" id="searchData" value="${vo.searchData }">
			<a><span id="searchbtn" class="mgBtn" onclick="search()">조회</span></a>
		</div>
		
		<div id="inner">
			<div id="content">
				<table id="noticeList" class="noticeList">
					<tr>
						<td style="width: 80px;">Total ${vo.totalRowCnt }</td>
						<td colspan="4" align="right">
							<c:if test="${sessionGrant == 'A'}">
								<input class="btn" type="button" onclick="writeBoard()" value="글등록">
							</c:if>
						</td>
					</tr>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
					<c:forEach items="${list }" var="vo">
						<tr id="noticeListTR">
							<td style="width: 30px;">${vo.baNo}</td>
							<td style="width: 330px;">
								<a href="/fleamarket/notice/updateBaCount?baNo=${vo.baNo}">
								<c:set var="kk" value="${vo.baTitle}" />
									<c:choose>
										<c:when test="${fn:length(kk) > 25}">${fn:substring(kk, 0, 25)}...</c:when>
										<c:otherwise>${kk}</c:otherwise>
									</c:choose>
								</a>
							</td>
							<td style="width: 70px;">${vo.memId}</td>
							<td style="width: 150px;">${vo.baDate}</td>
							<td style="width: 50px;">${vo.baCount}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<br />			

			<div id="paging" align="center">
				<jsp:include page="/WEB-INF/view/common/paging.jsp"></jsp:include>
			</div>
		</div>
		
	</div>
</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>