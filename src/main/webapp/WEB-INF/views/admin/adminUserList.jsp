<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>
<%-- map에 저장된 값들을 각각 변수에 저장 --%>
<c:set var="pagination" value="${map.pagination}"/>
<c:set var="userList" value="${map.userList}"/>


<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>유저 조회</title>

    <link rel="stylesheet" href="resources/css/admin/adminUserList.css">
  </head>
  <body>
 <%-- header --%>
    <jsp:include page="/WEB-INF/views/admin/admin-header.jsp" />
      <article>
    <main>
        <section class="board-list">
            <h1 class="board-name">유저 조회</h1>
            <div class="list-wrapper">
                <table class="list-table">
                    
                    <thead>
                        <tr>
                            <th>회원번호<i class="caret" fa-solid fa-caret-up fa-rotate-180" style="color: #ffffff;"></i></th>
                            <th>닉네임</th>
                            <th>이메일<i class="caret" fa-solid fa-caret-up fa-rotate-180" style="color: #ffffff;"></i></th>
                            <th>주소<i class="caret" fa-solid fa-caret-up fa-rotate-180" style="color: #ffffff;"></i></th>
                            <th>가입일<i class="caret" fa-solid fa-caret-up fa-rotate-180" style="color: #ffffff;"></i></th>
                            <th>작성 청원(건)</th>
                            <th>유저 삭제</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:choose>
                            <c:when test="${empty userList}">
                              
                                <tr>
                                    <th colspan="6">회원이 존재하지 않습니다.</th>
                                </tr>
                            </c:when>
                                
                            <c:otherwise>
                                <form action="/adminUserDelete" method="POST" id="mainForm">
                                <c:forEach items="${userList}" var="user">
                                <input type="hidden" name="userNickname" value="${user.userNickname}">
                                <input type="hidden" name="userNo" value="${user.userNo}">
                                <tr>
                                    <td class='petitionNo'>${user.userNo}</td>
                                    
                                    <c:choose>
                                      <c:when test="${empty user.userImage}">
                                        <td>
                                          <img class="list-thumbnail" src="resources/images/common/doge2.png">${user.userNickname}
                                        </td>
                                      </c:when>
                                      <c:otherwise>
                                        <td>
                                          <img class="list-thumbnail" src="${user.userImage}">${user.userNickname}
                                        </td>
                                      </c:otherwise>
                                    </c:choose>

                                    <td>${user.userEmail}</td>
                                    <td>${user.userAddress}</td>
                                    <td>${user.userEnrollDate}</td>
                                    <td>${user.userWriteCount}</td>
                                    <td>
                                        <button onclick="confirmDeleteUser('${user.userNo}', '${user.userNickname}')">유저 삭제</button>
                                    </td>

                                </tr>
                                </c:forEach>
                               
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
            <div class="btn-area">
                <%-- <button id="delete-check-btn" type="button" onclick="deleteCheck()">회원 삭제</button>                      --%>
            </div>
             </form>
            <div class="pagination-area">
                <ul class="pagination">
                    <!-- 첫 페이지로 이동 -->
                    <li><a href="/adminUser?cp=1">&lt;&lt;</a></li>
                    <!-- 이전 목록 마지막 번호로 이동 -->
                    <li><a href="/adminUser?cp=${pagination.prevPage}">&lt;</a></li>
                    <!-- 특정 페이지로 이동 -->
                    <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">

                        <c:choose>
                            <c:when test="${i==pagination.currentPage}">
                                 <!-- 현재 보고있는 페이지 -->
                                <li><a class="current">${i}</a></li>
                            </c:when>

                            <c:otherwise>
                            <!-- 현재 페이지를 제외한 나머지 -->
                                 <li><a href="/adminUser?cp=${i}">${i}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <!-- 다음 목록 시작 번호로 이동 -->
                    <li><a href="/adminUser?cp=${pagination.nextPage}">&gt;</a></li>
                    <!-- 끝 페이지로 이동 -->
                    <li><a href="/adminUser?cp=${pagination.maxPage}">&gt;&gt;</a></li>
                </ul>
            </div>


			<!-- 검색창 -->
            <form action="/adminUser" method="get" id="petitionSearch">

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
  <script src="resources/js/admin/adminUserList.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
  <script src="https://kit.fontawesome.com/8be2100736.js" crossorigin="anonymous"></script>
</body>
</html>