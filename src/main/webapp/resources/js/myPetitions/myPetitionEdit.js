/* 청원 주요내용 팁보기 */
document.getElementById("titleTipBtn").addEventListener("click", () => {
    document.getElementById("titleTip").style.display = "block";
});
document.getElementById("descriptTipBtn").addEventListener("click", () => {
    document.getElementById("descriptTip").style.display = "block";
});
document.getElementById("imgTipBtn").addEventListener("click", () => {
    document.getElementById("imgTip").style.display = "block";
});

/* 청원 데이터 팁보기 */
function tipHover(input){
    const inputI = document.getElementById(`${input}I`);
    const inputP = document.getElementById(`${input}P`);

    inputI.addEventListener("mouseover", () =>{
        inputP.style.display = "block";
    });
    
    inputI.addEventListener("mouseout", () =>{
        inputP.style.display = "none";
    });

}

tipHover("scope");
tipHover("location");
tipHover("topic");
tipHover("owner");
tipHover("twitter");

/* 사진 또는 비디오 주소 추가 */
// document.getElementById("AddBtn").addEventListener("click", () => {
//     const addurl = document.getElementById("AddUrl").value;
//     document.querySelector(".content-img").innerHTML = "";
//     document.querySelector(".content-img").style = "height:300px"

//     if(addurl == null){
//         document.querySelector(".content-img").innerHTML
//     }

//     const input = document.createElement("div");

//     const closeBtn = document.createElement("button");
//     closeBtn.innerText = "버튼";

//     closeBtn.style = "position : absolute, color : blue ";

//     closeBtn.addEventListener("click", () =>{return});

//     const youtube = document.createElement("iframe");

//     input.append(closeBtn, youtube);

//     document.querySelector(".content-img").append(input);
// });

/* 주제추가 */
// const addTopicBox = document.getElementById("addTopicBox");

// function addTopic(){

//     const topicInput = document.getElementById("topicInput");
    
//     const addTopic = document.createElement("div");
//     addTopic.innerHTML = `<span>${topicInput.value}</span> <span>X</span>`;


//     addTopic.addEventListener('click', e => {
//         e.target.remove();
//     });

//     topicInput.insertAdjacentElement('beforebegin', addTopic);

// };


// addTopicBox.addEventListener('keyup', (e) =>{
//     if(e.key === 'Enter'){
//         addTopic();
//     }
// })
const addTopicBox = document.getElementById("addTopicBox");
let topicCount = 0; // 추가된 요소의 개수를 카운트하는 변수

function addTopic() {
    if (topicCount >= 5) {
        return; // 요소 개수가 5개 이상이면 추가하지 않음
    }

    const topicInput = document.getElementById("topicInput");
    const topicValue = topicInput.value.trim(); // 입력된 내용에서 앞뒤 공백을 제거하여 가져옴

    if (topicValue === "") {
        return; // 내용이 비어있으면 추가하지 않음
    }

    const addTopic = document.createElement("div");
    addTopic.innerHTML = `<span>${topicValue}</span> <span>X</span>`;

    addTopic.addEventListener('click', e => {
        e.target.remove();
        topicCount--; // 요소가 제거될 때 카운트 감소
    });

    topicInput.insertAdjacentElement('beforebegin', addTopic);
    topicInput.value = ""; // 요소가 추가된 후 입력란 내용 초기화
    topicCount++; // 요소가 추가될 때 카운트 증가

    if (topicCount >= 5) {
        topicInput.remove();
    }
}
// 요소 삭제 후 다시 input 생성하기 
addTopicBox.addEventListener('keyup', (e) => {
    if (e.key === 'Enter') {
        addTopic();
    }
});
