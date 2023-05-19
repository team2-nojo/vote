<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>main</title>
    <link rel="stylesheet" href="resources/css/mainPage/maincontent.css">
    <link rel="stylesheet" href="resources/css/mainPage/maincontent2.css">
</head>
<body>
    <%-- header --%>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <main>

      <section class="section1">

      <div class="container id="mf">
        <div style="margin-top: 100px;">
          <h1 class="title">당신의 투표를 기다립니다.</h1>
          <h3 class="subTitle">508,140,283명이 행동에 나섰습니다. 매일 승리하십시오.</h3>

          <a href="/adminLogin"><button class="titleBtn">청원시작</button></a>
        </div>
      </div>
    </section>
      <div class="container2">
        <a href="#" style="cursor:pointer" id="mainNewsLink"><div class="item box1"><img src="${mainPtList[0].petitionImage}" style="height: 288px; width: 477px; object-fit: cover; position: absolute;" id="mainPhoto"><span id="victory-btn">청원 승리!</span></div>
        <div class="item box2" id="newsTitle">
          <div id="newsTitle">
            <h3 id="news-title">${mainPtList[0].petitionTitle}</h3></a>
          
            <%-- <input type="hidden" name="petitionContent" value="${mainPtList[0].petitionContent}">
            <input type="hidden" name="petitionLikeCount" value="${mainPtList[0].petitionLikeCount}">
            <input type="hidden" name="userAddress" value="${mainPtList.userAddress}"> --%>
          </div>
          <div id="newsContent">
            <h5 id="news">${mainPtList[0].petitionContent}</div>
          </h5>
        
        </div>
        <div class="item box3">
          <div id="main-user-image"><img src="${mainPtList[0].userImage}" style="height: 45px; width:45px; border-radius: 50%; position: absolute; margin: 5px;" id="news-id"></div>

          <div class="main-news-id-container">
            <div id="main-news-id-box">
            <div id="main-news-nickname" style="margin:7px;">${mainPtList[0].userNickname}</div>
            <div id="main-news-address" style="margin-left:7px;">${mainPtList[0].userAddress}</div>

            
          </div>
          </div>
        </div>
        <div class="item box4">
          <div class="news-view">
              <i class="fa-solid fa-users" style="color: #1dbf27; font-size: 15px; margin-left: 5px;"></i><span id="view">${mainPtList[0].petitionViewCount}</span>
              <div id='supporter' style="font-size: 15px; margin-bottom: 0;">Supporters</div>
            </div>
          </div>
        </div>
      </div>
  
      <%-- 메인에 보여지는 6개 박스에 들어가는 청원 --%>
      <div class="container3">
        <c:forEach var="mainPt" items="${mainPtList}">
      <div class="box6">
        <img src="${mainPt.petitionImage}" style="height: 100px; width: 150px; object-fit: cover; position: absolute;" class="item2">
      </div>
          <div class="box13 small-news"><a href="#">${mainPt.petitionTitle}</a></div>
            <input type="hidden" name="petitionContent" value="${mainPt.petitionContent}">
            <input type="hidden" name="userImage" value="${mainPt.userImage}">
            <input type="hidden" name="userAddress" value="${mainPt.userAddress}">
            <input type="hidden" name="userNickname" value="${mainPt.userNickname}">
            <input type="hidden" name="petitionViewCount" value="${mainPt.petitionViewCount}">
        </c:forEach>
      </div>
      <i class="fa-solid fa-angle-up fa-rotate-90" id="slide-btn2" style="color: #a9aaad;"></i>
      <h2 style="margin: 0 auto; width: 960px; font-weight: bold;">What's happening on VOTE.org</h2>
    <section class="main-section">
      <div class="container4">
        <div>
         <ul class="content2">
           <c:forEach var="mainPetition" items="${mainPetitionList}">
            <li class="content pettition1">
            <div class="pettition1 pet-title">
              <i class="fa-solid fa-tag fa-rotate-90" style="color: #000000; margin:15px"></i>
              <span>Trending in Environment</span>
              <a href="#" style="text-decoration: underline;">See more</a>
            </div>
            <div class="pettition1 article">
              <div class="article-title"><h3>${mainPetition.petitionTitle}</h3></div>
              <div>
                <div>${mainPetition.petitionContent}<a href="#">더보기</a></div>
           
              </div>
              <div class="photo"><img src="${mainPetition.petitionImage}" style="width: 145px; height: 145px; object-fit: cover;"></div> 
            </div>
            <div class="pettition1 id">
              <span id="id-profile"><img src="${mainPetition.userImage}" style="height: 28px; margin: 5px;" class="profile-image"></span>
              <span>${mainPetition.userNickname}</span>
              <a href="#"><i class="fa-solid fa-users" style="color: #1dbf27; font-size: 15px; margin-right: 5px;"></i>${mainPetition.petitionLikeCount} Supporters</a>
            </div>
          </li>
            </c:forEach>
        </ul>
        <button class="moreBtn" id="btn2">버튼</button>
      </div>


      
        <div class="container5">
          <h2 id="icon-topic">FEATURED TOPICS</h2>
          <ul>
            <li class="title-list"><a href="#" class="title-icon">북한인권</a></li>
            <li class="title-list"><a href="#" class="title-icon">러-우크라이나 전쟁</a></li>
            <li class="title-list"><a href="#" class="title-icon">달러 강세</a></li>
            <li class="title-list"><a href="#" class="title-icon">미-중 갈등</a></li>
            <li class="title-list"><a href="#" class="title-icon">윤석열</a></li>
          </ul>
        </div>
      </div>
    </section>
    <section class="side-section">
    </section>
    </main>
    <%-- footer --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <%-- main.js --%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/resources/js/mainPage/mainPage.js"></script>
  <script>
    const userImg = $
  </script>
</body>
</html>