function checkParam() {

    //토론양식 미선택시
    var listT = document.getElementById('listU_format');
    var type = document.getElementById('listU_format').selectedIndex;

    if (listT.options[type].value === '0') {
        alert("토론양식이 선택되지 않았습니다.");
        alert(listT.options[type].innerText);
        document.getElementById('listU_format').focus();
        return;
    }

    //카테고리 미선택시
    var listC = document.getElementById('listU_category');
    var category = document.getElementById('listU_category').selectedIndex;

    if (listC.options[category].value === '0') {
        alert("카테고리가 선택되지 않았습니다.");
        document.getElementById('listU_category').focus();
        return;
    }

    //제목 미입력시
    var title = document.getElementById('listU_titlebar').value;

    if (!title) {
        alert("제목을 입력하세요.");
        document.getElementById('listU_titlebar').focus();
        return;
    }

    //(자유토론만)내용 미입력시
    var contents = document.getElementById('listU_contentsarea').value;

    if ((!contents) && (listT.options[type].value === '1')) {
        alert("내용을 입력하세요.");
        document.getElementById('listU_contentsarea').focus();
        return;
    }

    document.getElementById('listU_from').submit();
}

// 토론양식 -> 찬반토론 선택시 내용 감추기
function hiddenContents() {

    var listT = document.getElementById('listU_format');
    var type = document.getElementById('listU_format').selectedIndex;

    if (listT.options[type].value === '2') {
        document.getElementById('listU_contentsbox').style.display = "none";
        document.getElementById("listU_upload").style.display = "none";
    } else {
        document.getElementById('listU_contentsbox').style.display = "block";
        document.getElementById("listU_upload").style.display = "block";
    }
}

//로그인 후 글작성(href)
function uploadLock(id) {
    if (id === "") {
        alert("로그인이 필요 합니다.");
    } else {
        location.href = 'listUpload.jsp';
    }
}

//글번호와 일치하는 카테고리 선택
function selectCat(cat) {
    var checkboxCat = document.getElementById("listU_category")
    var idx = document.getElementById('listU_category').selectedIndex;
    var innertext = checkboxCat.options[idx].innerText
    for (var i = 0 ; i<5; i++ ) {
        if (cat === innertext) {
            checkboxCat.option[idx].setAttribute("checked", "checked")
        }
    }
}