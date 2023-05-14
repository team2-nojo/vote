// 서비스약관 체크하려고 할 때 팝업으로 약관 볼 수 있게 하기
const searchButton = document.getElementById("searchButton");
const searchPetitions = document.getElementById("searchPetitions");

searchButton.addEventListener("click", () => {
    // window.open(url);


    // 검색 키워드가 포함된 패티션의 유무에 따라 페이지 이동
    if(searchPetitions.value.length > 0){ 
        const search ="내용"; // 임시변수
        
        // 검색창에 값이 입력되었을 때
        if(searchPetitions.value == search){ 
            // 검색창에 입력된 값이 DB에 있을 때(임시변수와 같을 때로 임시적용 수정예정)
            location.href="searchPetition_result.html"; 
        }else{
            // 검색차에 입력된 값이 없을 때
            location.href="Petitions_not_found.html"; 
        }
    }else{ // 검색창이 공란일 때
        alert("검색어를 입력해주세요.")
        rollback;
    }



    


    
});  


