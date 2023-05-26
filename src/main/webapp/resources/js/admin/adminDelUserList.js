function confirmDeleteUserCancle(userNo, userNickname) {
  var confirmed = confirm(
    '회원번호: ' +
      ' "' +
      userNo +
      ' "' +
      '\n\n' +
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
    userNoInput.name = 'userNo';
    userNoInput.value = userNo;
    form.appendChild(userNoInput);

    document.body.appendChild(form);
    form.submit();
    alert('복구 성공~!');
  } else {
    console.log('복구 취소');
  }
}
