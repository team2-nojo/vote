<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 나눔고딕 --%>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic.css" rel="stylesheet">

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>11ent</title>
     <link rel="stylesheet" href="resources/css/admin/layout.css" />
    <link rel="stylesheet" href="resources/css/admin/basic.css">
    <link rel="stylesheet" href="resources/css/admin/css/tab.css">
    <link rel="stylesheet" href="resources/css/admin/css/chart.css">
  </head>
  <body>
  <article>
  <jsp:include page="/WEB-INF/views/admin/admin-header.jsp" />
    <main>
      <div class="container">
        <div class="item color1" id="tab-menu">Item1</div>
        <div class="item color2" id="chart-box">최근 회원 가입/탈퇴 수
          <canvas id="myChart"></canvas>
        </div>
        <div class="item color3">Item3</div>
        <div class="item color4">
          <div class="tabs">
            <input id="all" type="radio" name="tab_item" checked>
            <label class="tab_item" for="all">최근 댓글</label>
            <input id="programming" type="radio" name="tab_item">
            <label class="tab_item" for="programming">1:1문의</label>
            <input id="design" type="radio" name="tab_item">
            <label class="tab_item" for="design">Tab 3</label>
            <div class="tab_content" id="all_content">
                11
            </div>
            <div class="tab_content" id="programming_content">
                22
        </div>
            <div class="tab_content" id="design_content">
              33
        </div>
        </div>
      </div>
      <div class="item color5">d</div>
          <button id="helpmenu">도움말</button>
          <div id="menu" class="helpmenu">
            <ul>
              <a href="">a</a>
                <li>메뉴 항목 1</li>
                <li>메뉴 항목 2</li>
                <li>메뉴 항목 3</li>
            </ul>
        </div>
        </div>
    </main>
  </article>
  <script src="resources/js/admin/layout.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
  <script src="https://kit.fontawesome.com/8be2100736.js" crossorigin="anonymous"></script>
  <script src="resources/js/admin/chart.js"></script>
</body>
</html>
