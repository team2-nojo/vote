const loginId = document.getElementById('id');
const loginPw = document.getElementById('pw');
const loginBtn = document.getElementById('loginBtn');

// loginBtn.addEventListener('click', async () => {
//   try {
//     // 서버로 아이디와 비밀번호 전송하여 로그인 시도
//     const response = await fetch('/api/login', {
//       method: 'POST',
//       body: JSON.stringify({
//         id: loginId.value,
//         pw: loginPw.value,
//       }),
//       headers: {
//         'Content-Type': 'application/json',
//       },
//     });

//     if (response.ok) {
//       // 로그인 성공 시
//       setTimeout(() => {
//         window.location.href = '/html/admin_member.html'; // 절대 경로 사용
//       }, 1000); // 1초 후에 페이지 이동
//     } else {
//       // 로그인 실패 시
//       setTimeout(() => {
//         window.location.href = '/html/main_login.html'; // 절대 경로 사용
//       }, 1000); // 1초 후에 페이지 이동
//     }
//   } catch (error) {
//     // 에러 핸들링
//     console.error('로그인 오류:', error);
//     // 에러 발생 시에 대한 처리를 추가할 수 있음
//   }
// });
