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

/* 대시보드에서 특정위치로 이동 */
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
    inputI.addEventListener("mouseover", () => { inputP.style.display = "block"; });
    inputI.addEventListener("mouseout", () => { inputP.style.display = "none"; });
};
tipHover("scope");
tipHover("location");
tipHover("topic");
tipHover("owner");
tipHover("twitter");

/* 주제추가 */
const addTopicBox = document.getElementById("addTopicBox");
let topicCount = 0;
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




/* summerNote */
let content = '';
$(document).ready(() => {
    //에디터 설정
    $('#summernote').summernote({
        height: 500,                 // 에디터 높이
        minHeight: null,             // 최소 높이
        maxHeight: null,             // 최대 높이
        focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
        lang: "ko-KR",					// 한글 설정
        toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'underline', 'clear']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['table', ['table']],
            ['insert', ['link', 'picture']],
        ],
        callbacks: {
            onChange: function (contents, $editable) { //텍스트 글자수
                content = contents;
                checkContentsLength();
            },
            onImageUpload: function (files) {
                for (let i = 0; i < files.length; i++)
                    uploadSummernoteImageFile(files[i], this);
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
// 내용이 있는 지 체크
const checkContentsLength = () => {
    console.log(content);
    let str = f_SkipTags_html(content).trim();
    console.log(str);
    if (str == '') nextBtn.disabled = true;
    else nextBtn.disabled = false;
}

// ajax로 이미지 업로드
const uploadSummernoteImageFile = (file, editor) => {
    data = new FormData();
    data.append("file", file);
    $.ajax({
        data: data,
        type: "POST",
        url: "/uploadSummernoteImageFile",
        contentType: false,
        processData: false,
        success: data => {
            $(editor).summernote('insertImage', data.url);
        }
    });
}