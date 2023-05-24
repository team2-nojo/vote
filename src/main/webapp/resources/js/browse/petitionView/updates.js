let index = 0;
let position = 0;
let go = 480;

let leftBtn = document.getElementById("leftBtn");
let rightBtn = document.getElementById("rightBtn");
let frames = document.querySelectorAll(".updatesFrame");
let frame = document.getElementsByClassName("frame");

function right(){

    if(index < frames.length){
        // leftBtn.removeAttribute('disabled')//뒤로 이동해 더이상 disabled가 아니여서 속성을 삭제한다.
        alert("확인");
        position += go;//IMAGE_WIDTH의 증감을 positionValue에 저장한다.
        
        alert(position);

    
        frame.style.transform = `translateX(${position}px)`;
        index += 1;
          //x축으로 positionValue만큼의 px을 이동한다.
        //   index += 1; //다음 페이지로 이동해서 pages를 1증가 시킨다.
    }
    if(index === frames.length){ //
        rightBtn.setAttribute('disabled', 'true')//마지막 장일 때 next버튼이 disabled된다.
    }

}
