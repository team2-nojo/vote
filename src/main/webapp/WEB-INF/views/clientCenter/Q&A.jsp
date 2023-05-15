<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Q&A</title>

  <link rel="stylesheet" href="../CSS/Q&A.css">
</head>

<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<main>
    <form action="update" method="POST" 
    class="board-write" id="boardUpdateFrm" enctype="multipart/form-data">  

  <h1 id="title">1:1 문의</h1>

    <h1 class="board-title">
      <input type="text" name="boardTitle" placeholder="제목" value="${board.boardTitle}">   
    </h1>

  <br>

    <div class="board-content">내용
      <textarea name="boardContent">${board.boardContent}</textarea>
    </div>

  <br><br>

  <div class="profile-btn-area">
    <label for="imageInput">파일 첨부</label><br><br>

    <input type="file" name="profileImage" id="imageInput" accept="image/*">
  </div>

  

  <span class="filename">
    파일명은 -,_를 제외한 특수문자 허용되지 않습니다. <br>
    아래 파일 형식만 첨부할 수 있습니다 <br>
    <br>
    이미지:jpeg,jpg,gif,bmp,png <Br>

    문서:pdf,txt,hwp,doc,docs,xls,xlsm,ppt,pptx
  </span>


  
  <h id="suzip">개인정보 수집 등(필수)</h> <br><br>
  <span class="suzip2">
    - 수집하는 개인정보 항목: 이메일 주소, 주소 <br><br>


    개인정보는 문의 접수, 고객 불편 사항 확인 및 처리 결과 회신에 이용되며 전자상거래법 등 관련 법령에 따라 3년간 보관<br>
    됩니다.
    이용자는 본 동의를 거부할 수 있으나, 미동의 시 문의 접수가 불가능합니다.

  </span>


  <br><br><br><br>

  <button type="submit" , id="select2">문의하기</button>

</main>

 <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
  <script src="../JS/Q&A.js"></script>
  <script src="https://kit.fontawesome.com/fa1a384c97.js" crossorigin="anonymous"></script>

</body>

</html>