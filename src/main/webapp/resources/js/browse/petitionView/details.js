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


// 댓글 작성 시 글자수 세는 이벤트
const count = document.getElementById("count");
const content = document.getElementById("commentContent")
content.addEventListener("input", () => {
    count.innerText = content.value.length; 

    // 글자수 확인하여 1000자가 넘어가면 붉게 표시
    if( content.value.length > 1000 ){ // 댓글이 1000자 넘어가면
        count.classList.add("error");
    }else{ // 댓글이 1000자 이내일 때
        count.classList.remove("error");
    }

});


// 댓글등록(중)
const like = document.getElementById("signButton");

like.addEventListener("click", e => { // 댓글 등록 버튼이 클릭이 되었을 때

    // 1) 로그인이 되어있나? -> 전역변수 memberNo 이용
    if(loginUser.userNo == ""){ // 로그인 X
        alert("로그인 후 이용해주세요.");
        return;
    }

    // 2) 댓글 내용이 작성되어있나?
    if(commentContent.value.trim().length == 0){ // 미작성인 경우
        alert("댓글을 작성한 후 버튼을 클릭해주세요.");

        commentContent.value = ""; // 띄어쓰기, 개행문자 제거
        commentContent.focus();
        return;
    }

    // 3) AJAX를 이용해서 댓글 내용 DB에 저장(INSERT)

    const data = {"commentContent" : commentContent.value, 
                    "userNo" : loginUser.userNo, "petitionNo" : petitionNo}; // JS객체

    fetch("/comments", {
        method: "POST",
        headers: {"Content-Type" : "application/json"},
        body: JSON.stringify(data) // JS객체 -> JSON파싱
    })
    .then(resp =>resp.text())
    .then(result => {
        if(result > 0){ // 등록 성공
            alert("댓글이 등록되었습니다.");

            commentContent.value = ""; // 작성했던 댓글 삭제

            selectCommentList(); // 비동기 댓글 목록 조회 함수 호출
            // -> 새로운 댓글이 추가되어짐

        } else { // 실패
            alert("댓글 등록에 실패했습니다.");
        }
    })
    .catch(err => console.log(err));
});
