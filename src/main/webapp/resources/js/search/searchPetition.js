// 전체 검색 입력시 일치하는 청원 제목 요소로 추가
document.addEventListener("DOMContentLoaded", () => {

    const query = document.querySelector("#searchPetitions");
    const searchResult = document.querySelector("#searchResult");

    query.addEventListener("input", e => {

        if(query.value.trim().length > 0){
            fetch("/search/allSearch?query=" + query.value.trim())
            .then(resp => resp.json())
            .then(list => {
                console.log(list);

                if(list.length > 0){ 
                    searchResult.classList.remove("close");
                    searchResult.innerHTML = "";

                    for(let map of list){
                        const li = document.createElement("li");
                        li.setAttribute("path", `${map.PT_NO}`);

                        const a = document.createElement("a");

                        map.PT_TITLE = map.PT_TITLE.replace(query.value, `<mark>${query.value}</mark>`);
                        map.PT_TITLE = `<span>${map.PT_TITLE}</span>`;

                        a.innerHTML = `<i class="fa-sharp fa-solid fa-magnifying-glass"></i>${map.PT_TITLE}`;
                        a.setAttribute("href", "#");
                        a.addEventListener("click", e => {
                            e.preventDefault();
                            const path = e.currentTarget.parentElement.getAttribute("path");
                            location.href = "/browse/petitionView/details/" + path;
                        });
                        li.append(a)
                        searchResult.append(li);
                    }
                }else{
                    searchResult.classList.add("close");
                }
            })
            .catch(err => console.log(err));
        }else{
            searchResult.classList.add("close");
        }
    })
    
});


// 검색창 닫기
document.addEventListener("click", e => {
    const elementList = document.querySelectorAll(".search, .search *");
    const searchResult = document.querySelector("#searchResult"); // 검색창 자동 완성 영역

    let flag = true;
    for(let element of elementList){
        if(element == e.target){
            flag = false;
            break;
        }
    }

    if(flag){
        searchResult.classList.add("close");
    }
});
