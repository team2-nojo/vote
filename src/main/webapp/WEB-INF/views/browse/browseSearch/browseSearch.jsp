<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>브라우저 게시글 조회(popular)</title>

    <%-- popular.css --%>
    <link rel="stylesheet" href="/resources/css/browse/browseSearch/browseSearch.css">
    
</head>
<body>
    <%-- header --%>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <main>
        <section class="top">
            <div id="discoverP">
                청원글 조회
            </div>
            <div class="menu" id="menu">
                <div><a href="/browse/browseSearch/popular" id="popular">Popular</a></div>
                <div><a href="/browse/browseSearch/recent" id="recent">Recent</a></div>
                <div><a href="/browse/browseSearch/victories" id="victories">Victories</a></div>
            </div>
        </section>
        <section class="middle">
            <c:forEach items="${petitionList}" var="petition">
                <div class="result">
                    <a href="/browse/petitionView/details/${petition.petitionNo}" class="result1 contentBox">
                        <div class="row-left" id="rowPicture">
                            <img src="${petition.petitionImage}" class="picture">
                        </div>
                        <div class="row-right">
                            <div id="title" class="limit-title">
                                ${petition.petitionTitle}
                            </div>
                            <div id="content" class="limit-content">
                                ${petition.petitionContent}
                                <a href="/browse/petitionView/details/${petition.petitionNo}" id="readMore"> Read more</a>
                            </div>
                            <div class="progress">
                                <progress id="progress" value="${petition.petitionLikeCount}" min="0" max="${fn:substringBefore((Math.ceil(petition.petitionLikeCount / 5) * 5), '.')}" ></progress>
                                <div id="value"></div>
                                <div id="goal">
                                    청원 지지자 수 <span id="count">${petition.petitionLikeCount}</span> 명
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </section>
        <section>
            <div>
                <button type="button" id="moreView">더보기</button>
            </div>
        </section>
    </main>
    <%-- footer --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <%-- browse_search.js --%>
    <script src="/resources/js/browse/browseSearch/browseSearch.js"></script>
</body>
</html>