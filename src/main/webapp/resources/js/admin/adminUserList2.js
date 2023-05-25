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

        var tBody = document.getElementById('t-body');
        for (var i = 0; i < delUserList.length; i++) {
          console.log(delUserList[i]);
          const tr = document.createElement('tr');
          tr.className = 'tr-table';
          tr.innerHTML = `<td class='petitionNo'>${delUserList[i].userNo}</td>
            <td>
              <img class="list-thumbnail" src="${delUserList[i].userImage}">${delUserList[i].userNickname}
            </td>
            <td>
            ${delUserList[i].userEnrollDate}
            </td>
            <td>
                <button onclick="confirmDeleteUserCancle('${delUserList[i].userNo}', '${delUserList[i].userNickname}')">유저 복구</button>
            </td>`;

          // 수정된 부분: 생성한 행을 실제 테이블에 추가
          tBody.appendChild(tr);
        }
      })

      .catch(function (error) {
        // 오류 처리
        console.log(error);
      });
  });

function confirmDeleteUserCancle(userNo2, userNickname) {
  var confirmed = confirm(
    '회원번호: ' +
      userNo2 +
      ' "' +
      userNickname +
      '"' +
      '님을 정말로 복구하시겠습니까?'
  );

  if (confirmed) {
    var form = document.createElement('form');
    form.method = 'POST';
    form.action = '/adminUserDeleteCancle';
    form.style.display = 'none';

    var userNoInput = document.createElement('input');
    userNoInput.type = 'hidden';
    userNoInput.name = 'userNo2';
    userNoInput.value = userNo2;
    form.appendChild(userNoInput);

    document.body.appendChild(form);
    form.submit();
    alert('복구 성공~!');
  } else {
    console.log('복구 취소');
  }
}
