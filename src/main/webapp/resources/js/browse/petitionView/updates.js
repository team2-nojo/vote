
let index = 0; // 인덱스 값
let position = 0; // translateX값 위치

const go = 500; // 한 번에 움직이는 너비

let frame = document.getElementById("frame"); // 전체 슬라이드 프레임
let slideContents = document.querySelectorAll(".updatesFrame"); // 모든 update 컨텐츠들
let slideCount = slideContents.length // 모든 update 컨텐츠 개수


const leftBtn = document.getElementById("leftBtn");
const rightBtn = document.getElementById("rightBtn");

// 전체 슬라이드 프레임 넓이 설정
frame.style.width = 500* (slideCount) + 'px';


// 왼쪽 버튼
function left(){
    if(index > 0){
        rightBtn.removeAttribute("disabled") /* disabled 속성 제거*/
        position += go /* position 값 증가 */
        frame.style.transform = `translateX(${position}px)` /* frame transform, x축 변경*/
        index -= 1; /* index 값 감소*/
    }
    if(index == 0){ /* 이미지 index값 0 되면 prev 못하게 */
        leftBtn.setAttribute("disabled", 'true')
    }
}

 // 오른쪽 버튼
function right(){
    
    if(index < slideCount){
        leftBtn.removeAttribute("disabled")
        position -= go
        frame.style.transform = `translateX(${position}px)`
        index += 1;  
    }

    if(index == slideCount-1){
        // 뒤로 못 가게 하기
        rightBtn.setAttribute("disabled", 'true') // 못 누르는 버튼이 됨
}
}

// 초기 설정
function init(){
    // 왼쪽 버튼은 처음부터 못누르게
    prevBtn.setAttribute("disabled", 'true')
    prevBtn.addEventListener("click", prev)
    nextBtn.addEventListener("click", next)
}

leftBtn.addEventListener('click', () => {
    left(); 
});

rightBtn.addEventListener('click', () => {
    right(); 
});