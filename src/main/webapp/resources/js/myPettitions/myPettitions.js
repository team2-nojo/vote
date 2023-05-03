

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
    myPettitionTabs(num1); // start 글 개수를 매개변수로 전달
});

signed.addEventListener("click", () => {
    myPettitionTabs(num2); // signed 글 개수를 매개변수로 전달
});


function myPettitionTabs(num) {
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

        // defaultbox에 클릭하면 Mypettitions dashboard로 이동하는 이벤트 추가
        defaultbox.addEventListener("click", e => {
            location.href = "/vote/myPetitions/myPetitionsDashboard/myPetitionsDashboard.html";
        });
        
        // myPettitionStatus 생성(청원 상태 창 생성)
        const myPettitionStatus = document.createElement("div");
        myPettitionStatus.classList.add("myPettitionStatus")

        // 청원 상태를 알려주는 div 생성
        const div = document.createElement("div");
        div.classList.add("myPettitionStatus")

        // div에 내용 추가
        div.innerText = "진행중";

        // myPettitionStatus의 마지막 자식으로 div 추가
        myPettitionStatus.append(div);
        
        // 청원 제목을 가져오는 myPettitionTitle 생성
        const myPettitionTitle = document.createElement("div");
        myPettitionTitle.classList.add("myPettitionTitle")

        // myPettitionTitle에 내용 추가
        myPettitionTitle.innerText = "가져온 청원 제목";
        
        // 청원 본문을 가져오는 myPettitionText 생성
        const myPettitionText = document.createElement("div");
        myPettitionText.classList.add("myPettitionText")

        // myPettitionTitle에 내용 추가
        myPettitionText.innerText = "가져온 청원 본문";
        
        // 청원 하단부 box myPettitionBottom 생성
        const myPettitionBottom = document.createElement("div");
        myPettitionBottom.classList.add("myPettitionBottom")
        
        // 청원 작성자를 가져오는 myPettitionWriter 생성
        const myPettitionWriter = document.createElement("div");
        myPettitionWriter.classList.add("myPettitionWriter")

        // myPettitionWriter 내용 추가
        myPettitionWriter.innerText = "가져온 청원 작성자";

        // myPettitionBottom 마지막 자식으로 div 추가
        myPettitionBottom.append(myPettitionWriter);
        
        // 청원 지지자를 가져오는 myPettitionSupporter 생성
        const myPettitionSupporter = document.createElement("div");
        myPettitionSupporter.classList.add("myPettitionSupporter")

        // myPettitionSupporter 내용 추가
        myPettitionSupporter.innerText = "가져온 청원 작성자";

        // myPettitionBottom 마지막 자식으로 div 추가
        myPettitionBottom.append(myPettitionSupporter);

    //userProfileframe 마지막 자식으로 defaultbox 추가
        userProfileframe.append(defaultbox);

        // // defaultbox에 내용 추가
        defaultbox.append(myPettitionStatus);
        defaultbox.append(myPettitionTitle);
        defaultbox.append(myPettitionText);
        defaultbox.append(myPettitionBottom);
    }
};