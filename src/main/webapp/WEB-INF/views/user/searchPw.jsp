<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>

    <link rel="stylesheet" href="/resources/css/user/searchPw.css">

</head>
<body>
    
    <%-- header --%>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <main>
        
        
        <section>
            <div id="searchPw">
                비밀번호를 잊어버리셨나요?
            </div>


            <div>
                여기에 이메일 주소를 입력한 후 받은 편지함을 확인하십시오.<br>
                암호를 재설정하는 링크를 보내드립니다.
            </div>

            
            <div>
                <input type="text" id="email" placeholder=" Email">
            </div>


            <div>
                <button id="resetPw">Reset password</button>
            </div>
        </section>
    </main>
    <%-- footer --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>


    <script src="/resources/js/user/searchPw.js"></script>
</body>
</html>