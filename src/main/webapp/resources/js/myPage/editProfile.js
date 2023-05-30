const userNickname = document.getElementById("userNickname");
const nickMessage = document.getElementById("nickMessage");
const nicknameDupCheck = document.getElementById("nicknameDupCheck");






// 중복확인 버튼 클릭 시
nicknameDupCheck.addEventListener("click", () => {

    // 닉네임에 아무것도 입력이 되지 않은 경우
    if(userNickname.value.trim() == '') {
        alert("닉네임을 입력해주시기 바랍니다.");
        userNickname.value="";
        userNickname.focus();
        checkObj.userNickname = false;
        return;
    } 

    // 닉네임이 유효하지 않은 경우
    const regEx = /^[가-힣\w\d]{2,10}$/;
    if(!regEx.test(userNickname.value)) { 
        alert("닉네임 형식이 유효하지 않습니다.");
        userNickname.value="";
        userNickname.focus();
        checkObj.userNickname = false;
        return;
    }

    // 중복 확인
    fetch("dupCheck/nickname?nickname=" + userNickname.value)
    .then( response => response.text() )
    .then( count => {
        if(count == '0') { // 중복이 아닌 경우
            alert("사용 가능한 닉네임 입니다.");
            document.getElementById("editProfileDescription").focus();
            checkObj.userNickname = true;
        } else { // 중복인 경우
            alert("이미 사용중인 닉네임 입니다.");
            userNickname.value="";
            userNickname.focus();
            checkObj.userNickname = false;
        }
    })
    .catch(err => console.log(err));
});







/* 이미지 업로드 */
const profileImage = document.getElementById("profileUserImage"); // img 태그
const imageInput = document.getElementById("inputUserImage"); // input 태그
const deleteImage = document.getElementById("deleteImage"); // x버튼


/* 업로드 후 미리보기로 원 안의 프로필 사진 변경 */
let initCheck; // 초기 프로필 이미지 상태를 저장하는 변수 (false : 기본 이미지,  true : 이전 업로드 이미지)
let deleteCheck = -1; // 프로필 이미지가 새로 업로드 되거나 삭제 되었음을 나타내는 변수 (-1 : 초기값 ,  0 : 프로필 삭제(기본이미지),  1 : 새 이미지 업로드)
let originalImage; // 초기 프로필 이미지 파일 경로 저장


if(imageInput != null){ // 화면에 imageInput이 있을 경우

    // 프로필 이미지가 출력되는 img태그의 src 속성을 저장
    originalImage = profileImage.getAttribute("src"); 


    // 현재 회원의 프로필 이미지 상태를 확인
    if(profileImage.getAttribute("src") == "/resources/images/common/user.png"){ // 기본 이미지인 경우
        initCheck = false;
    }else{
        initCheck = true;
    }
    

// inputimage이 있을 경우
    imageInput.addEventListener("change", e => {
        
        // 2MB로 최대 크기 제한 
        const maxSize = 1 * 1024 * 1024 * 2; 
        const file = e.target.files[0]; // 업로드한 파일의 정보가 담긴 객체

        // 파일을 한번 선택한 후 취소했을 때
        if(file == undefined){ 
            deleteCheck = -1; // 취소 == 파일 없음 == 초기상태
            // 취소 시 기본 프로필 이미지로 변경
            profileImage.setAttribute("src", originalImage);
            return;
        }


        // 선택된 파일의 크기가 최대 크기를 초과한 경우
        if(file.size > maxSize){ 
            alert("2MB 이하의 이미지를 선택해주세요.");
            imageInput.value = ""; // input 이미지 삭제
            deleteCheck = -1; // 취소 == 파일 없음 == 초기상태
            // 기존 프로필 이미지로 변경
            profileImage.setAttribute("src", originalImage);
            return;
        }


        // JS에서 파일을 읽는 객체 생성(파일을 읽고 클라이언트 컴퓨터에 파일을 저장할 수 있음)
        const reader = new FileReader();
        reader.readAsDataURL(file);
        // 매개변수에 작성된 파일을 읽어서 저장 후 파일을 나타내는 URL을 result 속성으로 얻어올 수 있게

        // 파일을 다 읽었을 때
        reader.onload = e => {
            const url = e.target.result;
            // 프로필이미지(img) 태그에 src 속성으로 추가
            profileImage.setAttribute("src", url);
            deleteCheck = 1;
        }
    });


    // x버튼 클릭 시
    deleteImage.addEventListener('click', () => {
        imageInput.value = ""; // input type="file"의 value 삭제

        profileImage.setAttribute("src", "/resources/images/common/user.png");
        // 프로필 이미지를 기본 이미지로 변경

        deleteCheck = 0;
    });
        
    




    // #profileFrm이 제출 되었을 때
    document.getElementById("profileFrm").addEventListener("submit", e => {

        if(userNickname.value.trim() == '') {
            e.preventDefault();
            alert("변경할 닉네임을 작성해 주시기 바랍니다")
            return;
        }


        let flag = true;

        // 프로필 이미지가 없다 -> 있다
        if(!initCheck && deleteCheck == 1)  flag = false;

        // 이전 프로필 이미지가 있다 -> 삭제
        if(initCheck && deleteCheck == 0)   flag = false;

        // 이전 프로필 이미지가 있다 -> 새 이미지
        if(initCheck && deleteCheck == 1)   flag = false;
        

    });


}