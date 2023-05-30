// SignUp  클릭 시 회원가입 페이지로 이동
const SignUp = document.getElementById("SignUp");

SignUp.addEventListener("click", () => {
    location.href="signUp.jsp"; 
});  



// Forget Password 클릭 시 비밀번호 찾기 페이지로 이동
const searchPw = document.getElementById("searchPw");

searchPw.addEventListener("click", () => {
    location.href="searchPw.jsp"; 
});  



// 로그인 시도
const loginFrm = document.getElementById("loginFrm"); //로그인 폼
const userEmail = document.querySelector("#loginFrm input[name='userEmail']");
const userPw = document.querySelector("#loginFrm input[name='userPw']");

loginFrm.addEventListener("submit", e => {
    if(userEmail.value.trim().length == 0){
        alert("이메일을 입력해주세요.");

        userEmail.value =""; // 잘못 입력된 값(공백) 제거

        userEmail.focus(); // 이메일 input태그에 초점을 맞춤

        e.preventDefault(); // 제출 못하게 하기
        return;
    }

    // 비밀번호가 입력되지 않은 경우
    if(userPw.value.trim().length == 0){
        alert("비밀번호를 입력해주세요.");

        e.preventDefault(); // 제출 못하게 하기
        return;
    }

});