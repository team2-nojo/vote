
/* 이메일 미리보기 모달 */
const modal = document.getElementById("modal")
const submit = document.getElementById("emailPreview")

/* 이메일 미리보기 버튼 클릭 시 */
submit.addEventListener("click", e => {
    modal.style.display = "flex";
    document.body.style.overflowY = "hidden";

    // 제목 대입
    const updateTitle = document.getElementsByClassName("dashboard-update-input")[0];
    const modalTitle = document.getElementsByClassName("modal-content-title")[0];
    modalTitle.innerHTML = updateTitle.value;


    // 써머노트 컨텐츠 대입
    const summernote = $('#summernote');
    const previewContent = document.getElementById('summernotePreview');
    previewContent.innerHTML = summernote.summernote('code');

    

})



/* 모달창 바깥 영역을 클릭하면 모달창이 꺼지게 하기 */
modal.addEventListener("click", e => {
    const evTarget = e.target
    if(evTarget.classList.contains("modal-overlay")) {
        modal.style.display = "none";
        document.body.style.removeProperty('overflow');
    }
})


/* 모달창이 켜진 상태에서 ESC 버튼을 누르면 모달창이 꺼지게 하기 */
window.addEventListener("keyup", e => {
    if(modal.style.display === "flex" && e.key === "Escape") {
        modal.style.display = "none"
        document.body.style.removeProperty('overflow');
    }
})

/* 이메일 미리보기 모달창 내부 닫기 버튼 */
const modalClose = document.getElementById("modalClose");
modalClose.addEventListener("click", e => {
    modal.style.display = "none";
    document.body.style.removeProperty('overflow');
});



// 써머노트 관련 설정
let content = '';
$(document).ready( () => {
    
    $('#summernote').summernote({
        height: 500,
        minHeight : null,
        maxHeight : null,
        focus : true,
        lang : "ko-KR",
        toolbar: [
        ['style', ['style']],
        ['font', ['bold', 'underline', 'clear']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['table', ['table']],
        ['insert', ['link', 'picture', 'video']],
        ],


        callbacks: {


            // 내용이 있는지 체크
            // onChange:function(contents, $editable){
            //     content = contents;
            //     checkContentsLength();
            // },

            // 써머노트 내에서 이미지 삽입 시
            onImageUpload : function(files) {
              for(let i=0 ; i<files.length ; i++)
                uploadSummernoteImageFile(files[i],this);
            },
            onPaste: function (e) {
              var clipboardData = e.originalEvent.clipboardData;
              if (clipboardData && clipboardData.items && clipboardData.items.length) {
                var item = clipboardData.items[0];
                if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
                  e.preventDefault();
                }
              }
            }
          }

    });
});

  

// ajax로 이미지 업로드
const uploadSummernoteImageFile = (file, editor) => {
    data = new FormData();
    data.append("file", file);
    $.ajax({
      data : data,
      type : "POST",
      url : "/petitionUpdateUploadSummernoteImageFile",
      contentType : false,
      processData : false,
      success : data => {
        $(editor).summernote('insertImage', data.url);
      }
    });
  }
  


/* 썸네일 이미지 업로드 */
const imagePreview = document.getElementById("imagePreview"); // img 태그
const imageInput = document.getElementById("dashboardUpdatefileInput"); // input 태그



/* 업로드 후 미리보기로 사진 변경 */
let initCheck; // 이미지 상태를 저장하는 변수 (false : 기본 이미지,  true : 이전 업로드 이미지)
let deleteCheck = -1; // 이미지가 새로 업로드 되거나 삭제 되었음을 나타내는 변수 (-1 : 초기값 ,  0 : 프로필 삭제(기본이미지),  1 : 새 이미지 업로드)
let originalImage; // 초기 이미지 파일 경로 저장

// 이미지가 출력되는 img태그의 src 속성을 저장
originalImage = imagePreview.getAttribute("src"); 
    

// 현재 이미지 상태를 확인
if(imagePreview.getAttribute("src") == "/resources/images/common/user.png"){ // 기본 이미지인 경우
    initCheck = false;
}else{
    initCheck = true;
}

// 화면에 imageInput이 있을 경우
if(imageInput != null){

    // inputimage이 있을 경우
    imageInput.addEventListener("change", e => {
    
        // 10MB로 최대 크기 제한 
        const maxSize = 1 * 1024 * 1024 * 10; 
        const file = e.target.files[0]; // 업로드한 파일의 정보가 담긴 객체
    
        // 파일을 한번 선택한 후 취소했을 때
        if(file == undefined){ 
            deleteCheck = -1; // 취소 == 파일 없음 == 초기상태
            // 취소 시 기본 이미지로 변경
            imagePreview.setAttribute("src", originalImage);
            return;
        }
    
    
        // 선택된 파일의 크기가 최대 크기를 초과한 경우
        if(file.size > maxSize){ 
            alert("10MB 이하의 이미지를 선택해주세요.");
            imageInput.value = ""; // input 이미지 삭제
            deleteCheck = -1; // 취소 == 파일 없음 == 초기상태
            // 기본 이미지로 변경
            imagePreview.setAttribute("src", originalImage);
            return;
        }
    
        // JS에서 파일을 읽는 객체 생성(파일을 읽고 클라이언트 컴퓨터에 파일을 저장할 수 있음)
        const reader = new FileReader();
        reader.readAsDataURL(file);
        // 매개변수에 작성된 파일을 읽어서 저장 후 파일을 나타내는 URL을 result 속성으로 얻어올 수 있게

        // 파일을 다 읽었을 때
        reader.onload = e => {
            const url = e.target.result;
            // 미리보기 태그에 src 속성으로 추가, exist-image 박스 hidden처리, upload-image 박스 보이게 처리
            imagePreview.setAttribute("src", url);
            document.getElementById("modalImagePreview").setAttribute("src", url);
            document.getElementsByClassName("exist-image")[0].classList.add("hidden");
            document.getElementsByClassName("upload-image")[0].classList.remove("hidden");
            deleteCheck = 1;
        }
    });

} 


const deleteImage = document.getElementById("deleteImage"); // x버튼

    // x버튼 클릭 시
    deleteImage.addEventListener('click', () => {

        imageInput.value = ""; // input type="file"의 value 삭제
        // upload-image 박스 hidden처리, exist-image 박스 보이게 처리
        document.getElementsByClassName("upload-image")[0].classList.add("hidden");
        document.getElementsByClassName("exist-image")[0].classList.remove("hidden");
        deleteCheck = 0;
    });


// 제출 못 하는 경우 : 내용, 타이틀 중 하나라도 작성하지 않았을 때
document.getElementById("dashboardUpdateFrm").addEventListener("submit", e => {


    // 제목 미작성 시
    const petitionUpdateTitle = document.querySelector("input[name = 'petitionUpdateTitle']");
    if(petitionUpdateTitle.value.trim() == '') {
        petitionUpdateTitle.value="";
        petitionUpdateTitle.focus();
        e.preventDefault();
        alert("업데이트 제목을 작성해 주시기 바랍니다.")
        return;
    }

    // 써머노트 컨텐츠 대입하기
    const submitContent = document.getElementById('summernote');
    const summernote = $('#summernote');


    submitContent.value = summernote.summernote('code');
    previewContent.innerHTML = submitContent.value;

    alert("업데이트 이메일이 발송되었습니다.")

});

