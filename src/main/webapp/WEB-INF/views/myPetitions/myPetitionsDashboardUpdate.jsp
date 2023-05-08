<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit profile</title>
    <!-- summernote -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <!-- css -->
    <link rel="stylesheet" href="/resources/css/myPetitions/myPetitions.css">
    <link rel="stylesheet" href="/resources/css/myPetitions/petitionsDashboardUpdate.css">
</head>
<body>
    <%-- header --%>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <main>
        <form action="#" method="get">
            <div class="content" id="dashboardUpdate">
                <div class="contentbox" id="dashboardUpdateContainer">
                    <div class="dashboard-update-top-frame">
                        <div id="dashboardUpdateTitle">청원 지지자 업데이트</div>
                    </div>
                    <div class="dashboard-update-top-frame">
                        <div id="dashboardUpdateSubtitle">청원글 본문</div>
                    </div>
                    <div>
                        <div class="dashboard-update-text">표제</div>
                        <div>
                            <input type="text" class="dashboard-update-input" placeholder="서포터 1만명 달성">
                        </div>
                    </div>
                    <div>
                        <div class="dashboard-update-text">사진추가</div>
                        <div id="dashboardUpdateAddImage">
                            <div>
                                <img src="/resources/images/user.png" alt="">
                            </div>
                            <div>
                                <input type="file" id="DashboardUpdatefileInput">
                                <label aria-controls="DashboardUpdatefileInput" for="DashboardUpdatefileInput">
                                    <span>Upload an image</span>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="dashboard-update-text">업데이트 정보</div>
                        <div id="summernote"></div>
                    </div>
                    <div>
                        <div class="dashboard-update-text-guide">
                            <div><strong>업데이트는 24시간에 한 번씩 게시 가능합니다.</strong><br></div>
                            <div>업데이트는 청원 페이지에 나타나며, 모든 지원자에게 이메일로 전송됩니다.</div>
                            
                        </div>
                    </div>
                    <div id="goRight">
                        <!-- 모달창 -->
                        <div id="modal" class="modal-overlay">
                            <div class="modal-window">
                                <div class="modal-title-container">
                                    <div class="modal-title">업데이트 이메일 미리보기</div>
                                    <div class="modal-subtitle">지원자의 받은 편지함에 메세지가 어떻게 표시되는지 확인하십시오</div>
                                </div>
                                <div class="modal-content-container">
                                    <div class="modal-content-title">업데이트한당</div>
                                    <div class="modal-content-title-profile">
                                        <img src="" alt="user">
                                        <div>
                                            <p>사용자이름</p>
                                            <p>to 나에게</p>
                                        </div>  
                                    </div>
                                    <div>
                                        <img src="" alt="">
                                        <p></p>
                                    </div>
                                    <div class = modal-content>
                                        <p>가나다라마바사 아자차카타파하</p>
                                        <p>가나다라마바사 아자차카타파하</p>
                                        <p>가나다라마바사 아자차카타파하</p>
                                        <p>가나다라마바사 아자차카타파하</p>
                                    </div>
                                </div>    
                                <div class="close-area">
                                    <button>미리보기 닫기</button>
                                </div>
                            </div>
                        </div>
                        <!-- 모달창 끝 -->
                        <div class="submit-cancel-button-frame">
                            <button id="submit" class="submit-cancel-button preview" type="button">이메일 미리보기</button>
                            <button id="cancel" class="submit-cancel-button">포스트</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </main>
    <%-- footer --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <%-- js --%>
    <script src="/resources/js/myPetitions/petitionsDashboardUpdate.js"></script>
    <%-- summernote --%>
    <script src="https://kit.fontawesome.com/fa1a384c97.js" crossorigin="anonymous"></script>
    <script>
        $('#summernote').summernote({
            placeholder: 'Hello stand alone ui',
            tabsize: 2,
            height: 400,
            toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'underline', 'clear']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['table', ['table']],
            ['insert', ['link', 'picture', 'video']],
            ['view', ['fullscreen', 'codeview', 'help']]
            ]
        });
    </script>
</body>
</html>