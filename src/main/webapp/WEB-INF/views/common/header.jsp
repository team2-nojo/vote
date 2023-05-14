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
        <li><a id="startPetitions" href="/writePetition">Start a petition</a></li>
        <li><a id="myPetitions" href="/myPetitions/myPetitions">My petitions</a></li>
        <li><a id="browse" href="#">Browse</a></li>
        <li><a id="Help" href="#">Help</a></li>
      </ul>
    </div>
    <c:choose>
      <c:when test="${empty loginUser}">
        <div class="header-icon">
          <a href=""><i class="fa-sharp fa-solid fa-magnifying-glass"></i></a>
          <%-- <i class="fa-sharp fa-solid fa-user"></i>
          <i class="fa-sharp fa-solid fa-bell"></i> --%>
          <a href="/user/login" id="loginBtn">Log in</a>
        </div>
      </c:when>
      <%-- 로그인 되었을 때 --%>
      <c:otherwise>
        <div class="header-icon">
          <a href=""><i class="fa-sharp fa-solid fa-magnifying-glass"></i></a>
          <label for="userMenuToggle">
            <i class="fa-sharp fa-solid fa-user"></i>
          </label>
          <input type="checkbox" id="userMenuToggle">
          <div class="user-menu">
            <a href="#">마이페이지</a>
            <a href="#">로그아웃</a>
          </div>
          <i class="fa-sharp fa-solid fa-bell"></i>
        </div>
      </c:otherwise>
    </c:choose>
  </section>
</header>
