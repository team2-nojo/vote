/* 팁보기 */
function tipHover(input){
    const inputI = document.getElementById(`${input}I`);
    const inputP = document.getElementById(`${input}P`);
    inputI.addEventListener("mouseover", () =>{inputP.style.display = "block";});
    inputI.addEventListener("mouseout", () =>{inputP.style.display = "none";});
};
tipHover("graph");


/* graph */
const animatedPath = document.getElementById('animated-path');
const length = animatedPath.getTotalLength();
animatedPath.style.strokeDasharray = length;
animatedPath.style.strokeDashoffset = length;

function animatePath(input) {
    document.addEventListener('DOMContentLoaded', () => {
        let max = 0;
        if(input == (Math.ceil(input / 5) * 5)){
            max = Math.ceil((input + 1) / 5) * 5;
        }else{
            max = Math.ceil(input / 5) * 5;
        }
        const targetOffset = length - (length * input / max);
        animatedPath.style.transition = 'none';

        requestAnimationFrame(() => {
            animatedPath.style.transition = 'stroke-dashoffset 1s ease-in-out';
            animatedPath.style.strokeDashoffset = targetOffset;
        });
    });
}
animatePath(likeUserCount);




