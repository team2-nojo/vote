// ajax로 서버로 제출할 파라미터를 모아둔 JS 객체
const data = {
    "qnaNo": qnaNo,
    "userNo": loginUserNo
};

// 게시글 수정 버튼 클릭 시

const updatebtn = document.getElementById("updateBtn");
const deletebtn = document.getElementById("deleteBtn");

updatebtn.addEventListener("click", e => {

    // /clientCenter/QNADetail/25?cp=1
    location.href = '/clientCenter/QNAupdate/' + qnaNo;

});

deletebtn.addEventListener("click", e => {

    if(confirm("정말 삭제하겠습니까?")) {
    location.href = '/clientCenter/QNAupdate/' + qnaNo + "/delete";

    }
});
