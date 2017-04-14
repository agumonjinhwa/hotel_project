<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="./admin_css/ad_main.css" />
<script src="./js/jquery.js"></script>
</head>
<body>
 <header>
  <div id="adheader">
  
   <div class="adlogo"><%-- 로고이미지 삽입 --%>
    <a href="admin_main.kkc">
     <img src="./images/logo.png" width="120" height="60"/>
    </a>
   </div>
   
   <div class="admenu"><%-- 메뉴 라인 --%>
    <ul>
     <li><a href="admin_mem_list.kkc">회원관리</a></li>
     <li><a href="admin_hotel_list.kkc">호텔목록</a></li>
     <li><a href="#">예약현황</a></li>
     <li><a href="admin_cm_list.kkc">자유게시판</a></li>
     <li><a href="admin_gongji_list.kkc">고객센터</a></li>
    </ul>
   
   </div>
   	
   	
   <div class="adlogin"><%-- 오른쪽 로그인 라인--%>
   
   <c:if test="${!empty admin_id}">
   <div class="adlogin">
    <form method="post" action="admin_logout.kkc">
     <a>${admin_name}님 환영합니다.</a>
     <input type="submit" value="로그아웃" />
    </form>
   </div>
   </c:if>	
    
   </div>
   
   <div class="clear"></div><%-- 빈공백 제거 --%>
  </div><%-- header 끝 --%>
 </header>
</body>
</html>