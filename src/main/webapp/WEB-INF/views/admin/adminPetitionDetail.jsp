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
    <link rel="stylesheet" href="resources/css/admin/adminPetitionDetail.css">
  </head>
<body>
  <jsp:include page="/WEB-INF/views/admin/admin-header.jsp" />
  <article>
    <main>
      

        <section class="board-detail">  
            <!-- 제목 -->
            <h1 class="board-title">${petition.petitionTitle}  <span> -</span>    </h1>

            <!-- 프로필 + 닉네임 + 작성일 + 조회수 -->
            <div class="board-header">
                <div class="board-writer">

                    <!-- 프로필 이미지 -->
                    <c:choose>
                        <c:when test="${empty petition.petitionImage}">
                            <%-- 프로필 이미지가 없을 경우 기본 이미지 출력 --%>
                            <img src="/resources/images/user.png">
                        </c:when>
                        
                        <c:otherwise>
                            <%-- 프로필 이미지가 있을 경우 출력 --%>
                            <img src="${petition.userImage}">
                        </c:otherwise>
                    </c:choose>

                    <span>${petition.userNickname}</span>

                    
                </div>

                <div class="board-info">
                    <p> <span>작성일</span> ${petition.petitionDate} </p>     

                
                    <p> <span>조회수</span> ${petition.petitionViewCount} </p>                    
                </div>
            </div>


            <!-- 내용 -->
            <div class="board-content">${petition.petitionContent}</div>


            <!-- 버튼 영역-->
            <div class="board-btn-area">

                <!-- 로그인한 회원과 게시글 작성자 번호가 같은 경우-->
                
                    <button id="updateBtn">수정</button>
                    <button id="deleteBtn">삭제</button>



                <button id="goToListBtn">목록으로</button>
            </div>


        </section>

        <!-- 댓글 include-->
        
    </main>
    </article>
    <script src="resources/js/admin/layout.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
  <script src="https://kit.fontawesome.com/8be2100736.js" crossorigin="anonymous"></script>



</body>

</html>
