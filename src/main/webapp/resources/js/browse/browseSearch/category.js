let current = 'trending';
let page = 0;
const categoryNo = window.location.href.split('/').pop();
document.getElementById(current).classList.add('current');
const trending = document.getElementById('trending');
const recent = document.getElementById('recent');
const petitionsContainer = document.getElementById('petitionsContainer');
const loadPetitionBtn = document.getElementById('loadPetitionBtn');
trending.addEventListener('click',()=>{
    petitionsContainer.innerHTML="";
    trending.classList.add('current');
    recent.classList.remove('current');
    loadPetitionBtn.classList.remove('hidden');
    current = 'trending';
    page = 0;
    loadPetition();
})
recent.addEventListener('click',()=>{
    petitionsContainer.innerHTML="";
    recent.classList.add('current');
    trending.classList.remove('current');
    loadPetitionBtn.classList.remove('hidden');
    current = 'recent';
    page = 0;
    loadPetition();
})
const loadPetition = () => {
    const xhr = new XMLHttpRequest();
    xhr.onreadystatechange = () => {
        if(xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                const petitionList = JSON.parse(xhr.responseText);
                for(let i=0;i<petitionList.length;i++){
                    const petition=petitionList[i];
                    const petitionBox = document.createElement('div');
                    petitionBox.classList.add('petition-box');
                    let categories = '';
                    petition.categoryList.forEach((category, index) => {
                        categories += `<a href="/browse/category/${category.categoryNo}" class="petition-category">${category.categoryName}</a>`;
                        if (index < petition.categoryList.length - 1) {
                            categories += ', ';
                        }
                    });
                        
                    petitionBox.innerHTML = `
                        <div class="categories"><i class="fa-solid fa-tag fa-flip-horizontal"> </i> Trending in ${categories}</div>
                        <div class="petition">
                            <div class="img-box"><img src="${petition.petitionImage}" alt=""></div>
                            <div class="petition-contents">
                                <div class="petition-title">${petition.petitionTitle}</div>
                                <div class="petition-content">
                                    ${petition.petitionContent}
                                </div>
                                <div class="petition-info">
                                    <div class="user-info"><img src="${petition.userImage}" style="width:30px; height:30px; border-radius:50%; margin-top:5px;"/>${petition.userNickname}</div><div class="suppoters"><i class="fa-solid fa-users" style="color: #1dbf27; font-size: 15px; margin-right: 5px;"></i>${petition.petitionLikeCount} Supporters</div>
                                </div>
                            </div>
                        </div>
                    `
                    petitionsContainer.append(petitionBox);
                }
                if(petitionList.length<4){
                    loadPetitionBtn.classList.add('hidden');
                }
            } else {
                console.error('Error: ' + xhr.status);
            }
        }
    }
    xhr.open('GET', `/browse/category/${current}/${categoryNo}?page=${page++}`, true);
    xhr.send();
}
loadPetitionBtn.addEventListener('click',loadPetition);
loadPetition();


// document.getElementById('moreView').addEventListener('click', function () {
//     // AJAX 요청
//     var xhr = new XMLHttpRequest();
//     xhr.onreadystatechange = function () {
//         if (xhr.readyState === XMLHttpRequest.DONE) {
//             if (xhr.status === 200) {
//                 // 서버로부터 응답 데이터 받음
//                 var response = JSON.parse(xhr.responseText);
//                 // 받은 데이터로 <li> 요소 생성 및 추가
//                 for (var i = 0; i < response.length; i++) {
//                 }
//                 if (response.length < 5) {
//                     document.getElementById('moreView').style.display = 'none';
//                 }
//             } else {
//                 // 서버 오류 처리
//                 console.error('Error: ' + xhr.status);
//             }
//         }
//     };
//     xhr.open('GET', `/browse/load-${current}?page=${page++}`, true);
//     xhr.send();
// });