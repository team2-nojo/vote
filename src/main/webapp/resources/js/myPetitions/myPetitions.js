

// tab의 요소(start/signed)를 누르면 해당 건들이 나오는 코드
const start = document.getElementById("start");
const signed = document.getElementById("signed");
const userProfileframe = document.getElementsByClassName("userProfileframe")[0];


// 나중에 DB에서 받아 올 숫자들 임시로 선언
// num1 : start 글 개수(작성글)
// num2 : signed 글 개수(서명한 글)
num1 = 0;
num2 = 2;



// 로딩 화면에서 실행
(function(){
    // myPetitions가 있을 시 start 화면 default
    if(num1 > 0) {

        myPetitionTabs(num1)
        start.classList.add("myPetitions-mouseover");

    // myPetitions가 없을 시 defaultbox 생성    
    } else {

        const emptyDefaultBox = document.createElement("div");
        emptyDefaultBox.classList.add("empty-default-box");

        const emptyDefaultBoxArea = document.createElement("div");
        emptyDefaultBoxArea.classList.add("emptyDefaultBoxArea");

        const defaultboxContent = document.createElement("div");
        defaultboxContent.innerText = "바꾸고 싶은 세상이 있으신가요? 당신이 걱정하는 것에 대해 청원을 작성해 보세요.";
        
        const toStartAPetition = document.createElement("div");
        toStartAPetition.setAttribute("href", "/writePetition");
        toStartAPetition.classList.add("toStartAPetition");
        toStartAPetition.innerText = "청원 시작";

        emptyDefaultBoxArea.append(defaultboxContent);
        emptyDefaultBoxArea.append(toStartAPetition);
        emptyDefaultBox.append(emptyDefaultBoxArea);
        userProfileframe.append(emptyDefaultBox);
    }

})();












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










// tab[0](start) 탭을 누르면 작성한 청원글이 나오는 함수
start.addEventListener("click", () => {


    // 만약 signed가 클릭된 상태라면, signed 활성화 제거 후 start 활성화
    if(signed.classList.contains("myPetitions-click")) {
        signed.classList.remove("myPetitions-click");
    }
    start.classList.add("myPetitions-click");

    // 만약 start한 myPetitions가 있다면
    if(num1 > 0) {

        myPetitionTabs(num1)
        start.classList.add("myPetitions-mouseover");

    // start한 myPetitions가 없다면
    } else {

        

        const emptyDefaultBox = document.createElement("div");
        emptyDefaultBox.classList.add("empty-default-box");

        const emptyDefaultBoxArea = document.createElement("div");
        emptyDefaultBoxArea.classList.add("emptyDefaultBoxArea");

        const defaultboxContent = document.createElement("div");
        defaultboxContent.innerText = "바꾸고 싶은 세상이 있으신가요? 당신이 걱정하는 것에 대해 청원을 작성해 보세요.";
        
        const toStartAPetition = document.createElement("div");
        toStartAPetition.setAttribute("href", "/writePetition");
        toStartAPetition.classList.add("toStartAPetition");
        toStartAPetition.innerText = "청원 시작";

        emptyDefaultBoxArea.append(defaultboxContent);
        emptyDefaultBoxArea.append(toStartAPetition);
        emptyDefaultBox.append(emptyDefaultBoxArea);
        userProfileframe.append(emptyDefaultBox);
    }
    
});






signed.addEventListener("click", () => {

    // 만약 start가 클릭된 상태라면, start 활성화 제거 후 signed 활성화
    if(start.classList.contains("myPetitions-click")) {
        start.classList.remove("myPetitions-click");
    }
    signed.classList.add("myPetitions-click");

    // 만약 signed글 개수가 없다면
    // 청원 시작 박스 로딩

    // 만약 sigend 글 개수가 있다면
    // signed한 글 불러오기
        // 

     
    // signed 글 개수를 매개변수로 전달
    myPetitionTabs(num2); 
});



