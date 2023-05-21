<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>브라우저 게시글 View(updates)</title>

    <link rel="stylesheet" href="/resources/css/browse/petitionView/updates.css">
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

        <section id="updatesSection1">
            <div id="updatesBT">최근 소식</div>
        </section>

        

        <!-- updates -->
        <section id="updatesSection2">
            <button type="button" id="leftBtn"><a href="#" id="left">&lang;</a></button>
            <div class="slide">
                <div class="frame">

                    <div class="updatesFrame">
                        <div class="cImage">
                            <a href="/browse/petitionView/updates_detail"><img src="/resources/images/순덕이.png" alt="업데이트사진" class="updatesImg"></a>
                        </div>
                        <div class="updatesT">
                            <a href="/browse/petitionView/updates_detail" class="updatesTitle">
                                업데이트 제목
                            </a>
                        </div>
                        <div class="updatesC">
                            <a href="/browse/petitionView/updates_detail" class="updatesContent">
                                업데이트 내용 업데이트 내용업데이트 내용업데이트 내용업데이트 내용업데이트 내용업데이트 내용업데이트 내용업데이트 내용업데이트 내용업데이트 내용업데이트 내용업데이트 내용업데이트 내용업데이트 내용업데이트 내용
                            </a>
                        </div>
                        <div class="updatesProfile">
                            <div>
                                <a href="/browse/petitionView/updates_detail" class="updatesProfileImg">
                                    <img src="/resources/images/순덕이.png" alt="프로필사진" class="profileImg">
                                </a>
                            </div>
                            <div>
                                <div class="uNickname">닉네임</div>
                                <div class="uDate">등록시간</div>
                            </div>
                        </div>
                    </div>

                    <div class="updatesFrame">
                        <div class="cImage">
                            <a href="/browse/petitionView/updates_detail"><img src="/resources/images/순덕이.png" alt="업데이트사진" class="updatesImg"></a>
                        </div>
                        <div class="updatesT">
                            <a href="/browse/petitionView/updates_detail" class="updatesTitle">
                                업데이트 제목
                            </a>
                        </div>
                        <div class="updatesC">
                            <a href="/browse/petitionView/updates_detail" class="updatesContent">
                                업데이트 내용 업데이트 내용업데이트 내용업데이트 내용업데이트 내용업데이트 내용업데이트 내용업데이트 내용업데이트 내용업데이트 내용업데이트 내용업데이트 내용업데이트 내용업데이트 내용업데이트 내용업데이트 내용
                            </a>
                        </div>
                        <div class="updatesProfile">
                            <div>
                                <a href="/browse/petitionView/updates_detail" class="updatesProfileImg">
                                    <img src="/resources/images/순덕이.png" alt="프로필사진" class="profileImg">
                                </a>
                            </div>
                            <div>
                                <div class="uNickname">닉네임</div>
                                <div class="uDate">등록시간</div>
                            </div>
                        </div>
                    </div>

                    <div class="updatesFrame">
                        <div class="cImage">
                            <a href="/browse/petitionView/updates_detail"><img src="/resources/images/순덕이.png" alt="업데이트사진" class="updatesImg"></a>
                        </div>
                        <div class="updatesT">
                            <a href="/browse/petitionView/updates_detail" class="updatesTitle">
                                업데이트 제목
                            </a>
                        </div>
                        <div class="updatesC">
                            <a href="/browse/petitionView/updates_detail" class="updatesContent">
                                업데이트 내용 업데이트 내용업데이트 내용업데이트 내용업데이트 내용업데이트 내용업데이트 내용업데이트 내용업데이트 내용업데이트 내용업데이트 내용업데이트 내용업데이트 내용업데이트 내용업데이트 내용업데이트 내용
                            </a>
                        </div>
                        <div class="updatesProfile">
                            <div>
                                <a href="/browse/petitionView/updates_detail" class="updatesProfileImg">
                                    <img src="/resources/images/순덕이.png" alt="프로필사진" class="profileImg">
                                </a>
                            </div>
                            <div>
                                <div class="uNickname">닉네임</div>
                                <div class="uDate">등록시간</div>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
            <button type="button" id="rightBtn"><a href="#" id="right">&rang;</a></button>
        </section>

        <section id="updatesSection3"></section>
    </main>
    <%-- footer --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script src="/resources/js/browse/petitionView/updates.js"></script>
</body>
</html>