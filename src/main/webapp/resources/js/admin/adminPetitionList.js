function confirmChange(selectElement) {
  var selectedValue = selectElement.value;
  var userNickname = selectElement
    .closest('tr')
    .querySelector('.userNickname').textContent;

  var selectedValue2 = selectElement.value;
  var petitionNo = selectElement
    .closest('tr')
    .querySelector('.petitionNo').textContent;

  var selectedNumber = selectElement.value;
  var confirmed = confirm(
    '"' +
      userNickname +
      '"' +
      '님의 ' +
      '청원을 ' +
      '메인 ' +
      '"' +
      selectedNumber +
      '"' +
      '번' +
      '으로 변경하시겠습니까?'
  );

  if (confirmed) {
    // 선택한 값을 컨트롤러로 전송
    var form = document.createElement('form');
    form.setAttribute('action', '/adminPetitionList');
    form.setAttribute('method', 'POST');

    // selectedNumber를 hidden 필드로 추가
    var inputSelectedNumber = document.createElement('input');
    inputSelectedNumber.setAttribute('type', 'hidden');
    inputSelectedNumber.setAttribute('name', 'selectedNumber');
    inputSelectedNumber.setAttribute('value', selectedNumber);
    form.appendChild(inputSelectedNumber);

    // userNickname을 hidden 필드로 추가
    var inputUserNickname = document.createElement('input');
    inputUserNickname.setAttribute('type', 'hidden');
    inputUserNickname.setAttribute('name', 'userNickname');
    inputUserNickname.setAttribute('value', userNickname);
    form.appendChild(inputUserNickname);

    var inputPetitionNo = document.createElement('input');
    inputPetitionNo.setAttribute('type', 'hidden');
    inputPetitionNo.setAttribute('name', 'petitionNo');
    inputPetitionNo.setAttribute('value', petitionNo);
    form.appendChild(inputPetitionNo);

    document.body.appendChild(form);
    form.submit();
  }
}

function confirmDeletePetition(petitionNo, userNickname) {
  var confirmed = confirm(
    '청원 번호 : ' +
      petitionNo +
      '\n\n' +
      ' "' +
      userNickname +
      '"' +
      '님의 청원을 정말로 삭제하시겠습니까? '
  );

  if (confirmed) {
    deleteUser(petitionNo, userNickname);
  } else {
    event.preventDefault();
    console.log('삭제 취소');
  }
}

function deleteUser(petitionNo, userNickname) {
  var form = document.getElementById('mainForm2');
  var petitionNoInput = document.createElement('input');
  petitionNoInput.type = 'hidden';
  petitionNoInput.name = 'petitionNo';
  petitionNoInput.value = petitionNo;
  form.appendChild(petitionNoInput);

  form.submit();
  alert('삭제 성공~!');
}
