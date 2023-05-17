<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 나눔고딕 --%>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic.css" rel="stylesheet">

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <title>"VOTE LOGIN"</title>
    <link rel="stylesheet" type="text/css" href="resources/css/admin/adminLogin.css" />
  </head>
  <body>
    <div id="wrap">
      <div id="header">
        <a href="#" class="logo">
          <img src="resources/images/mainPage/voteLogo2.png" alt="로고" id="voteLogo"
        /></a>
        <div id="admin">administrator</div>
      </div>
      <div id="container">
        <div id="contents">
          <form action="#" id="login" action="" method="POST">
            <div id="id_area">
              <input
                type="text"
                name="id"
                id="id"
                placeholder="아이디"
                class="idpw"
              />
            </div>
            <div id="pw_area">
              <input
                type="password"
                name="pw"
                id="pw"
                placeholder="비밀번호"
                class="idpw"
              />
              <div class="saveId-area">
                <input type="checkbox" name="saveId" id="saveId" />
                <label for="saveId"
                  ><i class="fas fa-check"></i
                  ><span id="saveIdText">아이디 저장</span>
                </label>
              </div>
            </div>
            <button id="loginBtn" type="submit" class="btn_login">
              로그인
            </button>
            <div id="check">
              <div id="login_check">
                <input type="checkbox" name="login_chk" id="login_chk" />
                <!-- <label for="login_chk"><span></span>로그인 상태 유지</label> -->
                <a href="/adminPetitionList"><button type="button" class="adminSignUp">
                  관리자 회원가입
                </button></a>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
    <script src="resources/js/admin/adminLogin.js"></script>
    <script
      src="https://kit.fontawesome.com/f7459b8054.js"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
