<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/browse/browseSearch/category.css">
    <title>카테고리별 조회</title>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <main>
        <div class="title-container">
            <p><i class="fa-solid fa-tag fa-flip-horizontal"></i> 카 테 고 리</p>
            <h1>${categoryInfo.categoryName}</h1>
            <p>${categoryInfo.count}개의 청원</p>
        </div>
        <c:choose>
            <c:when test="${not empty petitionList}">
                <div id="contentContainer" class="content-container">
                    <div class="align-menu-container">
                        <div id="trending" class="align-item current">인기순</div>
                        <div id="recent" class="align-item">최신순</div>
                    </div>
                    <hr>
                    <div id="petitionsContainer" class="petitions-container">
                    </div>
                    <div><button id="loadPetitionBtn">더 보기</button></div>
                </div>
            </c:when>
        
            <c:otherwise>
                이 카테고리에는 청원이 한 개도 없어
                이 카테고리로 청원해볼래?
            </c:otherwise>
        </c:choose>
        <c:if test="${not empty petitionList}" >
            
        </c:if>
    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script src="/resources/js/browse/browseSearch/category.js"></script>
</body>
</html>