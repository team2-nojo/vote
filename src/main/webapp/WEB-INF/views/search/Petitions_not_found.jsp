<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>청원 찾는 키워드 없음 </title>

    <%-- Petitions_not_found.css --%>
    <link rel="stylesheet" href="/resources/css/search/Petitions_not_found.css">
    
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
                
                <button type="button" id="searchButton" class="fa-solid fa-magnifying-glass"> search</button>
            </div>
            <div id="noResult">
                찾는 결과가 없습니다.
            </div>
            <div id="start">
                <p>찾고 있는 것을 찾을 수 없습니까? 관심 있는 문제에 대해 지지해드립니다.</p>
                <button type="button" id="startPatition">청원 시작하기</button>
            </div>
            
        </section>
        <%-- footer --%>
        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    </main>
    
    <%-- 돋보기 아이콘 --%>
    <script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>
</body>
</html>