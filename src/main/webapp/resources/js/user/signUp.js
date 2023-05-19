
const openPopup = document.getElementById("agreeServiceGo");
const loginMember = document.getElementById("loginMember");

// 로그인 클릭 시 로그인 화면으로 이동
loginMember.addEventListener("click", () => {
    
    // 열기 이벤트
    location.href= "login.jsp";
});  


const checkObj = {
    "userEmail" : false, 
    "userPw" : false,
    "userPwConfirm" : false,
    "userNickname" : false

};


const doubleCheck = document.getElementById("doubleCheck");
const userEmail = document.getElementById("email");
const emailMessage = document.getElementById("emailMessage");

// 이메일 포커스
userEmail.addEventListener("focus", () => {

    emailMessage.style.display= "block";
    nameMessage.style.display= "none";
    pwCfMessage.style.display = "none";
    pwMessage.style.display = "none";

    userEmail.addEventListener("input", () => {
        // 입력이 되지 않은 경우(공란일 때)
        if(userEmail.value.trim().length == 0) {
            emailMessage.innerText = "메일을 받을 수 있는 이메일을 입력해주세요.";
            emailMessage.classList.remove("confirm", "error")
            userEmail.value=""; // 띄어쓰기 못 넣게 하기
            checkObj.userEmail = false; // 유효 X
            userEmail.focus(); // 이메일 input태그에 초점을 맞춤
            return;
        }
        
        
        // 정규식 객체 생성
        const regEx = /^[A-Za-z\d\-\_]{4,}@[가-힣\w\-\_]+(\.\w+){1,3}$/;
        
        // 입력받은 이메일과 정규식 일치 여부 판별
        if( regEx.test(userEmail.value) ){ // 유효한 경우
            

            /**/
            // GET방식 ajax요청(파라미터는 쿼리스트링)
            fetch('/dupCheck/email?email=' + userEmail.value)
            .then(resp => resp.text()) // 응답객체 -> 파싱(parsing, 데이터 형태 변환)
            .then(count => {
                // count : 중복되면 1, 중복 아니면 0

                
                
                if(count == 0){ // 중복이 아니면
                    emailMessage.innerText = "사용 가능한 이메일 입니다.";
                    emailMessage.classList.add("confirm");
                    emailMessage.classList.remove("error");
                    checkObj.userEmail = true; // 유효 O
                }else{ // 중복일 때
                    emailMessage.innerText = "이미 사용중인 이메일 입니다.";
                    emailMessage.classList.add("error");
                    emailMessage.classList.remove("confirm");
                    checkObj.userEmail = false; // 유효 X
                    userEmail.focus(); // 이메일 input태그에 초점을 맞춤
                }
                

            }) //파싱한 데이터를 이용해서 수행할 코드 작성
            .catch(err => console.log(err)); // 예외처리
            
        }else{ // 유효하지 않은 경우(무효인 경우)
            emailMessage.innerText = "이메일 형식이 유효하지 않습니다.";
            emailMessage.classList.add("error");
            emailMessage.classList.remove("confirm");
            checkObj.userEmail = false; // 유효 X
            userEmail.focus(); // 이메일 input태그에 초점을 맞춤
        }
    });
    
    
});




// 닉네임 유효성 검사

const NicknameCheck = document.getElementById("NicknameCheck");
const userNickname = document.getElementById("name");
const nameMessage = document.getElementById("nameMessage");

userNickname.addEventListener("focus", () => {

    nameMessage.style.display= "block";
    emailMessage.style.display= "none";
    pwCfMessage.style.display = "none";
    pwMessage.style.display = "none";

    
    // 닉네임이 입력이 되었을 때
    userNickname.addEventListener("input", () => {
        // 닉네임에 입력이 되지 않은 경우
        if(userNickname.value.trim().length == "") {
            nameMessage.innerTitle ="한글,영어,숫자로만 2~10글자 입력해주세요.";
            nameMessage.classList.remove("confirm", "errror")
            checkObj.userNickname = false;
            userNickname.value=""; 
            return;
        }

        // 정규 표현식으로 유효성 검사
        const regEx = /^[가-힣\w\d]{2,10}$/;
        
        if(regEx.test(userNickname.value)){ //유효할 때
            
            fetch("/nickname?nickname=" + userNickname.value)
            .then(resp => resp.text()) // 응답 객체를 text로 파싱(변환)
            .then(count => {
                if(count == 0){ //중복이 아닌 경우
                    nameMessage.innerTitle ="사용가능한 닉네임 입니다.";
                    nameMessage.classList.add("confirm")
                    nameMessage.classList.remove("error")
                    checkObj.userNickname = true;
                }else{ // 중복인 경우
                    nameMessage.innerTitle ="이미 사용중인 닉네임 입니다.";
                    nameMessage.classList.add("error")
                    nameMessage.classList.remove("confirm")
                    checkObj.userNickname = false;
                    userNickname.value="";
                    userNickname.focus();
                }
            })
            .catch(err => console.error(err));
            
            
        }else{ //무효
        }
        
    });
});






// 비밀번호/비밀번호 확인 유효성 검사
const userPw = document.getElementById("password1");
const userPwConfirm = document.getElementById("password2");
const pwMessage = document.getElementById("pwMessage");
const pwCfMessage = document.getElementById("pwCfMessage");


