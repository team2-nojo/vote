/* 청원 주요내용 팁보기 */
function tipView(input){
    const inputTip = document.getElementById(input.slice(0,-3));
    const inputBtn = document.getElementById(input);
    inputBtn.addEventListener("click", () => {
        if(input.slice(-3,-2) == 'B') inputTip.classList.add("dp-block");
        else inputTip.classList.remove("dp-block");
    });
};
tipView('titleTipBtn');
tipView('descriptTipBtn');
tipView('imgTipBtn');
tipView('titleTipCtn');
tipView('descriptTipCtn');
tipView('imgTipCtn');

/* 청원 데이터 팁보기 */
function tipHover(input){
    const inputI = document.getElementById(`${input}I`);
    const inputP = document.getElementById(`${input}P`);
    inputI.addEventListener("mouseover", () =>{inputP.style.display = "block";});
    inputI.addEventListener("mouseout", () =>{inputP.style.display = "none";});
};
tipHover("scope");
tipHover("location");
tipHover("topic");
tipHover("owner");
tipHover("twitter");

/* 주제추가 */
const addTopicBox = document.getElementById("addTopicBox");
let topicCount = 0;
let topicInputReference;

function addTopic() {
    if (topicCount >= 5) return;
    const topicInput = document.getElementById("topicInput");
    const topicValue = topicInput.value.trim();
    if (topicValue === "") return;

    const addTopic = document.createElement("div");
    addTopic.innerHTML = `<span>${topicValue}&nbsp;<i class="fa-regular fa-rectangle-xmark"></i></span>`;
    addTopic.addEventListener("click", (e) => {
        e.target.remove();
        topicCount--;
        if (topicCount === 4 && topicInputReference) restoreTopicInput();
    });

    topicInput.insertAdjacentElement("beforebegin", addTopic);
    topicInput.value = "";
    topicCount++;

    if (topicCount === 5 && !topicInputReference) {
        topicInputReference = topicInput;
        topicInput.remove();
    }
}

function restoreTopicInput() {
    if (topicInputReference) {
        addTopicBox.insertBefore(topicInputReference, addTopicBox.lastChild);
        topicInputReference = null;
    };
};

addTopicBox.addEventListener("click", () => {
    if (topicCount === 4 && topicInputReference) {
        restoreTopicInput();
    }
});

addTopicBox.addEventListener('keyup', (e) => {
    if (e.key === 'Enter') {
        addTopic();
    }
});
