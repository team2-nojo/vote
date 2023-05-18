const startBtn = document.getElementById("startBtn");

startBtn.addEventListener("click", ()=>{
    location.href="writePetition.jsp"; 
});


const commentMore = document.getElementById("commentMore");

commentMore.addEventListener("click", ()=>{
    location.href="comments.jsp"; 
});



const reportClick = document.getElementById("reportClick");

reportClick.addEventListener("click", ()=>{
    window.open("report_popUp.jsp", "신고팝업", "width=450, hight=450px");
    reportClick.style.display="block";
});


// 좋아요 버튼 누르면 게이지 올라감, 누른 사람 수 남은 사람 수 표시
const signButton = document.getElementById("signButton");
const progress = document.getElementById("progress");
const likeCount = document.getElementById("likeCount");

signButton.addEventListener("click", ()=> {
    progress.value += 1;

    const crrent1 = parseInt(likeCount.innerText, 10)
    likeCount.innerText = crrent1 + 1;

    const crrent2 = parseInt(remainNumber.innerText, 10)
    remainNumber.innerText = 50000 - likeCount.innerText ;

});