userPw.addEventListener("focus", ()=>{
    
    pwMessage.style.display = "block";
    nameMessage.style.display= "none";
    pwCfMessage.style.display = "none";
    emailMessage.style.display= "none";
    
    userPw.addEventListener("input", () => {
        
        // 비밀번호가 입력되지 않은 경우
        if(userPw.value.trim().length == 0){
            pwMessage.innerText = "영어,숫자,특수문자(!,@,#,-,_) 6~20글자 사이로 입력해주세요.";
            emailMessage.classList.remove("confirm", "error")
            userPw.value = ""; // 띄어쓰기 못 넣게 하기
            checkObj.userPw = false; //빈칸 == 유효 X
            return;
        }
        
        
        
        // 정규표현식을 이용한 비밀번호 유효성 검사
        // 영어,숫자,특수문자(!,@,#,-,_) 6~20글자 사이
        const regEx = /^[a-zA-Z0-9\!\@\#\-\_]{6,8}$/;
        
        
        // 입력한 비밀번호가 유효한 경우
        if(regEx.test(userPw.value)){
            checkObj.userPw = true;
            
            if(userPwConfirm.value.trim().length == 0){ // 비밀번호가 유효하게 작성된 상태에서 비밀번호 확인이 입력되지 않았을 때
                pwMessage.innerText = "유효한 비밀번호 형식입니다.";
                pwMessage.classList.add("confirm"); // .confirm 스타일 적용
                pwMessage.classList.remove("error"); // .error 스타일 제거
            }else{
                if(userPw.value == userPwConfirm.value){ // 비밀번호가 유효하게 작성된 상태에서 비밀번호 확인이 입력되어 있을 때
                    pwMessage.innerText = "비밀번호가 일치합니다.";
                    pwMessage.classList.add("confirm"); // .confirm 스타일 적용
                    pwMessage.classList.remove("error"); // .error 스타일 제거
                    // 비밀번호 == 비밀번호 확인 (같을 겅우)
                    checkObj.userPwConfirm=true;
                }else{ // 다를 경우
                    pwMessage.innerText = "비밀번호가 일치하지 않습니다.";
                    pwMessage.classList.add("error"); // .error 스타일 적용
                    pwMessage.classList.remove("confirm"); // .confirm 스타일 제거
                    checkObj.userPwConfirm=false;
                }
            }
        }else{ // 유효하지 않은 경우
            pwMessage.innerText = "비밀번호 형식이 유효하지 않습니다.";
            pwMessage.classList.add("error"); // .error 스타일 적용
            pwMessage.classList.remove("confirm"); // .confirm 스타일 제거
            checkObj.userPw = false;
        }
        
    });
    return
});

userPwConfirm.addEventListener("focus", ()=>{
    pwCfMessage.style.display = "block";
    pwMessage.style.display = "none";
    emailMessage.style.display= "none";
    nameMessage.style.display= "none";
    
    userPwConfirm.addEventListener('input', ()=>{
        
        if(checkObj.userPw){ // 비밀번호가 유효하게 작성된 경우에
            
            // 비밀번호 == 비밀번호 확인 (같을 겅우)
            if(userPw.value == userPwConfirm.value){
                pwCfMessage.innerText = "비밀번호가 일치합니다.";
                pwCfMessage.classList.add("confirm"); // .confirm 스타일 적용
                pwCfMessage.classList.remove("error"); // .error 스타일 제거
                checkObj.userPwConfirm=true;
            }else{ // 다를 경우
                pwCfMessage.innerText = "비밀번호가 일치하지 않습니다.";
                pwCfMessage.classList.add("error"); // .error 스타일 적용
                pwCfMessage.classList.remove("confirm"); // .confirm 스타일 제거
                checkObj.userPwConfirm=false;
            }
            
        }else{ // 비밀번호가 유효하지 않은 경우
            pwCfMessage.classList.add("error"); // .error 스타일 적용
            pwCfMessage.classList.remove("confirm"); // .confirm 스타일 제거
            checkObj.userPwConfirm = false;
        }
        
    });

    
    
});



const SignUpBtn = document.getElementById("SignUpSubmit");










// 회원가입 폼 제출 시
document.getElementById("signUpFrm").addEventListener("submit", () => {
    for(let key in checkObj){
        if(!checkObj[key]){ // 각 key에 대한 value(true/false)를 얻어와 false인 경우 == 유효하지 않다!
            switch(key){
            case "userEmail": alert("이메일이 유효하지 않습니다."); break;
            case "userPw": alert("비밀번호가 유효하지 않습니다."); break;
            case "userPwConfirm": alert("비밀번호가 확인되지 않았습니다."); break;
            case "userNickname": alert("닉네임이 유효하지 않습니다."); break;
            }
            // 유효하지 않은 input태그로 focus이동
            // - key를 input의 id와 똑같이 설정했음!
            document.getElementById(key).focus();
            e.preventDefault(); // from태그 기본 이벤트 제거
            return; // 함수 종료

        }
    }
});






const agreeServiceFrm = document.getElementById("agreeService"); // 제출 



// 서비스_이용약관_동의 체크박스 클릭 시 새 창으로 이동
openPopup.addEventListener("click", () => {
    
    // 열기 이벤트
    window.open("/user/agreeService", "서비스_이용약관_동의", "width=500, hight=500px");

});  




