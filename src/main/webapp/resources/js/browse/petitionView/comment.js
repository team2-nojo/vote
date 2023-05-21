// 댓글 목록 조회
function selectCommentList(){
    
    fetch()
    .then()
    .then(cList => {
        console.log(cList);

        // 화면에 출력되어 있는 댓글 목록 삭제
        const commentList = document.getElementById("commentList"); // ul태그
        commentList.innerHTML = "";

        // cList에 저장된 요소를 하나씩 접근
        for(let browsePetition of cList){

            // 행
            const commentRow = document.createElement("li");
            commentRow.classList.add("comment-row");

            // 작성자
            const commentFrame = document.createElement("p");
            commentFrame.classList.add("commentFrame");

            // 프로필 이미지
            const userImage = document.createElement("img");

            if( browsePetition.userImage != null ){ // 프로필 이미지가 있을 경우
                userImage.setAttribute("src", browsePetition.userImage);
            }else{ // 없을 경우 == 기본이미지
                userImage.setAttribute("src", "/resources/images/user.png");
            }

            // 작성자 닉네임
            const userNickname = document.createElement("span");
            userNickname.innerText = browsePetition.userNickname;
            
            // 작성일
            const petitionDate = document.createElement("span");
            petitionDate.classList.add("comment-date");
            petitionDate.innerText =  "(" + browsePetition.petitionDate + ")";

            // 작성자 영역(p)에 프로필,닉네임,작성일 마지막 자식으로(append) 추가
            commentFrame.append(userImage , userNickname , petitionDate);

            

            // 댓글 내용
            const commentContent = document.createElement("p");
            commentContent.classList.add("commentContent");
            commentContent.innerHTML = browsePetition.commentContent;

            // 행에 작성자, 내용 추가
            commentRow.append(commentFrame, commentContent);

            /*
            // 로그인이 되어있는 경우 답글 버튼 추가
            if(loginMemberNo != ""){
                // 버튼 영역
                const commentBtnArea = document.createElement("div");
                commentBtnArea.classList.add("comment-btn-area");

                // 답글 버튼
                const childCommentBtn = document.createElement("button");
                childCommentBtn.setAttribute("onclick", "showInsertComment("+comment.commentNo+", this)");
                childCommentBtn.innerText = "답글";

                // 버튼 영역에 답글 버튼 추가
                commentBtnArea.append(childCommentBtn);

                // 로그인한 회원번호와 댓글 작성자의 회원번호가 같을 때만 버튼 추가
                if( loginMemberNo == comment.memberNo   ){

                    // 수정 버튼
                    const updateBtn = document.createElement("button");
                    updateBtn.innerText = "수정";

                    // 수정 버튼에 onclick 이벤트 속성 추가
                    updateBtn.setAttribute("onclick", "showUpdateComment("+comment.commentNo+", this)");                        


                    // 삭제 버튼
                    const deleteBtn = document.createElement("button");
                    deleteBtn.innerText = "삭제";
                    // 삭제 버튼에 onclick 이벤트 속성 추가
                    deleteBtn.setAttribute("onclick", "deleteComment("+comment.commentNo+")");                       


                    // 버튼 영역 마지막 자식으로 수정/삭제 버튼 추가
                    commentBtnArea.append(updateBtn, deleteBtn);

                } // if 끝
                

                // 행에 버튼영역 추가
                commentRow.append(commentBtnArea); 
            }
            

            // 댓글 목록(ul)에 행(li)추가
            commentList.append(commentRow);
            */
        }

    })
    .catch(err => console.log(err));

}