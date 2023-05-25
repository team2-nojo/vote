function confirmDeleteUserCancler(userNo, userNickname) {
  var confirmed = confirm(
    '회원번호 : ' +
      userNo +
      ' "' +
      userNickname +
      '"' +
      '님을 정말로 복구하시겠습니까? '
  );

  if (confirmed) {
    updateDeleteUser(userNo, userNickname);
  } else {
    event.preventDefault();
    console.log('복구 취소');
  }
}

// document
//   .getElementById('delete-check-btn2')
//   .addEventListener('click', function () {
//     // Fetch API를 사용하여 GET 요청
//     fetch('/adminUser2', {
//       method: 'GET',
//     })
//       .then(function (response) {
//         if (response.ok) {
//           return response.text();
//         } else {
//           throw new Error('Request failed.');
//         }
//       })
//       .then(function (data) {
//         // 응답을 받았을 때 수행할 작업
//         console.log(data);
//       })
//       .catch(function (error) {
//         // 오류 처리
//         console.log(error);
//       });
//   });
// var data; 변수를 미리 선언

document
  .getElementById('delete-check-btn')
  .addEventListener('click', function () {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '/adminUser2', true);
    xhr.onload = function () {
      if (xhr.status === 200) {
        data = xhr.responseText;
        console.log('success');
      }
    };
    xhr.onerror = function () {
      console.error('Request failed.');
    };
    xhr.send();
  });
