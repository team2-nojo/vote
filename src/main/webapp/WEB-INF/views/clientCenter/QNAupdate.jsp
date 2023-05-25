<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<c:forEach items="${boardTypeList}" var="boardType">
    <c:if test="${boardType.BOARD_CODE == boardCode}">
        <c:set var="boardName" value="${boardType.BOARD_NAME}"/>
    </c:if>
</c:forEach>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VOTE ${boardName}</title>

    <link rel="stylesheet" href="/resources/css/clientCenter/QNAupdate.css">
</head>
<body>
    <main>
        <<jsp:include page="/WEB-INF/views/common/header.jsp"/>

        <form action="/clientCenter/QNAupdate/${qna.qnaNo}" method="POST" class="board-write" id="boardUpdateFrm" enctype="multipart/form-data">  
            <h1 class="board-name">${boardName}</h1>

            <!-- 제목 -->
            <h1 class="board-title">
                <input type="text" name="qnaTitle" placeholder="제목" value="${qna.qnaTitle}">   
            </h1>

            <!-- 내용 -->
            <div class="board-content">
                <textarea name="qnaCont">${qna.qnaCont}</textarea>
            </div>

            <!-- 버튼 영역 -->
            <div class="board-btn-area">
                <button type="submit" id="writebtn">등록</button>
            </div>

        </form>

    </main>

   <jsp:include page="/WEB-INF/views/common/footer.jsp"/>



    <script src="/resources/js/clientCenter/QNAupdate.js"></script>

</body>
</html>