/* 팁보기 */
function tipHover(input){
    const inputI = document.getElementById(`${input}I`);
    const inputP = document.getElementById(`${input}P`);
    inputI.addEventListener("mouseover", () =>{inputP.style.display = "block";});
    inputI.addEventListener("mouseout", () =>{inputP.style.display = "none";});
};
tipHover("graph");


/* graph */
const animatedPath = document.getElementById('animated-path');
const length = animatedPath.getTotalLength();
animatedPath.style.strokeDasharray = length;
animatedPath.style.strokeDashoffset = length;

function animatePath(input) {
    document.addEventListener('DOMContentLoaded', () => {
        let max = 0;
        if(input == (Math.ceil(input / 5) * 5)){
            max = Math.ceil((input + 1) / 5) * 5;
        }else{
            max = Math.ceil(input / 5) * 5;
        }
        const targetOffset = length - (length * input / max);
        animatedPath.style.transition = 'none';

        requestAnimationFrame(() => {
            animatedPath.style.transition = 'stroke-dashoffset 1s ease-in-out';
            animatedPath.style.strokeDashoffset = targetOffset;
        });
    });
}
animatePath(likeUserCount);


/* suppoterListSet ajax */

const petitionNo = document.getElementById("petitionNo");
const supportBtn = document.getElementById("supportBtn");
const supportList = document.getElementById("supportList");

function suppoterListSet(){

    fetch("/myPetitions/selectSuppoter", {
        method: "POST",
        headers: {"Content-Type": "application/json; charset=UTF-8"},
        body: JSON.stringify(parseInt(petitionNo.value))
    })
    .then(resp => resp.json())
    .then(likeUserList => {
        
        supportList.innerHTML="";
                
        for(let likeUser of likeUserList){
            const li = document.createElement("li");
        
            const img = document.createElement("img");
            img.setAttribute('id', 'profile'); 
            if(likeUser.userImage == null){
                img.setAttribute('src', '/resources/images/common/user.png'); 
            }else{
                img.setAttribute('src', likeUser.userImage); 
            }
        
            const span1 = document.createElement("span");
            span1.setAttribute('id', 'nickName');
            span1.innerText = likeUser.userNickname + '님'; 
        
            const span2 = document.createElement("span");
            span2.setAttribute('id', 'date'); 
            span2.innerHTML = '<i class="fa-solid fa-clock"></i> ' + likeUser.petitionLikeDate + ' 전';  
        
            li.append(img, span1, span2);
            supportList.append(li);
        }
    }) 
    .catch( err => {
        console.log(err);
    } );
};



/* commentListSet ajax */

const commentBtn = document.getElementById("commentBtn");
const commentList = document.getElementById("commentList");

function commentListSet(){

    fetch("/myPetitions/selectComment", {
        method: "POST",
        headers: {"Content-Type": "application/json; charset=UTF-8"},
        body: JSON.stringify(parseInt(petitionNo.value))
    })
    .then(resp => resp.json())
    .then(comments => {
        console.log(comments);

    commentList.innerHTML="";
                    
    for(let comment of comments){
        const li = document.createElement("li");

        const img = document.createElement("img");
        img.setAttribute('id', 'profile'); 
        if(comment.userImage == null){
            img.setAttribute('src', '/resources/images/common/user.png'); 
        }else{
            img.setAttribute('src', comment.userImage); 
        }

        const span1 = document.createElement("span");
        span1.innerText = comment.userNickname + '님'; 

        const span2 = document.createElement("span");
        span2.innerHTML = '<i class="fa-regular fa-thumbs-up"></i>좋아요<i class="fa-regular fa-thumbs-down"></i>싫어요'; 

        const div1 = document.createElement("div");
        div1.innerHTML = comment.commentContent;

        const div2 = document.createElement("div");
        div2.innerHTML = comment.commentDate;

        li.append(img, span1, span2, div1, div2);
        commentList.append(li);
    }
        }) 
        .catch( err => {
            console.log(err);
        } );
};


/* 페이지로드시 실행 */
document.addEventListener('DOMContentLoaded', function() {
    suppoterListSet();
    commentListSet();
});


/* 버튼 클릭시 suppoterListSet 실행 */
supportBtn.addEventListener('click', function() {
    suppoterListSet();
});
