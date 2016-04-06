<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
	var searchType = "SEARCHALL";
	$(document).ready(init);
	function init() {
		$('td a').click(clickAtag);
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
	function clickAtag() {
		$(location).attr('href','/fleamarket/market/updateBaCount?baNo='+ this.innerHTML);
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
</script>

<title>플리 리스트1</title>
</head>
<body>
	<div id="fleamarketlist" align="center">
		<h1>fleamarketlist</h1>
 		
		<a href="/fleamarket/market?baType=WEAR">WEAR</a>
		<a href="/fleamarket/market?baType=PRODUCT">PRODUCT</a>
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
			<h4>${vo.totalRowCnt }</h4>
			<table border="1">
				<tr>
					<th width="5%">No.</th>
					<th width="40%">Title</th>
					<th width="10%">Id</th>
					<th width="10%">Name</th>
					<th width="15%">Date</th>				
					<th width="5%">hits</th>
				</tr>
				<!-- jstl -->
				<c:forEach items="${list}" var="vo">
					<tr>
						<td align="center"><a>${vo.baNo}</a></td>
						<td>${vo.baTitle}</td>
						<td>${vo.memId}</td>
						<td>${vo.memName}</td>
						<td>${vo.baDate}</td>
						<td>${vo.baCount}</td>
					</tr>
				</c:forEach>
			</table>
			<div id="paging" align="center">
				<jsp:include page="/WEB-INF/view/common/paging.jsp"></jsp:include>
			</div>
			
			<c:if test="${sessionId != null}">		
			 	<a href="/fleamarket/market/writeboard?baType=${vo.baType}">새글등록</a>
			</c:if>
		</div>
	</div>


</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>