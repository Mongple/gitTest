<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
	$(document).ready(init);

	function init() {
		$('td a').click(clickA);
	}
	function clickA() {

		$(location).attr('href', 'editView.do?abId=' + this.innerHTML);
		/* pwd = prompt('수정/삭제 하려면 비밀번호를 넣으세요');
		//document.location.href="addrbook_control.jsp?action=edit&ab_id="+ab_id+"&upasswd="+pwd;
		document.location.href="editview.do?ab_id="+ab_id+"&upasswd="+pwd; */
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<div  class="content" id="main" align="center">
		<h1>main Contents</h1>
	</div>
</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>