<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>myPetitionEdit</title>
  <!-- summernote -->
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
  <!-- css -->
  <link rel="stylesheet" href="/resources/css/myPetitions/myPetitionEdit.css">
</head>
<body>
  <%-- header --%>
  <jsp:include page="/WEB-INF/views/common/header.jsp"/>
  <main>
    <div>
      <div class="title">
        <nav>
          <div class="nav-title">
            <h2>청원 글제목</h2>
          </div>
          <div class="nav">
            <ul>
              <li><a href="#">Dashboard</a></li>
              <li><a href="#">Petition details</a></li>
              <li id="navSelect"><a href="#">Edit</a></li>
              <li><a href="#">Comments</a></li>
            </ul>
          </div>
        </nav>
      </div>
      <div class="content">
        <div class="content-edit">
          <div class="content-top">
            <h1>청원서 편집</h1>
            <h2>청원 주요내용</h2>
          </div>
          <form action="">
            <div class="content-title">
              <div class="content-side-title">
                <h3>제목 편집</h3>
                <span id="titleTipBtn">팁 보기</span>
                <dialog class="tip" id="titleTip">
                  <div class="tip-container">
                    <div class="tip-top">
                      <div><h3>제목 팁</h3></div>
                      <div><a href="">X</a></div>
                    </div>
                    <div>
                      <ul>
                        <li>
                          <p id="tipFont">동작 동사로 시작</p>
                          <p>예: "중지, 저장, 금지, 부여, 반대 등"</p>
                        </li>
                        <li>
                          <p id="tipFont">특정 장소, 조직 또는 사람 이름 지정</p>
                          <p>예: "미니애폴리스의 최저 임금을 시간당 $15로 인상합니다."</p>
                        </li>
                        <li>
                          <p id="tipFont">더 긴 제목을 사용하여 핵심 세부정보 추가</p>
                          <p>예: "2차 유방암 진단 개선 - 스캔을 합시다!"</p>
                        </li>
                      </ul>
                    </div>
                  </div>
                </dialog>
              </div>
              <textarea name="conTitle" id="" rows="3" placeholder="달성하려는 청원 목표를 입력해주세요."></textarea>
            </div>
            <div class="description">
              <div class="content-side-title">
                <h3>본문 편집</h3>
                <span id="descriptTipBtn">팁 보기</span>
                <dialog class="tip" id="descriptTip">
                  <div class="tip-container">
                    <div class="tip-top">
                      <div><h3>설명 팁</h3></div>
                      <div><a href="">X</a></div>
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
              <div id="summernote"></div>
            </div>
            <div class="img-link"><a href="#">이제 동영상과 이미지로 청원을 돋보이게 만들 수 있습니다. 여기에서 시도하십시오!</a></div>
            <div>
              <div class="content-side-title">
                <h3>이미지</h3>
                <span id="imgTipBtn">팁 보기</span>
                <dialog class="tip" id="imgTip">
                  <div class="tip-container">
                    <div class="tip-top">
                      <div><h3>이미지 팁</h3></div>
                      <div><a href="">X</a></div>
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
                <div>사진 또는 비디오에 대한 링크 붙여넣기</div>
                <div class="content-img-url">
                  <input id="AddUrl" type="url" placeholder="http://">
                  <button id="AddBtn">추가하다</button>
                </div>
                <hr>
                <div class="content-img-up">
                  <div class="content-img-up-button"><button>사진 업로드</button></div>
                  <div id="and">또는</div>
                  <div><p>사진은 최소 1200 × 675 픽셀이어야 합니다. 텍스트가 없는 큰 사진이 가장 좋습니다.</p></div>
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
                <h3>위치</h3>
                <i id="locationI" class="fa-regular fa-circle-question">
                  <div id="locationP">
                    <p>귀하의 청원이 어떤 분야와 더 관련이 있습니까? 귀하의 청원에 적합한 청중을 찾는데 도움이 될 것입니다.</p>
                  </div>
                </i>
              </div>
              <input id="lcationInput" rows="3">
            </div>
            <div>
              <div class="content-data-side-title">
                <h3>주제추가</h3>
                <i id="topicI" class="fa-regular fa-circle-question">
                  <div id="topicP">
                    <p>청원서의 주요 관련 주제는 무엇입니까? 귀하의 청원에 적합한 청중을 찾는데 도움이 될 것입니다.</p>
                  </div>
                </i>
              </div>
              <input id="topicInput" rows="3">
            </div>
            <div>
              <div class="content-data-side-title">
                <h3>결정권자</h3>
                <i id="ownerI" class="fa-regular fa-circle-question">
                  <div id="ownerP">
                    <p>귀하의 청원서에 대한 결정에 영향을 미칠 수 있는 주요 인물 또는 조직은 누구입니까?</p>
                  </div>
                </i>
              </div>
              <div>
                <div class="content-owner">
                  <div>의사 결정권자 추가</div>
                  <div class="content-owner-add">
                    <input type="text" placeholder="누구를 의사 결정권자로 추가하고 싶나요?">
                </div>
              </div>
            </div>
            <div>
              <div class="content-data-side-title">
                <h3>기본 트위터 메시지</h3>
                <i id="twitterI" class="fa-regular fa-circle-question">
                  <div id="twitterP">
                    <p>이 메시지는 누군가 트위터에서 이 청원을 공유할 때마다 기본적으로 나타납니다. 청원을 증폭시키는데 도움이 되도록 해시태그를 추가하고 특정 트위터 계정을 언급할 수 있습니다.</p>
                  </div>
                </i>
              </div>
              <textarea name="conTitle" id="twitterText" rows="3"></textarea>
            </div>
            <div class="edit-btn">
              <button id="cancel" type="reset">cancel</button>
              <button id="save">save</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </main>
  <%-- footer --%>
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
  <script src="/resources/js/myPetitions/myPetitionEdit.js"></script>
  <script>
    $('#summernote').summernote({
      placeholder: 'Hello stand alone ui',
      tabsize: 2,
      width : 600,
      height: 400,
      toolbar: [
        ['style', ['style']],
        ['font', ['bold', 'underline', 'clear']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['table', ['table']],
        ['insert', ['link', 'picture']],
      ]
    });
  </script>
</body>
</html>