const animatedPath = document.getElementById('animated-path');
const length = animatedPath.getTotalLength();
animatedPath.style.strokeDashoffset = length;
animatedPath.style.strokeDasharray = -length;

// 입력된 숫자에 따라 애니메이션을 진행하는 함수
function animatePath(num) {
    const targetOffset = length - length * num / 20; // 입력된 숫자에 맞는 총 길이 계산
    animatedPath.style.transition = 'stroke-dashoffset 1s ease-in-out'; // 애니메이션 효과 설정
    animatedPath.style.strokeDashoffset = targetOffset;
}

animatePath(5);