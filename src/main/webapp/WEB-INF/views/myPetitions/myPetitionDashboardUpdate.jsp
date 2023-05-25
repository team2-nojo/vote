<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>업데이트 업로드</title>
    <!-- summernote -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <!-- css -->
    <link rel="stylesheet" href="/resources/css/myPetitions/myPetitionsCommon.css">
    <link rel="stylesheet" href="/resources/css/myPetitions/myPetitionDashboardUpdate.css">
</head>
<body>
    <%-- header --%>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <main>
        <form action="insert/${myPetition.petitionNo}" method="POST" id="dashboardUpdateFrm" enctype="multipart/form-data">
            <div class="content" id="dashboardUpdate">
                <div class="contentbox" id="dashboardUpdateContainer">
                    <div class="dashboard-update-top-frame">
                        <div id="dashboardUpdateTitle">청원 업데이트</div>
                    </div>
                    <div class="dashboard-update-top-frame">
                        <div id="dashboardUpdateSubtitle">${myPetition.petitionTitle}</div>
                    </div>
                    <div>
                        <div class="dashboard-update-text">제목</div>
                        <div>
                            <input type="text" class="dashboard-update-input" name="petitionUpdateTitle">
                        </div>
                    </div>
                    <div>
                        <div class="dashboard-update-text">사진추가</div>
                        <!-- 사진 업로드 전 화면 -->
                        <div id="dashboardUpdateAddImage" class="exist-image">
                            <div id="relativeBox">
                                <img src="/resources/images/common/user.png" id="imageBefore">
                            </div>
                            <div>
                                <input type="file" id="dashboardUpdatefileInput" name="inputImage">
                                <label for="dashboardUpdatefileInput">
                                    <span>이미지 등록</span>
                                </label>
                            </div>
                        </div>
                        <!-- 사진 업로드 후 화면 -->
                        <div id="dashboardUpdateAddImage" class="upload-image hidden">
                            <img src="" id="imagePreview">
                            <span class="delete-image" id="deleteImage">X</span>
                        </div>
                    <div>
                        <div class="dashboard-update-text">업데이트 정보</div>
                        <textarea id="summernote" name="petitionUpdateContent"></textarea>
                    </div>
                    <div>
                        <div class="dashboard-update-text-guide">
                            <%-- <div><strong>업데이트는 24시간에 한 번씩 게시 가능합니다.</strong><br></div> --%>
                            <div>업데이트는 청원 페이지에 나타납니다.</div>
                        </div>
                    </div>
                    <div id="goRight">
                        <!-- 모달창 -->
                        <div id="modal" class="modal-overlay">
                            <div class="modal-window">
                                <div class="modal-title-container">
                                    <div class="modal-title">업데이트 미리보기</div>
                                    <div class="modal-subtitle">지지자에게 메세지가 어떻게 표시되는지 확인하십시오</div>
                                </div>
                                <div class="modal-content-container">
                                    <div class="modal-content-title">제목</div>
                                    <div class="modal-content-title-profile">
                                        <img src="${loginUser.userImage}" id="userProfileMini">
                                        <div>
                                            <strong>${loginUser.userNickname}</strong>
                                            <p>to. 지지자</p>
                                        </div>  
                                    </div>
                                    <div>
                                        <img src="" id="modalImagePreview">
                                        <p></p>
                                    </div>
                                    <div class = "modal-content">
                                        <div id="summernotePreview">내용</div>
                                    </div>
                                </div>    
                                <div class="close-area">
                                    <button type="button" id="modalClose">미리보기 닫기</button>
                                </div>
                            </div>
                        </div>
                        <!-- 모달창 끝 -->
                        <div class="submit-cancel-button-frame">
                            <button id="emailPreview" class="submit-cancel-button preview" type="button">미리보기</button>
                            <button id="updatePetitionPost" class="submit-cancel-button">제출</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </main>
    <%-- footer --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <%-- js --%>
    <script src="/resources/js/myPetitions/myPetitionDashboardUpdate.js"></script>
    <%-- summernote --%>
    <script src="https://kit.fontawesome.com/fa1a384c97.js" crossorigin="anonymous"></script>
</body>
</html>