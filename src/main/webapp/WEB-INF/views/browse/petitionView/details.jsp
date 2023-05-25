<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<c:set var="petition" value="${petition}"/>
<c:set var="likeUserList" value="${likeUserList}"/>
<%-- <c:set var="comment" value="${selectCommentList}"/> --%>
<c:set var="likeUserList" value="${resetlikeUserList}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>브라우저 게시글 View</title>

    <%-- petitionView.css --%>
    <link rel="stylesheet" href="/resources/css/browse/petitionView/details.css">

    <%-- 신고 깃발 아이콘 --%>
    <script src="https://kit.fontawesome.com/f7459b8054.js"crossorigin="flag"></script>
</head>

<body>
    
    <%-- header --%>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <main>
        <!-- 상단메뉴 -->
        <section class="top">
            <div id="menu">
                <div id="details">Petition details</div>
                <div><a href="/browse/petitionView/comments/${petitionNo}" id="comments">Comments</a></div>
                <div ><a href="/browse/petitionView/update/${petitionNo}" id="updates">Updates</a></div>
            </div>
        </section>

        <!-- 게시글뷰 -->
        <section id="post">
            <!-- 게시글 왼쪽 -->
            <div id="post-L">
                <div id="postTitle">
                    ${petition.petitionTitle}
                </div>
                <div id="postPicture">
                
                    <img src="${petition.petitionImage}" id="postPic">
                </div>
                <div id="postContent">
                    <div class="paragraph">
                        ${petition.petitionContent}
                    </div>
                </div>

                <!-- 신고하기 -->
                <div id="report1">
                    <i class="fa-regular fa-flag"></i>
                    <%-- # 수정하면 안됨! --%>
                    <a href="#" id="reportClick">정책 위반 신고하기</a>
                </div>



                <!-- 패티션 만들기 -->
                <div id="box1">
                    <div>
                        <div class="startCon" id="startCon1">당신만의 청원을 시작할 수 있습니다.</div>
                        <div class="startCon" id="startCon2">당신의 신념을 행동으로 옮기시겠습니까??</div>
                    </div>
                    <div id="btnBox">
                        <a href="/writePetition" id="start"><button type="button" id="startBtn">청원 시작하기</button></a>
                    </div>
                </div>
                <br>
    <%--             <hr> --%>
                
                <br>
                <!-- 업데이트 -->
                <div id="notification">
                    <div id="update">업데이트</div>
                    <div class="box2" id="box2">
                        <div class="updateCon">업데이트 내용</div>
                        <div class="time">1일 전</div>
                    </div>
                </div>


                <br>
                <%-- <hr> --%>
                <br>


                <%-- 댓글 --%>
                <div id="commentBox">
                    <div id="reason">댓글 보기</div>
                    <ul class="commentList">
                    </ul>
                </div>
                <!-- 버튼 클릭 시 이동 -->
                <button type="button" id="commentMore" >댓글 더 보기</button>
            




            </div>
        </div>

        <!-- 게시글 오른쪽 -->
        <div id="post-R">
            <div id="gauge">
                <div id="postContent">
                    <div id="row1">
                        <strong>
                            <%-- 좋아요 클릭 한 사람 수 --%>
                            <span id="likeCount">${petition.petitionLikeCount}</span> 
                            명이 서명했습니다.
                        </strong>
                    </div>
                    <progress id="progress" value="${petition.petitionLikeCount}" min="0" max="50" ></progress>
                    <div id="row2">
                        청원 달성까지 서포터 단
                        <strong>
                            <!-- 청원 달성 위해 남은 사람의 수-->
                            <span id="remainNumber">${50-petition.petitionLikeCount}</span>
                            명만 더!
                        </strong> 
                    </div>
                    <div id="row3">
                        <div id="row3-1">
                            <!-- 임시이미지 -->
                            <i class="fa-solid fa-arrow-trend-up fa-sm" id="arrow"></i>
                        </div>
                        <div id="row3-2">
                            더 많은 사람이 서명할수록<br>
                            <strong>
                                순위권이 높은 청원이 됩니다!
                            </strong>
                            <%-- 달성목표와 달성된 %에 따라 문구가 달라짐 --%>
                            <%-- 5,000명의 서명이 있는 이 청원은 지역 뉴스에 의해 채택될 가능성이 더 높습니다! --%>
                            <%-- 25개의 서명에서, 이 청원은 추천서에 실릴 가능성이 더 높습니다! --%>
                            <%-- 1,000명의 서명이 있는 이 청원은 추천에 포함될 가능성이 더 높습니다! --%>
                        </div>
                    </div>
                </div>
                 <c:choose>
                        <c:when test="${loginUser.userNo != petition.userNo}">
                            <%-- 로그인 유저와 해당 글 작성자가 다른 경우 --%>
                            <%-- 체크박스 --%>
                            <div id="check">
                                <input type="checkbox" id="agree">
                                <label for="agree">
                                    이 청원에 이름과 댓글을 표시합니다.
                                </label>
                            </div>
                                <%-- 댓글창 --%>
                                <div id="commentPlace">
                                        <div id="wrtComment">
                                            <textarea id="commentContent" cols="10" rows="20" placeholder=" - 띄어쓰기를 포함하여 최대 200자까지 작성할 수 있습니다. &#13;&#10; *욕설, 서비스 이용에 방해되는 글은 관리자에 의해 삭제됩니다."></textarea>
                                        </div>
                                    </form>
                                    <div id="countComment">
                                        <span id="count">0</span>자 / 200자
                                    </div>
                                </div>
                                <%-- 좋아요 버튼 --%>
                                <div>
                                    <button id="signButton" >좋아요!</button>
                                </div>
                        </c:when>
                            <%-- 로그인 유저와 해당 글 작성자가 같은 경우 --%>
                        <c:otherwise>
                        </c:otherwise>
                    </c:choose>
        </section>
        
        
        
    </main>
    <%-- footer --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script>
        const petitionNo = ${petition.petitionNo};
        const loginUserNo = "${loginUser.userNo}";
        const petitionLikeCount = "${petition.petitionLikeCount}";
        const comment = "${selectCommentList}";
        const likeUser = "${resetlikeUserList[0].userNo}"
    </script>
    
    <%-- petitionView.js --%>
    <script src="/resources/js/browse/petitionView/details.js"></script>
</body>
</html>