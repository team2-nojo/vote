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
    } else {
      newsTitle.innerText = newsTitles[index].childNodes[0].innerText;
      mainPhoto.src = smallNews[index].src;
      newsSub.innerText = hiddenContent[index].value;
      mainUserImage.childNodes[0].src = hiddenUserImage[index].value;
      newsAddress.innerText = hiddenUserAddress[index].value;
      newsId.innerText = hiddenUserNickname[index].value;
      viewers.innerText = hiddenPetitionViewCount[index].value + ' 명';
    }
  });
});

////////////////////////////////////////////////////////////////////////////////////////////////
const button = document.getElementById('btn2');
const petitionContainer = document.getElementById('petitionContainer');
const itemsPerLoad = 3;
let currentIndex = 0;

button.addEventListener('click', loadMorePetitions);

function loadMorePetitions() {
  // 이벤트 핸들러에서 호출될 함수
}
function loadMorePetitions() {
  for (let i = currentIndex; i < currentIndex + itemsPerLoad; i++) {
    if (i >= mainPetitionList.length) {
      // 더 이상 표시할 항목이 없으면 버튼을 비활성화하고 종료
      button.disabled = true;
      return;
    }

    const mainPetition = mainPetitionList[i];

    // 표시할 항목을 생성하여 petitionContainer에 추가
    const petitionItem = document.createElement('li');
    petitionItem.classList.add('content', 'pettition1');

    // petitionItem 내부 요소 생성 및 추가

    petitionContainer.appendChild(petitionItem);
  }

  // 인덱스 업데이트
  currentIndex += itemsPerLoad;
}
