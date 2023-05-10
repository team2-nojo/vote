<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>청원하기</title>
        
        <!-- include summernote css/js -->
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
        
        <link rel="stylesheet" href="resources/css/writePetition/writePetition.css">
    </head>
    <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <main>
        <div class="write-petition-container">
            <div class="wp-progress-bar"><div class="wp-progress"></div></div>
            <form action="">
                <!-- page1 -->
                <div id="page1" class="page container border current">
                    <h1>변화를 향한 첫 걸음</h1>
                    <p>청원 범위 선택:</p>
                    <div class="selectContainer border">
                        <span class="item selectedItem" name="scope" value="local">
                            <span class="scope-icon pointer-events-none">icon</span>
                            <span class="pointer-events-none">지역</span>
                        </span><span class="item" name="scope" value="national">
                            <span class="scope-icon pointer-events-none">icon</span>
                            <span class="pointer-events-none">국가</span>
                        </span><span class="item" name="scope" value="global">
                            <span class="scope-icon pointer-events-none">icon</span>
                            <span class="pointer-events-none">세계</span>
                        </span>
                    </div>
                    <div id="page1Tip" class="tip"><span class="scope-icon">icon</span><span> 지역 청원은 승리할 확률이 50% 더 높습니다.</span></div>
                </div>
                
                <!-- page2 -->
                <div id="page2" class="page container border">
                    <h1>이 청원에 가장 적합한 주제는 무엇인가요?</h1>
                    <div id="categoryContainer" class="border">
                        <input type="checkbox" name="asdf" id="a" style="display:none;">
                        <label for="a" class="categoryItem">임시데이터1</label>
                        <span class="categoryItem">직접 입력</span>
                    </div>
                </div>
                
                <!-- page3 -->
                <div id="page3" class="page container border">
                    <h1>청원 제목을 작성하세요.</h1>
                    <p>사람들에게 당신이 바꾸고 싶은 것을 말하세요.</p>
                    <div id="titleContainer">
                        <div>청원 제목</div>
                        <input type="text" name="title" id="inputTitle">
                        <div id="titleCountContainer"><div id="titleCharCount">0</div><div>/90</div></div>
                    </div>
                </div>
                
                <!-- page4 -->
                <div id="page4" class="page container border">
                    <h1>당신의 이야기를 들려주세요.</h1>
                    <div id="summernote"></div>
                </div>
                
                <!-- page5 -->
                <div id="page5" class="page container border">
                    <h1>이미지를 추가하세요.</h1>
                    <p>(선택 사항)</p>
                    <p>이미지가 있는 청원은 6배 많은 서명을 받습니다.</p>
                    <div id="inputImgContainer" class="inputImgContainer container border center">
                        <img data-testid="drop-target" width="115" alt="Target for dropping an image to upload." src="resources/images/writePetition/uploadimg.svg" class="">
                        <button type="button" id="inputImgBtn" class="inputImgBtn myBtn nextBtn">이미지 등록</button>
                    </div>
                    <p>이미지 크기는 1200 x 675픽셀에 최적화 되어 있습니다.</p>
                </div>
                
                <!-- page6 -->
                <div id="page6" class="page container border">
                    <h1>당신의 청원이 준비되었습니다.</h1>
                    <h3>다음은 다음과 같습니다.</h3>
                    <ol>
                        <li>아래에서 당신의 청원서를 확인하세요.</li>
                        <li>청원서 최종 제출 버튼을 눌러 작성을 완료하세요.</li>
                        <li>청원서는 언제든지 수정할 수 있습니다.</li>
                        <li>아는 사람이나 온라인 커뮤니티에 공유하세요.</li>
                        <li>당신의 청원은 5개의 서명에 도달한 후 본 사이트에서 볼 수 있습니다.</li>
                    </ol>
                    <div id="previewContainer" class="border container">
                        <h1 id="previewTitle">제목이 작성되는 곳</h1>
                        <div id="previewImgAndSignContainer">
                            <div class="inputImgContainer container border center">
                                <img data-testid="drop-target" width="115" alt="Target for dropping an image to upload."
                                    src="resources/images/writePetition/uploadimg.svg" class="">
                                <button type="button" class="inputImgBtn myBtn nextBtn">이미지 등록</button>
                            </div>
                            <div id="signContainer">
                                <br><br>
                                <div class="bold">현재 1명이 청원에 서명하였습니다.</div>
                                <div>다음 목표는 5명입니다.</div>
                                <div id="progC"><div id="prog"></div></div>
                                <hr style="width:100%;">
                                <div class="signer"><img class="profileImg" src="resources/images/writePetition/dog1.jpg"><span> firstname lastname</span></div>
                            </div>
                        </div>
                        <p class="startPetition" ><img class="profileImg" src="resources/images/writePetition/dog1.jpg"> firstname lastname님이 이 청원을 시작하였습니다.</p>
                        <div id="previewContents">
                            <p>가나다라</p>
                            <p>가나다라</p>
                            <p>가나다라</p>
                            <p>가나다라</p>
                            <p>가나다라</p>
                            <p>가나다라</p>
                            <p>가나다라</p>
                            <p>가나다라</p>
                        </div>
                    </div>
                </div>
                
            <div id="btnContainer" class="btnContainer border">
                <button type="button" id="prevBtn" class="myBtn">이전으로</button>
                <button type="button" id="nextBtn" class="myBtn">다음으로</button>
                <button type="submit" id="submitBtn" class="myBtn">청원서 최종 제출</button>
            </div>
            </form>
        </div>
    </main>
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
        <script src="resources/js/writePetition/writePetition.js"></script>
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