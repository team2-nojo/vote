<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>VOTE 1대1 문의하기</title>

  <link rel="stylesheet" href="/resources/css/clientCenter/QNA.css">
</head>

<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<main>
  <div class="content">
    <form action="QNA" method="POST"
    class="board-write" id="boardUpdateFrm">  

  <h1 id="title">1:1 문의하기</h1>
    <div>
      <div class="board-title">제목</div>
      <input type="text" name="qnaTitle" value="" id="boardTitle">   
    </div>
      <div class="board-content">내용
      <textarea name="qnaCont" id="boardContent"></textarea>
    </div>



  <div class="filename">
      <div id="agree">
        개인정보 수집 등
      </div>
      <div>
        - 수집하는 개인정보 항목: 이메일 주소, 주소 <br>
        개인정보는 문의 접수, 고객 불편 사항 확인 및 처리 결과 회신에 이용되며 전자상거래법 등 관련 <br>
        법령에 따라 3년간 보관됩니다.<br>
      </div>
  </div>
<div>

  <button type="submit", id="select2">문의하기</button>



</div>

</div>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
  <script src="/resources/js/clientCenter/QNA.js"></script>
  <script src="https://kit.fontawesome.com/fa1a384c97.js" crossorigin="anonymous"></script>

</body>

</html>