const muni = document.getElementById("select2");
muni.addEventListener("click", () => {
    window.open("popup.html", "_blank", "popup", "width=580, height=225, top=500, left=800");
    document.location.href='FAQ.html';
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

const boardUpdateFrm = document.querySelector("#boardUpdateFrm");
const boardTitle = document.querySelector("[name='boardTitle']");
const boardContent = document.querySelector("[name='boardContent']");

boardUpdateFrm.addEventListener('submit', e => {

    if(boardTitle.value.trim().length == 0){
        alert("제목을 입력해주세요")
        boardTitle.value = "";
        boardTitle.focus();
        e.preventDefault(); // form 기본 이벤트 제거
        return;
    }

    if(boardContent.value.trim().length == 0){
        alert("내용을 입력해주세요")
        boardContent.value = "";
        boardContent.focus();
        e.preventDefault(); // form 기본 이벤트 제거
        return;
    }

document.querySelector("[name='deleteList']").value 
=  Array.from(deleteSet);

//e.preventDefault(); // 확인만하고 지울 예정
});
