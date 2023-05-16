const smallNews = document.querySelectorAll('.item2');
const box1 = document.querySelector('.box1');
const newsTitle = document.querySelector('#news-title');
const newsTitles = document.querySelectorAll('.small-news');
const newsSub = document.querySelector('#news');
const newsId = document.querySelector('#main-news-id');
const newsCountry = document.querySelector('#main-news-country');
const viewers = document.querySelector('#view');
const mainPhoto = document.querySelector('#mainPhoto');
const idImg = document.querySelector('#news-id');
smallNews.forEach((newBox, index) => {
  //smallNews[index].src = pettitions[index].image;
  //smallNews[index].src.backgroundSize = 'cover';
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
    } else {
      newsTitle.innerText = newsTitles[index].childNodes[0].innerText;
      mainPhoto.src = smallNews[index].src;
    }
  });
});

const ul = document.querySelector('.content2');
const button = document.querySelector('#btn');
const inc = 3;
let idx = 4;

function createItem(obj) {
  const item = document.createElement('li');
  item.classList.add('content', 'pettition1');
  item.innerHTML = `
              <div class="pettition1 pet-title">
              <i class="fa-solid fa-tag fa-rotate-90" style="color: #000000; margin:15px"></i>
              <span>${obj.title}</span>
              <a href="#" style="text-decoration: underline;">See more</a>
            </div>
            <div class="pettition1 article">
              <div class="article-title"><h3>${obj.title}</h3></div>
              <div class="text">
                <div>
                ${obj.content}
                <a href="#">더보기</a>
              </div>
            </div>
            <div class="photo"><img src=${obj.image} style="width: 145px; height: 145px; object-fit: cover;"></div> 
            </div>
            <div class="pettition1 id">
              <span class="id-profile"><img src=${obj.profile} style="height: 28px; margin: 5px;" alt=""></span>
              <span>${obj.name}</span>
              <a href="#"><i class="fa-solid fa-users" style="color: #1dbf27; font-size: 15px; margin-right: 5px;"></i>${obj.viewers} Supporters</a>
            </div>
            `;

  ul.append(item);
}

function loadItems() {
  const itemsToLoad = newsTitles.slice(idx, idx + inc);
  itemsToLoad.forEach(createItem);
  idx += inc;
}

button.addEventListener('click', loadItems);
