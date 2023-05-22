// 게시글 수정 시 제목, 내용 작성 여부 검사
const boardUpdateFrm = document.querySelector("#boardUpdateFrm");
const boardTitle = document.querySelector("[name='boardTitle']");
const boardContent = document.querySelector("[name='boardContent']");


boardUpdateFrm.addEventListener('submit', e => {

    if(boardTitle.value.trim().length == 0){
        alert("제목을 입력해주세요")
        boardTitle.value = "";
        boardTitle.focus();
        e.preventDefault(); // form 기본 이벤트 제거
        return;
    }

    if(boardContent.value.trim().length == 0){
        alert("내용을 입력해주세요")
        boardContent.value = "";
        boardContent.focus();
        e.preventDefault(); // form 기본 이벤트 제거
        return;
    }


    // input type="hidden" 태그에
    // deleteSet에 저장된 값을 "1,2,3" 형태로 변경해서 저장

    // Array.from(deleteSet) : Set -> Array 변경

    // JS 배열은 string에 대입되거나 출력될 때
    // 요소,요소,요소 형태의 문자열을 반환한다! 

    document.querySelector("[name='deleteList']").value 
        =  Array.from(deleteSet);

    //e.preventDefault(); // 확인만하고 지울 예정
});