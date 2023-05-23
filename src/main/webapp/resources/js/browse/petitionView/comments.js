// 댓글 목록 조회
function selectCommentList(){


    fetch("/browse/petitionView/comments/" + petitionNo) // GET방식은 주소에 파라미터를 담아서 전달
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
            commentWriter.classList.add("comment-writer");

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