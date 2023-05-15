<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

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
    
    <main>
        <%-- header --%>
        <jsp:include page="/WEB-INF/views/common/header.jsp"/>
        
        
        <section>
            <div id="search">
                청원 검색
            </div>
            
            <div>
                <input type="text" id="searchPetitions" >
                        
                <button id="searchButton" class="fa-solid fa-magnifying-glass"> 검색하기</button>
            </div>
            
        </section>
        <%-- footer --%>
        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    </main>

    
    <%-- 돋보기 아이콘 --%>
    <script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>
    
    <%-- searchPetition.js --%>
    <script src="/resources/js/search/searchPetition.js"></script>
</body>
</html>