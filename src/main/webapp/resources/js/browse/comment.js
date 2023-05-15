const count = document.getElementById("count");
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


const commentBtn = document.getElementById("commentBtn"); // 등록버튼 변수대입

// 등록버튼 클릭 이벤트
commentBtn.addEventListener("click", ()  => {

    // 댓글 입력 여부 확인
    if(content.value.length > 0){
        //댓글입력
        if(content.value.length <= 1000){ // 댓글이 1000자이내
            alert("댓글등록완료");
        }else{ // 댓글이 1000자가 넘어가면
            alert("1000자 이내로 작성해주세요.");
        }
    }else{ // 댓글 미입력
        alert("댓글을 입력해주세요.");
    }

});