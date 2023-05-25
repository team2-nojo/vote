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
                <div><a href="/browse/petitionView/details/${petitionNo}" id="details">Petition details</a></div>
                <div><a href="/browse/petitionView/comments/${petitionNo}" id="comments">Comments</a></div>
                <div id="updates">Updates</div>
            </div>
        </section>

        <section id="updatesSection1">
            <div id="updatesBT">최근 소식</div>
        </section>

        <%-- 최근 소식이 없는 경우 --%>
        <c:if test="${empty updatePetitionList}" >
            <section id="updatesSection2">
                <button type="button" id="leftBtn"><a href="#" id="left">&lang;</a></button>
                <div class="slide">
                    <div class="frame">
                        <div id="noUpdateBox">
                            <div>
                                이 청원은 아직 업데이트 내용을 제공하지 않습니다
                            </div>
                        </div>
                    </div>
                </div>
                <button type="button" id="rightBtn"><a href="#" id="right">&rang;</a></button>
            </section>
        </c:if>
        <%-- 최신 소식이 있는 경우 --%>
        <c:if test="${not empty updatePetitionList}">
            <!-- updates -->
            <section id="updatesSection2">
                <button type="button" id="leftBtn">&lang;</button>
                <div class="slide">
                    <div class="frame" id="frame">
                        <c:forEach items="${updatePetitionList}" var="updatePetition">
                            <div class="updatesFrame">
                                <%-- 업데이트 썸네일이 있는 경우 --%>
                                <c:if test="${not empty updatePetition.petitionUpdateImage}">
                                    <div class="cImage">
                                        <img src="/resources/images/common/default-img.jpg" class="updatesImg">
                                    </div>
                                </c:if>
                                <%-- 업데이트 썸네일이 없는 경우 --%>
                                <c:if test="${not empty updatePetition.petitionUpdateImage}">
                                    <div class="cImage">
                                       <img src="${updatePetition.petitionUpdateImage}" class="updatesImg">
                                    </div>
                                </c:if>
                                <div class="updatesT">
                                    ${updatePetition.petitionUpdateTitle}
                                </div>
                                <div class="updatesC">
                                    ${updatePetition.petitionUpdateContent}
                                </div>
                                <div class="updatesProfile">
                                    <div>
                                        <img src="/resources/images/순덕이.png" alt="프로필사진" class="profileImg">
                                    </div>
                                    <div>
                                        <div class="uNickname">${updatePetition.userNo}</div>
                                        <div class="uDate">${updatePetition.petitionUpdateDate}</div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <button type="button" id="rightBtn">&rang;</button>
            </section>
        </c:if>
        <section id="updatesSection3"></section>
    </main>
    <%-- footer --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script src="/resources/js/browse/petitionView/updates.js"></script>
</body>
</html>