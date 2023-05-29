// ---------------------------------------------------------------------------
// 웹소켓 테스트
// 1. SockJS 라이브러리 추가

// 2. SockJS를 이용해서 클라이언트용 웹소켓 객체 생성
let testSock = new SockJS("/alarmSock");

function sendMessage(CP, userNo, petitionNo){

    // 매개변수를 JS 객체에 저장
    let msg = {}; // 비어있는 객체

    // 객체에 일치하는 key가 없다면 자동으로 추가
    msg.CP = CP;
    msg.userNo = userNo; 
    msg.petitionNo = petitionNo; 

    // console.log(obj);

                // JS객체 -> JSON
    testSock.send(JSON.stringify(msg)); // 웹소켓 연결된 곳으로 메시지를 보냄

}



const alarmBox = document.getElementById("alarmBox");


// 웹소켓 객체(testSock)가 서버로 부터 전달 받은 메시지가 있을경우
document.addEventListener("DOMContentLoaded", function() {

    testSock.onmessage = e => {

        // e : 이벤트 객체
        // e.date : 전달 받은 메시지 (JSON)
        const msg = JSON.parse(e.data); // JSON -> JS객체
        console.log(msg);

        const alarmList = document.createElement("li");
        
        const div1 = document.createElement("div");
        div1.innerText = msg.petitionNo.substr(0,10) + "... 게시글에";
        
        const div2 = document.createElement("div");
        div2.innerText = msg.userNo + "님 께서 댓글을 작성하였습니다.";


        alarmList.append(div1, div2);

        alarmBox.append(alarmList);




        
    }

});