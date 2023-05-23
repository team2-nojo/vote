function updateDeletePetition(petitionNo, userNickname) {
  var confirmed = confirm(
    '청원 번호 : ' +
      petitionNo +
      '\n\n' +
      ' "' +
      userNickname +
      '"' +
      '님의 청원을 정말로 복구하시겠습니까? '
  );

  if (confirmed) {
    deleteUser(petitionNo, userNickname);
  } else {
    event.preventDefault();
    console.log('삭제 취소');
  }
}

function deleteUser(petitionNo, userNickname) {
  var form = document.getElementById('mainForm');
  var petitionNoInput = document.createElement('input');
  petitionNoInput.type = 'hidden';
  petitionNoInput.name = 'petitionNo';
  petitionNoInput.value = petitionNo;
  form.appendChild(petitionNoInput);

  form.submit();
  alert('복구 성공~!');
}
