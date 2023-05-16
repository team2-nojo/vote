<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>브라우저 게시글 View(comments_not_found)</title>

    <link rel="stylesheet" href="/resources/css/browse/petitionView/comments_not_found.css">
    
</head>

<body>
    <%-- header --%>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <main>
        
        
        <!-- 상단메뉴 -->
        <section class="top">
            <div id="menu">
                <div><a href="/browse/petitionView/details" id="details">Petition details</a></div>
                <div id="comments">Comments</div>
                <div ><a href="#" id="updates">Updates</a></div>
            </div>
        </section>

        <!-- comment -->
        <section id="comment">
            <div id="comment1">서명한 사유를 적어주세요.</div>
            <div id="comment2">다른 지지자들이 서명하는 이유, 이 청원이 그들에게 중요한 이유를 확인하고 서명 이유를 공유합니다(이는 청원 시작자에게 큰 의미가 있을 것입니다).</div>
            <div id="comment3">
                이 청원에 서명하고 가장 먼저 의견을 추가하십시오.
            </div>
        </section>






        
    </main>

    <script src="https://kit.fontawesome.com/f7459b8054.js"crossorigin="flag"></script>


    <%-- footer --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <%-- comment.js --%>
    <script src="/resources/js/browse/petitionView/comments.js"></script>
</body>
</html>