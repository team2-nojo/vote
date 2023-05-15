<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>FAQ</title>

  
  <link rel="stylesheet" href="../css/FAQ.css">
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

  <main>
  <h1 id="title">질문해보세요</h1>

  <article class="search-area">

    <form action="#" method="GET"></form>
    <input type="search" name="query" id="query" autocomplete="off">
    <button id="searchBtn" class="fa-solid fa-magnifying-glass">검색</button>

  </article>

  <div class="faq-category">
  <button id="button1">청원</button>
  <button id="button1">신고</button>
  <button id="button1">개인정보</button>
  <button id="button1">전체</button>
  </div>

  <div id="Accordion_wrap">
    <div class="question">
      <span>신고는 어떻게 하나요</span>
      <div class="arrow-wrap">
        <span class="arrow-top">▲</span>
        <span class="arrow-bottom">▼</span>
      </div>

    </div>
    <div class="answer">
      <span>이렇게 하면 됩니다.</span>
    </div>
    <div class="question">
      <span>청원 글 작성은 어떻게 하나요</span>
      <div class="arrow-wrap">
        <span class="arrow-top">▲</span>
        <span class="arrow-bottom">▼</span>
      </div>
    </div>
    <div class="answer">
      <span>여기서 하면 됩니다.</span>
    </div>
    <div class="question">
      <span>비밀번호를 잃어버렸어요</span>
      <div class="arrow-wrap">
        <span class="arrow-top">▲</span>
        <span class="arrow-bottom">▼</span>
      </div>
    </div>
    <div class="answer">
      <span>잃어버린 비밀번호는 어쩔수 없어</span>
    </div>
  </div>

  <div class="center-btn">
  <a href="Q&A.html" id="button2"><i class="fa-solid fa-user fa-4x" id="ic"></i>1:1 문의</a>
  <a href="Q&A3.html" id="button2"><i class="fa-solid fa-scroll fa-4x" id="ic"></i>문의내역</a>
  <a href="chatbot.html" id="button2"><i class="fa-regular fa-comment fa-4x" id="ic"></i>챗봇</a>
  </div>

</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  <script src="../js/FAQ.js"></script>
  <script src="https://kit.fontawesome.com/fa1a384c97.js" crossorigin="anonymous"></script>
</body>

</html>