<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
	
</script>
<title>:: FLEAMARKET ::</title>
</head>
<body>
	<!-- <div class="mainImage"  style="background-image:url(/fleamarket/img/mainmain.jpg); height: 450px; ">
		<div id='title' style="position:absolute; top: 400px; left: 13%;">main<font size="2"></div>
	</div> -->
	
	<div class="container" >
        <div class="col-md-12">

                <div class="row carousel-holder">

                    <div class="col-xs-12">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img class="slide-image" src="/fleamarket/img/market3.jpg"  style="height: 400px" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="/fleamarket/img/market4.jpg" style="height: 400px" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="/fleamarket/img/market2.jpg" style="height: 400px" alt="">
                                </div>
                            </div>
                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </div>
                    </div>

                </div>
				 <h3>Recently Wear Board</h3>
                <div class="row">

                    <c:forEach var="vo" items="${wearList}">
						<div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                             <%-- <img src="${vo.baContent}" style="width: 360px;height: 200px"   alt=""> --%>
                             ${vo.baContent}
                            <div class="caption">
                                <h4><a href="/fleamarket/market/board?baType=WEAR&baNo=${vo.baNo}" style="text-decoration: none;color: black;">${vo.baTitle}</a>
                                </h4>
            
                            </div>
                            <div class="ratings">
                                <p class="pull-right">${vo.baDate }</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>
					</c:forEach>

                </div>
                <h3>Recently Product Board</h3>
                <div class="row">

                    <c:forEach var="vo" items="${proList}">
						<div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                             <%-- <img src="${vo.baContent}" style="width: 360px;height: 200px"   alt=""> --%>
                             ${vo.baContent}
                            <div class="caption">
                                <h4><a href="/fleamarket/market/board?baType=PRODUCT&baNo=${vo.baNo}" style="text-decoration: none;color: black;">${vo.baTitle}</a>
                                </h4>
            
                            </div>
                            <div class="ratings">
                                <p class="pull-right">${vo.baDate }</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>
					</c:forEach>

                </div>

            </div>

    </div>
</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>