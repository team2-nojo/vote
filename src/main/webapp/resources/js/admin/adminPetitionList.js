document.getElementsByTagName('li')[4].style.backgroundColor = '#333';

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
// 클릭 이벤트 핸들러 등록
document.querySelectorAll('.caret').addEventListener('click', function () {
  // 현재 요소에 fa-rotate-180 클래스가 있는지 확인
  var hasRotate180Class = this.classList.contains('fa-rotate-180');

  // fa-rotate-180 클래스가 있는 경우 제거, 없는 경우 추가
  if (hasRotate180Class) {
    this.classList.remove('fa-rotate-180');
  } else {
    this.classList.add('fa-rotate-180');
  }

  // Ajax 요청 수행
  // ...
});
