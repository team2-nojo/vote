let currentPage = 0;
const prevBtn = document.getElementById('prevBtn');
const nextBtn = document.getElementById('nextBtn');
const sbmtBtn = document.getElementById('submitBtn');
const pages = document.getElementsByClassName('page');
const progressBar = document.querySelector('.wp-progress');
const inputTitle = document.getElementById('inputTitle');
const countContainer = document.getElementById('countContainer');
const charCount = document.getElementById('charCount');
const btnContainer = document.getElementById('btnContainer');
const titleCharCheck = () =>{
  const remainingChars = inputTitle.value.length;
  charCount.textContent = String(remainingChars);
  if(remainingChars>90){
    countContainer.classList.add('red');
    nextBtn.disabled = true;
  } else if(remainingChars == 0){
    nextBtn.disabled = true;
  } else {
    countContainer.classList.remove('red');
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

prevBtn.addEventListener('click', () => {if (currentPage > 0) currentPage--; updatePage();})
nextBtn.addEventListener('click', () => {if (currentPage < pages.length) currentPage++;updatePage();});

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