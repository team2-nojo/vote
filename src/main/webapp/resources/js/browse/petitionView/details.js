const signButton = document.getElementById("signButton");
const progress = document.getElementById("progress");
const commentMore = document.getElementById("commentMore");
const startBtn = document.getElementById("startBtn");


startBtn.addEventListener("click", ()=>{
    location.href="writePetition.jsp"; 
});



commentMore.addEventListener("click", ()=>{
    location.href="comments.jsp"; 
});



const reportClick = document.getElementById("reportClick");

reportClick.addEventListener("click", ()=>{
    window.open("report_popUp.jsp", "신고팝업", "width=450, hight=450px");
    reportClick.style.display="block";
});