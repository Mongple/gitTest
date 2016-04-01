<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
	function clickA(p) {
		$.ajax({
			type:"post",
			url:'/fleamarket/member/mypage/board?page='+p+'&baType=${vo.baType}',
			success : function(html){
				$('#inner').html(html);
			},
			error : function(){
				alert("에러")
			}
		});
	}
	function clickWarp(warp) {
		var url = '/fleamarket/member/mypage/board';
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
			url:'/fleamarket/member/mypage/board',
			data: param,
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
	<a href="/fleamarket/member/mypage/product">가전제품 게시판 활동내역</a>&nbsp&nbsp//&nbsp&nbsp
	<a href="/fleamarket/member/mypage/wear">의류 게시판 활동내역</a>&nbsp&nbsp//&nbsp&nbsp
	<a href="/fleamarket/member/mypage/memberinfo">나의정보</a>
	<br><br>
	<div id="inner" align="center">
		<input type="hidden" id="page" value="${vo.page }" >
		<input type="hidden" id="pageCnt" value="${vo.pageCnt }" >
		<table border="1">
			<tr>			
				<td>게시물번호</td>
				<td>활동유형</td>
				<td>게시글작성자</td>
				<td>게시글제목</td>
				<td>게시글작성날짜</td>
				<td>조회수</td>
			</tr>
			<c:forEach items="${list }" var="vo">
				<tr>
					<td>${vo.baNo }</td>	
					<c:if test="${sessionId == vo.memId}">
						<td>게시글작성</td>
					</c:if>
					<c:if test="${sessionId != vo.memId}">
						<td>댓글작성</td>
					</c:if>
					<td>${vo.memId}</td>	
					<td>${vo.baTitle}</td>
					<td>${vo.baDate}</td>
					<td>${vo.baCount}</td>
				</tr>
			</c:forEach>
		</table>
		
		<div id="paging" align="center">
			<a onclick="clickWarp('doubleLeft')"><<</a>
			<a onclick="clickWarp('singleLeft')"><</a>
			<c:choose>
				<c:when test="${vo.blockCnt == 1 }">
					<c:forEach var="p" begin="1" end="${vo.pageCnt }">
						<a onclick="clickA('${p}')">${p}</a>
					</c:forEach>
				</c:when>
				<c:when test="${vo.blockCnt > 1 }">
					<c:if test="${vo.blockCnt == vo.block }">
						<c:forEach var="p" begin="${vo.block*10-9}" end="${vo.pageCnt}">
							<a onclick="clickA('${p}')">${p}</a>
						</c:forEach>
					</c:if>
					<c:if test="${vo.blockCnt != vo.block }">
						<c:forEach var="p" begin="${vo.block*10-9}" end="${vo.block*10}">
							<a onclick="clickA('${p}')">${p}</a>
						</c:forEach>
					</c:if>
				</c:when>
			</c:choose>
			<a onclick="clickWarp('singleRight')">></a>
			<a onclick="clickWarp('doubleRight')">>></a>
		</div>
	</div>
</div>
<!-- 	<div id="mypage" align="center"style="width: 500px">
		<ul class="nav nav-pills">
		  <li class="active"><a href="#">Home</a></li>
		  <li><a href="#">Menu 1</a></li>
		  <li><a href="#">Menu 2</a></li>
		  <li><a href="#">Menu 3</a></li>
		</ul>
	</div> -->
</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>