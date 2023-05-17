<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 나눔고딕 --%>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic.css" rel="stylesheet">
<!-- font awesome 라이브러리 추가 + key 등록 -->
<script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/resources/css/main.css">

<header>
  <section class="logo-menu-icon">
    <div class="header-logo"><a href="/"><img id="logoimg" src="/resources/images/common/Logo.png" /></a></div>
    <div class="header-menu">
      <ul>
        <li><a class="header-a" id="startPetitions" href="/writePetition">Start a petition</a></li>
        <li><a class="header-a" id="myPetitions" href="/myPetitions/myPetitions">My petitions</a></li>
        <li><a class="header-a" id="browse" href="/browse/browse_search/featured">Browse</a></li>
        <li><a class="header-a" id="Help" href="/clientCenter/FAQ">Help</a></li>
        <%-- 임시 --%>
        <li>
          <form action="/user/login" method="post" id="loginFrm">
            <input type="hidden" name="userEmail" value="user02@kh.or.kr">
            <input type="hidden" name="userPw" value="pass02!">
            <button id=btn>user02로그인</button>
          </form>
        </li>
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
          <a class="header-a" href="#"><i class="fa-sharp fa-solid fa-magnifying-glass"></i></a>
          <label for="userMenuToggle">
            <i class="fa-sharp fa-solid fa-user"></i>
          </label>
          <input type="checkbox" id="userMenuToggle">
          <div class="user-menu">
            <a class="header-a" href="/myPetitions/myPetitions">나의 청원</a>
            <a class="header-a" href="/myPage">마이페이지</a>
            <span>${loginUser.userNickname}</span>
            <a class="header-a" href="/user/logout">로그아웃</a>
          </div>
          <i class="fa-sharp fa-solid fa-bell"></i>
        </div>
      </c:otherwise>
    </c:choose>
  </section>
</header>
