

// tab의 요소(start/signed)를 누르면 해당 건들이 나오는 코드
const start = document.getElementById("start");
const signed = document.getElementById("signed");
const myStartPetitions = document.getElementById("myStartPetitions");
const mySignedPetitions = document.getElementById("mySignedPetitions");


// start, signed 버튼을 마우스오버 하면 빨간색으로 변경
start.addEventListener('mouseenter', () => {
    if(signed.classList.contains("myPetitions-mouseover")) {
        signed.classList.remove("myPetitions-mouseover");
    }
    start.classList.add("myPetitions-mouseover");
});

start.addEventListener('mouseleave', () => {
    start.classList.remove("myPetitions-mouseover");
});

signed.addEventListener('mouseenter', () => {
    if(start.classList.contains("myPetitions-mouseover")) {
        start.classList.remove("myPetitions-mouseover");
    }
    signed.classList.add("myPetitions-mouseover");
});

signed.addEventListener('mouseleave', () => {
    signed.classList.remove("myPetitions-mouseover");
});





// start 버튼을 누르면
start.addEventListener("click", () => {

    // 만약 signed가 클릭된 상태라면, signed 활성화 제거 후 start 활성화
    if(signed.classList.contains("myPetitions-click")) {
        signed.classList.remove("myPetitions-click");
    }
    start.classList.add("myPetitions-click");
    
    // 만약 myStartPetitions에 invisibleMyPetitions클래스가 있다면 클래스 삭제 
    if(myStartPetitions.classList.contains("invisibleMyPetitions")) {
        myStartPetitions.classList.remove("invisibleMyPetitions");
    }
    // mySignedPetitions에 invisibleMyPetitions클래스 추가
    mySignedPetitions.classList.add("invisibleMyPetitions");
    
});




// signed 버튼을 누르면
signed.addEventListener("click", () => {

    // 만약 start가 클릭된 상태라면, start 활성화 제거 후 signed 활성화
    if(start.classList.contains("myPetitions-click")) {
        start.classList.remove("myPetitions-click");
    }
    signed.classList.add("myPetitions-click");

    // 만약 mySignedPetitions에 invisibleMyPetitions클래스가 있다면 클래스 삭제 
    if(mySignedPetitions.classList.contains("invisibleMyPetitions")) {
        mySignedPetitions.classList.remove("invisibleMyPetitions");
    }
    // myStartPetitions에 invisibleMyPetitions클래스 추가
    myStartPetitions.classList.add("invisibleMyPetitions");

});




