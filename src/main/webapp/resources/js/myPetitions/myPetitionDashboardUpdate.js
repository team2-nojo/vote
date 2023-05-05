
/* 이메일 미리보기 모달 */
const modal = document.getElementById("modal")
const submit = document.getElementById("submit")

/* 이메일 미리보기 버튼 클릭 시 */
submit.addEventListener("click", e => {
    modal.style.display = "flex";
    document.body.style.overflowY = "hidden";
})

/* 모달창의 클로즈(x) 버튼을 누르면 모달창이 꺼지게 하기 */
const closeBtn = modal.querySelector(".close-area")
closeBtn.addEventListener("click", e => {
    modal.style.display = "none"
    document.body.style.removeProperty('overflow');
})



/* 모달창 바깥 영역을 클릭하면 모달창이 꺼지게 하기 */
modal.addEventListener("click", e => {
    const evTarget = e.target
    if(evTarget.classList.contains("modal-overlay")) {
        modal.style.display = "none";
    }
})


/* 모달창이 켜진 상태에서 ESC 버튼을 누르면 모달창이 꺼지게 하기 */
window.addEventListener("keyup", e => {
    if(modal.style.display === "flex" && e.key === "Escape") {
        modal.style.display = "none"
    }
})



/* 이메일 미리보기 모달창 내부 닫기 버튼 */
// const closeModal = modal.getElementById("closeModal")
// closeModal.addEventListener("click", e => {
//     modal.style.display = "none";
//     document.body.style.removeProperty('overflow');
// })


// modal.addEventListener("click", e => {
//     const evTarget = e.target
//     if(evTarget.classList.contains("modal-overlay")) {
//         modal.style.display = "none"
//     }
// })

// window.addEventListener("keyup", e => {
//     if(modal.style.display === "flex" && e.key === "Escape") {
//         modal.style.display = "none"
//     }
// })

