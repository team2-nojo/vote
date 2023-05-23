const agree = document.querySelectorAll('.agree');
const disagree = document.querySelector('.disagree');
agree.forEach(el => {
    el.addEventListener('change', () => {
        if (el.checked) {
            disagree.checked = false;
        } else if (document.querySelectorAll('.agree:checked').length === 0) {
            disagree.checked = true;
        }
    })
})
disagree.addEventListener('change', () => {
    if (disagree.checked) {
        agree.forEach(el => {
            el.checked = false;
        })
    } else if (document.querySelectorAll('.agree:checked').length === 0) {
        agree.forEach(el=>{
            el.checked = true;
        })
    }
})