<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<c:set var="MP" value="${myPetition}"/>
<c:set var="CAT" value="${category}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>VOTE 청원 편집</title>
  <!-- summernote -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
  <!-- css -->
  <link rel="stylesheet" href="/resources/css/myPetitions/myPetitionEdit.css">
</head>
<body>
  <%-- header --%>
  <jsp:include page="/WEB-INF/views/common/header.jsp"/>
  <main>
    <nav >
      <c:choose>
        <c:when test="${not empty MP}">
          <div class="nav-title">
            <h2>${MP.petitionTitle}</h2>
          </div>
        </c:when>
        <c:otherwise>
          <div class="nav-title">
            <h2>청원 글제목</h2>
          </div>
        </c:otherwise>
      </c:choose>
      <div class="nav">
        <ul>
          <li id="nav"><a href="/myPetitions/myPetitionsDashboard/${petitionNo}">대시보드</a></li>
          <li id="nav"><a href="/browse/petitionView/details/${petitionNo}">청원 상세</a></li>
          <li id="navSelect"><a href="/myPetitions/myPetitionEdit/${petitionNo}">편집</a></li>
        </ul>
      </div>
    </nav>
    <div class="content">
      <div class="content-edit">
        <div class="content-top">
          <h1>청원 편집</h1>
          <h2>청원 주요내용</h2>
        </div>
        <form id="editForm" action="/myPetitions/myPetitionEdit/${petitionNo}" method="post" enctype="multipart/form-data">
          <div class="content-title">
            <div class="content-side-title">
              <h3 id="titleEdit">제목 편집</h3>
              <span id="titleTipBtn">팁 보기</span>
              <dialog class="tip" id="titleTip">
                <div class="tip-container">
                  <div class="tip-top">
                    <div><h3>제목 팁</h3></div>
                    <div><span id="titleTipCtn"><i class="fa-regular fa-rectangle-xmark"></i></span></div>
                  </div>
                  <div>
                    <ul>
                      <li>
                        <p id="tipFont">동작 동사로 시작</p>
                        <p>예: "중지, 저장, 금지, 부여, 반대 등"</p>
                      </li>
                      <li>
                        <p id="tipFont">특정 장소, 조직 또는 사람 이름 지정</p>
                        <p>예: "미니애폴리스의 최저 임금을 시간당 15,000원으로 인상합니다."</p>
                      </li>
                      <li>
                        <p id="tipFont">더 긴 제목을 사용하여 핵심 세부정보 추가</p>
                        <p>예: "2차 유방암 진단 개선 - 엑스레이를 찍읍시다!"</p>
                      </li>
                    </ul>
                  </div>
                </div>
              </dialog>
            </div>
            <textarea name="conTitle" id="" rows="3" placeholder="달성하려는 청원 목표를 입력해주세요.">${MP.petitionTitle}</textarea>
          </div>
          <div class="description">
            <div class="content-side-title">
              <h3 id="contentEdit">본문 편집</h3>
              <span id="descriptTipBtn">팁 보기</span>
              <dialog class="tip" id="descriptTip">
                <div class="tip-container">
                  <div class="tip-top">
                    <div><h3>설명 팁</h3></div>
                    <div><span id="descriptTipCtn"><i class="fa-regular fa-rectangle-xmark"></i></span></div>
                  </div>
                  <div>
                    <ul>
                      <li>
                        <p id="tipFont">1항: 누가 영향을 받습니까?</p>
                        <p>사람들이 문제에 의해 구체적으로 어떻게 영향을 받는지 설명하십시오.</p>
                      </li>
                      <li>
                        <p id="tipFont">2항: 무엇이 위험에 처해 있습니까?</p>
                        <p>상황이 바뀌거나 동일하게 유지된다면 그것이 무엇을 의미하는지 설명하십시오.</p>
                      </li>
                      <li>
                        <p id="tipFont">3항: 지금이 행동해야 할 때인 이유는 무엇입니까?</p>
                        <p>즉각적인 조치의 중요성을 요약하고 강조합니다.</p>
                      </li>
                    </ul>
                  </div>
                </div>
              </dialog>
            </div>
            <textarea id="summernote" name="editorContent">${MP.petitionContent}</textarea>
          </div>
          <c:if test="${empty MP.petitionImage}" >
            <div class="img-link">이미지를 추가해주세요! 당신의 청원을 돋보이게 만들 수 있습니다!!</div>
          </c:if>
          <div class="img-top">
            <div class="content-side-title">
              <h3 id="imgEdit">이미지</h3>
              <span id="imgTipBtn">팁 보기</span>
              <dialog class="tip" id="imgTip">
                <div class="tip-container">
                  <div class="tip-top">
                    <div><h3>이미지 팁</h3></div>
                    <div><span id="imgTipCtn"><i class="fa-regular fa-rectangle-xmark"></i></span></div>
                  </div>
                  <div>
                    <ul>
                      <li>
                        <p id="tipFont">하다</p>
                        <p>감정을 전달하는 사람이나 동물의 클로즈업 이미지를 사용하세요.</p>
                        <p>색상 대비가 좋은 단순한 이미지를 사용하세요.</p>
                        <p>해당되는 경우 공인이나 지역 명소의 이미지를 사용하세요.</p>
                      </li>
                      <li>
                        <p id="tipFont">하지 않다</p>
                        <p>텍스트가 있는 이미지 피하기</p>
                        <p>복잡한 이미지 피하기</p>
                        <p>노골적인 폭력이나 성적 콘텐츠를 표시하지 마세요.</p>
                      </li>
                    </ul>
                  </div>
                </div>
              </dialog>
            </div>
            <div class="content-img">
              <input name="thumbnailImage" type="file" id="inputImgUpload" accept="image/*">
              <div class="img-upload">
                <c:choose>
                  <c:when test="${not empty MP.petitionImage}">
                    <img src="${MP.petitionImage}">
                    <button type="button" id="imgDelete">x</button>
                  </c:when>
                  <c:otherwise>
                    <label id="imgUpload" for="inputImgUpload">
                        <span>Upload an image</span>
                    </label>
                  </c:otherwise>
                </c:choose>
              </div>
            </div>
          </div>
          <div class="content-data">
            <h2>청원 데이터</h2>
          </div>
          <div>
            <div class="content-data-side-title">
              <h3>범위</h3>
              <i id="scopeI" class="fa-regular fa-circle-question">
                <div id="scopeP">
                  <p>청원서의 지리적 범위를 선택하십시오. 귀하의 청원에 적합한 청중을 찾는데 도움이 될 것입니다.</p>
                </div>
              </i>
            </div>
            <select class="scope">
              <option>청원서 적용범위 선택</option>
              <option>지역</option>
              <option>국가</option>
              <option>전세계</option>
            </select>
          </div>
          <div>
            <div class="content-data-side-title">
              <h3 id="topicEdit">주제 추가</h3>
              <i id="topicI" class="fa-regular fa-circle-question">
                <div id="topicP">
                  <p>청원서의 주요 관련 주제는 무엇입니까? 귀하의 청원에 적합한 청중을 찾는데 도움이 될 것입니다.</p>
                </div>
              </i>
            </div>
            <div id="addTopicBox">
              <c:if test="${not empty CAT}" >
                <c:forEach items="${CAT}" var="category">
                  <div><span>${category.categoryName}&nbsp;<i class="fa-regular fa-rectangle-xmark"></i></span></div>
                </c:forEach>
              </c:if>
              <input id="topicInput" placeholder="예시 : 뭐하지">
            </div>
            <input id="inputCategory" name="inputCategory" type="hidden">
          </div>
          <div class="edit-btn">
            <button id="cancel" type="reset">삭제</button>
            <button id="save">제출</button>
          </div>
        </form>
      </div>
    </div>
  </main>
  <%-- footer --%>
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
  <script src="/resources/js/myPetitions/myPetitionEdit.js"></script>

</body>
</html>