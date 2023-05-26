<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Petition List</title>
    <link rel="stylesheet" href="resources/css/admin/layout.css" />
    <link rel="stylesheet" href="resources/css/admin/basic.css">
    <%-- <link rel="stylesheet" href="resources/css/admin/adminPetitionList.css"> --%>
  </head>
  <body>
  <article id="article">
    <header>
        <nav class="navbar">
          <div class="navbar_logo">
            <img src="resources/images/mainPage/voteLogo2.png" id="vote_logo" />
            <a href="/" id="admin">Administrator</a>
          </div>
          <ul class="navbar_menu"></ul>
          <ul class="navbar_links">
              <i class="fa-solid fa-user" style="color: #ffffff; font-size: 24px""></i>
              <i class="fa-solid fa-bell" style="color: #ffffff; font-size: 24px; margin-left: 18px;" ></i>
              <i class="fa-solid fa-comment" style="color: #ffffff; font-size: 24px; margin-left: 18px;"></i>
              <a href="/user/logout"><span class="fa-solid logout-span" style="color: #ffffff; font-size: 16px; margin-left: 18px;">로그아웃</span></a>
          </ul>
        </nav>
    </header>
    <nav class="left">
      <div class="left-panel">
        <div id="admin-profile-image">
          <img src="resources/images/mainPage/순덕이.png" alt="" id="admin-img" />
          <div id="admin-id">순덕이 admin</div>
        </div>
        <div id="menu-wrap1">
          <ul>
            <li class="head-menu" id="menu1">회원관리</li>
            <li><a href="/adminUserList">
              <img
                src="resources/images/mainPage/member_menu_logo.png"
                alt="이미지_설명"
                class="menu-icon"
              />회원정보</a>
            </li>
            <li><a href="/adminDelUserList">
              <img
                src="resources/images/mainPage/ask_menu_logo.png"
                alt="이미지_설명"
                class="menu-icon"
              />삭제회원조회</a>
            </li>
          </ul>
        </div>
        <div id="menu-wrap2">
          <ul>
            <!-- 메뉴 아이템 1 -->
            <li id="menu2">청원 관리</li>
            <!-- 메뉴 아이템 2 -->
            <li><a href="/adminPetitionList">
              <img
                src="resources/images/mainPage/search_menu_logo.png"
                alt="이미지_설명"
                class="menu-icon"
              />청원 조회</a>
            </li>
            <!-- 메뉴 아이템 3 -->
            <li><a href="/adminPetitionDelList">
              <img
                src="resources/images/mainPage/content_menu_logo.png"
                alt="이미지_설명"
                class="menu-icon"
              />삭제된 청원 조회</a>
            </li>
          </ul>
          </div>
          <div id="menu-wrap3">
          <ul>
            <!-- 메뉴 아이템 1 -->
            <li id="menu3">인사이트</li>
            <li><a href="/adminQnA">
              <img
                src="resources/images/mainPage/dash_menu_logo.png"
                alt="이미지_설명"
                class="menu-icon"
              />1:1 문의내역</a>
            </li>
            
            <li><a href="">
              <img
                src="resources/images/mainPage/donation_menu_logo.png"
                alt="이미지_설명"
                class="menu-icon"
              />도네이션</a>
            </li>
            <ul>
              <li id="remove1"></li>
            </ul>
          </ul>
          <ul>
            <li id="remove2"></li>
          </ul>
  
          <div class="menu">
            <ul>
              <li class="lang mainLang" id="korean">
                <img
                  src="resources/images/mainPage/icon_lang.png"
                  alt="한국어"
                  class="menu-icon mainLanguage"
                />
                한국어
                <img
                  src="resources/images/mainPage/drop-down.png"
                  alt="드롭다운"
                  class="menu-icon"
                  style="float: right"
                />
              </li>
            </ul>
  
            <ul class="sub">
              <li class="lang" id="english">
                <img
                  src="resources/images/mainPage/lang_logo_black.png"
                  alt="langicon"
                  class="menu-icon"
                />English
              </li>
              <li class="lang" id="japanese">
                <img
                  src="resources/images/mainPage/lang_logo_black.png"
                  alt="langicon"
                  class="menu-icon"
                />日本語
              </li>
              <li class="lang" id="chinese">
                <img
                  src="resources/images/mainPage/lang_logo_black.png"
                  alt="中文"
                  class="menu-icon"
                />中文
              </li>
            </ul>
          </div>
        </div>
      </div>
      </nav>
      </article>