<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

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
                <div><a href="/browse/petitionView/comments" id="comments">Comments</a></div>
                <div ><a href="/browse/petitionView/updates" id="updates">Updates</a></div>
            </div>
        </section>

        <!-- 게시글뷰 -->
        <section id="post">
            <!-- 게시글 왼쪽 -->
            <div id="post-L">
                <div id="postTitle">
                    서울시 종로구 순덕이 출현
                </div>
                <div id="postPicture">
                    <img src="/resources/images/순덕이.png" id="postPic">
                </div>
                <div id="postContent">
                    <div class="paragraph">

                        내용내용내용내용내용내용내용내용내용내용내용내용내내용내용내용내용내용내용내용내용내용내용내용내용내내용내용내용내용내용내용내용내용내용내용내용내용내내용내용내용내용내용내용내용내용내용내용내용내용내
                    </div>
                    <div class="paragraph">

                        내용내용내용내용내용내용내용내용내용내용내용내용내내용내용내용내용내용내용내용내용내용내용내용내용내내용내용내용내용내용내용내용내용내용내용내용내용내내용내용내용내용내용내용내용내용내용내용내용내용내
                    </div>
                    <div class="paragraph">

                        내용내용내용내용내용내용내용내용내용내용내용내용내내용내용내용내용내용내용내용내용내용내용내용내용내내용내용내용내용내용내용내용내용내용내용내용내용내내용내용내용내용내용내용내용내용내용내용내용내용내
                    </div>
                </div>

                <!-- 신고하기 -->
                <div id="report1">
                    <i class="fa-regular fa-flag"></i>
                    <a href="/browse/petitionView/report_popUp" id="reportClick">정책 위반 신고하기</a>
                </div>



                <!-- 패티션 만들기 -->
                <div id="box1">
                    <div>
                        <div class="startCon" id="startCon1">당신만의 청원을 시작할 수 있습니다.</div>
                        <div class="startCon" id="startCon2">이 청원글을 작성한 사람은 행동으로 옮겼습니다. 당신도 함께 동참하지 않겠습니까?</div>
                    </div>
                    <div>
                        <button type="button" id="startBtn"><a href="/writePetition" id="start">청원 시작하기</a></button>
                    </div>
                    
                    
                </div>
                <br>
                <hr>
                
                <br>
                <!-- 업데이트 -->
                <div id="notification">
                    <div id="update">updates</div>
                    <div class="box2" id="box2">
                        <div class="updateCon">40,000명의 지지자</div>
                        <div class="time">1일 전</div>
                    </div>
                    <div class="box3" id="box3">
                        <div class="updateCon">어쩌구 시민과 다른 저쩌구 시민들은 이 청원서를 시작했다. 대충 업데이트 내용</div>
                        <div class="time">2년 전</div>
                    </div>
                </div>


                <br>
                <hr>
                <br>

                <!-- 댓글보기 -->
                <div id="commentBox">
                    <div id="reason">댓글 보기</div>
                    <div id="noti">
                        <!-- 유저아이콘 추가해야 함-->
                        <div id="comUser">유저</div>
                        <div>
                            · <!-- 점 추가 -->
                        </div>
                        <div> 댓글등록 ??시간 전</div>
                    </div>
                    <div id="commentCon">
                        <div>
                            내용내용내용내용내용내용내용내용내용내용내용내용내내용내용내용내용내용내용내용내용
                        </div>
                    </div>    
                    <div id="push">
                        <div>하트</div>
                        <div><a href="#" id="comReport">신고하기</a></div>
                    </div>
                    <!-- 댓글 사이 마다 수평선 추가 -->
                    <!-- <hr> -->
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
                            <!-- span 태그로 숫자 변경되게 해야 함(js)-->
                            43,564명이 서명했습니다.
                        </strong>
                        50000명을 향해!!
                    </div>
                    <progress id="progress" value="35000" min="0" max="50000" ></progress>
                    <div id="row2">
                        다음목표까지 서포터 단
                        <strong>
                            <!-- span 태그로 숫자 변경되게 해야 함(js)-->
                            33
                            명만 더!
                        </strong> 
                    </div>
                    <div id="row3">
                        <div id="row3-1">
                            <!-- 임시이미지 -->
                            <img src="/resources/images/순덕이.png" id="arrow">
                        </div>
                        <div id="row3-2">
                            이 청원은 서명된 청원 중에서 
                            <strong>
                                순위권이 높은 청원이 됩니다!
                            </strong>
                        </div>
                    </div>
                </div>
                <div id="sign_User">
                    <!-- 서명한 유저 이름 & 서명한 시간 실시간업로드 -->
                    <div class="signUserBox">
                        <div class="signImg">
                            <img src="/resources/images/순덕이.png" class="prof">
                        </div>
                        <div class="signNickname">닉네임</div>
                        <div Class="signTime">서명시간</div>
                    </div>
                    <div class="signUserBox">
                        <div class="signImg">
                            <img src="/resources/images/순덕이.png" class="prof">
                        </div>
                        <div class="signNickname">닉네임</div>
                        <div Class="signTime">서명시간</div>
                    </div>

                </div>
                <div id="check">
                    <input type="checkbox" id="agree">
                    <label for="agree">
                        이 청원에 이름과 댓글을 표시합니다.
                    </label>
                </div>
                <div>
                    <button id="signButton" onclick="document.getElementById('progress').value += 1;">좋아요!</button>
                </div>
            </div>
        </section>
        
        
        
        <br><br>
        <hr>
        
        
        <!-- 추천게시글 -->
        <section class="middle">
            <div id="trandPeti">
                Trending petitions
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
                    <img src="/resources/images/순덕이.png" class="picture">
                </div>
            </div>
            <div>
                <button type="button" id="moreView">더보기</button>
            </div>
        </section>
    </main>
    <%-- footer --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <%-- petitionView.js --%>
    <script src="/resources/js/browse/petitionView/details.js"></script>
</body>
</html>