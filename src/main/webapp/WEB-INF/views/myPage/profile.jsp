<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login_myPetitions</title>
    <link rel="stylesheet" href="/resources/css/myPage/profile.css">
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
                                <c:if test="${empty selectedUser.userImage}" >
                                    <img src="/resources/images/common/user.png" id="profileUserImage">
                                </c:if>

                                <%-- 프로필 이미지가 있으면 있는 이미지 --%>
                                <c:if test="${not empty selectedUser.userImage}">
                                    <img src="${selectedUser.userImage}" id="profileUserImage">
                                </c:if>
                            </div>
                        </div>
                        <div class="userProfileID">${selectedUser.userNickname}</div>
                        <div class="userProfileLocation">${selectedUser.userAddress.split(" ")[0]}</div>
                    </div>
                </div>
                <ul class="tabs"></ul> 
            </div>
            <div class="userAboutMe">${selectedUser.userAboutMe}</div>
        </div>
    </main>
    <%-- footer --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script>
        const num1 = ${fn:length(petitionList)};
        const num2 = 3;
    </script>
</body>
</html>


<%-- start시 화면, signed시 화면을 미리 다 만들어 놓고 --%>
<%-- css랑 js를 활용해서 display를 none으로 바꿨다가 켰다가 하기 --%>