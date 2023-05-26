<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>

<c:set var="pagination" value="${map2.pagination2}"/>
<c:set var="userList" value="${map2.delUserList}"/>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>VOTE 회원정보</title>

    <link rel="stylesheet" href="resources/css/admin/adminDelUserList.css">
  </head>
  <body>
 <%-- header --%>
    <jsp:include page="/WEB-INF/views/admin/admin-header.jsp" />
      <article>
    <main>
        <section class="board-list">
        <div>
            <h1 class="board-name">삭제회원조회</h1>
            <div class="list-wrapper">
                <table class="list-table">
                    
                    <thead id='thead'>
                        <tr>
                            <th>회원번호</th>
                            <th>닉네임</th>
                            <th>가입일</th>
                            <th>유저복구</th>
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
                                <form action="/adminUserDeleteCancle" method="POST" id="mainForm">
                                <c:forEach items="${userList}" var="user">
                                <input type="hidden" name="userNickname" value="${user.userNickname}">
                                <input type="hidden" name="userNo" value="${user.userNo}">
                                <tr class='delUserTable'>
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


                                    <td>${user.userEnrollDate}</td>

                                    <td>
                                        <button onclick="confirmDeleteUserCancle('${user.userNo}', '${user.userNickname}')">유저 복구</button>
                                    </td>

                                </tr>
                                </c:forEach>
                               
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
            <div class="btn-area">
     



                    </div>

                       
            </div>
            </div>
             </form>
            <div class="pagination-area">
                <ul class="pagination">
                    <!-- 첫 페이지로 이동 -->
                    <li><a href="/adminDelUserList?cp=1"><i class="fa-solid fa-backward" style="color: #3d434d;"></i></a></li>
                    <!-- 이전 목록 마지막 번호로 이동 -->
                    <li><a href="/adminDelUserList?cp=${pagination.prevPage}"><i class="fa-solid fa-caret-up fa-rotate-270" style="color: #40454f;"></i></a></li>
                    <!-- 특정 페이지로 이동 -->
                    <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">

                        <c:choose>
                            <c:when test="${i==pagination.currentPage}">
                                 <!-- 현재 보고있는 페이지 -->
                                <li><a class="current">${i}</a></li>
                            </c:when>

                            <c:otherwise>
                            <!-- 현재 페이지를 제외한 나머지 -->
                                 <li><a href="/adminDelUserList?cp=${i}">${i}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <!-- 다음 목록 시작 번호로 이동 -->
                    <li><a href="/adminDelUserList?cp=${pagination.nextPage}"><i class="fa-solid fa-caret-up fa-rotate-90" style="color: #3d3f43;"></i></a></li>
                    <!-- 끝 페이지로 이동 -->
                    <li><a href="/adminDelUserList?cp=${pagination.maxPage}"><i class="fa-solid fa-backward fa-rotate-180" style="color: #3d434d;"></i></a></li>
                </ul>
            </div>
            </div>


			
        </section>
<%-- /////////////// /////////////////////////////////////////////////////////////////////////////////////--%>
                <div id="modalBackground" class="modal-background"></div>

                    <div id="modal" class="modal">
                       
                        <section class="board-list2">
                         <span class="close-button"><i class="fa-sharp fa-solid fa-circle-xmark" style="color: #4a4e54;"></i></span>
        <div>


          <%-- <form action="/adminUserDeleteCancle" method="POST" id="mainForm2"> --%>
            <div class="list-wrapper2">
                <table class="list-table2">
                    
                    <thead id='thead'>
                        <tr>
                            <th>회원번호</th>
                            <th>닉네임</th>
                            <th>가입일</th>
                            <th>유저복구</th>
                        </tr>
                    </thead>
                    <tbody id="t-body">
                               
                            
                    </tbody>
                </table>
                    <div id='pagination2'>
              
                </div>
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
