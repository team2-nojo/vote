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
const topicInput = document.getElementById("topicInput");
const addTopicBox = document.getElementsByClassName("addTopicBox");

topicInput.addEventListener("keydown", e => {
    
    const addTopic = document.createElement("div");
    addTopic.innerText = topicInput.value;
    addTopic.style.borderRadius = "5px"
    addTopic.style.backgroundColor = "#ccc"

    topicInput.append(addTopic);

});