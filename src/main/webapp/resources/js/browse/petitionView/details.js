

// 체크박스 클릭 시 팝업창 열림
const reportClick = document.getElementById("reportClick");

reportClick.addEventListener("click", () => {
    window.open("/browse/petitionView/report_popUp", "신고팝업", "width=600, height=580");
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


//댓글 작성 시 글자수 세는 이벤트
const count = document.getElementById("count");
const content = document.getElementById("commentContent")
content.addEventListener("input", () => {
    count.innerText = content.value.length; 

    // 글자수 확인하여 200자가 넘어가면 붉게 표시
    if( content.value.length > 200 ){ // 댓글이 1000자 넘어가면
        count.classList.add("error");
    }else{ // 댓글이 200자 이내일 때
        count.classList.remove("error");
    }

});



















// 좋아요 버튼을 누르면 
const like = document.getElementById("signButton");
const progress = document.getElementById("progress");
const likeCount = document.getElementById("likeCount");

like.addEventListener("click", e => { // 댓글 등록 버튼이 클릭이 되었을 때

    // 1) 로그인이 되어있나? -> 전역변수 memberNo 이용
    if(loginUserNo == ""){ // 로그인 X
        alert("로그인 후 이용해주세요.");
        return;
    }
    
    if(!agree.checked){
        alert("해당 청원에 이름과 댓글을 표시하는 것에 동의해주세요.")
        return;
    }
    
    if(commentContent.value.trim().length == 0){ 
        alert("댓글을 작성한 후 버튼을 클릭해주세요.");
        return;
    }
    
    if(commentContent.value.trim().length > 200){ 
        alert("댓글을 200자 이내로 작성해주세요.");
        return;
    }
    
    






    // 댓글등록(완료)
    const data1 = {"commentContent" : commentContent.value, 
    "userNo" : loginUserNo, "petitionNo" : petitionNo}; // JS객체
    
    fetch("/browse/petitionView/details/comment", {
        method: "POST",
        headers: {"Content-Type" : "application/json;"},
        body: JSON.stringify(data1) // JS객체 -> JSON파싱
    })
    .then(resp =>resp.text())
    .then(result => {
        // console.log(result);
        if(result > 0){ // 등록 성공
            alert("댓글이 등록되었습니다.");
            sendMessage(1, loginUserNickname, petitionTitle.replace(/"가 &quot;/g, ''));

            // DB반영 안 됨 임시로 작성함.-----------
            // progress.value += 1;
            
            // const crrent1 = parseInt(likeCount.innerText, 10)
            // likeCount.innerText = crrent1 + 1;
            
            // const crrent2 = parseInt(remainNumber.innerText, 10)
            // remainNumber.innerText = 50 - likeCount.innerText ;
            //-------------------------------------
            
            commentContent.value = ""; // 작성했던 댓글 삭제

            selectCommentList(); // 비동기 댓글 목록 조회 함수 호출
            // -> 새로운 댓글이 추가되어짐

        } else { // 실패
            alert("댓글 등록에 실패했습니다.");
        }
    })
    .catch(err => console.log(err));

    


});

