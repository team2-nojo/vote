<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<c:set var="commentList" value="${commentList}"/>

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
                <div><a href="/browse/petitionView/details" id="details">Petition details</a></div>
                <div id="comments">Comments</div>
                <div ><a href="/browse/petitionView/updates" id="updates">Updates</a></div>
            </div>
        </section>






        <!-- comment -->
            <section id="comment">
                <ul id="commentList">
                    <li class="comment-row" >
                        <div id="comment1">서명한 사유를 적어주세요.</div>
                        <div id="comment2">다른 지지자들이 서명하는 이유, 이 청원이 그들에게 중요한 이유를 확인하고 서명 이유를 공유합니다.(이는 청원 시작자에게 큰 의미가 있을 것입니다.)</div>
                        <div id="comment3">
                            <div id="commentFrame">
                                <div id="cImage">
                                    <a href="#"><img src="/${commentList[0].userImage}" alt="프로필사진" id="profileImg"></a>
                                </div>
                                <div>
                                    <div id="cNickname">
                                        ${commentList[0].userNickname}
                                    </div>
                                    <div id="cDate">
                                        ${commentList[0].commentDate}
                                    </div>
                                </div>
                            </div>
                            <div id="cContent">
                                <div>
                                    ${commentList[0].commentContent}
                                    
                                </div>
                            </div>
                            <div id="commentLike">
                                <div id="push">
                                    <i class="fa-solid fa-thumbs-up fa-xl" style="color: #29c81e;"></i> <span>0</span>
                                    <i class="fa-regular fa-thumbs-up fa-xl" style="color: #29c81e;"></i> <span>0</span>
                                </div>
                                <div id="push2">
                                    <i class="fa-solid fa-thumbs-down fa-xl" style="color: #29c81e;"></i> <span>0</span>
                                    <i class="fa-regular fa-thumbs-down fa-xl" style="color: #29c81e;"></i> <span>0</span>
                                </div>


                            </div>
                        </div>
                    </li>
                </ul>
            </section>





        
    </main>

    <script src="https://kit.fontawesome.com/f7459b8054.js"crossorigin="flag"></script>


    <%-- footer --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <%-- comments.js --%>
    <%-- <script src="/resources/js/browse/petitionView/comments.js"></script> --%>
</body>
</html>