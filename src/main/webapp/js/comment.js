//수정 버튼 클릭시 textare 수정 가능하게 변경 및 버튼 변경
function editComment(commentNo) {
    var editArea = document.getElementById("comment-" + commentNo);
    editArea.removeAttribute("readonly");
    document.getElementById('comment_btn_edit-' + commentNo).style.display = "none";
    document.getElementById('comment_btn_editconf-' + commentNo).style.display = "inline";
    editArea.focus();
}

function lineBreak(){
    document.getElementById("listD_commentIn_y").addEventListener('keyup',count)


}

function count(){
    var textlen = document.getElementById("listD_commentIn_y").value.length;
    document.getElementById("temp1").innerText = textlen;
}