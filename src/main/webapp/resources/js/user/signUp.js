// 서비스약관 체크하려고 할 때 팝업으로 약관 볼 수 있게 하기
const openPopup = document.getElementById("agree");
const loginMember = document.getElementById("loginMember");
const openWd = window.open("agreeService.html", "서비스_이용약관_동의", "width=500, hight=500px"); 

// 로그인 클릭 시 로그인 화면으로 이동
loginMember.addEventListener("click", () => {

    // 열기 이벤트
    location.href= "login.html";
});  


// 서비스_이용약관_동의 체크박스 클릭 시 새 창으로 이동
openPopup.addEventListener("click", () => {

     // 열기 이벤트
    window.open("agreeService.html", "서비스_이용약관_동의", "width=500, hight=500px");
    
    
});  


// 서비스_이용약관_동의 새창에서 제출되면 체크박스 표시되게(미완성)
// openWd.addEventListener("onveforeunload", ()=>{
    
//     if(openWd.submit){
//         openPopup.checked = true;
//     }else{
//         openPopup.checked = false;
//     }
// });