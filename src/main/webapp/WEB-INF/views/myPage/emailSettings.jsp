<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/myPage/emailSettings.css">
    <title>이메일 수신 설정</title>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
        <main>
            <form id="emailSettingsForm" action="myPage/emailSettings" method="get">
                <h1 id="emailSettingsTitle">이메일 수신 설정</h1>
                <p id="emailSettingsTip"><i class="fa-sharp fa-light fa-shield-exclamation"></i>VOTE는 고객의 프라이버시를 존중하고 보호하기 위해 노력하고 있습니다.</p>
                <div><input type="checkbox" name="items" id="item1" value="1"> <label for="item1">탄원서에 서명할 사람을 모집합니다.</label></div>
                <div><input type="checkbox" name="items" id="item2" value="2"> <label for="item2">내가 서명한 탄원서에 대한 업데이트가 있습니다.</label></div>
                <div><input type="checkbox" name="items" id="item3" value="3"> <label for="item3">내가 시작한 청원에 대한 팁을 제공합니다.</label></div>
                <div><input type="checkbox" name="items" id="item4" value="4"> <label for="item4">내 주간 청원 요약이 준비되었습니다.</label></div>
                <div><input type="checkbox" name="items" id="item5" value="5"> <label for="item5">제가 서명하거나 작성한 청원서를 바탕으로 다른 청원서에 대해 자세히 알고 싶습니다.</label></div>
                <hr class="email-settings-hr">
                <div><input type="checkbox" name="items" id="item6" value="6"> <label for="item6">그 어떤 이메일도 받고 싶지 않습니다.</label></div>
                <div id="btnContainer">
                    <button type="submit" id="submit" class="submit-cancel-button">저장</button>
                    <a href="/myPage"><button type="button" id="cancel" class="submit-cancel-button">취소</button></a>
                </div>
            </form>
        </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>