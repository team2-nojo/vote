<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<footer>
    <div class="footer-content">
        <div class="footer-header">
            <a href="/adminPetitionList"><div><img id="footlogo" src="/resources/images/common/Logo.png" /></a></div>&nbsp;
            <div><a href="#"> | 개인정보처리방침</a></div>&nbsp;
            <div><a href="#"> | 이용약관</a></div>
        </div>
        <div class="footer-body">
            <p>KH-nojo.kr | 만든사람 | 경규원 | 권재웅 | 김자민 | 배진현 | 이도현 | 정송이</p>
            <p>제작기간 2023.03.27 ~ 2023.05.25 | 주소:서울특별시 중구 남대문로 120 그레이츠 청계(구 대일빌딩) 2F</p>
        </div>
        <div class="footer-last">
            <span class="footer-copy">Copyright &copy; nojo.kr</span>
            <span>| 이 사이트는 reCAPTCHA로 보호되며 Google 개인정보 보호정책 및 서비스 약관이 적용됩니다.</span>
        </div>
    </div>
</footer>

<c:if test="${not empty serverMessage}">
    <script>
        alert('${serverMessage}');
    </script>
</c:if>

<%-- SockJS(라이브러리)추가 / cdn방식으로 추가됨 --%>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="/resources/js/websocket/alarm.js"></script>