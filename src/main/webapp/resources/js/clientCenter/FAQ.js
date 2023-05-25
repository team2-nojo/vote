$(".question").click(function() {
    $(this).next(".answer").stop().slideToggle(300);
    $(this).toggleClass('on').siblings().removeClass('on');
    $(this).next(".answer").siblings(".answer").slideUp(300); // 1개씩 펼치기
  });
  
  
  const button = document.getElementById("button2");
  const buttons = document.getElementById("button3");
  const buttonsa = document.getElementById("button4");

  button.addEventListener("click", e => {
    if(loginUserNo == ""){
      alert("로그인 후 이용해주세요")
      e.preventDefault();
      location.href = '/user/login';
  } else {
    location.href = '/clientCenter/QNA';
  }
  });

  buttons.addEventListener("click", e => {
    if(loginUserNo == ""){
      alert("로그인 후 이용해주세요")
      e.preventDefault();
      location.href = '/user/login';
  } else {
    location.href = '/clientCenter/QNA3';
  }
  });

  buttonsa.addEventListener("click", e => {
    if(loginUserNo == ""){
      alert("로그인 후 이용해주세요")
      e.preventDefault();
      window.location.href = '/user/login';
  } else {
    location.href = '/clientCenter/chatbot';
  }

  });


  const buttList = document.getElementById("button1");

buttList.addEventListener("click", e => {
    if(e.target.classList.contains("confirm")){
        buttList.classList.toggle("confirm")
    } else {
      buttList.classList.remove("confirm")
    }
  });

  // 로고 클릭시 메인페이지
document.getElementById("logoimg").addEventListener("click", () => {
    window.location.href = '/vote/mainFrame.html';
  });

  
  // 프레임 불러오기
  document.getElementById("startPetitions").addEventListener("click",function () {
      document.getElementById("mf").innerHTML = '<iframe id="iframe" onload="iframeLoaded()" frameborder = "0" src="startPetitions/start_a_petition.html"></iframe>';
  });
  
  document.getElementById("myPetitions").addEventListener("click",function () {
    document.getElementById("mf").innerHTML = '<iframe id="iframe" onload="iframeLoaded()" frameborder = "0" src="/vote/myPetitions/myPetitions/login_mypettitions.html"></iframe>';
  });
  
  document.getElementById("browse").addEventListener("click",function () {
    document.getElementById("mf").innerHTML = '<iframe id="iframe" onload="iframeLoaded()" frameborder = "0" src="browse/browser.html"></iframe>';
  });
  
  // 프레임 크기 변동
  function iframeLoaded() {
    let frame = document.getElementById('iframe');
    let mheight = document.getElementById('mf');
    let height = frame.contentWindow.document.body.scrollHeight;
    let width = frame.contentWindow.document.body.scrollWidth;
  
    mheight.height = height + "px";
    mheight.width = width + "px";
  
    frame.height = height + 100 + "px";
    frame.width = width + 100 + "px"
  }