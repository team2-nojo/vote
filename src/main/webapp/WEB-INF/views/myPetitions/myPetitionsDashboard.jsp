<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${not empty myPetition && not empty likeUserList}">
  <c:set var="MP" value="${myPetition}"/>
  <c:set var="UL" value="${likeUserList}"/>
  <c:set var="likeUserCount" value="${likeUserList.size()}"/>
</c:if>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>myPetitions</title>
  <link rel="stylesheet" href="/resources/css/myPetitions/myPetitionsDashboard.css">
</head>
<body>
  <jsp:include page="/WEB-INF/views/common/header.jsp"/>
  <main>
    <div class="title">
      <nav>
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
            <li id="navSelect"><a href="/myPetitions/myPetitionsDashboard">Dashboard</a></li>
            <li><a href="#">Petition details</a></li>
            <li><a href="/myPetitions/myPetitionEdit">Edit</a></li>
            <li><a href="#">Comments</a></li>
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
                    다음 목표까지 서포터 단 
                    <c:choose>
                      <c:when test="${fn:substringBefore((Math.ceil(likeUserCount / 5) * 5), '.') == likeUserCount}">
                        ${fn:substringBefore((Math.ceil((likeUserCount + 1) / 5) * 5), '.') - likeUserCount}명만 더!
                      </c:when>
                      <c:otherwise>
                        ${fn:substringBefore((Math.ceil(likeUserCount / 5) * 5), '.') - likeUserCount}명만 더!
                      </c:otherwise>
                    </c:choose>
                  </c:when>
                  <c:otherwise>당신의 청원을 지지해줄 서포터를 찾으세요!</c:otherwise>
                </c:choose>
              </div>
              <div class="graph-text">
                <div>조회수 ${MP.petitionViewCount}회</div>
                <div>댓글수 미구현</div>
              </div>
            </div>
          </div>
          <div class="agree">
            <div class="support" id="contentFrame">
              <div class="agree-top"><h3>최신 서포터 목록</h3></div>
              <div class="support-list">
                <ul>
                  <c:forEach items="${UL}" var="likeUser">
                    <li>
                      <c:choose>
                        <c:when test="${not empty likeUser.userImage}">
                          <span><img ID="profileImg" src="${likeUser.userImage}"></span>
                        </c:when>
                        <c:otherwise>
                          <span><i class="fa-sharp fa-solid fa-user"></i></span>
                        </c:otherwise>
                      </c:choose>
                      <span>${likeUser.userNickname}님</span>
                      <span>DB 작성일추가필요</span>
                    </li>
                  </c:forEach>
                </ul>
              </div>
              <div class="agreeBt">
                <div>
                  <h3>전체 후원자 목록</h3>
                  <p>지지자들의 서명과 의견이 담긴 전체 목록을 이메일로 받으십시오.</p>
                </div>
                <div>
                  <select id="exportOpt">
                    <option value="">서명(스프레드시트)</option>
                    <option value="">댓글(스프레드시트)</option>
                  </select>
                </div>
                <div><a href="#" class="export">목록 가져오기</a></div>
              </div>
            </div>
          </div>
        </div>
        <div class="content-right">
          <div class="share">
            <div class="share-content" id="contentFrame">
              <div>
                <div><h3>당신의 청원을 공유하세요</h3></div>
                <div>
                  <p>
                    성공적인 청원 시작자들은 약 12번의 청원을 공유합니다. 가능한 한 다양한 플랫폼에서 공유하고 추진력을 높이기 위해 다른 사람들에게 청원서에 서명하고 공유하도록 요청하세요!
                  </p>
                </div>
              </div>
              <div>
                <div class="input-url">
                  <input type="url" value="https://chng.it/Sz2tMGgB">
                  <button><i class="fa-solid fa-link"></i>   복사</button>
                </div>
              </div>
              <div class="share-link">
                <div> <a id="linkBtn">링크 수정</a> 더 쉽게 공유할수 있도록 수정하세요!</div>
              </div>
              <div>
                <div class="out-link">
                  <div><button><i class="fa-brands fa-facebook"></i> 페이스북</button></div>
                  <div><button><i class="fa-brands fa-square-twitter"></i> 트위터</button></div>
                  <div><button><i class="fa-regular fa-envelope"></i> 이메일</button></div>
                  <div><button><i class="fa-sharp fa-solid fa-phone"></i> 카카오톡</button></div>
                </div>
              </div>
            </div>
          </div>
          <div class="reflesh">
            <div id="contentFrame">
              <div>
                <div><h3>지지자 업데이트</h3></div>
                <div>
                  <p>
                    귀하의 청원, 언론 보도에 대한 뉴스 및 발전 사항을 공유하고 감사의 말을 전하거나 승리하는 데 필요한 도움을 요청하기 위해 업데이트를 보내십시오! 게시한 업데이트는 청원서에 표시되고 후원자에게 이메일로 전송됩니다.
                  </p>
                </div>
              </div>
              <div>
                <div>
                  <a href="#">업데이트 게시</a>
                </div>
              </div>
            </div>
          </div>
          <div class="marketing">
            <div id="contentFrame">
              <div>
                <div><h3>당신의 청원을 공유하세요</h3></div>
                <div>
                  <p>
                    귀하 또는 귀하의 서명자는 귀하의 청원을 홍보하기 위해 참여할 수 있습니다. 귀하의 청원이 홍보되면 우리는 그것을 지지할 가능성이 있는 다른 Change.org 사용자들에게 보여주기 시작합니다.
                  </p>
                </div>
              </div>
              <div>
                <div class="mkt">
                  <a id="mkt" href="#">홍보하다</a>
                  <a href="#">더 알아보기</a>
                </div>
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
              <div><h3>사진 또는 비디오 추가</h3>사진이나 동영상이 있는 청원은 6배 더 많은 서명을 받습니다.</div>
              <div><i class="fa-solid fa-chevron-right"></i></div>
            </li>
            <li>
              <div><h3>프로필 사진 추가</h3>사람들은 실제 사람이 보낸 청원임을 알 때 청원을 지지할 가능성이 더 높습니다.</div>
              <div><i class="fa-solid fa-chevron-right"></i></div>
            </li>
            <li>
              <div><h3>이웃, 도시, 주 또는 국가 추가</h3>청원은 특정 위치에 관심이 있는 사람들에게 권장됩니다.</div>
              <div><i class="fa-solid fa-chevron-right"></i></div>
            </li>
            <li>
              <div><h3>의사 결정권자의 연락처 정보 추가</h3>새로운 이정표에 도달하면 의사 결정권자에게 알림이 전송됩니다.</div>
              <div><i class="fa-solid fa-chevron-right"></i></div>
            </li>
            <li>
              <div><h3>스마트 이미지</h3>다른 이미지를 시도하여 어떤 이미지가 더 많은 서명을 제공하는지 확인하십시오.</div>
              <div><i class="fa-solid fa-chevron-right"></i></div>
            </li>
            <li>
              <div><h3>주제 추가</h3></div>
              <div><i class="fa-solid fa-chevron-right"></i></div>
            </li>
            <li>
              <div><h3>해결하려는 문제를 설명하십시오.</h3></div>
              <div><i class="fa-solid fa-chevron-right"></i></div>
            </li>
            <li>
              <div><h3>의사 결정권자를 선택하십시오.</h3></div>
              <div><i class="fa-solid fa-chevron-right"></i></div>
            </li>
            <li>
              <div><h3>제목 쓰기</h3></div>
              <div><i class="fa-solid fa-chevron-right"></i></div>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div class="guide">
      <div class="guide-left">
        <div>
          <div><h3>청원안내</h3></div>
          <div>
            <p>청원 가이드에는 청원을 시작하고, 캠페인을 구축하고, 목표를 달성하는 데 도움이 되는 리소스가 있습니다.</p>
          </div>
        </div>
      </div>
      <div class="guide-right">
          <div>
            <div><h3>청원관리</h3></div>
            <div>
              <p>
                의사 결정자와 합의에 이르렀습니까? 당신의 청원이 승리했음을 선언하고 당신의 지지자들이 그것을 실현하는 데 어떻게 도움이 되었는지 알려주세요.
              </p>
            </div>
          </div>
          <div>
            <div>
              <a id="mkt" href="#">홍보하다</a>
              <a href="#">더 알아보기</a>
            </div>
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