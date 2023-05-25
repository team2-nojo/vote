<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VOTE 프로필 편집</title>
    <link rel="stylesheet" href="/resources/css/myPage/editProfile.css">
</head>
<body>
    <main>
        <jsp:include page="/WEB-INF/views/common/header.jsp"/>
        <form action="editProfile" method="POST" name="editProfileFrm" id="profileFrm"  enctype="multipart/form-data">
            <div class="content" id="editProfile">
                <div class="contentbox" id="editProfileContainer">
                    <div class="edeit-profile-top-frame">
                        <div class="row">
                            <div id="editProfileTitle">프로필 편집</div>
                        </div>
                    </div>
                    <div class="x-parent">
                        <div id="imageContainer">
                            <%-- 프로필 이미지가 없으면 기본 이미지 --%>
                            <span id="deleteImage">x</span> 
                            <c:if test="${empty loginUser.userImage}" >
                                <img src="/resources/images/common/user.png" id="profileUserImage">
                            </c:if>
                            <%-- 프로필 이미지가 있으면 있는 이미지 --%>
                            <c:if test="${not empty loginUser.userImage}">
                                <img src="${loginUser.userImage}" id="profileUserImage">
                            </c:if>
                        </div>
                    </div>
                    <div class="userProfileID">${loginUser.userNickname}</div>
                    <div class="userProfileLocation">${loginUser.userAddress.split(" ")[0]}</div>
                    <div>
                        <label class="upload-photo" for="inputUserImage">사진 업로드</label>
                        <input type="file" name="profileImage" id="inputUserImage" accept="image/*">
                    </div>
                    <div id="editPrifileNameFrame">
                        <label class="edit-profile-text">닉네임</label>
                        <div id="editProfileInputName">
                            <input type="text" class="edit-profile-input" id="userNickname" name="userNickname" value="${loginUser.userNickname}">
                            <button class="edit-profile-btn" type="button" id="nicknameDupCheck">중복확인</button>
                        </div>
                            <div id="nickMessage">한국어, 영어, 숫자(특수문자 제외) 2~10자</div>
                    </div>
                    <div>
                        <label class="edit-profile-text">자기소개</label>
                        <textarea id="editProfileDescription" name="userAboutMe" row="6" maxlength="255">${loginUser.userAboutMe}</textarea>
                    </div>


                    <c:set var="addr" value="${fn:split(loginUser.userAddress, '^^^')}"/>
                    
                    
                    <div>
                        <label class="edit-profile-text">지역</label>
                        <div id="editProfileInputName">
                            <input type="text" id="sample6_address" class="edit-profile-input" name="userAddress" value="${addr[0]}">
                            <button class="edit-profile-btn" type="button" onclick="sample6_execDaumPostcode()">주소찾기</button>
                        </div>
                    </div>
                    <div>
                        <label class="edit-profile-text">상세주소</label>
                        <div id="editProfileInputName">
                            <input type="text" class="edit-profile-input-long" id="sample6_detailAddress" name="userAddress" value="${addr[1]}">
                        </div>
                    </div>
                    <div id="goRight">
                        <div class="submit-cancel-button-frame">
                            <button id="cancel" class="submit-cancel-button">취소</button>
                            <button id="submit" class="submit-cancel-button">저장</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    </main>    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
    
                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
    
                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }
                    // 주소 정보를 해당 필드에 넣는다.
                    document.getElementById("sample6_address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("sample6_detailAddress").removeAttribute('placeholder');
                    document.getElementById("sample6_detailAddress").focus();

                }
            }).open();
        }
    </script>
    <%-- editProfile.js --%>
    <script src="/resources/js/myPage/editProfile.js"></script>
</body>
</html>