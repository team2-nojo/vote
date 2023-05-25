<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<c:forEach items="${qnaTypeList}" var="qnaType">
    <c:if test="${qnaType.QNA_CAT_CODE == qnaCatCode}">
        <c:set var="qnaName" value="${qna.QNA_NAME}"/>
    </c:if>
</c:forEach>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VOTE 문의 상세</title>

    <link rel="stylesheet" href="/resources/css/clientCenter/QNADetail.css">
</head>
<body>
<main>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    
<div class="content">
<section class="board-detail">  
<h1 class="board-title">
    <span>${qna.qnaTitle}</span>
    <span>${qna.memberNickname}</span>
</h1>

<div class="board-ma">
    <div class="board-content">${qna.qnaCont}</div>

    <div class="board-header">
        <div class="board-writer">
        </div>
        <div class="board-info">
            <p> <span>작성일</span> ${qna.qnaCreateDt} </p>     

            <!-- 수정한 게시글인 경우 -->
            <%-- <c:if test="${not empty qna.qnaUpdateDate}" >
            <p> <span>마지막 수정일</span>   ${qna.qnaUpdateDate} </p>   
            </c:if> --%>
            <p> <span>마지막 수정일</span>  2023.05.22 </p>   
            
            <%-- <p> <span>조회수</span> ${qna.readCount} </p> --%>                    
            <p> <span>조회수</span> 3 </p>                    
        </div>
    </div>
</div>




<div class="board-btn-area">
                <c:if test="${loginUser.userNo == qna.userNo}" >
                <button id="updateBtn">수정</button>
                <button id="deleteBtn">삭제</button>
                </c:if>
                <a href="/clientCenter/QNA3"><button id="goToListBtn">목록으로</button></a>
            </div>
</div>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

        <Script>
            // JSP에서 작성 가능한 언어/라이브러리
            // -> html, css, js, java, EL, JSTL

            // JSP 해석 우선 순위 : Java/EL/JSTL > HTML,CSS,JS

            // 게시글 번호 전역 변수로 선언
            const qnaNo = "${qna.qnaNo}";

            // 로그인한 회원 번호를 전역변수로 선언
            // -> 작성한 EL 구문이 null일 경우 빈칸으로 출력되어
            //    변수에 값이 대입되지 않는 문제가 발생할 수 있음!
            // 해결방법 : EL 구문을 '', "" 같은 문자열로 감싸면 해결
            //         -> EL 값이 null이어도 ""(빈문자열)로 출력

            const loginUserNo = "${loginUser.userNo}";

            console.log(qnaNo);
            console.log(loginUserNo);

        </Script>

<script src="/resources/js/clientCenter/QNADetail.js"></script>
</body>
</html>