function myPetitionTabs(num) {

    
    document.querySelectorAll(".empty-default-box").forEach(e=>e.remove());
    document.querySelectorAll(".defaultbox").forEach(e=>e.remove());ss


      // 만약 이미 start/signed 버튼을 눌러 내 start/signed가 나와있는 화면이면 기존 div 다 삭제하고 다시 생성
    if(userProfileframe.childElementCount>2) {
        
        const defaultboxToRemove = document.querySelectorAll(".defaultbox");
   

        defaultboxToRemove.forEach(e => {
            e.parentNode.removeChild(e);
        });


      }

      for(let i = 0; i < num; i++){ // DB에 있는 내 작성 청원 개수를 매개변수로 받아와 개수만큼 실행
        // defaultbox 생성(큰 틀 생성)
        const defaultbox = document.createElement("div");
        defaultbox.classList.add("defaultbox");

        // defaultbox에 클릭하면 myPetitions dashboard로 이동하는 이벤트 추가
        defaultbox.addEventListener("click", e => {
            location.href="/myPetitions/myPetitionsDashboard";
        });
        
        // myPetitionstatus 생성(청원 상태 창 생성)
        const myPetitionstatus = document.createElement("div");
        myPetitionstatus.classList.add("myPetitionstatus")

        // 청원 상태를 알려주는 div 생성
        const div = document.createElement("div");
        div.classList.add("myPetitionstatus")

        // div에 내용 추가
        div.innerText = "진행중";

        // myPetitionstatus의 마지막 자식으로 div 추가
        myPetitionstatus.append(div);
        
        // 청원 제목을 가져오는 myPetitionTitle 생성
        const myPetitionTitle = document.createElement("div");
        myPetitionTitle.classList.add("myPetitionTitle")

        // myPetitionTitle에 내용 추가
        myPetitionTitle.innerText = "가져온 청원 제목";
        
        // 청원 본문을 가져오는 myPetitionText 생성
        const myPetitionText = document.createElement("div");
        myPetitionText.classList.add("myPetitionText")

        // myPetitionTitle에 내용 추가
        myPetitionText.innerText = "가져온 청원 본문";
        
        // 청원 하단부 box myPetitionBottom 생성
        const myPetitionBottom = document.createElement("div");
        myPetitionBottom.classList.add("myPetitionBottom")
        
        // 청원 작성자를 가져오는 myPetitionWriter 생성
        const myPetitionWriter = document.createElement("div");
        myPetitionWriter.classList.add("myPetitionWriter")

        // myPetitionWriter 내용 추가
        myPetitionWriter.innerText = "가져온 청원 작성자";

        // myPetitionBottom 마지막 자식으로 div 추가
        myPetitionBottom.append(myPetitionWriter);
        
        // 청원 지지자를 가져오는 myPetitionsupporter 생성
        const myPetitionsupporter = document.createElement("div");
        myPetitionsupporter.classList.add("myPetitionsupporter")

        // myPetitionsupporter 내용 추가
        myPetitionsupporter.innerText = "가져온 청원 작성자";

        // myPetitionBottom 마지막 자식으로 div 추가
        myPetitionBottom.append(myPetitionsupporter);

    //userProfileframe 마지막 자식으로 defaultbox 추가
        userProfileframe.append(defaultbox);

        // // defaultbox에 내용 추가
        defaultbox.append(myPetitionstatus);
        defaultbox.append(myPetitionTitle);
        defaultbox.append(myPetitionText);
        defaultbox.append(myPetitionBottom);
    }
};





// 만약 작성한 청원이 없다면 start a pettition으롤 가는 박스를 생성해서 보여줌
// (function(){
//    if(userProfileframe.childElementCount=0) {

//     // 박스 생성
//     const defaultbox = document.createElement("div");
//     defaultbox.classList.add("defaultbox");
//     userProfileframe.append(defaultbox);

//    }
// })();

