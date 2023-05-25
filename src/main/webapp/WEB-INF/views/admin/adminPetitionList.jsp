<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>
<%-- map에 저장된 값들을 각각 변수에 저장 --%>
<c:set var="pagination" value="${map.pagination}"/>
<c:set var="petitionList" value="${map.petitionList}"/>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>VOTE 청원 조회</title>

    <link rel="stylesheet" href="resources/css/admin/adminPetitionList.css">
  </head>
  <body>
 <%-- header --%>
    <jsp:include page="/WEB-INF/views/admin/admin-header.jsp" />
      <article>
    <main>
        <section class="board-list">
            <h1 class="board-name">청원 조회</h1>
            <div class="list-wrapper">
                <table class="list-table">
                    
                    <thead>
                        <tr>
                            <th>글번호<i class="caret" fa-solid fa-caret-up fa-rotate-180" style="color: #ffffff;"></i></th>
                            <th>제목</th>
                            <th>작성자</th>
                           <th>작성일<i class="caret" fa-solid fa-caret-up fa-rotate-180" style="color: #ffffff;"></i></th>
                            <th>조회수<i class="caret" fa-solid fa-caret-up fa-rotate-180" style="color: #ffffff;"></i></th>
                            <th>청원삭제<i class="caret" fa-solid fa-caret-up fa-rotate-180" style="color: #ffffff;"></i></th>
                            <th>메인등록</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:choose>
                            <c:when test="${empty petitionList}">
                              
                                <tr>
                                    <th colspan="6">게시글이 존재하지 않습니다.</th>
                                </tr>
                            </c:when>
                                
                            <c:otherwise>
                                <form action="/adminPetitionDelete" method="POST" id="mainForm2">
                                <%-- <form action="/admin/petition/${petition.petitionNo}" method="POST" id="mainForm"> --%>
                                <c:forEach items="${petitionList}" var="petition">

                                <tr>
                                    <td class='petitionNo'>${petition.petitionNo}</td>
                                    <td>
                                        <img class="list-thumbnail" src="${petition.userImage}">
                                        <%-- ${petitionNo} : @Pathvariable로 request scope에 추가된 값임 --%>
                                        <a href="/${petition.petitionNo}?cp=${pagination.currentPage}">${petition.petitionTitle}</a>
                                    </td>
                                    <td class='userNickname'>${petition.userNickname}</td>
                                    <td>${petition.petitionDate}</td>
                                    <td>${petition.petitionViewCount}</td>
                                    <td><button onclick="confirmDeletePetition('${petition.petitionNo}', '${petition.userNickname}')">청원 삭제</button></td>
                                    <td>
                                            <label for="mainUpdateNumber"></label>
                                            <select id="mainUpdateNumber" name="mainUpdateNumber" onchange="confirmChange(this)">

                                                <option selected disabled>메인 번호 선택</option>
                                                <c:forEach var="number" begin="1" end="6">
                                                <option value="${number}">${number}</option>
                                                </c:forEach>
                                            </select>
                                    </td>
                                </tr>
                                </c:forEach>
                                </form>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
            <div class="btn-area">
                <%-- <button id="insertBtn">메인 등록</button>                      --%>
            </div>
            <div class="pagination-area">
                <ul class="pagination">
                    <!-- 첫 페이지로 이동 -->
                    <li><a href="/adminPetitionList?cp=1"><i class="fa-solid fa-backward" style="color: #3d434d;"></i></a></li>
                    <!-- 이전 목록 마지막 번호로 이동 -->
                    <li><a href="/adminPetitionList?cp=${pagination.prevPage}"><i class="fa-solid fa-caret-up fa-rotate-270" style="color: #40454f;"></i></a></li>
                    <!-- 특정 페이지로 이동 -->
                    <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">

                        <c:choose>
                            <c:when test="${i==pagination.currentPage}">
                                 <!-- 현재 보고있는 페이지 -->
                                <li><a class="current">${i}</a></li>
                            </c:when>

                            <c:otherwise>
                            <!-- 현재 페이지를 제외한 나머지 -->
                                 <li><a href="/adminPetitionList?cp=${i}">${i}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <!-- 다음 목록 시작 번호로 이동 -->
                    <li><a href="/adminPetitionList?cp=${pagination.nextPage}"><i class="fa-solid fa-caret-up fa-rotate-90" style="color: #3d3f43;"></i></a></li>
                    <!-- 끝 페이지로 이동 -->
                    <li><a href="/adminPetitionList?cp=${pagination.maxPage}"><i class="fa-solid fa-backward fa-rotate-180" style="color: #3d434d;"></i></a></li>
                </ul>
            </div>


			<!-- 검색창 -->
            <form action="/adminPetitionList" method="get" id="petitionSearch">

                <select name="key" id="searchKey">
                    <option value="t">제목</option>
                    <option value="c">내용</option>
                    <option value="tc">제목+내용</tion>
                    <option value="w">작성자</option>
                </select>

                <input type="text" name="query"  id="searchQuery" placeholder="검색어를 입력해주세요.">

                <button>검색</button>
            </form>

        </section>
    </main>
  </article>
  <script src="resources/js/admin/layout.js"></script>
  <script src="resources/js/admin/adminPetitionList.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
  <script src="https://kit.fontawesome.com/8be2100736.js" crossorigin="anonymous"></script>
</body>
</html>
