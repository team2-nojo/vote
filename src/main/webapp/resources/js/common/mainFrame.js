var smallNews = document.querySelectorAll('.item2');
const box1 = document.querySelector('.box1');
const newsTitle = document.querySelector('#news-title');
const newsTitles = document.querySelectorAll('.small-news');
const newsSub = document.querySelector('#news');
const newsProfile = document.querySelector('.news-id');
const newsId = document.querySelector('#main-news-id');
const newsCountry = document.querySelector('#main-news-country');
const viewers = document.querySelector('#view');

const pettitions = [
  {
    title: '尹, 중·러 겨냥…“힘에 의한 현상 변경, 꿈꿀 수 없게 해야"',
    content:
      '윤석열 대통령은 28일(현지시간) 보스턴 하버드 대학 케네디스쿨에서 연설하면서 다른 나라의 자유를 무시하는 힘에 의한 현상 변경 시도’에 국제사회는 용기 있고 결연한 연대로서 대응해야 한다고 밝혔다. 하버드대에서 현직 대통령이 연설하는 것은 처음이다. 윤 대통령은...',
    image: 'url("../img/news1.jpeg")',
    name: 'Tom Cruise',
    country: 'Republic of Korea',
    viewers: '48,567',
    profile: '"../img/profile1.jpeg"',
    topic: 'politics',
  },
  {
    title:
      '손흥민, 1골 추가하면 호날두와 동률 … 7년 연속 리그 10호 골 안필드에서 터질까',
    content:
      '이번에는 안필드다. 지난 주 맨유를 상대로 극적인 동점골을 터트리며 팀을 위기에서 구해낸 손흥민이 5월 1일 월요일(한국시간) 새벽 0시 30분 리버풀 원정에서 2경기 연속 골에 도전한다.올 시즌 리그 9호 골을 기록한 손흥민은 최근 리그 10경기에서 5골을 넣으며 완연한 회복세를 보이...',
    image: 'url("../img/news2.jpeg")',
    name: 'Iron Man',
    country: 'Taiwan',
    viewers: '24,982',
    profile: '"../img/profile2.jpeg"',
    topic: 'politics',
  },
  {
    title: '"나폴리 우승, 이번주 안돼".. 라치오 감독도 단장도 한목소리 다짐',
    content:
      '이 경기는 나폴리의 우승과 직결된다는 점에서 많은 팬들의 관심이 쏠려 있다. 2위 라치오가 이날 경기에서 이기지 못할 경우 나폴리의 세리에 A 우승이 눈앞에 다가서기 때문이다. 나폴리가 인테르-라치오전에 이어 열리는 살레르니타나와 맞대결에서 승리할 경우 33년 만의 우승을 확정짓게 된다. ',
    image: 'url("../img/news3.jpeg")',
    name: 'Johnny Depp',
    country: 'Argentina',
    viewers: '18,403',
    profile: '"../img/profile3.jpeg"',
    topic: 'politics',
  },
  {
    title: '[단독]현대차, 아이오닉6 N 개발 착수…"고성능 전기차로 中 승부수"',
    content:
      '아이오닉6 N은 제품 개발을 거쳐 2025년 하반기부터 현대차 아산공장에서 내수와 유럽·호주 수출 물량을 우선 생산한다. 2026년 초부터는 북미·중국 물량을 추가로 생산한다. 호주 등을 위해 좌핸들 차량 외에 우핸들 차량도 선보인다.주력 시장은 중국이다. 현대차는 ',
    image: 'url("../img/news4.jpeg")',
    name: 'Jennifer Lawrence',
    country: 'Portugal',
    viewers: '18,260',
    profile: '"../img/profile4.jpeg"',
    topic: 'politics',
  },
  {
    title: '바이든, ‘요즘 신나’…“1조원 날린 폭스 뉴스, 공짜밥 먹으러” 농담',
    content:
      '조 바이든 미국 대통령이 백악관 출입기자들과의 연례 만찬 행사에서 손해배상 소송에 대해 7억8750만달러(약 1조560억원)를 합의금으로 물기로 한 <폭스 뉴스>를 마음껏 놀렸다.바이든 대통령은 29일 저녁(현지시각) 백악관 출입기자협회 연례',
    image: 'url("../img/news5.jpeg")',
    name: 'Nick Fury',
    country: 'England',
    viewers: '10,992',
    profile: '"../img/profile5.jpeg"',
    topic: 'politics',
  },
  {
    title: '주가 상승엔 성장과 실적 확신이 필요하다',
    content:
      '최근 국내 증시가 불안한 흐름을 보이고 있다. 이달 중순까지 910포인트에 근접하며 빠르게 오르던 코스닥 지수는 며칠 새 10% 가까이 급락했고, 코스피 역시 5거래일 연속 하락하며 위축된 투자심리를 보여주고 있다. 같은 기간 글로벌 증시 역시 상승세가 꺾였기 때문에 증시 부진을 우리만의 일이라 볼 순 없다.',
    image: 'url("../img/news6.jpeg")',
    name: 'Leonardo DiCaprio',
    country: 'United States',
    viewers: '37,528',
    profile: '"../img/profile6.jpeg"',
    topic: 'politics',
  },
  {
    title: '"美 은행주 vs 코인시장"...힘겨운 줄다리기 [코인브리핑]',
    content:
      '최근 비트코인 가격이 미국 은행들의 위기와 맞물려 요동치고 있다. 은행들이 위기를 맞으면 비트코인은 급등하는 모습을 보이고, 위기를 극복하면 급락하는 모습을 반복하고 있다.전문가들은 "비트코인이 대안적인 자산으로서 인정받기 시작했다"는 긍정론부터 "이슈에 변동성이 커지는 것은 그 만큼 펀더멘털(기초체력)이...',
    image: 'url("../img/news6.jpeg")',
    name: 'Leonardo DiCaprio',
    country: 'United States',
    viewers: '37,528',
    profile: '"../img/profile7.jpeg"',
    topic: 'politics',
  },
  {
    title: '주가 상승엔 성장과 실적 확신이 필요하다',
    content:
      '최근 국내 증시가 불안한 흐름을 보이고 있다. 이달 중순까지 910포인트에 근접하며 빠르게 오르던 코스닥 지수는 며칠 새 10% 가까이 급락했고, 코스피 역시 5거래일 연속 하락하며 위축된 투자심리를 보여주고 있다. 같은 기간 글로벌 증시 역시 상승세가 꺾였기 때문에 증시 부진을 우리만의 일이라 볼 순 없다.',
    image: 'url("../img/news6.jpeg")',
    name: 'Leonardo DiCaprio',
    country: 'United States',
    viewers: '37,528',
    profile: '"../img/profile8.jpeg"',
    topic: 'politics',
  },
  {
    title: '주가 상승엔 성장과 실적 확신이 필요하다',
    content:
      '최근 국내 증시가 불안한 흐름을 보이고 있다. 이달 중순까지 910포인트에 근접하며 빠르게 오르던 코스닥 지수는 며칠 새 10% 가까이 급락했고, 코스피 역시 5거래일 연속 하락하며 위축된 투자심리를 보여주고 있다. 같은 기간 글로벌 증시 역시 상승세가 꺾였기 때문에 증시 부진을 우리만의 일이라 볼 순 없다.',
    image: 'url("../img/news6.jpeg")',
    name: 'Leonardo DiCaprio',
    country: 'United States',
    viewers: '37,528',
    profile: '"../img/profile9.jpeg"',
    topic: 'politics',
  },
  {
    title: '주가 상승엔 성장과 실적 확신이 필요하다',
    content:
      '최근 국내 증시가 불안한 흐름을 보이고 있다. 이달 중순까지 910포인트에 근접하며 빠르게 오르던 코스닥 지수는 며칠 새 10% 가까이 급락했고, 코스피 역시 5거래일 연속 하락하며 위축된 투자심리를 보여주고 있다. 같은 기간 글로벌 증시 역시 상승세가 꺾였기 때문에 증시 부진을 우리만의 일이라 볼 순 없다.',
    image: 'url("../img/news6.jpeg")',
    name: 'Leonardo DiCaprio',
    country: 'United States',
    viewers: '37,528',
    profile: '"../img/profile10.jpeg"',
    topic: 'politics',
  },
  {
    title: '주가 상승엔 성장과 실적 확신이 필요하다',
    content:
      '최근 국내 증시가 불안한 흐름을 보이고 있다. 이달 중순까지 910포인트에 근접하며 빠르게 오르던 코스닥 지수는 며칠 새 10% 가까이 급락했고, 코스피 역시 5거래일 연속 하락하며 위축된 투자심리를 보여주고 있다. 같은 기간 글로벌 증시 역시 상승세가 꺾였기 때문에 증시 부진을 우리만의 일이라 볼 순 없다.',
    image: 'url("../img/news6.jpeg")',
    name: 'Leonardo DiCaprio',
    country: 'United States',
    viewers: '37,528',
    profile: '"../img/profile1.jpeg"',
    topic: 'politics',
  },
  ////////////////////////////////
];

