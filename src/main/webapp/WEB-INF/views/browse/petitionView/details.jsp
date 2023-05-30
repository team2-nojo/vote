<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="petition" value="${petition}"/>
<c:set var="likeUserList" value="${likeUserList}"/>
<c:set var="comment" value="${commentList}"/>
<c:set var="likeUserList" value="${resetlikeUserList}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VOTE 청원 상세</title>

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
                <div id="details">청원 상세</div>
                <div ><a href="/browse/petitionView/update/${petitionNo}" id="updates">청원 업데이트</a></div>
            </div>
        </section>

        <!-- 게시글뷰 -->
        <section id="post">
            <!-- 게시글 왼쪽 -->
            <div id="post-L">
                <div id="postTitle">
                    ${petition.petitionTitle}
                </div>
                <div class="writer">
                        <c:choose>
                            <c:when test="${empty petition.userImage}">
                            <%-- 프로필 이미지 없을 경우 기본 이미지 --%>

                                <a href="/myPage/profile/${petition.userNo}"><img id="profile-id" src="/resources/images/common/user.png"></a>
                            </c:when>
                            <c:otherwise>
                                <%-- 프로필 이미지 있을 경우 프로필 이미지 --%>
                                <a href="/myPage/profile/${petition.userNo}"><img id="profile-id" src="${petition.userImage}"></a>

                            </c:otherwise>
                        </c:choose>
                        <div class="nickname">
                            ${petition.userNickname}
                        </div>
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
                <div class="box1">
                    <div>
                        <div class="startCon" id="startCon1">당신만의 청원을 시작할 수 있습니다.</div>
                        <div class="startCon" id="startCon2">당신의 신념을 행동으로 옮기시겠습니까??</div>
                    </div>
                    <div id="btnBox">
                        <a href="/writePetition" id="start"><button type="button" id="startBtn">청원 시작하기</button></a>
                    </div>
                </div>
                <br>
                <br>
                <%-- 댓글 --%>
                <div id="commentBox">
                    <div id="reason">댓글 보기</div>
                        <c:choose>
                            <c:when test="${empty commentList}">
                                <%-- 댓글이 없을 경우 --%>
                                <div class="box1">
                                    <div>
                                        <div class="startCon" id="startCon1">아직 해당 글에 대한 댓글이 없습니다.</div>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <%-- 댓글이 있을 경우 --%>
                                <ul class="commentList">
                                    <c:forEach items="${commentList}" var="comment">
                                    <li class="comment-row">
                                        <p class="noti">
                                            <!-- 유저아이콘 추가해야 함-->
                                            <c:choose>
                                                <c:when test="${empty comment.userImage}">
                                                    <%-- 프로필 이미지 없을 경우 기본 이미지 --%>
                                                    <img id="comImg" src="/resources/images/common/user.png" class="profile">
                                                </c:when>

                                                <c:otherwise>
                                                    <%-- 프로필 이미지 있을 경우 프로필 이미지 --%>
                                                    <img id="comImg" src="${comment.userImage}" class="profile">
                                                </c:otherwise>
                                            </c:choose>
                                            <span class="comUser" >${comment.userNickname}</span>
                                            <span class="commentDate">${comment.commentDate}</span>
                                            <i class="fa-regular fa-thumbs-up fa-xl" style="color: red;"></i><span>${comment.commentFLY}</span>
                                            <i class="fa-regular fa-thumbs-down fa-xl" style="color: blue;"></i><span>${comment.commentFLN}</span>

                                        </p>
                                        <p class="commentCon"> ${comment.commentContent}
                                        </p>    
                                    </li>
                                    </c:forEach>
                                </ul>
                            </c:otherwise>
                        </c:choose>

                </div>
            




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
                    <progress id="progress" value="${petition.petitionLikeCount}" min="0" max="${fn:substringBefore((Math.ceil(petition.petitionLikeCount / 5) * 5), '.')}" ></progress>
                    <div id="row2">
                        청원 달성까지 서포터 단
                        <strong>
                            <!-- 청원 달성 위해 남은 사람의 수-->
                            <span id="remainNumber">${fn:substringBefore((Math.ceil(petition.petitionLikeCount / 5) * 5), '.') - petition.petitionLikeCount}</span>
                            명만 더!
                        </strong> 
                    </div>
                    <div id="row3">
                        <div id="row3-1">
                            <i class="fa-solid fa-arrow-trend-up fa-sm" id="arrow"></i>
                        </div>
                        <div id="row3-2">
                            더 많은 사람이 서명할수록<br>
                            <strong>
                                순위권이 높은 청원이 됩니다!
                            </strong>
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
                                    <button id="signButton" >서명하기</button>
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
        const likeUser = "${resetlikeUserList[0].userNo}";
        const loginUserNickname = "${loginUser.userNickname}";
        const petitionTitle = "${petition.petitionTitle}";
    </script>
    
    <%-- petitionView.js --%>
    <script src="/resources/js/browse/petitionView/details.js"></script>
</body>
</html>