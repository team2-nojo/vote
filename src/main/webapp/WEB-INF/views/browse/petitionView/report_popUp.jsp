<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>신고팝업</title>

    <%-- report_popUp.css --%>
    <link rel="stylesheet" href="/resources/css/browse/petitionView/report_popUp.css">

</head>
<body>
    <section>
        <form action="/browse/report_popUp" method="POST"  id="reportFrm">
            <div id="reportTitle">신고하기</div>
            <div id="reportContent1">서비스 약관 또는 커뮤니티 가이드라인을 위반할 수 있는 내용을 보고하십시오.</div>
            <div id="reportContent2">
                <input type="radio" name="report" id="disagree"> <label for="disagree">해당 청원에 동의하지 않거나 반대함</label> <br>
                <input type="radio" name="report" id="spam"> <label for="spam">오해의 소지 또는 스팸</label> <br>
                <input type="radio" name="report" id="infringement"> <label for="infringement">권리침해</label> <br>
                <input type="radio" name="report" id="disgusting"> <label for="disgusting">욕설 또는 혐오스러운 내용</label> <br>
                <input type="radio" name="report" id="inappropriate"> <label for="inappropriate">부적절한 이미지</label> <br>
                <input type="radio" name="report" id="harmful"> <label for="harmful">어린이에게 유해함</label> <br>
                <input type="radio" name="report" id="suicide"> <label for="suicide">폭력, 자살 또는 자해</label> <br>
                <input type="radio" name="report" id="imposture"> <label for="imposture">사칭</label> <br>
            </div>
            <div id="reportContent3">이 청원을 신고하는 이유를 설명하고 검토하는데 도움이 될 만한 정보를 적어주세요</div>
            <div>
                <textarea id="reportContent4" cols="30" rows="10" placeholder="이 청원을 신고하는 이유를 설명하고 검토하는데 도움이 될 만한 정보를 적어주세요"></textarea>
            </div>
            <div>
                <button id="reportContent5">제출</button>
            </div>
            <div id="reportContent6"> 신고 접수된 청원은 vote직원이 검토하여 서비스 약관 또는 커뮤니티 지침을 위반하는 지 여부를 판단합니다. </div>
        </form>
    </section>
</body>
</html>