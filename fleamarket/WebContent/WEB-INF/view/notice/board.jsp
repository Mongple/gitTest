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
	$(document).ready(function(){
		$('#searchType').change(function () {
	      	$("#searchType option:selected").each(function () {
	      		searchType = $(this).val();
	       	});
	    })
	   
	    $('#searchbtn').click(function () {
	    	$.ajax({
				type:"post",
				url:'/fleamarket/notice/resultboard',
				data: 'searchType='+searchType+'&searchData='+$('#searchData').val(),
				success : function(html){
					$('#inner').html(html);
				    if($('#totalRowCnt').val() == 0){
				    	alert("검색결과가 없습니다.");
				    	$(location).attr('href','/fleamarket/notice/board');
				    }
				},
				error : function(){
					alert("에러")
				}
			});
	    })
	    
	    $('#insertBtn').click(function () {
	    	$(location).attr('href','/fleamarket/notice/write');
	    })
	}); 
	function clickA(p) {
		$.ajax({
			type:"post",
			url:'/fleamarket/notice/resultboard',
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
		var url = '/fleamarket/notice/resultboard';
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
</script>
<title>Insert title here</title>
</head>
<body>
<div align="center">
	<div id="search">
		<table>
			<tr>
				<td align="right">
					<select id="searchType">
							<option value="SEARCHALL">전체</option>
							<option value="SEARCHTITLE">제목</option>
							<option value="SEARCHCONTENT">내용</option>
					</select> 
					<input type="text" id="searchData"  value="${vo.searchData }" >
					<input type="button" id="searchbtn" value="조회" onclick="search()"> 
				</td>
			</tr>
		</table>
	</div>
	<div id="inner" align="center">
		총 ${vo.totalRowCnt }개의 게시물</td>
		<table border="1">
			<tr>			
				<td>게시물번호</td>
				<td>게시글작성자</td>
				<td>게시글제목</td>
				<td>게시글작성날짜</td>
				<td>조회수</td>
			</tr>
			<c:forEach items="${list }" var="vo">
				<tr>
					<td>${vo.baNo }</td>	
					<td>${vo.memId}</td>	
					<td>${vo.baTitle}</td>
					<td>${vo.baDate}</td>
					<td>${vo.baCount}</td>
				</tr>
			</c:forEach>
		</table>
		<c:if test="${sessionGrant == 'A'}">
			<input id="insertBtn" type="button" value="글등록">
		</c:if>
		<div id="paging" align="center">
			<jsp:include page="/WEB-INF/view/common/paging.jsp"></jsp:include>
		</div>
	</div>
</div>

</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>