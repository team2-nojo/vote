

// tab의 요소(start/signed)를 누르면 해당 건들이 나오는 코드
const start = document.getElementById("start");
const signed = document.getElementById("signed");
const userProfileframe = document.getElementsByClassName("userProfileframe")[0];


// 나중에 DB에서 받아 올 숫자들 임시로 선언
// num1 : start 글 개수(작성글)
// num2 : signed 글 개수(서명한 글)
num1 = 3;
num2 = 2;

// tab[0](start) 탭을 누르면 작성한 청원글이 나오는 함수
start.addEventListener("click", () => {
    myPetitionTabs(num1); // start 글 개수를 매개변수로 전달
});

signed.addEventListener("click", () => {
    myPetitionTabs(num2); // signed 글 개수를 매개변수로 전달
});


function myPetitionTabs(num) {
      // defaultbox를 만들어 DB에 작성된 내 작성글 중 하나를 입력
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