<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VOTE 비밀번호 변경</title>
    <link rel="stylesheet" href="/resources/css/myPage/changePassword.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <main>
        <form id="changePasswordForm" name="changePasswordForm" action="changePassword" method="POST">
            <h1 id="changePasswordTitle">비밀번호 변경</h1>
            <p id="changePasswordTip">비밀번호는 숫자, 문자, 기호를 포함해 8~20자로 설정해주세요.</p>

            <div class="input-container">
                <label for="currentPassword" class="input-label">현재 비밀번호</label>
                <input id="currentPassword" class="input-password" type="password" name="currentPassword">
            </div>
            <div class="input-container">
                <label for="newPassword" class="input-label">새 비밀번호</label>
                <input id="newPassword" class="input-password" type="password" name="newPassword">
            </div>
            <div class="input-container">
                <label for="confirmPassword" class="input-label">새 비밀번호 확인</label>
                <input id="confirmPassword" class="input-password" type="password">
            </div>
            <p id="message"></p>
            <div id="btnContainer">
                <a href="/myPage"><button type="button" id="cancel" class="submit-cancel-button">취소</button></a>
                <button type="submit" id="submit" class="submit-cancel-button">저장</button>
            </div>
        </form>
    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/myPage/changePassword.js"></script>
</body>
</html>