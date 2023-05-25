<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>

    <link rel="stylesheet" href="/resources/css/user/login.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    
    <main>

        <section>
            <form action="/user/login" method="post" id="loginFrm">
                <div id="logIn">Log in</div>
                <br>
                
                <div id="DontHaveAccount">Don't have an account? <a href="/user/signUp" id="SignUp">Sign up</a></div>
                <br>
                
                <div class="or"> OR </div>
                <br>
                <div>
                    <input type="text" name="userEmail" id="email" placeholder=" Email"><br>
                    <input type="password" name="userPw" id="password" placeholder=" Password" autocomplete="off">
                </div>
            
                <div class="searchPw">
                    <a href="/user/searchPw"  id="searchPw">Forget Password</a>
                </div>
                

                <div>
                    <button id="loginSubmit">Login</button>
                </div>
            </form>
        </section>
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script src="/resources/js/user/login.js"></script>
    
    
</body>
</html>