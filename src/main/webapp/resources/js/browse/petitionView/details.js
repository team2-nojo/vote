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

    // 글자수 확인하여 200자가 넘어가면 붉게 표시
    if( content.value.length > 200 ){ // 댓글이 1000자 넘어가면
        count.classList.add("error");
    }else{ // 댓글이 200자 이내일 때
        count.classList.remove("error");
    }

});











// 댓글 목록 조회
function selectCommentList(){

    fetch("/browse/petitionView/details/selectComment", {
        method: "POST",
        headers: {"Content-Type": "application/json; charset=UTF-8"},
        body: JSON.stringify
    }) 
    .then(response => response.json()) // 응답 객체 -> 파싱
    .then(cList => { // cList : 댓글 목록(객체배열)
        console.log(cList);
        
        // 화면에 출력되어 있는 댓글 목록 삭제
        const commentList = document.getElementById("commentList"); // ul태그
        commentList.innerHTML = "";

        // cList에 저장된 요소를 하나씩 접근
        for(let comment of cList){

            // 행
            const commentRow = document.createElement("li");
            commentRow.classList.add("comment-row");
        


            // 작성자
            const commentWriter = document.createElement("p");
            commentWriter.classList.add("noti");

            // 프로필 이미지
            const userImage = document.createElement("img");

            if( comment.userImage != null ){ // 프로필 이미지가 있을 경우
                userImage.setAttribute("src", comment.userImage);
            }else{ // 없을 경우 == 기본이미지
                userImage.setAttribute("src", "/resources/images/user.png");
            }

            // 작성자 닉네임
            const userNickname = document.createElement("span");
            userNickname.innerText = comment.userNickname;
            
            // 작성일
            const commentDate = document.createElement("span");
            commentDate.classList.add("commentDate");
            commentDate.innerText =  "(" + comment.commentDate + ")";

            // 작성자 영역(p)에 프로필,닉네임,작성일 마지막 자식으로(append) 추가
            commentWriter.append(userImage , userNickname , commentDate);

            

            // 댓글 내용
            const commentContent = document.createElement("p");
            commentContent.classList.add("class_content");
            commentContent.innerHTML = comment.commentContent;

            // 행에 작성자, 내용 추가
            commentRow.append(commentWriter, commentContent);

            // 댓글 목록(ul)에 행(li)추가
            commentList.append(commentRow);
        }


    })
    .catch(err => console.log(err));
}






// 좋아요 버튼 누르면 게이지 올라감, 좋아요 누른 사람 수 & 남은 사람 수 표시
// const signButton = document.getElementById("signButton");

// signButton.addEventListener("click", ()=> {
//         // alert(progress.max);
//         progress.value += 1;
        
//         const crrent1 = parseInt(likeCount.innerText, 10)
//         likeCount.innerText = crrent1 + 1;
    
//         const crrent2 = parseInt(remainNumber.innerText, 10)
//         remainNumber.innerText = progress.max - likeCount.innerText ;
        
        
    
// });







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
    
    
    
    // 3) AJAX를 이용해서 댓글 내용 DB에 저장(INSERT)
    


    // 좋아요(미완)
    let check; // 기존에 좋아요가 아닐 때(빈하트) : 0, 좋아요(꽉찬하트) : 1
    if(loginUserNo){ // 좋아요가 아닐 때
        check = 0;
    }else{ 
        check = 1;
    }


    // ajax로 서버로 제출할 파라미터를 모아둔 JS객체
    const data2 = {"petitionNo" : petitionNo, "loginUserNo" : loginUserNo};
    
    // ajax코드 작성
    fetch("/browse/petitionView/details/like", {
        method : "POST",
        headers : {"Content-Type" : "application/json"},
        body : JSON.stringify(data2)
    })
    .then(response => response.text()) // 응답 객체를 필요한 형태로 파싱하여 리턴
    
    .then(count => { 

        console.log("count : " + count);

        if(count == -1){ // INSERT, DELETE실패 시 
            console.log("좋아요 처리 실패");
            return;
        }


    
        // 현재 게시글의 좋아요 수를 화면에 출력
        e.target.nextElementSibling.innerText = count;

    }) // 파싱된 데이터를 받아서 처리하는 코드 작성
    
    .catch(err => {
        console.log("예외발생");
        console.log(err);
    }) //예외 발생시 처리하는 부분





    // 댓글등록(완료)
    const data1 = {"commentContent" : commentContent.value, 
    "userNo" : loginUserNo, "petitionNo" : petitionNo, "petitionLikeCount" : petitionLikeCount}; // JS객체
    
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
            

            // DB반영 안됨 임시로 작성함.-----------
            progress.value += 1;
            
            const crrent1 = parseInt(likeCount.innerText, 10)
            likeCount.innerText = crrent1 + 1;
            
            const crrent2 = parseInt(remainNumber.innerText, 10)
            remainNumber.innerText = 50 - likeCount.innerText ;
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
