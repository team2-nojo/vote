<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OpenAI를 이용한 챗봇</title>

    <link rel="stylesheet" href="../CSS/chatbot.css">
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div id="chat-container">
        <div id="chat-messages"></div>
        <div id="user-input">
            <input type="text" placeholder="메시지를 입력하세요..." />
            <button>전송</button>
        </div>
    </div>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="../JS/chatbot.js"></script>
</body>


</html>