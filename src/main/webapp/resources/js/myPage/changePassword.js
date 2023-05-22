const currentPassword = document.getElementById('currentPassword');
const newPassword = document.getElementById('newPassword');
const confirmPassword = document.getElementById('confirmPassword');
const message = document.getElementById('message');
const changePasswordForm = document.getElementById('changePasswordForm');
const inputPassword = document.querySelectorAll('.input-password');
changePasswordForm.addEventListener('submit', e =>{
    const regEx = /^[a-zA-Z0-9!@#\-_]{8,20}$/;
    if(currentPassword.value.trim()==''){
        e.preventDefault();
        message.innerText = "비밀번호가 입력되지 않았습니다."
        currentPassword.focus();
        return;
    }
    if(!regEx.test(newPassword.value)){
        e.preventDefault();
        message.innerText = "비밀번호가 유효하지 않습니다.";
        newPassword.focus();
        return;
    }
    if(newPassword.value != confirmPassword.value){
        e.preventDefault();
        message.innerText='비밀번호가 일치하지 않습니다.';
        confirmPassword.focus();
        return;
    }
    if(!confirm("정말 비밀번호를 변경하시겠습니까?")){
        e.preventDefault();
        message.innerText='비밀번호 변경을 취소하셨습니다.';
        return;
    }
})

inputPassword.forEach(input =>{
    input.addEventListener('input',()=>{
        message.innerText='';
    })
})