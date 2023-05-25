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
// document
//   .getElementById('delete-check-btn')
//   .addEventListener('click', function () {
//     var xhr = new XMLHttpRequest();
//     xhr.open('GET', '/adminUser2', true);
//     xhr.onload = function () {
//       if (xhr.status === 200) {
//         data = xhr.responseText;

//       }
//     };
//     xhr.onerror = function () {
//       console.error('Request failed.');
//     };
//     xhr.send();
//   });

document
  .getElementById('delete-check-btn')
  .addEventListener('click', function () {
    fetch('/adminUser2', {
      method: 'GET',
    })
      .then(function (response) {
        if (response.ok) {
          return response.json(); // 데이터를 JSON 형식으로 파싱
        } else {
          throw new Error('Request failed.');
        }
      })
      .then(function (data) {
        var pagination2 = data.pagination2;
        var delUserList = data.delUserList;

        for (var i = 0; i < delUserList.length; i++) {
          const tr = document.createElement('tr');
          console.log(delUserList[i]);
          tr.className = 'delUserTable';
          tr.innerHTML = `<td class='petitionNo'>${delUserList[i].userNo}</td>
            <td>
              <img class="list-thumbnail" src="${delUserList[i].userImage}">${delUserList[i].userNickname}
            </td>
            <td>
            ${delUserList[i].userNickname}
            </td>
            <td>
                <button onclick="confirmDeleteUserCancle('${delUserList[i].userNo}', '${delUserList[i].userNickname}')">유저 복구</button>
            </td>`;

          // 수정된 부분: 생성한 행을 실제 테이블에 추가
          document.getElementsByClassName('delUserTable').appendChild(tr);
        }
      })

      .catch(function (error) {
        // 오류 처리
        console.log(error);
      });
  });
