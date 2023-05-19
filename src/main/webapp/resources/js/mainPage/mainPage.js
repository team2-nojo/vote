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
const hiddenContent = document.querySelectorAll('input[type="hidden"][name="petitionContent"]');
const hiddenUserImage = document.querySelectorAll('input[type="hidden"][name="userImage"]');
const hiddenUserAddress = document.querySelectorAll('input[type="hidden"][name="userAddress"]');
const hiddenUserNickname = document.querySelectorAll('input[type="hidden"][name="userNickname"]');
const hiddenPetitionViewCount = document.querySelectorAll('input[type="hidden"][name="petitionViewCount"]');




smallNews[0].style.borderBottom = '6px solid #2DB400';
newsTitles[0].lastChild.style.color= 'rgba(40, 144, 5, 1)';

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
      // newsSub.innerText = petitionTitle;

      // mainUserImage.childNodes[0].src = 
      // newsContent.lastChild.innerText = '${mainPt.petitionContent}';
    } else {
      newsTitle.innerText = newsTitles[index].childNodes[0].innerText;
      mainPhoto.src = smallNews[index].src;
      newsSub.innerText = hiddenContent[index].value;
      mainUserImage.childNodes[0].src = hiddenUserImage[index].value;
      newsAddress.innerText = hiddenUserAddress[index].value;
      newsId.innerText = hiddenUserNickname[index].value;
      viewers.innerText = hiddenPetitionViewCount[index].value+' 명';
    }
  });
});



////////////////////////////////////////////////////////////////////////////////////////////////
