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

// 검색창에 이전 검색 기록을 남겨놓기

const boardSearch = document.querySelector("#boardSearch");
const searchKey = document.querySelector("#searchKey");
const searchQuery = document.querySelector("#searchQuery");

const options = document.querySelectorAll("#searchKey > option");

(()=>{
    const params = new URL(location.href).searchParams;

    const key = params.get("key"); // t, c, tc, w 중 하나
    const query = params.get("query"); // 검색어

    if(key != null){ // 검색을 했을 때

        searchQuery.value = query; // 검색어를 화면에 출력

        // option태그를 하나씩 순차 접근해서 value가 key랑 같으면
        // selected 속성 추가
        for(let op of options){
            if(op.value == key){
                op.selected = true;
            }
        }
    }

})();

// 검색어 입력 없이 제출된 경우
boardSearch.addEventListener("submit", e => {

    if(searchQuery.value.trim().length == 0){ // 검색어 미입력 시
        e.preventDefault(); // form 기본 이벤트 제거

        location.href = location.pathname; // 해당 게시판 1페이지로 이동

        // location.pathname : 쿼리스트링을 제외한 실제 주소
    }

});
