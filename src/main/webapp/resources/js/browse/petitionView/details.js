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

    // 글자수 확인하여 200자가 넘어가면 붉게 표시
    if( content.value.length > 200 ){ // 댓글이 1000자 넘어가면
        count.classList.add("error");
    }else{ // 댓글이 200자 이내일 때
        count.classList.remove("error");
    }

});











// 댓글 목록 조회
function selectCommentList(){
    
    // REST (REpresentational State Transfer) API
    // - 자원을 이름(주소)으로 구분(REpresentational)하여 
    //   자원의 상태(State)를 주고 받는 것(Transfer)

    // -> 주소를 명시하고 Http Method(GET, POST, PUT, DELETE)를 이용해
    // 지정된 자원에 대한 CRUD진행

    // Create : 생성, 삽입(POST)
    // Read : 조회(GET)
    // Update : 수정(PUT, PETCH)
    // Delete : 삭제(DELETE)

    // 기본적으로 from태그는 GET/POST만 지원


    fetch("/browse/petitionView/" + petitionNo) // GET방식은 주소에 파라미터를 담아서 전달
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

















































// 댓글등록(중)

const like = document.getElementById("signButton");

like.addEventListener("click", e => { // 댓글 등록 버튼이 클릭이 되었을 때
    
    
    
    // 1) 로그인이 되어있나? -> 전역변수 memberNo 이용
    if(loginUserNo == ""){ // 로그인 X
        alert("로그인 후 이용해주세요.");
        return;
    }
    

    alert("확인")
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
    
    const data = {"commentContent" : commentContent.value, 
    "userNo" : loginUserNo, "petitionNo" : petitionNo}; // JS객체
    
    // 주소가 잘못된 것 같음
    fetch("/comment", {
        method: "POST",
        headers: {"Content-Type" : "application/json;"},
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
