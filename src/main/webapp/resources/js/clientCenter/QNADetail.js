    // 로그인 여부 검사
    if(loginYserNo == ""){
        alert("로그인 후 이용해주세요")
        return;
    }

    let check; // 기존에  좋아요 X(빈하트) : 0 
               //         좋아요 0(꽉찬하트) : 1

    // contains("클래스명") : 클래스가 있으면 true, 없으면 false
    if(e.target.classList.contains("fa-regular")){ // s좋아요 X(빈하트)
        check = 0;
    } else { // 좋아요 0(꽉찬하트)
        check = 1;
    }

    // ajax로 서버로 제출할 파라미터를 모아둔 JS 객체
    const data = {"qnaNo" : qnaNo, 
                    "UserNo" : loginUserNo,
                    "check" : check};

    // 게시글 수정 버튼 클릭 시
document.getElementById("updateBtn").addEventListener("click", ()=>{

    location.href 
        = location.pathname.replace("board","board2")
            + "/update"
            + location.search
    // /board2/1/2006/update?cp=1 (GET)
});