newsTitle.innerText = pettitions[0].title;
newsSub.innerText = pettitions[0].content;
box1.style.backgroundImage = pettitions[0].image;
newsProfile.style.backgroundImage = pettitions[0].image;
newsId.innerText = pettitions[0].name;
newsCountry.innerText = pettitions[0].country;
viewers.innerText = pettitions[0].viewers;

smallNews.forEach((newBox, index) => {
  smallNews[index].style.backgroundImage = pettitions[index].image;
  smallNews[index].style.backgroundSize = 'cover';
  newBox.addEventListener('mouseenter', () => {
    newBox.style.borderBottom = '6px solid #2DB400';

    if (index === 0) {
      box1.style.backgroundImage = pettitions[0].image;
      newsTitle.innerText = pettitions[0].title;
      newsSub.innerText = pettitions[0].content;
      newsProfile.style.backgroundImage = pettitions[0].image;
      newsId.innerText = pettitions[0].name;
      newsCountry.innerText = pettitions[0].country;
      viewers.innerText = pettitions[0].viewers;
    } else {
      box1.style.backgroundImage = pettitions[index].image;
      newsTitle.innerText = pettitions[index].title;
      newsSub.innerText = pettitions[index].content;
      newsProfile.style.backgroundImage = pettitions[index].image;
      newsId.innerText = pettitions[index].name;
      newsCountry.innerText = pettitions[index].country;
      viewers.innerText = pettitions[index].viewers;
    }
  });
  newBox.addEventListener('mouseleave', () => {
    newBox.style.borderBottom = 'none';
    box1.style.backgroundImage = pettitions[0].image;
    newsTitle.innerText = pettitions[0].title;
    newsSub.innerText = pettitions[0].content;
    newsProfile.style.backgroundImage = pettitions[0].image;
    newsCountry.innerText = pettitions[0].country;
    viewers.innerText = pettitions[0].viewers;
  });
});

for (var index = 0; index < newsTitles.length; index++) {
  newsTitles[index].innerText = pettitions[index].title;
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
            <div class="photo"><img src=${obj.profile} style="width: 145px; height: 145px; object-fit: cover;"></div> 
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
  const itemsToLoad = pettitions.slice(idx, idx + inc);
  itemsToLoad.forEach(createItem);
  idx += inc;
}

button.addEventListener('click', loadItems);
