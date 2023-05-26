<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<%-- map에 저장된 값들을 각각 변수에 저장 --%>
<c:set var="pagination" value="${map.pagination}"/>
<c:set var="QNA3List" value="${map.QNA3List}"/> 
<c:set var="qnaName" value="${qnaTypeList[qnaCatCode-1].QNA_NAME}"/>


<%-- <c:forEach items="${boardTypeList}" var="boardType">
    <c:if test="${boardType.BOARD_CODE == boardCode}" >
        <c:set var="boardName" value="${boardType.BOARD_NAME}"/>
    </c:if>
</c:forEach> --%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VOTE ${boardName} 문의 내역</title>

    <link rel="stylesheet" href="/resources/css/clientCenter/QNA3.css">

</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

        <c:if test="${not empty param.key}" >
            <c:set var="sp" value="&key=${param.key}&query=${param.query}"/>
        </c:if>

    <main>
    <div class="content">

        <section class="board-list">
            <h1 class="board-name">문의 내역</h1>
            <div class="list-wrapper">
                <table class="list-table">
                    <thead>
                        <tr>
                            <th>글번호</th>
                            <th>제목</th>
                            <th>답변여부</th>
                            <th>작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${empty QNA3List}">
                            
                                <tr>
                                    <th colspan="6">게시글이 존재하지 않습니다.</th>
                                </tr>
                            </c:when>
                                
                            <c:otherwise>
                                
                                <c:forEach items="${QNA3List}" var="qna">
                                    <tr>
                                        <td>${qna.qnaNo}</td>
                                        <%--<td> 
                                        
                                            <img class="list-thumbnail" src="${QNA3.userImage}">
                                            
                                            ${petitionNo} : @Pathvariable로 request scope에 추가된 값임 --%>
                                        <td>

                                        <a href="/clientCenter/QNADetail/${qna.qnaNo}?cp=${pagination.currentPage}">${qna.qnaTitle}</a>
                                        </td>
                                        <td>${qna.qnaStatus}</td>
                                        <td>${qna.qnaCreateDt}</td>
                                    </tr>
                                </c:forEach>

                            </c:otherwise>
                        </c:choose>
                

                    </tbody>
                </table>
            </div>


            <div class="pagination-area">


                <ul class="pagination">
                
                    <!-- 첫 페이지로 이동 -->
                    <li><a href="/clientCenter/QNA3/${qnaCatCode}?cp=1${sp}">&lt;&lt;</a></li>

                    <!-- 이전 목록 마지막 번호로 이동 -->
                    <li><a href="/clientCenter/QNA3/${qnaCatCode}?cp=${pagination.prevPage}${sp}">&lt;</a></li>
                    

					
                    <!-- 특정 페이지로 이동 -->
                    <c:forEach var="i" begin="${pagination.startPage}" 
                    end="${pagination.endPage}" step="1">

                        <c:choose>
                            <c:when test="${i==pagination.currentPage}">
                                 <!-- 현재 보고있는 페이지 -->
                                <li><a class="current">${i}</a></li>
                            </c:when>

                            <c:otherwise>
                            <!-- 현재 페이지를 제외한 나머지 -->
                                 <li><a href="/clientCenter/QNA3/${qnaCatCode}?cp=${i}${sp}">${i}</a></li>
                            </c:otherwise>
                        </c:choose>

                    </c:forEach>
                   
                    
    
                    
                    <!-- 다음 목록 시작 번호로 이동 -->
                    <li><a href="/clientCenter/QNA3/${qnaCatCode}?cp=${pagination.nextPage}">&gt;</a></li>

                    <!-- 끝 페이지로 이동 -->
                    <li><a href="/clientCenter/QNA3/${qnaCatCode}?cp=${pagination.maxPage}">&gt;&gt;</a></li>

                </ul>
            </div>


			<!-- 검색창 -->
            <form action="${qnaCatCode}" method="get" id="boardSearch">

                <select name="key" id="searchKey">
                    <option value="t">제목</option>
                    <option value="c">내용</option>
                    <option value="tc">제목+내용</tion>
                </select>

                <input type="text" name="query"  id="searchQuery" placeholder="검색어를 입력해주세요.">

                <button>검색</button>
            </form>

        </section>
    </main>

    
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="/resources/js/clientCenter/QNA3.js"></script>
<script src="https://kit.fontawesome.com/fa1a384c97.js" crossorigin="anonymous"></script>
</body>
</html>