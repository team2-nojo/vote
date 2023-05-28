<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

  <c:set var="MP" value="${myPetition}"/>
  <c:set var="UL" value="${likeUserList}"/>
  <c:set var="commentListCount" value="${commentList.size()}"/>
  <c:set var="likeUserCount" value="${likeUserList.size()}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>VOTE 대시보드</title>
  <link rel="stylesheet" href="/resources/css/myPetitions/myPetitionsDashboard.css">
</head>
<body>
  <jsp:include page="/WEB-INF/views/common/header.jsp"/>
  <main>
    <div class="title">
      <nav>
        <input id="petitionNo" type="hidden" value="${petitionNo}">
            <div class="nav-title">
        <c:choose>
          <c:when test="${not empty MP}">
              <h2>${MP.petitionTitle}</h2>
          </c:when>
          <c:otherwise>
              <h2>청원 글제목</h2>
          </c:otherwise>
        </c:choose>
        <c:choose>
          <c:when test="${MP.petitionVictory eq 'Y'}">
              <div id="vicHidden"><img src="/resources/images/common/victory.png"></div>
          </c:when>
          <c:otherwise>
              <div id="vicHidden" class="vic-hidden"><img src="/resources/images/common/victory.png"></div>
          </c:otherwise>
        </c:choose>
            </div>
        <div class="nav">
          <ul>
            <li id="navSelect"><a href="/myPetitions/myPetitionsDashboard/${petitionNo}">대시보드</a></li>
            <li id="nav"><a href="/browse/petitionView/details/${petitionNo}">청원 상세</a></li>
            <li id="nav"><a href="/myPetitions/myPetitionEdit/${petitionNo}">편집</a></li>
          </ul>
        </div>
      </nav>
    </div>
    <div class="content">
      <div class="content-dashborad">
        <div class="content-left">
          <div class="graph">
            <div id="contentFrame">
              <div class="graph-tip">
                <i id="graphI" class="fa-regular fa-circle-question">
                  <div id="graphP">
                    <span>보기에는 vote . kh 사이트 및 이메일에서 귀하의 청원에 대한 방문 및 청원에 대한 프로모션 광고의 조회가 포함됩니다. 대부분의 청원은 25회 조회당 약 1명의 지지자를 받습니다.</span>
                  </div>
                </i>
              </div>
              <div class="content-frame-img">
                <span class="supporter">
                <c:choose>
                  <c:when test="${not empty likeUserCount}">${likeUserCount}</c:when>
                  <c:otherwise>0</c:otherwise>
                </c:choose>
                </span>
                <span>Supporter</span>
                <svg id="my-svg" viewBox="-1.04 -1.04 2.08 2.08">
                    <path style="stroke:#dbd9db" stroke-width="0.08px" d="M -0.8910065241883681 0.45399049973954625 A 1 1 0 1 1 0.8910065241883677 0.4539904997395472" fill="transparent" stroke-linecap="round"></path>
                    <path id="animated-path" style="stroke:#ec2c22" stroke-width="0.09px" d="M -0.8910065241883681 0.45399049973954625 A 1 1 0 1 1 0.8910065241883677 0.4539904997395472" fill="transparent" stroke-linecap="round" stroke-dasharray="0.8168140899333463 10"></path>
                </svg>
              </div>
              <div class="maxnum">
                <c:choose>
                  <c:when test="${not empty likeUserCount}">
                    다음 목표까지 지지자 단 
                    <c:choose>
                      <c:when test="${fn:substringBefore((Math.ceil(likeUserCount / 5) * 5), '.') == likeUserCount}">
                        ${fn:substringBefore((Math.ceil((likeUserCount + 1) / 5) * 5), '.') - likeUserCount}명만 더!
                      </c:when>
                      <c:otherwise>
                        ${fn:substringBefore((Math.ceil(likeUserCount / 5) * 5), '.') - likeUserCount}명만 더!
                      </c:otherwise>
                    </c:choose>
                  </c:when>
                  <c:otherwise>당신의 청원을 지지해줄 지지자를 찾으세요!</c:otherwise>
                </c:choose>
              </div>
              <div class="graph-text">
                <div>조회수 ${MP.petitionViewCount}회</div>
                <div>댓글수 ${commentListCount}개</div>
              </div>
            </div>
          </div>
          <div class="agree">
            <div class="support" id="contentFrame">
              <div class="agree-top">
                <h3>최신 지지자 목록</h3>
                <button id="supportBtn" type = "button">
                  <i class="fa-solid fa-arrows-rotate"></i>&nbsp&nbsp최신화
                </button>
              </div>
              <div class="support-list">
                <ul id="supportList">
                </ul>
              </div>
              <div class="agree-L">
                <div><h3>전체 지지자 목록</h3></div>
                <div><p>지지자들의 서명과 댓글이 담긴 전체 목록을 이메일로 받으십시오.</p></div>
                <div class="agree-B">
                  <select id="exportOpt">
                    <option value="1">좋아요(스프레드시트)</option>
                    <option value="2">댓글(스프레드시트)</option>
                  </select>
                  <button type="button" class="export" id="exportBtn">목록 가져오기</button>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="content-right">
          <div class="comment">
            <div id="contentFrame">
              <div class="content-title">
                <h3>댓글 목록</h3>
                <button id="commentBtn" type = "button">
                  <i class="fa-solid fa-arrows-rotate"></i>&nbsp&nbsp최신화
                </button>
              </div>
              <ul id="commentList">
              </ul>
            </div>
          </div>
          <div class="reflesh">
            <div id="contentFrame">
              <div><h3>청원 업데이트</h3></div>
              <div>
                <p>
                  귀하의 청원, 언론 보도에 대한 뉴스 및 발전 사항을 공유하고 감사의 말을 전하거나 승리하는 데 필요한 도움을 요청하기 위해 업데이트를 보내십시오! 게시한 업데이트는 청원서에 표시되고 후원자에게 이메일로 전송됩니다.
                </p>
              </div>
              <div class="refleshBtn">
                <a href="myPetitionDashboardUpdate/${petitionNo}">업데이트 게시</a>
              </div>
            </div>
          </div>
          <div class="share">
            <div class="share-content" id="contentFrame">
              <div>
                <h3 id="shareTitle">
                  <span>당신의 청원을 공유하세요</span>
                  <span>
                    <a href="https://www.facebook.com/"><i class="fa-brands fa-facebook"></i></a>
                    <a href="https://twitter.com/i/flow/login"><i class="fa-brands fa-square-twitter"></i></a>
                    <a href="https://url.kr/d6zaob"><i class="fa-regular fa-envelope"></i></a>
                  </span>
                </h3>
              </div>
              <div>
                <p>
                  성공적인 청원의 작성자는 약 12번의 청원을 공유합니다. 가능한 한 다양한 플랫폼에서 공유하고 추진력을 높이기 위해 다른 사람들에게 청원서에 서명하고 공유하도록 요청하세요!
                </p>
              </div>
              <div class="input-url">
                <input type="url" value="https://chng.it/Sz2tMGgB">
                <button><i class="fa-solid fa-link"></i>&nbsp;복사</button>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="check-list">
        <h2>청원 체크리스트</h2>
        <div class="list">
          <ul>
            <li>
              <c:choose>
                <c:when test="${not empty MP.petitionTitle}">
                  <div class="list-checked">
                    <div><h3>청원 제목</h3></div>
                    <i class="fa-solid fa-check"></i>
                  </div>
                </c:when>
                <c:otherwise>
                  <a href="/myPetitions/myPetitionEdit/${petitionNo}/#titleEdit">
                    <div class=check-title>
                      <h3>청원 제목 추가</h3>
                      <h5>제목을 정해야 구체적인 청원이 나아갈 방향이 정해집니다.</h5>
                    </div>
                    <div><h3>청원 제목 추가</h3></div>
                    <i class="fa-solid fa-chevron-right"></i>
                  </a>
                </c:otherwise>
              </c:choose>
            </li>
            <li>
              <c:choose>
                <c:when test="${not empty MP.petitionImage}">
                  <div class="list-checked">
                    <div><h3>사진 : 썸네일</h3></div>
                    <i class="fa-solid fa-check"></i>
                  </div>
                </c:when>
                <c:otherwise>
                  <a href="/myPetitions/myPetitionEdit/${petitionNo}/#imgEdit">
                    <div class=check-title>
                      <h3>사진 추가</h3>
                      <h5>사진이 있는 청원은 6배 더 많은 서명을 받습니다.</h5>
                    </div>
                    <i class="fa-solid fa-chevron-right"></i>
                  </a>
                </c:otherwise>
              </c:choose>
            </li>
            <li>
              <c:choose>
                <c:when test="${not empty MP.petitionContent}">
                  <div class="list-checked">
                    <div><h3>주요 내용 : 문제 설명</h3></div>
                    <i class="fa-solid fa-check"></i>
                  </div>
                </c:when>
                <c:otherwise>
                  <a href="/myPetitions/myPetitionEdit/${petitionNo}/#contentEdit">
                    <div class=check-title>
                      <h3>청원에 대해 설명하십시오.</h3>
                      <h5>청원에 관심을 가지는 사람들에게 구체적인 설명을 해주세요.</h5>
                    </div>
                    <i class="fa-solid fa-chevron-right"></i>
                  </a>
                </c:otherwise>
              </c:choose>
            </li>
            <li>
              <c:choose>
                <c:when test="${catagoryCheck.size() == 5}">
                  <div class="list-checked">
                    <div><h3>카테고리</h3></div>
                    <i class="fa-solid fa-check"></i>
                  </div>
                </c:when>
                <c:otherwise>
                  <a href="/myPetitions/myPetitionEdit/${petitionNo}/#topicEdit">
                    <div class=check-title>
                      <h3>카테고리 추가</h3>
                      <h5>구체적인 카테고리를 추가로 정하면 사람들이 청원에 관심을 가질 가능성이 높아집니다.</h5>
                    </div>
                    <i class="fa-solid fa-chevron-right"></i>
                  </a>
                </c:otherwise>
              </c:choose>
            </li>
            <li>
              <c:choose>
                <c:when test="${not empty loginUser.userImage}">
                  <div class="list-checked">
                    <div><h3>프로필 사진</h3></div>
                    <i class="fa-solid fa-check"></i>
                  </div>
                </c:when>
                <c:otherwise>
                  <a href="/myPage/editProfile">
                    <div class=check-title>
                      <h3>프로필 사진 추가</h3>
                      <h5>사람들은 실제 사람이 보낸 청원임을 알 때 청원을 지지할 가능성이 더 높습니다.</h5>
                    </div>
                    <i class="fa-solid fa-chevron-right"></i>
                  </a>
                </c:otherwise>
              </c:choose>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div class="guide">
      <div class="guide-select">
          <div class="guide-left">
            <div><h3>청원관리</h3></div>
            <div>
              <p>
                의사 결정자와 합의에 이르렀습니까? 당신의 청원이 승리했음을 선언하고 당신의 지지자들이 그것을 실현하는 데 어떻게 도움이 되었는지 알려주세요.
              </p>
            </div>
          </div>
          <div class="guide-right">
            <button id="petitionDel" type="button">삭제</button>
            <button id="petitionVic" type="button">승리 선언</button>
          </div>
        </div>
      </div>
    </div>
  </main>
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  <script>
    const likeUserCount = ${likeUserCount};
  </script>

  <script src="/resources/js/myPetitions/myPetitionsDashboard.js"></script>
</body>
</html>