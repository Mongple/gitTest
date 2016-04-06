<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="/fleamarket/css/marketboard.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
   $(document).ready(init);
   function init() {
      $("#editbtn").click(edit);
   }
   function edit() {
      var baNo = $("#baNo").val();
      $(location).attr('href', '/fleamarket/market/editboard?baNo=' + baNo);
   }
   function cancel() {
      var baType = $("#baType").val();
      if(baType=="WEAR"){
         $(location).attr('href', '/fleamarket/market');
      }else{
         $(location).attr('href', '/fleamarket/market?baType='+baType);
      }
   }
   function delcheck() {
      result = confirm("정말로 삭제하시겠습니까 ?");
      var baNo = $("#baNo").val();
      var baType = $("#baType").val();
      if(result == true){
         $(location).attr('href','/fleamarket/market/deleteBoard?baNo='+baNo+'&baType='+baType);
      }
      else
         return;
   }
   function delcomment(rpNo, baNo) {
      result = confirm("댓글 정말로 삭제하시겠습니까 ?");
      if(result == true){
         $(location).attr('href','/fleamarket/market/deleteComment?rpNo='+rpNo+'&baNo='+baNo);
      }
      else
         return;
   }
</script>

<title>플리보드</title>
</head>
<body>
   <div align="center">
      <h1>fleamarket board Contents</h1>

      <form name=form1 action="/fleamarket/market/board">
         <input type=hidden id="baNo" name="baNo" value="${vo.baNo}">
         <input type="hidden" name="baType" id="baType" value="${vo.baType}">
         
         <table class="tbl_type" border="1" cellspacing="0" summary="글 내용을 표시">
            <caption>글 읽기</caption>
            <colgroup>
               <col width="80"><col><col width="80">
               <col width="150"><col width="80"><col width="150"><col width="80">
            </colgroup>
            <thead>
               <tr>
                  <th scope="row">제목</th>
                  <td colspan="7">${vo.baTitle}</td>
               </tr>
            </thead>
            <tbody>
            <tr>
               <th scope="row">작성자</th>
               <td>${vo.memName}</td>
               <th scope="row">id</th>
               <td>${vo.memId}</td>
               <th scope="row">작성일</th>
               <td>${vo.baDate}</td>
               <th scope="row">조회</th>
               <td>${vo.baCount}</td>
            </tr>
            <tr>
               <td class="cont" colspan="8">
                  ${vo.baContent}
               </td>
            </tr>
   
            </tbody>
         </table>
         <table>
            <tr>
               <c:if test="${sessionId == vo.memId || sessionGrant == 'A'}">               
                  <td colspan=2 align=center>
                     <input type="button" value="수정" id="editbtn" onclick="edit">
                     <input type="button" value="삭제" onclick="delcheck()" >
                  </td>
               </c:if>
               <td><input type="button" value="뒤로" onclick="cancel()"></td>
            </tr>
            </table>
         </form>
         
         <!-- 댓글 -->
         <hr>comment</hr>
         <form name=commentInsertform  method="post" action="/fleamarket/market/insertComment">   
            <input type="hidden" name="rpNo" id="rpNo" value="${vo.rpNo}">  
            <input type="hidden" id="baNo" name="baNo" value="${vo.baNo}" />
            
               <table class="tbl_type2" border="1" summary="글 내용에 대한 덧글 표시">
               <caption>글에 대한 코멘트</caption>
               <colgroup>
                  <col width="110">
                  <col>
               </colgroup>
                  <tbody>
                  <c:forEach items="${rplist}" var="vo">
                     <tr>
                        <td>${vo.memId}</td>
                        <td>${vo.rpContent}</td>
                        <td>${vo.rpDate}</td>
                        <c:if test="${sessionId == vo.memId || sessionGrant == 'A'}">   
                            <td>
                               <input type="button" value="삭제" onclick="delcomment('${vo.rpNo}','${vo.baNo}')"/>
                            </td>   
                        </c:if>
                     </tr>
                  </c:forEach>

                  <tr class="input_txt">
                         <c:if test="${sessionId != null }">    
                           <td colspan="3">
                         	  <input title="이름" class="name" type="text" value="${sessionId}">
                              <textarea class="comment" id="rpContent" name="rpContent" rows="10" cols="100"></textarea>
                              <input title="입력" class="submit" type="submit" value="입력">
                           </td>
                         </c:if> 
                  </tr>
                  </tbody>
               </table>
            </form>

   </div>

</body>
<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
</html>