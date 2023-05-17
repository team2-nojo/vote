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
                <div><a href="/browse/petitionView/details" id="details">Petition details</a></div>
                <div><a href="/browse/petitionView/comments" id="comments">Comments</a></div>
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
                <div id="date">날짜</div>
                <div id="postPicture">
                    <img src="/resources/images/순덕이.png" id="postPic">
                </div>
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
                            <!-- span 태그로 숫자 변경되게 해야 함(js)-->
                            43,564 
                            have signed, 
                        </strong>
                        Let's get to 50,000!
                    </div>
                    <progress id="progress" value="35000" min="0" max="50000" ></progress>
                    <div id="row2">
                        다음목표까지 서포터 단
                        <strong>
                            <!-- span 태그로 숫자 변경되게 해야 함(js)-->
                            33
                            명만 더!
                        </strong> 
                    </div>
                    <div id="row3">
                        <div id="row3-1">
                            <!-- 임시이미지 -->
                            <img src="/resources/images/순덕이.png" id="arrow">
                        </div>
                        <div id="row3-2">
                            this petition becomes one of the 
                            <strong>
                                top signed on VOTE!
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
                        Display my name and comment on this petition
                    </label>
                </div>
                <div>
                    <button id="signButton" onclick="document.getElementById('progress').value += 1;">Sign this petition</button>
                </div>
            </div>
        </section>
        
        
        
        <br><br>
        <hr>
        
        
        <!-- 추천게시글 -->
        <section class="middle">
            <div id="trandPeti">
                Trending petitions
            </div>
            <div class="result">
                <div class="row">
                    <div class="column" id="column-1">
                        <div id="title">
                            서울시 종로구 순덕이 출현
                        </div>
                        <div id="content">
                            내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용용내용내용내용내용내용내용내용내용내용내용내용내용용내용내용내용내용내용
                        </div>
                    </div>
                    <div class="column" id="column-2">
                        <div class="col" id="profile" >프로필</div>
                        <div class="col" id="suporterNum">서포터 수</div>
                    </div>
                </div>
                <div class="row" id="rowPicture">
                    <img src="/resources/images/순덕이.png" class="picture">
                </div>
            </div>
            <div>
                <button type="button" id="moreView">더보기</button>
            </div>
        </section>
        
    </main>
    <%-- footer --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>


    <script src="/resources/js/browse/petitionView.js"></script>
</body>
</html>