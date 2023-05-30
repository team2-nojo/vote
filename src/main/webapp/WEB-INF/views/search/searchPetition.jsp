<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>청원 찾기</title>

    <%-- searchPetition.css --%>
    <link rel="stylesheet" href="/resources/css/search/searchPetition.css">
</head>
<body>
    
    <%-- header --%>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <main>
        <section class="search"> <%-- 전체검색 입력란 --%>
            <div id="search">
                <h2>청원 검색</h2>
            </div>
            <form action="/search/searchResult" method="get">
                <div>
                    <input type="search" name="query" id="searchPetitions" placeholder="검색어를 입력해주세요." autocomplete="off" value="${param.query}">
                            
                    <button id="searchButton" class="fa-solid fa-magnifying-glass"> 검색하기</button>
                </div>
            </form>
            <ul id="searchResult" class="close"></ul>
        </section>
        <c:if test="${not empty searchList}" >
        <div class="resultCount"> <%-- 입력된 것을 제출시 출력 --%>
            <h2>검색결과 : ${searchList.size()} 개</h2>
        </div>
        <section class="middle">
            <c:forEach items="${searchList}" var="petition">
                <div class="result">
                    <a href="/browse/petitionView/details/${petition.petitionNo}" class="result1">
                        <div class="row-left">
                            <div id="title">
                                ${petition.petitionTitle}
                            </div>
                            <div id="content">
                                </span>${petition.petitionContent}
                                <a href="/browse/petitionView/details/${petition.petitionNo}" id="readMore"> Read more</a>
                            </div>
                            <div class="progress">
                                <span id="userP">
                                    <c:choose>
                                        <c:when test="${not empty petition.userImage}">
                                            <img class="user-image" src="${petition.userImage}" />
                                        </c:when>
                                        <c:otherwise>
                                            <i class="fa-sharp fa-solid fa-user header-a"></i>
                                        </c:otherwise>
                                    </c:choose>
                                    ${petition.userNickname}
                                </span>
                                <span id="count"><i class="fa-solid fa-users" style="color: #1dbf27; font-size: 15px; margin-left: 5px;"></i> 청원 지지자 수 : ${petition.petitionLikeCount}명</span> 
                            </div>
                        </div>
                        <div class="row-right" id="rowPicture">
                            <c:choose>
                                <c:when test="${not empty petition.petitionImage}">
                                    <img src="${petition.petitionImage}" class="picture">
                                </c:when>
                                <c:otherwise>
                                    <img src="/resources/images/common/defaultThumbnail.png" class="picture">
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </section>
        </c:if>
    </main>
    <%-- footer --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    
    <%-- 돋보기 아이콘 --%>
    <script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>
    
    <%-- searchPetition.js --%>
    <script src="/resources/js/search/searchPetition.js"></script>
</body>
</html>