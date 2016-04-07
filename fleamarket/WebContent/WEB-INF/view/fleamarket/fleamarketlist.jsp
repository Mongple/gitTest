<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/fleamarket/css/flealist.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">

	var searchType = "SEARCHALL";
	$(document).ready(init);
	function init() {
		$('#searchType').change(function () {
	      	$("#searchType option:selected").each(function () {
	      		searchType = $(this).val();
	       	});
	    })
	    $('#searchbtn').click(function () {
	    	$.ajax({
				type:"post",
				url:'/fleamarket/market.ajax',
				data: 'baType=${vo.baType}&searchType='+searchType+'&searchData='+$('#searchData').val(),
				success : function(html){
					$('#inner').html(html);
				    if($('#totalRowCnt').val() == 0){
				    	alert("검색결과가 없습니다.");
				    	$(location).attr('href','/fleamarket/market?baType=${vo.baType}');
				    }
				},
				error : function(){
					alert("에러")
				}
			});
	    })
	}
	
	function clickA(p) {
		$.ajax({
			type:"post",
			url:'/fleamarket/market.ajax',
			data: 'page='+p+'&baType=${vo.baType}&searchType='+searchType+'&searchData='+$('#searchData').val(),
			success : function(html){
				$('#inner').html(html);
			},
			error : function(){
				alert("에러")
			}
		});
	}
	function clickWarp(warp) {
		var url = '/fleamarket/market.ajax';
		var param;
		page = parseInt($('#page').val());
		pageCnt = parseInt($('#pageCnt').val());
		if(warp == 'doubleLeft'){
			param = 'page=1&baType=${vo.baType}';
		}else if(warp == 'singleLeft') {
			if(page == 1)
				return;
			else
				page = page-1;
			param = 'page='+page+'&baType=${vo.baType}';
		}else if(warp == 'singleRight') {
			if(page == pageCnt)
				return;
			else
				page = page+1;
			param = 'page='+page+'&baType=${vo.baType}';
		}else if(warp == 'doubleRight'){
			param = 'page='+pageCnt+'&baType=${vo.baType}';
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
		$(location).attr('href', '/fleamarket/market/writeboard?baType=${vo.baType}');
		/* <a href="/fleamarket/market/writeboard?baType=${vo.baType}">새글등록</a> */
	}		
	
</script>
<title>:: FLEAMARKET BOARD ::</title>
</head>
<body>
	<div id="fleamarketlist">
		<div id="title">
			<span id="title_name">${vo.baType} BOARD</span>
		</div>
		<div id="top_bar">
			<a href="/fleamarket/market?baType=WEAR"><span class="fleamarket_type">WEAR</span></a>
			&nbsp / &nbsp
			<a href="/fleamarket/market?baType=PRODUCT"><span class="fleamarket_type">PRODUCT</span></a>
		</div>
		<div>
			<select id="searchType">
					<option value="SEARCHALL">전체</option>
					<option value="SEARCHID">아이디</option>
					<option value="SEARCHNAME">이름</option>
					<option value="SEARCHTITLE">제목</option>
					<option value="SEARCHCONTENT">내용</option>
			</select> 
			<input type="text" id="searchData"  value="${vo.searchData }" >
			<a><span id="searchbtn" class="mgBtn" onclick="search()">조회</span></a> 
		</div>
		
		<div id="inner">
			<div id="content">
				<table id="noticeList" class="noticeList">
					<tr>
						<td style="width: 80px;">Total ${vo.totalRowCnt }</td>
						<td colspan="5" align="right">
							<c:if test="${sessionId != null}">
								<input class="btn" type="button" onclick="writeBoard()" value="글등록">
							</c:if>
						</td>
						<tr>
							<th>No.</th>
							<th>Title</th>
							<th>Id</th>
							<th>Name</th>
							<th>Date</th>				
							<th>hits</th>
						</tr>
					<!-- jstl -->
					<c:forEach items="${list}" var="vo">
						<tr id="noticeListTR">
							<td style="width: 30px;">${vo.baNo}</td>
							<td style="width: 300px;">
								<a href="/fleamarket/market/updateBaCount?baNo=${vo.baNo}">
								<c:set var="kk" value="${vo.baTitle}" />
									<c:choose>
										<c:when test="${fn:length(kk) > 25}">${fn:substring(kk, 0, 25)}...</c:when>
										<c:otherwise>${kk}</c:otherwise>
									</c:choose>
								</a>
							</td>
							<td style="width: 50px;">${vo.memId}</td>
							<td style="width: 50px;">${vo.memName}</td>
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