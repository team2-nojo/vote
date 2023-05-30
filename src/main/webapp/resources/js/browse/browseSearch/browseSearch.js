const current = window.location.href.split('/').pop();
document.getElementById(current).classList.add('now');

let page = 1;
const middle = document.querySelector('.middle');
document.getElementById('moreView').addEventListener('click', function () {
    // AJAX 요청
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                // 서버로부터 응답 데이터 받음
                var response = JSON.parse(xhr.responseText);
                // 받은 데이터로 <li> 요소 생성 및 추가
                var petitionContainer = document.getElementById('petitionContainer');
                for (var i = 0; i < response.length; i++) {
                    const div = document.createElement('div');
                    div.classList.add("result");
                    var petition = response[i];
                    let max = Math.ceil(petition.petitionLikeCount / 5) * 5;
                    let img;
                    console.log(petition.petitionImage);
                    if(petition.petitionImage === null)
                        img = "/resources/images/common/defaultThumbnail.png";
                    else
                        img = petition.petitionImage;
                    max = String(max);
                    max = max.split('.')[0];
                    div.innerHTML = `
                        <a href="/browse/petitionView/details/${petition.petitionNo}" class="result1">
                            <div class="row-left" id="rowPicture">
                                <img src="${img}" class="picture">
                            </div>
                            <div class="row-right">
                                <div id="title" class="limit-title">
                                    ${petition.petitionTitle}
                                </div>
                                <div id="content" class="limit-content">
                                    ${petition.petitionContent}
                                    <a href="/browse/petitionView/details/${petition.petitionNo}" id="readMore"> Read more</a>
                                </div>
                                <div class="progress">
                                    <progress id="progress" value="${petition.petitionLikeCount}" min="0" max="${max}" ></progress>
                                    <div id="value"></div>
                                    
                                </div>
                                <div class="profile">
                                    <div class="writer">
                                        <span id="id-profile"><img src="${petition.userImage}" style="height: 25px; margin: 5px;" class="profile-image"></span>
                                        <div class="nickname">
                                            ${petition.userNickname}
                                        </div>
                                    </div>
                                    <div id="goal">
                                        청원 지지자 수 <span id="count">${petition.petitionLikeCount}</span> 명
                                    </div>
                                </div>
                            </div>
                        </a>
                    `;
                    middle.append(div);
                }
                if (response.length < 5) {
                    document.getElementById('moreView').style.display = 'none';
                }
            } else {
                // 서버 오류 처리
                console.error('Error: ' + xhr.status);
            }
        }
    };
    xhr.open('GET', `/browse/load-${current}?page=${page++}`, true);
    xhr.send();
});