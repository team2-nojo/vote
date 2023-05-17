/* 단계별 달성목표 변경 함수 구현필요
    5의배수?
    5명 / 10 / 15 / 20 ...
*/

/* graph */
const animatedPath = document.getElementById('animated-path');
const length = animatedPath.getTotalLength();
animatedPath.style.strokeDasharray = length;
animatedPath.style.strokeDashoffset = length;

function animatePath(max) {
    document.addEventListener('DOMContentLoaded', () => {
        const targetOffset = length - (length * max / (Math.ceil(max / 5) * 5));
        animatedPath.style.transition = 'none';

        requestAnimationFrame(() => {
            animatedPath.style.transition = 'stroke-dashoffset 1s ease-in-out';
            animatedPath.style.strokeDashoffset = targetOffset;
        });
    });
}


animatePath(likeUserCount);


/* 팁보기 */
function tipHover(input){
    const inputI = document.getElementById(`${input}I`);
    const inputP = document.getElementById(`${input}P`);
    inputI.addEventListener("mouseover", () =>{inputP.style.display = "block";});
    inputI.addEventListener("mouseout", () =>{inputP.style.display = "none";});
};
tipHover("graph");