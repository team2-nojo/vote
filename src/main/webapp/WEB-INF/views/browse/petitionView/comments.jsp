<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>



<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>브라우저 게시글 View(comments)</title>

    <link rel="stylesheet" href="/resources/css/browse/petitionView/comments.css">
    
</head>

<body>
    <%-- header --%>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <main>
        
        
        <!-- 상단메뉴 -->
        <section class="top">
            <div id="menu">
                <div><a href="/browse/petitionView/details/${petitionNo}" id="details">Petition details</a></div>
                <div id="comments">Comments</div>
                <div ><a href="/browse/petitionView/updates" id="updates">Updates</a></div>
            </div>
        </section>





        <c:set var="commentList" value="${commentList}"/>
        <!-- comment -->
            <section id="comment">
                <div id="comment1">서명한 사유를 적어주세요.</div>
                <div id="comment2">다른 지지자들이 서명하는 이유, 이 청원이 그들에게 중요한 이유를 확인하고 서명 이유를 공유합니다.(이는 청원 시작자에게 큰 의미가 있을 것입니다.)</div>
                <ul id="commentList">
                    <c:forEach items="${commentList}" var="comment">
                    <li class="comment-row" >
                        <div id="comment3">
                            <p class="comment-writer">
                                <c:choose>
                                    <c:when test="${empty comment.userImage}">
                                    <%-- 프로필 이미지 없을 경우 기본 이미지 --%>
                                        <img src="/resources/images/common/user.png">
                                    </c:when>
                                    <c:otherwise>
                                        <%-- 프로필 이미지 있을 경우 프로필 이미지 --%>
                                            <img src="${comment.userImage}">
                                    </c:otherwise>
                                </c:choose>
                                <span id="cNickname">
                                    ${comment.userNickname}
                                </span>
                                <span class="commentDate">
                                    ${comment.commentDate}
                                </span>
                            </P>
                            <p class="class_content">
                                    ${comment.commentContent}
                            </p>
                            <div id="commentLike">
                                <div id="push">
                                    <i class="fa-regular fa-thumbs-up fa-xl" style="color: red;" class="like"></i> <span>0</span>
                                </div>
                                <div id="push2">
                                    <i class="fa-regular fa-thumbs-down fa-xl" style="color: blue;" class="like"></i> <span>0</span>
                                </div>
                            </div>
                        </div>
                    </li>
                </c:forEach>
                </ul>
            </section>





        
    </main>

    <script src="https://kit.fontawesome.com/f7459b8054.js"crossorigin="flag"></script>


    <%-- footer --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script>
        let commentUserNo = "${comment.userNo}";
    </script>

    <%-- comments.js --%>
    <script src="/resources/js/browse/petitionView/comments.js"></script>
</body>
</html>