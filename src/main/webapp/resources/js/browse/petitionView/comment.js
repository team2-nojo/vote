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

        const span1 = document.createElement("span");
        

        const img = document.createElement("img");
        img.setAttribute('id', 'profile'); 
        if(comment.userImage == null){
            img.setAttribute('src', '/resources/images/common/user.png'); 
        }else{
            img.setAttribute('src', comment.userImage); 
        }
        const span2 = document.createElement("span");
        span2.innerText = comment.userNickname + '님'; 

        span1.append(img, span2);


        const span3 = document.createElement("span");
        span3.setAttribute('id','commentResp')
        span3.innerHTML = '<i class="fa-regular fa-thumbs-up"></i>'+ comment.commentFLY +'&nbsp; | ' + '<i class="fa-regular fa-thumbs-down"></i>' + comment.commentFLN; 

        const div1 = document.createElement("div");
        div1.setAttribute('id','commentT')

        div1.append(span1, span3);

        const div2 = document.createElement("div");
        div2.innerHTML = comment.commentContent;

        const div3 = document.createElement("div");
        div3.innerHTML = comment.commentDate;

        li.append(div1, div2, div3);
        commentList.append(li);
    }
        }) 
        .catch( err => {
            console.log(err);
        } );
};