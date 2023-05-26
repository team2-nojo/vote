<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<c:set var="pagination" value="${map.pagination}"/>
<c:set var="faqList" value="${map.faqList}"/> 
<c:set var="faqCatName" value="${faqTypeList[faqCatNo-1].FAQ_CAT_NAME}"/>



<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>VOTE FAQ</title>

  
  <link rel="stylesheet" href="/resources/css/clientCenter/FAQ.css">
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

  <main>


  <div class="content">

  <div id="title">궁금하신 질문을 찾아 보세요</div>

          <c:if test="${not empty param.key}" >
            <c:set var="sp" value="&key=${param.key}&query=${param.query}"/>
        </c:if>

  <div class="faq-category">
    <a href="/clientCenter/FAQ?faqCatNo=1" id="button1">청원</a>
    <a href="/clientCenter/FAQ?faqCatNo=2" id="button1">신고</a>
    <a href="/clientCenter/FAQ?faqCatNo=3" id="button1">개인정보</a>
    <a href="/clientCenter/FAQ?faqCatNo=4" id="button1">건의</a>

  </div>


  <c:choose>
  <c:when test="{empty faqList}">

  <tr>
      <th colspan="3">존재하지 않습니다</th>
  </tr>

  </c:when>

  <c:otherwise>
  


  <div class="Faq">자주 묻는 질문</div>

<c:forEach items="${faqList}" var="faq">
  <div id="Accordion_wrap">
    <div class="question">
      <span>${faq.faqQuestionI}</span>
      <div class="arrow-wrap">
        <span class="arrow-top">▲</span>
        <span class="arrow-bottom">▼</span>
      </div>
    </div>
    <div class="answer">
      <span>${faq.faqAnswer}</span>
    </div>
  </div>

</c:forEach>
    </c:otherwise>
      </c:choose>
    
    </div>


<%-- <div class="question">
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
      <span>내용 2</span>
      <div class="arrow-wrap">
        <span class="arrow-top">▲</span>
        <span class="arrow-bottom">▼</span>
      </div>
    </div>
    <div class="answer">
      <span>답변 2</span>
    </div>
  </div> --%>

  <div class="center-btn">
    <a href="/clientCenter/QNA" id="button2"><i class="fa-solid fa-user fa-4x" id="ic"></i>1:1 문의</a>    
    <a href="/clientCenter/QNA3?qnaCatCode=1" id="button3"><i class="fa-solid fa-scroll fa-4x" id="ic"></i>문의내역</a>    
    <a href="/" id="button4"><i class="fa-regular fa-comment fa-4x" id="ic"></i>챗봇</a>
  </div>

</div>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


<Script>

const loginUserNo = "${loginUser.userNo}"
console.log(loginUserNo);

</Script>

  <script src="/resources/js/clientCenter/FAQ.js"></script>
  <script src="https://kit.fontawesome.com/fa1a384c97.js" crossorigin="anonymous"></script>
</body>

</html>