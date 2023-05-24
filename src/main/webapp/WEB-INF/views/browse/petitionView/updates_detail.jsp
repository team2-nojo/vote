<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>브라우저 게시글 View(updates_detail)</title>

    <link rel="stylesheet" href="/resources/css/browse/petitionView/updates_detail.css">
    <script src="https://kit.fontawesome.com/f7459b8054.js"crossorigin="flag"></script>
</head>

<body>
    <%-- header --%>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <main>
        <!-- 상단메뉴 -->
        <section id="top">
            <div id="menu">
                <div><a href="/browse/petitionView/details/${petitionNo}" id="details">Petition details</a></div>
                <div><a href="/browse/petitionView/comments/${petitionNo}" id="comments">Comments</a></div>
                <div id="updates">Updates</div>
            </div>
        </section>

        <section id="bigTitle">
            청원 업데이트 소식
        </section>
        <!-- 게시글뷰 -->
        <section id="post">
            <!-- 게시글 왼쪽 -->
            <div id="post-L">
                <div id="postTitle">
                    서울시 종로구 순덕이 출현
                </div>
                <div id="nickname">닉네임</div>
                <div id="place">장소</div>
                <div id="postPicture">
                    <img src="/resources/images/순덕이.png" id="postPic">
                </div>
                <div id="date">날짜</div>
                <div id="postContent">
                    <div class="paragraph">

                        내용내용내용내용내용내용내용내용내용내용내용내용내내용내용내용내용내용내용내용내용내용내용내용내용내내용내용내용내용내용내용내용내용내용내용내용내용내내용내용내용내용내용내용내용내용내용내용내용내용내
                    </div>
                    <div class="paragraph">
                        내용내용내용내용내용내용내용내용내용내용내용내용내내용내용내용내용내용내용내용내용내용내용내용내용내내용내용내용내용내용내용내용내용내용내용내용내용내내용내용내용내용내용내용내용내용내용내용내용내용내
                    </div>
                    <div class="paragraph">
                        내용내용내용내용내용내용내용내용내용내용내용내용내내용내용내용내용내용내용내용내용내용내용내용내용내내용내용내용내용내용내용내용내용내용내용내용내용내내용내용내용내용내용내용내용내용내용내용내용내용내
                    </div>
                </div>
            </div>
        </div>

        <!-- 게시글 오른쪽 -->
        <div id="post-R">
            <div id="gauge">
                <div id="postContent">
                    <div id="row1">
                        <strong>
                            <%-- 좋아요 클릭 한 사람 수 --%>
                            <span id="likeCount">0</span> 
                            명이 서명했습니다.
                        </strong>
                        50000명을 향해!!
                    </div>
                    <progress id="progress" value="0" min="0" max="50000" ></progress>
                    <div id="row2">
                        청원 달성까지 서포터 단
                        <strong>
                            <!-- 청원 달성 위해 남은 사람의 수-->
                            <span id="remainNumber">50000</span>
                            명만 더!
                        </strong> 
                    </div>
                    <div id="row3">
                        <div id="row3-1">
                            <!-- 임시이미지 -->
                            <i class="fa-solid fa-arrow-trend-up fa-sm" id="arrow"></i>
                        </div>
                        <div id="row3-2">
                            이 청원은 서명된 청원 중에서 
                            <strong>
                                순위권이 높은 청원이 됩니다!
                            </strong>
                        </div>
                    </div>
                </div>
                <div id="sign_User">
                    <!-- 서명한 유저 이름 & 서명한 시간 실시간업로드 -->
                    <div class="signUserBox">
                        <div class="signImg">
                            <img src="/resources/images/순덕이.png" class="prof">
                        </div>
                        <div class="signNickname">닉네임</div>
                        <div Class="signTime">서명시간</div>
                    </div>
                    <div class="signUserBox">
                        <div class="signImg">
                            <img src="/resources/images/순덕이.png" class="prof">
                        </div>
                        <div class="signNickname">닉네임</div>
                        <div Class="signTime">서명시간</div>
                    </div>

                </div>
                <div id="check">
                    <input type="checkbox" id="agree">
                    <label for="agree">
                        이 청원에 이름과 댓글을 표시합니다.
                    </label>
                </div>
                <%-- 댓글창 --%>
                <div id="commentPlace">
                    <form action="browse/comment" method="POST" id="commentFrm">
                        <div id="wrtComment">
                            <textarea name="" id="commentContent" cols="10" rows="100" placeholder=" - 띄어쓰기를 포함하여 최대 1000자까지 작성할 수 있습니다. &#13;&#10; *욕설, 서비스 이용에 방해되는 글은 관리자에 의해 삭제됩니다."></textarea>
                        </div>
                    </form>
                    <div id="countComment">
                        <span id="count">0</span>자 / 1000자
                    </div>
                </div>
                <%-- 좋아요 버튼 --%>
                <div>
                    <button id="signButton" >좋아요!</button>
                </div>
            </div>
        </section>
        
        
        
        <br><br>
        <hr>
        
        
        
    </main>
    <%-- footer --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>


    <script src="/resources/js/browse/petitionView/updates_detail.js"></script>
</body>
</html>