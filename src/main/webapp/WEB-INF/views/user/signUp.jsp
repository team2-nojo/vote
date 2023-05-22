<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>signUp</title>

    <%-- signUp.css --%>
    <link rel="stylesheet" href="/resources/css/user/signUp.css">
</head>
<body>
    
    <%-- header --%>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <main>

        <section>
            <form action="/user/signUp" method="post" name="signUpFrm" id="signUpFrm">
                <div id="signUp">Sign up</div>
                <br>
                
                <div id="haveAccount">Already have an account? <a href="/user/login" id="loginMember">Login</a></div>
                <br>
                
                <button type="button" id="kakao" onclick="kakaoLogin();"><img src="/resources/images/user/kakaoLogin.png"></button>

                
                <br>

                
                
                <div class="or"> OR </div>
                <br>

                <div>
                    <input type="text" name="userEmail" id="email" placeholder=" Email">
                    <input type="checkbox" class= "check1" id="emailCheck">
                    <button type="button" class="ChkBtn" id="doubleCheck">중복확인</button> 
                </div>
                <div id="emailMessage">
                    메일을 받을 수 있는 이메일을 입력해주세요.
                </div>
                <div>
                    <input type="text" name="userNickname" id="name" placeholder=" Nickname" maxlength='10'>
                    <input type="checkbox" class= "check1" id="nameCheck">
                    <button type="button" class="ChkBtn" id="NicknameCheck">중복확인</button> 
                </div>
                <div id="nameMessage">
                    한글,영어,숫자로만 2~10글자 입력해주세요.
                </div>
                <div>
                    <input type="password" name="userPw" id="password1" placeholder=" Password" maxlength='8'>
                    <input type="password" name="userPwConfirm" id="password2" placeholder=" Password" maxlength='8'>
                </div>
                <div id="pwMessage">
                    영어,숫자,특수문자(!,@,#,-,_) 8~20글자 사이로 입력해주세요.
                </div>
                <div id="pwCfMessage">
                    영어,숫자,특수문자(!,@,#,-,_) 8~20글자 사이로 입력해주세요.
                </div>
                <div>
                    <input type="text" name="userAddress" id="sample6_address" placeholder=" Address">
                    <button type="button" id="addressSearch" onclick="sample6_execDaumPostcode()">주소찾기</button> <br>
                    <input type="text" name="userAddress" id="sample6_detailAddress" placeholder=" Address">
                </div>

                <div>
                    <a href="/user/agreeService" id="agreeServiceGo">
                        <input type="checkbox" class= "check1" id="agree"><label for="agree"> vote 서비스약관에 동의합니다.</label> 
                    </a>
                </div>

                <div>
                    <button id="SignUpSubmit" disabled>Sign up</button>
                </div>
            </form>
        </section>

    </main>
    <%-- footer --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <%-- signUp.js --%>
    <script src="/resources/js/user/signUp.js"></script>
    <%-- agreeService.js --%>
    <script src="/resources/js/user/agreeService.js"></script>





    <!-- 
    다음 주소 api 추가
    https://postcode.map.daum.net/guide#sample 
    -->
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

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    // document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
        }
    </script>

    <%-- 카카오로 시작하기 --%>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    
    <script>
        Kakao.init('e81fb67f5d47af8f812ad1cadbce19e2'); //발급받은 키 중 javascript키를 사용해준다.
        console.log(Kakao.isInitialized()); // sdk초기화여부판단
        //카카오로그인
        function kakaoLogin() {
            Kakao.Auth.login({
            success: function (response) {
                Kakao.API.request({
                url: '/v2/user/me',
                success: function (response) {
                    console.log(response)
                },
                fail: function (error) {
                    console.log(error)
                },
                })
            },
            fail: function (error) {
                console.log(error)
            },
            })
        }
    </script>
</body>
</html>