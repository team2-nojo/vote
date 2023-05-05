<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>main</title>
    <link rel="stylesheet" href="/resources/css/common/maincontent.css">
    <link rel="stylesheet" href="/resources/css/common/maincontent2.css">
</head>
<body>
    <header>
        <jsp:include page="/WEB-INF/views/common/header.jsp" />
    </header>
    <main>
         <section class="section1">
      <div class="container id="mf">
        <div style="margin-top: 100px;">
          <h1 class="title">당신의 투표를 기다립니다.</h1>
          <h3 class="subTitle">508,140,283명이 행동에 나섰습니다. 매일 승리하십시오.</h3>
          <button class="titleBtn">청원시작</button>
        </div>
      </div>
     </section>
      <div class="container2">
        <div class="item box1"><span id="victory-btn">청원 승리!</span><br><br>

        <a href="">로그인</a><br>
        <a href="/myPage">MyPage</a><br>
        <a href="/myPetitions/myPetitions">MyPetitions</a><br>
        <a href="/writePettition">Startpetitions</a><br>
        <a href="/help">help</a><br>
        <a href="">Admin</a><br>

        </div>
        <div class="item box2" id="newsTitle">
          <div id="newsTitle"><h3 id="news-title">d</h3></div>
          <div id="newsContent"><h5 id="news">d<a href="#" id="more">More</a></div>
          </h5>
        </div>
        <div class="item box3">
          <div class="news-id"></div>
          <div class="main-news-id-container">
            <div id="main-news-id-box">
            <div id="main-news-id"></div>
            <div id="main-news-country"></div>
          </div>
          </div>
        </div>
        <div class="item box4">
          <div class="news-view">
            <i class="fa-solid fa-users" style="color: #1dbf27; font-size: 15px; margin-left: 5px;"></i><span id="view">s</span>
            <div id='supporter' style="font-size: 15px; margin-bottom: 0;">Supporters</div>
          </div>
        </div>
     
        </div>
        
      </div>
      <div class="container3">
        <div class="item2 box6"></div>
        <div class=" box12 small-news"><a href=""></a></div>
        <div class="item2 box7"></div>
        <div class="item2 box8"></div>
        <div class="item2 box9"></div>
        <div class="item2 box10"></div>
        <div class="item2 box11"></div>
        <div class="box13 small-news"><a href="#"></a></div>
        <div class="box14 small-news"><a href="#"></a></div>
        <div class="box15 small-news"><a href="#"></a></div>
        <div class="box16 small-news"><a href="#"></a></div>
        <div class="box17 small-news"><a href="#"></a></div>
      </div>
      
      <i class="fa-solid fa-angle-up fa-rotate-90" id="slide-btn2" style="color: #a9aaad;"></i>
      <h2 style="margin: 0 auto; width: 960px; font-weight: bold;">What's happening on VOTE.org</h2>
    <section class="main-section">
      <div class="container4">
        <div>
        <ul class="content2">
          <li class="content pettition1">
            <div class="pettition1 pet-title">
              <i class="fa-solid fa-tag fa-rotate-90" style="color: #000000; margin:15px"></i>
              <span>Trending in Environment</span>
              <a href="#" style="text-decoration: underline;">See more</a>
            </div>
            <div class="pettition1 article">
              <div class="article-title"><h3>“강북 끝자락인데 1억 올랐다고?”...재건축 바람에 도봉구 집값 ‘꿈틀’ [김경민의 부동산NOW]</h3></div>
              <div class="text">
                <div>
                  노후 단지가 밀집한 서울 도봉구 일대에 재건축 바람이 불면서 부동산업계 관심이 뜨겁다. 일부 단지 매매가도 서서히 상승세를 타는 중이다.
                국토교통부 실거래가 공개시스템에 따르면 도봉구 창동 ‘동아아파트(600가구)’ 전용 89㎡는 최근 8억원 넘는 가격에 잇따라 실거래됐다. 
                지난 2월 8억5000만원, 3월에는 8억2500만원에 주인을 찾았다. 지난해 3월 실거래가(7억2000만원) 대비 ... 
                <a href="#">더보기</a>
              </div>
            </div>
            <div class="photo"><img src="/resources/images/sample//news6.jpeg" style="width: 145px; height: 145px; object-fit: cover;"></div> 
            </div>
            <div class="pettition1 id">
              <span class="id-profile"><img src="/resources/images/sample//news6.jpeg" style="height: 28px; margin: 5px;" alt=""></span>
              <span>Coby</span>
              <a href="#"><i class="fa-solid fa-users" style="color: #1dbf27; font-size: 15px; margin-right: 5px;"></i>852 Supporters</a>
            </div>
          </li>
          <li class="content pettition1">
            <div class="pettition1 pet-title">
              <i class="fa-solid fa-tag fa-rotate-90" style="color: #000000; margin:15px"></i>
              <span>Trending in Environment</span>
              <a href="#" style="text-decoration: underline;">See more</a>
            </div>
            <div class="pettition1 article">
              <div class="article-title"><h3>단순 게스트? 임창정, 투자자 행사서 “번 돈 다 주겠다”</h3></div>
              <div class="text"><div>최근 외국계 증권사 소시에테제네랄(SG)증권발 주가 하락 사태와 관련해 수십억원의 손해를 본 것으로 알려진 가수 
                임창정이 주가 조작 의심 세력이 주최한 파티에 참석했다는 의혹에 대해 참석사실을 인정하면서도 “게스트 자격으로 참석한 것”이라는 입장을 밝혔다.
                임창정의 법률 대리인인 법무법인 대환은 “임창정이 해당 파티에 참석한 것은 당시 엔터테 ... <a href="#">더보기</a></div></div>
                <div class="photo"><img src="/resources/images/sample/news2.jpeg" style="width: 145px; height: 145px; object-fit: cover;"></div> 
            </div>
            <div class="pettition1 id">
              <span class="id-profile"><img src="/resources/images/sample/profile2.jpeg" style="height: 28px; margin: 5px;" alt=""></span>
              <span>Jayden</span>
              <a href="#"><i class="fa-solid fa-users" style="color: #1dbf27; font-size: 15px; margin-right: 5px;"></i>852 Supporters</a>
            </div>
          </li>
          <li class="content pettition1">
            <div class="pettition1 pet-title">
              <i class="fa-solid fa-tag fa-rotate-90" style="color: #000000; margin:15px"></i>
              <span>Trending in Environment</span>
              <a href="#" style="text-decoration: underline;">See more</a>
            </div>
            <div class="pettition1 article">
              <div class="article-title"><h3>[속보] 충북 옥천서 규모 3.1 지진…“흔들림 느꼈다” 신고 80여건</h3></div>
              <div class="text"><div>충북 옥천군 동쪽 16㎞ 지역에서 30일 오후 7시3분 규모 3.1 지진이 발생했다고 기상청이 밝혔다.
                진원은 옥천군 둥부에 있는 청성면으로 파악되며, 진원의 깊이는 6㎞로 추정된다. 
                기상청에 따르면 오후 7시20분까지 지진을 느꼈다는 신고 80여건이 소방당국에 접수됐다.
                기상청 관계자는 “이번 지진은 올해 3번째로 규모가 컸다”며 “올해 한반도와 주변 해역에서 발생한 지진 가운데 규모 2.0 이상 지진은 이번까지 합쳐 36번째”라고 밝혔다. 
                이번 지진은 계기진도가... <a href="#">더보기</a></div></div>
                <div class="photo"><img src="/resources/images/sample/news3.jpeg" style="width: 145px; height: 145px; object-fit: cover;"></div>  
            </div>
            <div class="pettition1 id">
              <span class="id-profile"><img src="/resources/images/sample/profile3.jpeg" style="height: 28px; margin: 5px;" alt=""></span>
              <span>Daniel</span>
              <a href="#" style="text-decoration: underline;"><i class="fa-solid fa-users" style="color: #1dbf27; font-size: 15px; margin-right: 5px;"></i>2,510 Supporters</a>
            </div>
          </li>
          <li class="content pettition1">
            <div class="pettition1 pet-title">
              <i class="fa-solid fa-tag fa-rotate-90" style="color: #000000; margin:15px"></i>
              <span>Trending in Environment</span>
              <a href="#" style="text-decoration: underline;">See more</a>
            </div>
            <div class="pettition1 article">
              <div class="article-title"><h3>한 곳에서 ‘2등 로또’ 103장…“조작 아닙니다” 국민 초청</h3></div>
              <div class="text"><div>정부가 최근 불거진 ‘로또 복권 조작 논란’을 해소하기 위해 추첨 현장을 국민에게 공개하기로 했다.
                30일 기획재정부는 오는 6월 로또 추첨 현장을 국민들이 참관할 수 있게 대규모 행사를 계획했다고 밝혔다.
                앞서 지난달 4일 추첨한 로또 1057회차에는 1억 1252만장이 팔렸고, 2등 당첨이 664건이나 나왔다. 이 중 103건이 모두 서울 동대문구 한 판매점에서 나와 조작 논란이 일었다.
                복권위는 2등 당첨 664장 중에서 609장은 특정 번호를 수동으로 선택한 것으로, 개개인이 선호하는 번호 조합이 우연 ... <a href="#">더보기</a></div></div>
                <div class="photo"><img src="/resources/images/sample/news4.jpeg" style="width: 145px; height: 145px; object-fit: cover;"></div> 
            </div>
            <div class="pettition1 id">
              <span class="id-profile"><img src="/resources/images/sample/profile4.jpeg" style="height: 28px; margin: 5px;" alt=""></span>
              <span>Stella</span>
              <a href="#"><i class="fa-solid fa-users" style="color: #1dbf27; font-size: 15px; margin-right: 5px;"></i>1,623 Supporters</a>
            </div>
          </li>
        </ul>
        <button id="btn">더보기 버튼</button>
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
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <script src="/resources/js/common/mainFrame.js">
    </script>
</body>
</html>