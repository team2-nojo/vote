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
    window.open("/browse/petitionView/report_popUp", "신고팝업", "width=450, hight=450px");
    
});


// 좋아요 버튼 누르면 게이지 올라감, 좋아요 누른 사람 수 & 남은 사람 수 표시
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


const content = document.getElementById("content");

// 댓글 작성 시 글자수 세는 이벤트
content.addEventListener("input", e => {

    count.innerText = e.target.value.length; 

    // 글자수 확인하여 1000자가 넘어가면 붉게 표시
    if( e.target.value.length > 1000 ){ // 댓글이 1000자 넘어가면
        count.classList.add("error");
    }else{ // 댓글이 1000자 이내일 때
        count.classList.remove("error");
    }

});


// 체크박스 클릭 시 댓글창 열림
const agree = document.getElementById("agree");
const commentPlace = document.getElementById("commentPlace");

agree.addEventListener("change", ()=>{
    
    if(agree.checked){
        // alert("이벤트 확인");
        commentPlace.style.display = 'block';
    }else{
        commentPlace.style.display = 'none';
    }
});