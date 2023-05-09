<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

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
            <div class="userProfileframe contentBox"> <!-- 화면 크기와 상관없이 가운데에 위치하는 -->
                <div class="row"> <!-- 사용자 프로필 영역 -->
                    <div class="EditProfileText">
                        <div class="userProfileID">JJ</div>
                        <div class="userProfileLocation">South Korea</div>
                        <a href="/myPage/editProfiile">Edit profile</a> <!-- '프로필 편집'으로 넘어가는 버튼 -->
                    </div>
                </div>
                <ul class="tabs"> <!-- 내가 시작한, 사인한 청원 목록 보는 탭 -->
                    <li><a href="#" id="start">Start(3)</a></li> <!-- 내가 시작한 청원 목록  -->
                    <li><a href="#" id="signed">Signed(2)</a></li> <!-- 내가 사인한 청원 목록 -->
                </ul> 
            </div>
        </div>
    </main>
    <%-- footer --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <%-- myPetitions.js --%>
    <script src="/resources/js/myPetitions/myPetitions.js"></script>
</body>
</html>