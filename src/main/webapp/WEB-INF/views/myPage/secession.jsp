<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/myPage/secession.css">
    <title>내 계정 비활성화</title>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <main>
        <form action="/myPage/secession" method="POST">
            <h1>내 계정 비활성화</h1>
            <div>
                <p>계정을 비활성화 하시겠습니까?</p>
                <p>계정을 비활성화하면 로그인하여 관심있는 캠페인에 지원할 수 없으며 활성 멤버십이 종료됩니다. 향후 기존 이메일을 사용하여 새로운 청원에 서명하시면 계정을 다시 활성화할 수 있습니다.</p>
            </div>
            <div><button id="secessionSubmit" type="submit">계정 비활성화</button></div>
        </form>
    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>