let currentPage = 0; // 현재 페이지 0으로 설정
const prevBtn = document.getElementById('prevBtn'); // 이전 버튼
const nextBtn = document.getElementById('nextBtn'); // 다음 버튼
const sbmtBtn = document.getElementById('submitBtn'); // 제출 버튼
const pages = document.getElementsByClassName('page'); // 페이지 배열
const progressBar = document.querySelector('.wp-progress'); // 프로그레스 바
const btnContainer = document.getElementById('btnContainer');

// console.log('1');

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

  if (currentPage==1) {
    categorySelectCheck();
    
  } else if(currentPage == 2){
    titleCharCheck();
    inputTitle.focus();
  } else if(currentPage == 5){
    previewPageUpdate();
  } else {
    nextBtn.disabled=false;
  }
}
// 이전 버튼 클릭 시 currentPage 감소 후 페이지 업데이트
prevBtn.addEventListener('click', () => {if (currentPage > 0) currentPage--; updatePage(); });
// 다음 버튼 클릭 시 currentPage 증가 후 페이지 업데이트
nextBtn.addEventListener('click', () => {if (currentPage < pages.length) currentPage++; updatePage();});

updatePage();

/*********************************** page1 ********************************/
const scopeItems = document.querySelectorAll('.scope-item'); // 범위 목록
const page1Tip = document.querySelector('#page1Tip'); // 페이지1 팁

scopeItems.forEach(item => {
  item.addEventListener('click', e => {
    scopeItems.forEach(item => {
      item.classList.remove('selected-item');
    })
    item.classList.add('selected-item');
    if(e.target == scopeItems[0]) page1Tip.style.display='flex';
    else page1Tip.style.display='none';
  })
})
/**************************************************************************/

/*********************************** page2 ********************************/

/* 직접 입력 checked인 경우 directInputContainer 보이기 */
const directInputContainer = document.getElementById('directInputContainer');
const directInputCheckBox = document.getElementById('directInputCheckbox');
directInputCheckBox.addEventListener('change',()=>{
  if(directInputCheckBox.checked){
    directInputContainer.classList.remove('hidden');
  } else {
    directInputContainer.classList.add('hidden');
  }
})
/* 체크박스 하나라도 체크되어 있을 때에만 다음 버튼 활성화 */
// 함수 정의
const categoryItems = document.querySelectorAll('[name="categoryItem"]');
const categorySelectCheck = () =>{
  let flag = false;
  // 기본 카테고리 확인
  categoryItems.forEach(categoryItem => {
    if(categoryItem.checked) {
      flag = true;
      return;
    }
  })
  // 직접 입력 선택된 경우
  if(directInputCheckBox.checked) {
    // 입력한 카테고리가 있다면
    if(document.querySelector('.direct-input-item') != null){
      flag = true;
    }
  }
  // 플래그에 따라 다음 버튼 활성화/비활성화
  if(flag){
    nextBtn.disabled=false;
  } else {
    nextBtn.disabled=true;
  }
}
// 카테고리 아이템에 이벤트리스너 추가
categoryItems.forEach(categoryItem =>{
  categoryItem.addEventListener('change', () => {
    if(currentPage==1) categorySelectCheck();
  });
})
// 직접 입력에 이벤트리스너 추가
directInputCheckBox.addEventListener('change', () =>{
  if(currentPage==1) categorySelectCheck();
});
// 직접 입력하는 창 또는 버튼에 이벤트 리스너 추가(해야함)

const categoryInput = document.getElementById('categoryInput');
const directInputItemContainer = document.getElementById('directInputItemContainer');
const categoryInputBtn = document.getElementById('categoryInputBtn');
categoryInputBtn.addEventListener('click', () => {
  if(categoryInput.value.trim().length > 0){
    const item = document.createElement('label');
    item.classList.add("direct-input-item","category-item");
    item.innerHTML = `
      <input type="hidden" name="directInputCategory" value="${categoryInput.value}">
      ${categoryInput.value}
      <span>X</span>
    `
    directInputItemContainer.append(item);
  }
})



/**************************************************************************/

/*********************************** page3 ********************************/
const inputTitle = document.getElementById('inputTitle'); // 제목 input
const titleCountContainer = document.getElementById('titleCountContainer'); // 제목 글자 수 카운트컨테이너
const titleCharCount = document.getElementById('titleCharCount'); // 제목 글자 수 표시 div
// 타이틀 입력에 따른 다음 버튼 활성화/비활성화
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
inputTitle.addEventListener('input', titleCharCheck);

/**************************************************************************/

/*********************************** page3 ********************************/

const summernote = $('#summernote');
const content = document.getElementById('content');




/**************************************************************************/

const previewTitle = document.getElementById('previewTitle');
const previewContent = document.getElementById('previewContent');

const previewPageUpdate = () => {
  previewTitle.innerText = inputTitle.value;
  content.value = summernote.summernote('code');
  previewContent.innerHTML = content.value;
};