/* 대시보드에서 특정위치로 이동 */
window.addEventListener('load', function() {
    if (window.location.hash === '#titleEdit') {
        scrollToElement(document.querySelector('#titleEdit'));
    }
    if (window.location.hash === '#imgEdit') {
        scrollToElement(document.querySelector('#imgEdit'));
    }
    if (window.location.hash === '#contentEdit') {
        scrollToElement(document.querySelector('#contentEdit'));
    }
    if (window.location.hash === '#topicEdit') {
        scrollToElement(document.querySelector('#topicEdit'));
    }
});

function scrollToElement(element) {
    var offset = element.offsetTop;
    window.scrollTo({
        top: offset,
        behavior: 'smooth'
    });
}

/* 청원 주요내용 팁보기 */
function tipView(input) {
    const inputTip = document.getElementById(input.slice(0, -3));
    const inputBtn = document.getElementById(input);
    inputBtn.addEventListener("click", () => {
        if (input.slice(-3, -2) == 'B') inputTip.classList.add("dp-block");
        else inputTip.classList.remove("dp-block");
    });
};
tipView('titleTipBtn');
tipView('descriptTipBtn');
tipView('imgTipBtn');
tipView('titleTipCtn');
tipView('descriptTipCtn');
tipView('imgTipCtn');

/* 청원 데이터 팁보기 */
function tipHover(input) {
    const inputI = document.getElementById(`${input}I`);
    const inputP = document.getElementById(`${input}P`);
    inputI.addEventListener("mouseover", () => { inputP.style.display = "block"});
    inputI.addEventListener("mouseout", () => { inputP.style.display = "none"});
};
tipHover("scope");
tipHover("topic");

/* 주제추가 */
const addTopicBox = document.getElementById("addTopicBox");
const inputTopic = document.querySelectorAll('#addTopicBox > div');
let topicCount = inputTopic.length;
let topicInputReference;


function addTopic() {
    if (topicCount >= 5) return;
    const topicInput = document.getElementById("topicInput");
    const topicValue = topicInput.value.trim();
    if (topicValue === "") return;

    const addTopic = document.createElement("div");
    addTopic.innerHTML = `<span>${topicValue}&nbsp;<i class="fa-regular fa-rectangle-xmark"></i></span>`;
    addTopic.addEventListener("click", (e) => {
        e.target.remove();
        topicCount--;
        if (topicCount === 4 && topicInputReference) restoreTopicInput();
    });
    
    topicInput.insertAdjacentElement("beforebegin", addTopic);
    topicInput.value = "";
    topicCount++;

    if (topicCount === 5 && !topicInputReference) {
        topicInputReference = topicInput;
        topicInput.remove();
    }
}

function restoreTopicInput() {
    if (topicInputReference) {
        addTopicBox.insertBefore(topicInputReference, addTopicBox.lastChild);
        topicInputReference = null;
    };
};

addTopicBox.addEventListener("click", () => {
    if (topicCount === 4 && topicInputReference) {
        restoreTopicInput();
    }
});

addTopicBox.addEventListener('keyup', (e) => {
    if (e.key === 'Enter') {
        addTopic();
    }
});

inputTopic.forEach(element => {
    element.addEventListener('click', e =>{
        e.target.remove();
        topicCount--;
        if (topicCount === 4 && topicInputReference) restoreTopicInput();
    });
});



/* img 제거 및 업로드 */
const imgframe = document.querySelector(".img-upload");

function imgDelete(){

    imgframe.innerHTML="";
    
    const input = document.createElement("input");
    input.setAttribute("type","file");
    input.setAttribute("id","inputImgUpload");
    input.addEventListener('change',preView);

    const label = document.createElement("label");
    label.setAttribute("id","imgUpload");
    label.setAttribute("for","inputImgUpload");
    
    const span = document.createElement("span");
    span.innerText = 'Upload an image';

    label.append(span);
    
    imgframe.append(input, label);
    
}

if(document.getElementById("imgDelete") != null){
    document.getElementById("imgDelete").addEventListener('click', imgDelete);
}

/* img 미리보기 */

if(document.getElementById("inputImgUpload") != null){
    document.getElementById("inputImgUpload").addEventListener('change',preView);
}

function preView(e){

    let file = e.target.files[0];
    let reader = new FileReader();

    reader.readAsDataURL(file);
    reader.onload = function(e) {
        let result = e.target.result;
        
        imgframe.innerHTML="";
        const img = document.createElement("img");
        img.setAttribute("src",result);

        const div = document.createElement("div");
        div.setAttribute("id","imgDelete");
        div.textContent = "x";
        div.addEventListener('click',imgDelete);
        
        imgframe.append(img, div);
    };
};


/* 제출하기 */

/* 버튼제어 */
const saveBtn = document.getElementById("save");
const cancelBtn = document.getElementById("cancel");

// 이전페이지로, 작성계속
cancelBtn.addEventListener('click', () => {

    let result = confirm("기존 내용을 제외한 작성된 내용이 모두 초기화 되었습니다.\n이전화면으로 돌아가시겠습니까?");
    if(result){
        location.href = document.referrer;
        return;
    }else{
        return;
    }
    alert(result);
});

// 텍스트제거 후 섬머노트 내용 없으면 비활성화
const checkContentsLength = () => {
    let str = f_SkipTags_html(content).trim();
    if(str=='') saveBtn.disabled = true;
    else saveBtn.disabled = false;
}

//에디터 내용 텍스트 제거
const f_SkipTags_html = (input, allowed) => {
	// 허용할 태그는 다음과 같이 소문자로 넘겨받습니다. (<a><b><c>)
    allowed = (((allowed || "") + "").toLowerCase().match(/<[a-z][a-z0-9]*>/g) || []).join('');
    var tags = /<\/?([a-z][a-z0-9]*)\b[^>]*>/gi,
    commentsAndPhpTags = /<!--[\s\S]*?-->|<\?(?:php)?[\s\S]*?\?>/gi;
    return input.replace(commentsAndPhpTags, '').replace(tags, function ($0, $1) {
        return allowed.indexOf('<' + $1.toLowerCase() + '>') > -1 ? $0 : '';
    });
}


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

const editForm = document.getElementById("editForm"); // 폼
const category = document.getElementById("inputCategory");

saveBtn.addEventListener('click', () => {
    // category.value = addTopicBox.innerText.replace(/\s*\n\s*/g, ",");
    category.value = addTopicBox.innerText.replace(/\s+\n/g, ",").trim();
});


editForm.addEventListener("submit", () => {
    // 제목 미작성 시
    const petitionUpdateTitle = document.querySelector("input[name = 'petitionUpdateTitle']");
    if(petitionUpdateTitle.value.trim() == '') {
        petitionUpdateTitle.value="";
        petitionUpdateTitle.focus();
        e.preventDefault();
        alert("업데이트 제목을 작성해 주시기 바랍니다.")
        return;
    }

    // 제출할때 섬머노트 내용 대입
    const summernote = $('#summernote');
    const submitContent = document.getElementById('summernote');

    submitContent.value = summernote.summernote('code');
    
});

// 엔터키 제출 막기
editForm.addEventListener("keydown", evt => {
    if (evt.code === "Enter") 
    evt.preventDefault();
});