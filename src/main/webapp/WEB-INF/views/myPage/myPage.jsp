<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VOTE 마이 페이지</title>
    <link rel="stylesheet" href="/resources/css/myPage/myPage.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <main>
        <div id="accountInfoContainer" class="center">
            <div id="accountInfoInnerContainer" class="center innerContainer">
                <div id="accountInfo" class="center flexCol">
                    <img class="profileImg" src="<c:if test="${empty loginUser.userImage}">resources/images/myPage/default-user-profile.svg</c:if>
                    <c:if test="${not empty loginUser.userImage}">${loginUser.userImage}</c:if>" width="80px" height="80px">
                    <div id="userName" class="bold largeFont">${loginUser.userNickname}</div>
                    <div id="joinDateContainer" class="flexRow">
                        <div id="joinDate" class="gray smallFont">가입일 : ${loginUser.userEnrollDate}</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="center">
            <div id="settingsMenuContainer" class="center">
                <div class="row">
                    <div class="row-center largeFont bold"><i class="fa-solid fa-user-pen"></i><span>프로필 및 기본 설정</span></div>
                    <div class="gray">계정 엑세스를 제어하고, 사용자 환경을 개인화하는 데 사용하는 데이터를 관리합니다.</div>
                </div>
                <div class="menu-container">
                    <a href="myPage/editProfile">
                        <sapn>개인정보 변경</sapn><i class="fa-solid fa-angle-up fa-rotate-90"></i>
                    </a>
                    <hr>
                    <a href="myPage/changePassword">
                        <sapn>비밀번호 변경</sapn><i class="fa-solid fa-angle-up fa-rotate-90"></i>
                    </a>
                    <hr>
                    <a href="myPage/emailSettings">
                        <sapn>이메일 수신 설정</sapn><i class="fa-solid fa-angle-up fa-rotate-90"></i>
                    </a>
                    <hr>
                    <a href="myPage/secession">
                        <sapn>계정 비활성화</sapn><i class="fa-solid fa-angle-up fa-rotate-90"></i>
                    </a>
                    <hr>
                </div>
            </div>
        </div>
    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>