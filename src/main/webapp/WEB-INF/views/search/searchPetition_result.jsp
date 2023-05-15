<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>청원 조회 결과</title>

    <%-- searchPetition_result.css --%>
    <link rel="stylesheet" href="/resources/css/search/searchPetition_result.css">
</head>
<body>
    
    <main>
        <%-- header --%>
        <jsp:include page="/WEB-INF/views/common/header.jsp"/>
        
        
        <section>
            <div id="searchP">
                Search Petitions
            </div>
            
            <div id="search">
                <input type="text" id="searchPetitions" >
                        
                <button id="searchButton" class="fa-solid fa-magnifying-glass"> search</button>
            </div>
            <div class="result">
                <div class="row">
                    <div class="column" id="column-1">
                        <div id="title">
                            서울시 종로구 순덕이 출현
                        </div>
                        <div id="content">
                            내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용용내용내용내용내용내용내용내용내용내용내용내용내용용내용내용내용내용내용
                        </div>
                    </div>
                    <div class="column" id="column-2">
                        <div class="col" id="profile" >프로필</div>
                        <div class="col" id="suporterNum">서포터 수</div>
                    </div>
                </div>
                <div class="row" id="rowPicture">
                    <img src="../image/순덕이.png" class="picture">
                </div>
            </div>
            <div>
                <button type="button" id="moreView">더보기</button>
            </div>
        </section>


        <%-- footer --%>
        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>


    </main>

    <%-- 돋보기아이콘 --%>
    <script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>

    <%-- searchPetition_result.js --%>
    <script src="/resources/js/search/searchPetition_result.js"></script>
</body>
</html>