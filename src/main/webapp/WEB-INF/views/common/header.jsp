<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- font awesome 라이브러리 추가 + key 등록 -->
<script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/main.css">

<header>
  <section class="logo-menu-icon">
    <div class="header-logo"><a href="/"><img id="logoimg" src="/resources/images/common/Logo.png" /></a></div>
    <div class="header-menu">
      <ul>
        <li><a class="header-a" id="startPetitions" href="/writePetition">청원하기</a></li>
        <li><a class="header-a" id="myPetitions" href="/myPetitions/myPetitions">나의청원</a></li>
        <li><a class="header-a" id="browse" href="/browse/browseSearch/popular">둘러보기</a></li>
        <li><a class="header-a" id="Help" href="/clientCenter/FAQ">고객센터</a></li>
        <%-- 임시 --%>
        <div style="width: 150px; height: 57px; display:flex; flex-wrap: wrap; ">
          <form action="/user/login" method="post" style="margin-left : 5px;">
            <input type="hidden" name="userEmail" value="user02@kh.or.kr">
            <input type="hidden" name="userPw" value="pass02!">
            <button>user02</button>
          </form>
          <form action="/user/login" method="post" style="margin-left : 5px;">
            <input type="hidden" name="userEmail" value="user03@kh.or.kr">
            <input type="hidden" name="userPw" value="pass03!">
            <button>user03</button>
          </form>
          <form action="/user/login" method="post" style="margin-left : 5px;">
            <input type="hidden" name="userEmail" value="user04@kh.or.kr">
            <input type="hidden" name="userPw" value="pass04!">
            <button>user04</button>
          </form>
          <form action="/user/login" method="post" style="margin-left : 5px;">
            <input type="hidden" name="userEmail" value="user05@kh.or.kr">
            <input type="hidden" name="userPw" value="pass05!">
            <button>user05</button>
          </form>
          <form action="/user/login" method="post" style="margin-left : 5px;">
            <input type="hidden" name="userEmail" value="user06@kh.or.kr">
            <input type="hidden" name="userPw" value="pass06!">
            <button>user06</button>
          </form>
          <form action="/user/login" method="post" style="margin-left : 5px;">
            <input type="hidden" name="userEmail" value="user07@kh.or.kr">
            <input type="hidden" name="userPw" value="pass07!">
            <button>user07</button>
          </form>
        </div>
        <%-- 임시끝 --%>
      </ul>
    </div>
    <c:choose>
      <c:when test="${empty loginUser}">
        <div class="header-icon">
          <a class="header-a" href="/search/searchPetition"><i class="fa-sharp fa-solid fa-magnifying-glass"></i></a>
          <%-- <i class="fa-sharp fa-solid fa-user"></i>
          <i class="fa-sharp fa-solid fa-bell"></i> --%>
          <a class="header-a" href="/user/login" id="loginBtn">Log in</a>
        </div>
      </c:when>
      <%-- 로그인 되었을 때 --%>
      <c:otherwise>
        <div class="header-icon">
          <a class="header-a" href="/search/searchPetition"><i class="fa-sharp fa-solid fa-magnifying-glass"></i></a>
          <label for="userMenuToggle">

            <c:choose>
              <c:when test="${not empty loginUser.userImage}">
                <img class="user-image" src="${loginUser.userImage}" />
              </c:when>
              <c:otherwise>
                <i class="fa-sharp fa-solid fa-user header-a"></i>
              </c:otherwise>
            </c:choose>

          </label>
          <input type="checkbox" id="userMenuToggle">
          <div class="user-menu">
            <span>${loginUser.userNickname} 님</span>
            <span>${loginUser.userEmail}</span>
            <a class="header-a" href="/myPetitions/myPetitions">나의 청원</a>
            <a class="header-a" href="/myPage">마이페이지</a>
            <a class="header-a" href="/user/logout">로그아웃</a>
          </div>
          <label for="alarmToggle">
            <i class="fa-sharp fa-solid fa-bell header-a"></i>
          </label>
          <input type="checkbox" id="alarmToggle">
          <div class="alarm-menu">
            알람받는 공간
            <ul id="alarmBox">
            </ul>
          </div>
        </div>
      </c:otherwise>
    </c:choose>
  </section>
</header>

