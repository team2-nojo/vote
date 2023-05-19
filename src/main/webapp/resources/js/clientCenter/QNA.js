const boardUpdateFrm = document.querySelector("#boardUpdateFrm");
const qnaTitle = document.querySelector("[name='qnaTitle']");
const qnaCont = document.querySelector("[name='qnaCont']");
const muni = document.getElementById("select2");

muni.addEventListener("click", () => {
    window.open("/clientCenter/popup", "_blank", "width=580, height=225");
    /* document.location.href='/clientCenter/FAQ'; */
});

boardUpdateFrm.addEventListener('submit', e => {

    if(qnaTitle.value.trim().length == 0){
        alert("제목을 입력해주세요")
        qnaTitle.value = "";
        qnaTitle.focus();
        e.preventDefault(); // form 기본 이벤트 제거
        return;
    }

    if(qnaCont.value.trim().length == 0){
        alert("내용을 입력해주세요")
        qnaCont.value = "";
        qnaCont.focus();
        e.preventDefault(); // form 기본 이벤트 제거
        return;
    }
});



// 로고 클릭시 메인페이지
document.getElementById("logoimg").addEventListener("click", () => {
window.location.href = '/vote/mainFrame.html';
});


// 프레임 불러오기
document.getElementById("startPetitions").addEventListener("click",function () {
document.getElementById("mf").innerHTML = '<iframe id="iframe" onload="iframeLoaded()" frameborder = "0" src="startPetitions/start_a_petition.html"></iframe>';
});

document.getElementById("myPetitions").addEventListener("click",function () {
document.getElementById("mf").innerHTML = '<iframe id="iframe" onload="iframeLoaded()" frameborder = "0" src="/vote/myPetitions/myPetitions/login_mypettitions.html"></iframe>';
});

document.getElementById("browse").addEventListener("click",function () {
document.getElementById("mf").innerHTML = '<iframe id="iframe" onload="iframeLoaded()" frameborder = "0" src="browse/browser.html"></iframe>';
});

// 프레임 크기 변동
function iframeLoaded() {
let frame = document.getElementById('iframe');
let mheight = document.getElementById('mf');
let height = frame.contentWindow.document.body.scrollHeight;
let width = frame.contentWindow.document.body.scrollWidth;

mheight.height = height + "px";
mheight.width = width + "px";

frame.height = height + 100 + "px";
frame.width = width + 100 + "px"
}

