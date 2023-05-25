const signupId = document.getElementById('signup-id');
const signupPw = document.getElementById('signup-pw');
const signupPww = document.getElementById('signup-pww');
const idBtn = document.getElementById('id-btn');
const menuMember = document.getElementById('menu-member');
const removeHover = document.getElementsByClassName('remove-hover');
const langDropDown = document.getElementById('menu-lang-drop-down');
const langList = document.getElementsByClassName('lang');
const menuList = document.getElementsByClassName('menuList');
const korean = document.getElementById('korean');
const english = document.getElementById('english');
const chinese = document.getElementById('chinese');
const japanese = document.getElementById('japanese');
const voteLogo = document.getElementById('vote_logo');

const menu = document.querySelector('.menu');
const subBar = document.querySelector('.menu > .sub');

let subToggle = true;

function swapLanguages(lang1, lang2) {
  const tempText = langList[lang1].childNodes[2].textContent;
  const tempId = langList[lang1].id;
  langList[lang1].childNodes[2].textContent =
    langList[lang2].childNodes[2].textContent;
  langList[lang1].id = langList[lang2].id;
  langList[lang2].childNodes[2].textContent = tempText;
  langList[lang2].id = tempId;
}

function show_sub() {
  if (subToggle) {
    subBar.style.height = '160px';
    subToggle = !subToggle;
  } else {
    subBar.style.height = '0px';
    subToggle = !subToggle;
  }
}
menu.querySelector(':first-child').addEventListener('click', show_sub);

for (let i = 1; i < langList.length; i++) {
  langList[i].addEventListener('click', function () {
    swapLanguages(0, i);

    subBar.style.height = '0px';
    subToggle = !subToggle;
  });
}

function changeImageSrc(imgElement, newSrc) {
  imgElement.src = newSrc;
}

// hover 이벤트에 대한 처리
const menuItems = document.querySelectorAll('.menu > .sub li');

menuItems.forEach((menuItem) => {
  const imgElement = menuItem.querySelector('.menu-icon');
  const originalSrc = imgElement.src;
  const hoverSrc = originalSrc.replace('black', 'white'); // 이미지 파일명에 따라 수정

  menuItem.addEventListener('mouseover', () => {
    changeImageSrc(imgElement, hoverSrc);
  });

  menuItem.addEventListener('mouseout', () => {
    changeImageSrc(imgElement, originalSrc);
  });
});

const userIcon = document.querySelector('.fa-user');
const bellIcon = document.querySelector('.fa-bell');
const commentIcon = document.querySelector('.fa-comment');

userIcon.addEventListener('mouseover', () => {
  userIcon.style.color = '#2db400';
});
userIcon.addEventListener('mouseout', () => {
  userIcon.style.color = 'white';
});

bellIcon.addEventListener('mouseover', () => {
  bellIcon.style.color = '#2db400';
});
bellIcon.addEventListener('mouseout', () => {
  bellIcon.style.color = 'white';
});

commentIcon.addEventListener('mouseover', () => {
  commentIcon.style.color = '#2db400';
});
commentIcon.addEventListener('mouseout', () => {
  commentIcon.style.color = 'white';
});

const helpmenu = document.getElementById('helpmenu');
