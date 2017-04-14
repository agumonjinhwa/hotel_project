<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- 상단 공통부분을 외부 포함파일 불러오기 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<link rel="stylesheet" type="text/css" href="./css/cm_cont.css" /><%-- css적용 --%>
<script src="./js/jquery.js" ></script>
<script src="./js/comment.js" ></script>
</head>
<body>
<header></header>
<div id="container_cm"><%-- 헤더아래 배경 --%>

 <div id="container_cm1"><%-- 큰틀 --%>
  <h1 class="h">자유게시판~</h1>
 <div class="clear"></div><%-- 빈공백 제거 --%>
 
 <div id="menubar">
  <input type="button" value="자유게시판" class="bt1" onclick="location='cm_list.kkc';"/>
  <input type="button" value="나만의포토" class="bt1" onclick="location='ptcm_list.kkc';"/>
  <input type="button" value="목록" class="btn" onclick="location='cm_list.kkc?page=${page}';" />
  </div>
 <div class="clear"></div><%-- 빈공백 제거 --%>
 <hr/>
 
 <div id="imgs">
  <img src="./images/tm01.jpg" width="200" height="400">
 </div>
 
 <div id="container_cm2">
  <table id="table" >
   <tr>
    <th class="th1">no</th>
    <th class="th2" colspan="5">제목</th>
   </tr>
   <tr>
    <td class="td1">${c.cm_no}</td> 
    <td colspan="5" class="td1">${c.cm_title}</td>
   </tr>
   <tr>
    <th class="th1">작성자</th> <td class="td1">${c.cm_name}</td>
    <th class="th1">작성일</th> <td class="td1">${c.cm_date}</td>
    <th class="th1">조횟수</th> <td class="td1">${c.cm_hit}</td>
   </tr>
   <tr>
    <th colspan="6" class="th3">내용</th>
   </tr>
   <tr>
    <td class="td2" colspan="6">${cont}</td>
   </tr>
  </table>
  <input type="button" value="삭제" class="btn1" onclick="location='cm_cont.kkc?no=${c.cm_no}&page=${page}&state=del';" />
  <input type="button" value="수정" class="btn1" onclick="location='cm_cont.kkc?no=${c.cm_no}&page=${page}&state=edit';" />
  
 </div><%-- table 끝 --%>
 
 <%-- 댓글 입력폼 --%>
 <form method="post" action="comment_ok.kkc" onsubmit="return com_check();">
  <input type="hidden" name="cm_no" value="${c.cm_no}" />
  <input type="hidden" name="c_name" value="${c.cm_name}" />
  <input type="hidden" name="page" value="${page}" />
  
  <table id="comment">
   <tr>
    <th colspan="2" class="cth1">댓글수: ${com_count} 개</th>
   </tr>
   <tr>
    <th><textarea name="c_cont" id="c_cont" class="cth2"></textarea></th>
    <th><input type="submit" value="댓글달기" class="cbtn1" /></th>
   </tr>
  </table>
 </form>
 
 <%-- 댓글 목록 --%>
 <table id="comment_cont" border="1">
  <c:if test="${!empty cmlist}">
   <tr>
    <th colspan="3">댓글목록</th>
   </tr>
   <c:forEach var="cb" items="${cmlist}">
    <tr>
     <th>${cb.c_name}</th>
     <td class="ctd1">${fn:substring(cb.c_date,0,16)}</td>
     <td class="ctd2">
      <a href="javascript:com_del_ok(${cb.c_no},${c.cm_no},${page});" onfocus="this.blur();">삭제</a>수정
     </td>
    </tr>
    <tr>
     <td colspan="3" class="ctd3">${cb.c_cont}</td>
    </tr>
   </c:forEach>
  </c:if>
 </table>

 </div><%-- container_cm1 끝 --%>

</div><%-- container_cm --%>

 <div class="clear"></div>
</body>

<%@ include file="../include/footer.jsp"%>
</html>