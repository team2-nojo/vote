let allAgree = document.getElementById('allAgree'); // 모두 동의 체크박스
let check1 = document.getElementById('privacyPolicy');
let check2 = document.getElementById('serviceUse');
let check3 = document.getElementById('MarketingInfo');
let check4 = document.getElementById('emailInfo');

window.onload = function(){} // 이거로 감싸면 에러는 사라지나 실행이 안됨...

document.addEventListener('DOMContentLoaded', function () {
    allAgree.addEventListener('change', () => {
        check1.checked = allAgree.checked;
        check2.checked = allAgree.checked;
        check3.checked = allAgree.checked;
        check4.checked = allAgree.checked;
        
        if(allAgree.checked){
            next.disabled = false;
            next.style.backgroundColor ="#2DB400";
            next.style.border="2px solid #2DB400";
            next.style.color ="white";
            
        }else{
            next.disabled = true;
            next.style.backgroundColor ="white";
            next.style.border="2px solid #ccc";
            next.style.color ="#ccc";
        }
    });
    
    let checkList = document.querySelectorAll('.check');
    checkList.forEach(function (e) {
        e.addEventListener('change', () => {
            if (check1.checked && check2.checked && check3.checked && check4.checked) {
                allAgree.checked = true;
                next.disabled = false;
                next.style.backgroundColor ="#2DB400";
                next.style.border="2px solid #2DB400";
                next.style.color ="white";
            }else {
                allAgree.checked = false;
                next.disabled = true;
                next.style.backgroundColor ="white";
                next.style.border="2px solid #ccc";
                next.style.color ="#ccc";
            }
            if (check1.checked && check2.checked) {
                next.disabled = false;
                next.style.backgroundColor ="#2DB400";
                next.style.border="2px solid #2DB400";
                next.style.color ="white";
            }else {
                next.disabled = true;
                next.style.backgroundColor ="white";
                next.style.border="2px solid #ccc";
                next.style.color ="#ccc";
            }
        });
    });
});


// 서비스_이용약관_동의 제출되면 체크박스 표시
const nextBtn = document.getElementById("next"); // 다음 버튼
nextBtn.addEventListener("click", ()=>{
    window.close("서비스_이용약관_동의.html");
    window.opener.document.getElementById("agree").checked = true;
    window.opener.document.querySelector('[name=agreeEmail]').value='y';
});



// 취소버튼 클릭하면 그냥 닫힘
const cancel = document.getElementById("cancel"); // 취소 버튼
cancel.addEventListener("click", () => {
    window.close("서비스_이용약관_동의.html");
    window.opener.document.getElementById("agree").checked = false;
    window.opener.document.querySelector('[name=agreeEmail]').value='n';
});






