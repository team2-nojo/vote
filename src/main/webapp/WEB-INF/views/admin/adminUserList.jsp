<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>

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
    <link rel="stylesheet" href="resources/css/admin/adminUserList2.css">
  </head>
  <body>
 <%-- header --%>
    <jsp:include page="/WEB-INF/views/admin/admin-header.jsp" />
      <article>
    <main>
        <section class="board-list">
        <div>
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
               <button id="delete-check-btn" type="button">삭제회원</button>



                    </div>

                       
            </div>
            </div>
             </form>
            <div class="pagination-area">
                <ul class="pagination">
                    <!-- 첫 페이지로 이동 -->
                    <li><a href="/adminUserList?cp=1">&lt;&lt;</a></li>
                    <!-- 이전 목록 마지막 번호로 이동 -->
                    <li><a href="/adminUserList?cp=${pagination.prevPage}">&lt;</a></li>
                    <!-- 특정 페이지로 이동 -->
                    <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">

                        <c:choose>
                            <c:when test="${i==pagination.currentPage}">
                                 <!-- 현재 보고있는 페이지 -->
                                <li><a class="current">${i}</a></li>
                            </c:when>

                            <c:otherwise>
                            <!-- 현재 페이지를 제외한 나머지 -->
                                 <li><a href="/adminUserList?cp=${i}">${i}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <!-- 다음 목록 시작 번호로 이동 -->
                    <li><a href="/adminUserList?cp=${pagination.nextPage}">&gt;</a></li>
                    <!-- 끝 페이지로 이동 -->
                    <li><a href="/adminUserList?cp=${pagination.maxPage}">&gt;&gt;</a></li>
                </ul>
            </div>
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
<%-- /////////////// /////////////////////////////////////////////////////////////////////////////////////--%>
                <div id="modalBackground" class="modal-background"></div>

                    <div id="modal" class="modal">
                        <span class="close-button"><i class="fa-sharp fa-solid fa-circle-xmark" style="color: #4a4e54;"></i></span>
                        <section class="board-list2">
        <div>
            <div class="list-wrapper2">
                <table class="list-table2">
                    
                    <thead>
                        <tr>
                            <th>회원번호</th>
                            <th>닉네임</th>
                            <th>가입일</th>
                            <th>유저복구</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${empty delUserList}">
                            
                                <tr>
                                    <th colspan="6">회원이 존재하지 않습니다.</th>
                                </tr>
                            </c:when>
                                <%-- <input type="hidden" id="pagination2" value="${pagination2}" />
                                <input type="hidden" id="delUserList" value="${delUserList}" /> --%>
                            <c:otherwise>
                                <form action="/adminUserDeleteCancle" method="POST" id="mainForm2">
                                <c:forEach items="${delUserList}" var="user2">
     
                                <%-- <input type="hidden" id="pagination2" value="">
                                <input type="hidden" id="delUserList" value=""> --%>
                                <tr>
                                    <td class='petitionNo'>${user2.userNo}</td>
                                    
                                    <c:choose>
                                      <c:when test="${empty user2.userImage}">
                                        <td>
                                          <img class="list-thumbnail" src="resources/images/common/doge2.png">${user2.userNickname}
                                        </td>
                                      </c:when>
                                      <c:otherwise>
                                        <td>
                                          <img class="list-thumbnail" src="${user2.userImage}">${user2.userNickname}
                                        </td>
                                      </c:otherwise>
                                    </c:choose>

                                    <td>${user2.userEnrollDate}</td>
                                    <td>
                                        <button onclick="confirmDeleteUserCancle('${user2.userNo}', '${user2.userNickname}')">유저 복구</button>
                                    </td>

                                </tr>
                                </c:forEach>
                               
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
                       </div>
             </form>
                      </div>






        </section>


        
    </main>
  </article>
  <script src="resources/js/admin/layout.js"></script>
  <script src="resources/js/admin/adminUserList.js"></script>
  <script src="resources/js/admin/adminUserList2.js"></script>
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
  <script src="https://kit.fontawesome.com/8be2100736.js" crossorigin="anonymous"></script>
</body>
</html>
