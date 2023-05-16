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
                        <div class="userProfileID">${loginUser.userNickname}</div>
                        <div class="userProfileLocation">${loginUser.userAddress.split(" ")[0]}</div>
                        <a href="/myPage/editProfiile">Edit profile</a> <!-- '프로필 편집'으로 넘어가는 버튼 -->
                    </div>
                </div>
                <ul class="tabs"> <!-- 내가 시작한, 사인한 청원 목록 보는 탭 -->
                    <li><a href="#" id="start" class="myPetitions-click">Start(${fn:length(petitionList)})</a></li> <!-- 내가 시작한 청원 목록  -->
                    <li><a href="#" id="signed">Signed(2)</a></li> <!-- 내가 사인한 청원 목록 -->
                </ul> 
                <div>
                <c:forEach items="${petitionList}" var="petition">
                <div class="defaultbox">
                    <div class="myPetitionTitle">${petition.petitionTitle}</div>
                    <div class="myPetitionText">${petition.petitionContent}</div>
                    <div class="myPetitionWriter">${loginUser.userNickname}</div>
                    <div class="myPetitionsuppoerter">좋아요 한 사람 수</div>
                </div>
                </c:forEach>
                </div>
            </div>
        </div>
    </main>
    <%-- footer --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script>
        const num1 = ${fn:length(petitionList)};
        const num2 = 3;
    </script>

    <%-- myPetitions.js --%>
    <script src="/resources/js/myPetitions/myPetitions.js"></script>
</body>
</html>


<%-- start시 화면, signed시 화면을 미리 다 만들어 놓고 --%>
<%-- css랑 js를 활용해서 display를 none으로 바꿨다가 켰다가 하기 --%>