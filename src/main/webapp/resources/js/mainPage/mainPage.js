const smallNews = document.querySelectorAll('.item2');
const box1 = document.querySelector('.box1');
const newsTitle = document.querySelector('#news-title');
const newsTitles = document.querySelectorAll('.small-news');
const newsSub = document.querySelector('#news');
const newsId = document.querySelector('#main-news-nickname');
const newsAddress = document.querySelector('#main-news-address');
const viewers = document.querySelector('#view');
const mainPhoto = document.querySelector('#mainPhoto');
const idImg = document.querySelector('#news-id');
const newsContent = document.querySelector('#newsContent');
const mainUserImage = document.querySelector('#main-user-image');
const mainNewsLink = document.querySelector('#main-news-link');
const titleLink = document.querySelector('#title-link');
const boxPetitionTitle = document.querySelector('#box-petition-title');
const articleTitle = document.querySelector('.article');

const hiddenContent = document.querySelectorAll(
  'input[type="hidden"][name="petitionContent"]'
);
const hiddenUserImage = document.querySelectorAll(
  'input[type="hidden"][name="userImage"]'
);
const hiddenUserAddress = document.querySelectorAll(
  'input[type="hidden"][name="userAddress"]'
);
const hiddenUserNickname = document.querySelectorAll(
  'input[type="hidden"][name="userNickname"]'
);
const hiddenPetitionViewCount = document.querySelectorAll(
  'input[type="hidden"][name="petitionViewCount"]'
);
const hiddenPetitionLink = document.querySelectorAll(
  'input[type="hidden"][name="petitionLink"]'
);
const hiddenPetitionLink2 = document.querySelectorAll(
  'input[type="hidden"][name="petitionLink2"]'
);

smallNews[0].style.borderBottom = '6px solid #2DB400';

newsTitles[0].lastChild.style.color = 'rgba(40, 144, 5, 1)';

smallNews.forEach((newBox, index) => {
  newBox.addEventListener('click', () => {
    // 모든 요소의 스타일 초기화
    smallNews.forEach((box) => {
      box.style.borderBottom = 'none';
    });
    newsTitles.forEach((title) => {
      title.style.color = 'black';
      title.lastChild.style.color = '';
    });

    // 클릭한 요소에 대해서만 스타일 변경
    newBox.style.borderBottom = '6px solid #2DB400';
    newsTitles[index].lastChild.style.color = 'rgba(40, 144, 5, 1)';
    if (index === 0) {
      newsTitle.innerText = newsTitles[0].childNodes[0].innerText;
      mainPhoto.src = smallNews[0].src;
      newsSub.innerText = hiddenContent[0].value;
      mainUserImage.childNodes[0].src = hiddenUserImage[0].value;
      newsAddress.innerText = hiddenUserAddress[0].value;
      newsId.innerText = hiddenUserNickname[0].value;
      viewers.innerText = hiddenPetitionViewCount[0].value + ' 명';
      mainNewsLink.href = hiddenPetitionLink[0].value;
      titleLink.href = hiddenPetitionLink[0].value;
    } else {
      newsTitle.innerText = newsTitles[index].childNodes[0].innerText;
      mainPhoto.src = smallNews[index].src;
      newsSub.innerText = hiddenContent[index].value;
      mainUserImage.childNodes[0].src = hiddenUserImage[index].value;
      newsAddress.innerText = hiddenUserAddress[index].value;
      newsId.innerText = hiddenUserNickname[index].value;
      viewers.innerText = hiddenPetitionViewCount[index].value + ' 명';
      mainNewsLink.href = hiddenPetitionLink[index].value;
      titleLink.href = hiddenPetitionLink[index].value;
    }
  });
});

////////////////////////////////////////////////////////////////////////////////////////////////

let page = 1;

document.getElementById('loadButton').addEventListener('click', function () {
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
          var mainPetition = response[i];
          var li = document.createElement('li');
          let categories = '';
          mainPetition.categoryList.forEach((category, index) => {
            categories += `<a href="/browse/category/${category.categoryNo}" class="petCategory">${category.categoryName}</a>`;
            if (index < mainPetition.categoryList.length - 1) {
              categories += ', ';
            }
          });
          let img;
          if(mainPetition.petitionImage === null)
              img = "/resources/images/common/defaultThumbnail.png";
          else
              img = mainPetition.petitionImage;
          li.className = 'content pettition1';
          li.innerHTML = `
            <div class="pettition1 pet-title">
              <i class="fa-solid fa-tag fa-rotate-90" style="color: #000000; margin:15px"></i>
              <span class="text-limit4">Trending in ${categories}</span>
              <a href="#" style="text-decoration: underline;">See more</a>
            </div>
            <div class="pettition1 article">
              <div class="article-title"><a href="/browse/petitionView/details/${mainPetition.petitionNo}"><h3 id="box-petition-title" class="text-limit5">${mainPetition.petitionTitle}</h3></a></div>
              <div>
                <a href="/browse/petitionView/details/${mainPetition.petitionNo}"><div class="text-limit6">${mainPetition.petitionContent}</a></a></div>
              </div>
              <div class="photo"><img src="${img}" style="width: 145px; height: 145px; object-fit: cover;"></div> 
            </div>
            <div class="pettition1 id">
              <span id="id-profile"><img src="${mainPetition.userImage}" style="height: 28px; margin: 5px;" class="profile-image"></span>
              <span>${mainPetition.userNickname}</span>
              <a href="#"><i class="fa-solid fa-users" style="color: #1dbf27; font-size: 15px; margin-right: 5px;"></i>${mainPetition.petitionLikeCount} Supporters</a>
            </div>
          `;
          petitionContainer.appendChild(li);

        }
        if (response.length < 3) {
          document.getElementById('loadButton').style.display = 'none';
        }
      } else {
        // 서버 오류 처리
        console.error('Error: ' + xhr.status);
      }
    }
  };
  xhr.open('GET', `/load-petitions?page=${page++}`, true);
  xhr.send();
});
