const deleteCheckBtn = document.querySelector('#delete-check-btn');

function confirmDeleteUser(userNo, userNickname) {
  var confirmed = confirm(
    '회원번호 : ' +
      userNo +
      ' "' +
      userNickname +
      '"' +
      '님을 정말로 삭제하시겠습니까? '
  );

  if (confirmed) {
    deleteUser(userNo, userNickname);
  } else {
    event.preventDefault();
    console.log('삭제 취소');
  }
}

function deleteUser(userNo, userNickname) {
  var form = document.getElementById('mainForm');
  var userNoInput = document.createElement('input');
  userNoInput.type = 'hidden';
  userNoInput.name = 'userNo';
  userNoInput.value = userNo;
  form.appendChild(userNoInput);

  form.submit();
}
