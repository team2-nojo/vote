<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VOTE 나의 청원</title>
    <link rel="stylesheet" href="/resources/css/myPetitions/myPetitions.css">
    <link rel="stylesheet" href="/resources/css/myPetitions/myPetitionsCommon.css">
</head>
<body>
    <%-- header --%>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <main>
        <nav>
        </nav>
        <div class="userProfile content"> <!-- 본문 -->
            <div class="userProfileframe contentBox startbox"> <!-- 화면 크기와 상관없이 가운데에 위치하는 -->
                <div class="row"> <!-- 사용자 프로필 영역 -->
                    <div class="EditProfileText">
                        <div>
                            <div id="imageContainer">
                                <%-- 프로필 이미지가 없으면 기본 이미지 --%>
                                <c:if test="${empty loginUser.userImage}" >
                                    <img src="/resources/images/common/user.png" id="profileUserImage">
                                </c:if>

                                <%-- 프로필 이미지가 있으면 있는 이미지 --%>
                                <c:if test="${not empty loginUser.userImage}">
                                    <img src="${loginUser.userImage}" id="profileUserImage">
                                </c:if>
                            </div>
                        </div>
                        <div class="userProfileID">${loginUser.userNickname}</div>
                        <div class="userProfileLocation">${loginUser.userAddress.split(" ")[0]}</div>
                        <div>
                            <a href="/myPage/editProfile">프로필 편집</a> <!-- '프로필 편집'으로 넘어가는 버튼 -->
                        </div>
                    </div>
                </div>
                <ul class="tabs"> <!-- 내가 시작한, 사인한 청원 목록 보는 탭 -->
                    <li><a href="#" id="start" class="myPetitions-click">시작한 청원(${fn:length(petitionList)})</a></li> <!-- 내가 시작한 청원 목록  -->
                    <li><a href="#" id="signed">서명한 청원(${fn:length(likeList)})</a></li> <!-- 내가 사인한 청원 목록 -->
                </ul> 
                <div id="myStartPetitions">
                    <c:choose>
                        <c:when test="${empty petitionList}">
                            <%-- start한 청원이 없을 경우 empty default box 출력 --%>
                            <div class="empty-default-box">
                                <div class="emptyDefaultBoxArea">
                                    <div>바꾸고 싶은 세상이 있으신가요? 당신이 걱정하는 것에 대해 청원을 작성해 보세요.</div>
                                    <div><a href="/writePetition" class="toStartAPetition">청원 시작</a></div>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <%-- start한 청원이 있을 경우 petitionList 출력 --%>
                            <c:forEach items="${petitionList}" var="petition">
                            <div class="defaultbox" onclick="location.href =`/myPetitions/myPetitionsDashboard/${petition.petitionNo}`">
                                <%-- Title이 30자 초과이면 ...로 출력, 30자 이하면 그대로 출력 --%>
                                <div class="myPetitionTitle">
                                <c:choose>
                                    <c:when test="${fn:length(petition.petitionTitle) > 30}">
                                        ${fn:substring(petition.petitionTitle, 0, 31)}...
                                    </c:when>
                                    <c:otherwise>
                                        ${petition.petitionTitle}
                                    </c:otherwise>
                                </c:choose>
                                </div>
                                <%-- Content가 100자 초과이면 ...로 출력, 100자 이하면 그대로 출력 --%>
                                <div class="myPetitionText">
                                <c:choose>
                                    <c:when test="${fn:length(petition.petitionContent) > 200}">
                                        ${fn:substring(petition.petitionContent, 0, 201)}...
                                    </c:when>
                                    <c:otherwise>
                                        ${petition.petitionContent}
                                    </c:otherwise>
                                </c:choose>
                                </div>
                                <div>
                                    <div class="myPetitionWriter">${loginUser.userNickname}</div>
                                    <div class="myPetitionsupporter">${petition.petitionLikeCount}</div>
                                </div>
                            </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div id="mySignedPetitions" class="invisibleMyPetitions">
                    <c:choose>
                        <c:when test="${empty likeList}">
                            <%-- signed한 청원이 없을 경우 empty default box 출력 --%>
                            <div class="empty-default-box">
                                <div class="emptyDefaultBoxArea">
                                    <div>관심이 있는 문제에 선한 영향력을 주는 청원을 찾아 지지를 표시하세요.</div>
                                    <div><a href="/browse/browseSearch/popular" class="toStartAPetition">청원 둘러보기</a></div>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <%-- signed한 청원이 있을 경우 petitionList 출력 --%>
                            <c:forEach items="${likeList}" var="petition">
                                <c:choose>
                                    <%-- signed한 청원이 내가 쓴 글인 경우 --%>
                                    <c:when test="${loginUser.userNo == petition.userNo}">
                                        <div class="defaultbox" onclick="location.href =`/myPetitions/myPetitionsDashboard/${petition.petitionNo}`">
                                    </c:when>
                                    <%-- signed한 청원이 내가 쓴 글이 아닌 경우 --%>
                                    <c:otherwise>
                                        <div class="defaultbox" onclick="location.href =`/browse/petitionView/details/${petition.petitionNo}`">
                                    </c:otherwise>
                                </c:choose>
                                            <%-- Title이 30자 초과이면 ...로 출력, 30자 이하면 그대로 출력 --%>
                                            <div class="myPetitionTitle">
                                            <c:choose>
                                                <c:when test="${fn:length(petition.petitionTitle) > 30}">
                                                    ${fn:substring(petition.petitionTitle, 0, 31)}...
                                                </c:when>
                                                <c:otherwise>
                                                    ${petition.petitionTitle}
                                                </c:otherwise>
                                            </c:choose>
                                            </div>
                                            <%-- Content가 100자 초과이면 ...로 출력, 100자 이하면 그대로 출력 --%>
                                            <div class="myPetitionText">
                                            <c:choose>
                                                <c:when test="${fn:length(petition.petitionContent) > 200}">
                                                    ${fn:substring(petition.petitionContent, 0, 201)}...
                                                </c:when>
                                                <c:otherwise>
                                                    ${petition.petitionContent}
                                                </c:otherwise>
                                            </c:choose>
                                            </div>
                                            <div>
                                                <div class="myPetitionWriter">${petition.userNickname}</div>
                                                <div class="myPetitionsupporter">${petition.petitionLikeCount}</div>
                                            </div>
                                        </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </main>
    <%-- footer --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <%-- myPetitions.js --%>
    <script src="/resources/js/myPetitions/myPetitions.js"></script>
</body>
</html>


<%-- start시 화면, signed시 화면을 미리 다 만들어 놓고 --%>
<%-- css랑 js를 활용해서 display를 none으로 바꿨다가 켰다가 하기 --%>