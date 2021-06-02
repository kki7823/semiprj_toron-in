//수정 버튼 클릭시 textare 수정 가능하게 변경 및 버튼 변경
function editComment(commentNo) {
    var editArea = document.getElementById("comment-" + commentNo);
    editArea.removeAttribute("readonly");
    document.getElementById('comment_btn_edit-' + commentNo).style.display = "none";
    document.getElementById('comment_btn_editconf-' + commentNo).style.display = "inline";
    editArea.focus();
}

function loginLock_yn(id) {
    var commentBox = document.getElementById("listD_commentIn_y")
    if (id == null) {
        commentBox.setAttribute('readonly', 'readonly');
        commentBox.innerText = "로그인이 필요합니다.";
    } else {
        commentBox.removeAttribute("readonly");
    }
}

function loginLock_free(id) {
    var commentBox = document.getElementById("listD_commentIn")
    if (id === "") {
        commentBox.setAttribute('readonly', 'readonly');
        commentBox.innerText = "로그인이 필요합니다.";
    } else {
        commentBox.removeAttribute("readonly");
    }
}