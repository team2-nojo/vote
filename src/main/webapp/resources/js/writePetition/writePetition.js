let currentPage = 0; // 현재 페이지 0으로 설정
const prevBtn = document.getElementById('prevBtn'); // 이전 버튼
const nextBtn = document.getElementById('nextBtn'); // 다음 버튼
const sbmtBtn = document.getElementById('submitBtn'); // 제출 버튼
const pages = document.getElementsByClassName('page'); // 페이지 배열
const progressBar = document.querySelector('.wp-progress'); // 프로그레스 바

const inputTitle = document.getElementById('inputTitle'); // 제목 input

const titleCountContainer = document.getElementById('titleCountContainer'); // 제목 글자 수 카운트컨테이너
const titleCharCount = document.getElementById('titleCharCount'); // 제목 글자 수 표시 div
const btnContainer = document.getElementById('btnContainer');
const titleCharCheck = () =>{
  const remainingChars = inputTitle.value.length;
  titleCharCount.textContent = String(remainingChars);
  if(remainingChars>90){
    titleCountContainer.classList.add('red');
    nextBtn.disabled = true;
  } else if(remainingChars == 0){
    nextBtn.disabled = true;
  } else {
    titleCountContainer.classList.remove('red');
    nextBtn.disabled = false;
  }
}
const updatePage = () => {
  progressBar.style.width = ((currentPage+1) / pages.length) * 100 + '%';
  for(let i=0;i<pages.length;i++)
    if(i == currentPage) pages[i].classList.add('current');
    else pages[i].classList.remove('current');
  if(currentPage == 0) prevBtn.style.display = 'none';
  else prevBtn.style.display = 'block';
  if(currentPage == pages.length-1){
    nextBtn.style.display = 'none';
    sbmtBtn.style.display = 'block';
    btnContainer.style.width = '960px';
    btnContainer.classList.add('sticky');
  }
  else {
    nextBtn.style.display = 'block';
    sbmtBtn.style.display = 'none';
    btnContainer.style.width = '600px';
  }
  if(currentPage == 2){
    titleCharCheck();
  } else {
    nextBtn.disabled=false;
  }
}

// 이전 버튼 클릭 시 currentPage 감소 후 페이지 업데이트
prevBtn.addEventListener('click', () => {
  if (currentPage > 0)
    currentPage--;
  updatePage();
});
// 다음 버튼 클릭 시 currentPage 증감 후 페이지 업데이트
nextBtn.addEventListener('click', () => {if (currentPage < pages.length) currentPage++; updatePage();});

const page1Items = document.querySelectorAll('.item');
const page1Tip = document.querySelector('#page1Tip');
page1Items.forEach(item => {
  item.addEventListener('click', e => {
    page1Items.forEach(item => {
      item.classList.remove('selectedItem');
    })
    item.classList.add('selectedItem');
    if(e.target == page1Items[0]) page1Tip.style.display='flex';
    else page1Tip.style.display='none';
  })
})
inputTitle.addEventListener('input', titleCharCheck);

updatePage();