<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>VOTE 나의청원</title>
        
        <!-- include summernote css/js -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
        
        
        <link rel="stylesheet" href="resources/css/writePetition/writePetition.css">
    </head>
    <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <main>
        <div class="write-petition-container">
            <div class="wp-progress-bar"><div class="wp-progress"></div></div>
            <form action="/writePetition" method="post" enctype="multipart/form-data">
                <!-- page1 -->
                <div id="page1" class="page container border current">
                    <h2>변화를 향한 첫 걸음</h2>
                    <p>청원 범위 선택:</p>
                    <div class="select-container border">
                        <span class="scope-item selected-item" name="scope" value="local">
                            <span class="scope-icon pointer-events-none"><i class="fa-solid fa-house"></i></span>
                            <span class="pointer-events-none">지역</span>
                        </span><span class="scope-item" name="scope" value="national">
                            <span class="scope-icon pointer-events-none"><i class="fa-sharp fa-solid fa-landmark-dome"></i></span>
                            <span class="pointer-events-none">국가</span>
                        </span><span class="scope-item" name="scope" value="global">
                            <span class="scope-icon pointer-events-none"><i class="fa-solid fa-earth-americas"></i></span>
                            <span class="pointer-events-none">세계</span>
                        </span>
                    </div>
                    <div id="page1Tip" class="tip"><span class="scope-icon"><i class="fa-solid fa-arrow-trend-up"></i></span><span>지역 청원은 승리할 확률이 50% 더 높습니다.</span></div>
                </div>
                
                <!-- page2 -->
                <div id="page2" class="page container border">
                    <h2>이 청원에 가장 적합한 주제는 무엇인가요?</h2>
                    <div id="categoryContainer" class="border">
                        <c:forEach items="${defaultCategoryList}" var="defaultCategory">
                            <input type="checkbox" name="categoryItems" class="hidden" id="defaultCategoryItem${defaultCategory.categoryNo}"
                            value="${defaultCategory.categoryNo}">
                            <label class="category-item" for="defaultCategoryItem${defaultCategory.categoryNo}">${defaultCategory.categoryName}</label>
                        </c:forEach>
                        <input type="checkbox" name="directInput" class="hidden" id="directInputCheckbox" value="y">
                        <label for="directInputCheckbox" class="category-item">직접 입력</label>
                    </div>
                    <div id="directInputContainer" class="hidden">
                        <div id="directInputInputContainer">
                            <input type="text" id="categoryInput">
                            <input id="categoryInputBtn" class="my-btn" type="button" value="입력">
                        </div>
                        <div id="directInputItemContainer">
                            <%-- <div class="direct-input-item category-item">
                                <input type="hidden" name="directInputCategory" value="직접 입력한 샘플데이터">
                                직접 입력한 샘플데이터
                                <span>X</span>
                            </div> --%>
                        </div>
                    </div>
                </div>
                
                <!-- page3 -->
                <div id="page3" class="page container border">
                    <h2>청원 제목을 작성하세요.</h2>
                    <p>사람들에게 당신이 바꾸고 싶은 주제에 대해 말해보세요.</p>
                    <div id="titleContainer">
                        <div id="writeTitle">청원 제목</div>
                        <input type="text" name="title" id="inputTitle" onkeydown="return event.key != 'Enter';">
                        <div id="titleCountContainer"><div id="titleCharCount">0</div><div>/90</div></div>
                    </div>
                </div>
                
                <!-- page4 -->
                <div id="page4" class="page container border">
                    <h2>당신의 이야기를 들려주세요.</h2>
                    <!-- 에디터 출력영역 -->
                    <textarea id="summernote" name="editorContent"></textarea>
                </div>
                
                <!-- page5 -->
                <div id="page5" class="page container border">
                    <h2 id="writeImageTitle">이미지를 추가하세요.</h2>
                    <div class="smallText">(선택 사항)</div>
                    <h4>이미지가 있는 청원은 6배 많은 서명을 받습니다.</h4>
                    <div class="input-img-container container border center">
                        <div class="no-img-container center container">
                            <img data-testid="drop-target" width="115" src="resources/images/writePetition/uploadimg.svg">
                            <label for='inputImage' class="input-img-btn my-btn">이미지 등록</label>
                            <input type="file" name="thumbnailImage" id="inputImage" class="hidden" accept="image/*">
                        </div>
                        <div class="img-container hidden">
                            <img id="previewImage" class="preview-image">
                            <span class="delete-image center">X</span>
                        </div>
                    </div>
                    <div class="smallText">이미지 크기는 1200 x 675픽셀에 최적화 되어 있습니다.</div>
                </div>
                
                <!-- page6 -->
                <div id="page6" class="page container border">
                    <h2>당신의 청원이 준비되었습니다.</h2>
                    <h3>다음 진행 사항은 아래와 같습니다.</h3>
                    <ol>
                        <li>아래에서 당신의 청원서를 확인하세요.</li>
                        <li>제출 버튼을 눌러 작성을 완료하세요.</li>
                        <li>청원서는 언제든지 수정할 수 있습니다.</li>
                        <li>아는 사람이나 온라인 커뮤니티에 공유하세요.</li>
                    </ol>
                    <div id="previewContainer" class="border container">
                        <h1 id="previewTitle">제목이 작성되는 곳</h1>
                        <div id="previewImgAndSignContainer">
                            <div class="input-img-container container border center">
                                <div class="no-img-container center container">
                                    <img data-testid="drop-target" width="115" src="resources/images/writePetition/uploadimg.svg">
                                    <label for='inputImage' class="input-img-btn my-btn">이미지 등록</label>
                                </div>
                                <div class="img-container hidden">
                                    <img id="previewImage" class="preview-image">
                                    <span class="delete-image center">X</span>
                                </div>
                            </div>
                            <div id="signContainer">
                                <br><br>
                                <div class="bold">현재 1명이 청원에 서명하였습니다.</div>
                                <div>다음 목표는 5명입니다.</div>
                                <div id="progC"><div id="prog"></div></div>
                                <hr id="progHr" style="width:100%;">
                                <div id="signer">
                                    <c:choose>
                                        <c:when test="${not empty loginUser.userImage}">
                                            <img class="user-image" src="${loginUser.userImage}" />
                                        </c:when>
                                        <c:otherwise>
                                            <i class="fa-sharp fa-solid fa-user header-a"></i>
                                        </c:otherwise>
                                    </c:choose>
                                    <div id="signerName">${loginUser.userNickname}</div>
                                </div>
                            </div>
                        </div>
                        <div id="writer">
                            <c:choose>
                                <c:when test="${not empty loginUser.userImage}">
                                    <img class="user-image" src="${loginUser.userImage}" />
                                </c:when>
                                <c:otherwise>
                                    <i class="fa-sharp fa-solid fa-user header-a"></i>
                                </c:otherwise>
                            </c:choose>
                            ${loginUser.userNickname}님이 이 청원을 시작하였습니다.
                        </div>
                        <div id="previewContentContainer">
                            <div id="previewContent">내용</div>
                        </div>
                    </div>
                </div>
                
            <div id="btnContainer" class="btn-container border">
                <button type="button" id="prevBtn" class="my-btn">이전으로</button>
                <button type="button" id="nextBtn" class="my-btn">다음으로</button>
                <button type="submit" id="submitBtn" class="my-btn">제출</button>
            </div>
            </form>
        </div>
    </main>
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
        <script src="resources/js/writePetition/writePetition.js"></script>
        <script src="https://kit.fontawesome.com/fa1a384c97.js" crossorigin="anonymous"></script>
    </body>
</html>