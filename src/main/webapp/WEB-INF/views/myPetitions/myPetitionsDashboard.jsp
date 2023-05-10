<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <div class="nav-title">
          <h2>청원 글제목</h2>
        </div>
        <div class="nav">
          <ul>
            <li id="navSelect"><a href="#">Dashboard</a></li>
            <li><a href="#">Petition details</a></li>
            <li><a href="#">Edit</a></li>
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
              <div class="content-frame-img"><img src="/resources/images/myPetitions/graph.jpg" /></div>
              <div class="graph-text">
                <div>1 보기</div>
                <div>0 주</div>
              </div>
            </div>
          </div>
          <div class="agree">
            <div class="support" id="contentFrame">
              <div class="agree-top"><h3>최근 후원자</h3></div>
              <div class="support-list">
                <ul>
                  <li>
                    <i class="fa-sharp fa-solid fa-user"></i>
                    <span>홍길동</span>
                    <span>서명</span>
                    <span>3주전</span>
                  </li>
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
                  <div><button><i class="fa-sharp fa-solid fa-phone"></i> 왓츠앱</button></div>
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
</body>
</html>