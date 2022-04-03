function memberUpdate(){

    if(document.memberProfile.pwd.value != document.memberProfile.pwd2.value){
        alert("비밀번호가 일치하지 않습니다.");
        document.memberProfile.pwd2.focus();
        history.back();
        //return;
    }
    else{
        document.memberProfile.submit();
        alert("개인정보를 수정하였습니다.");
    }
}

// 회원가입 확인 클릭 시 함수 (필수 항목 입력 체크)
function ckeckJoin(){
    // 아이디 입력 안했을시
    if (document.join.userId.value.length == 0) {
        alert("아이디 입력은 필수입니다.");
        join.userId.focus();
        return false;
    }

    // 비밀번호 입력 안했을 시
    if (document.join.userPwd.value.length == 0) {
        alert("비밀번호 입력은 필수입니다.");
        join.userPwd.focus();
        return false;
    }

    // 비밀번호 확인 안했을 시
    if (document.join.userPwd2.value.length == 0) {
        alert("비밀번호 확인은 필수입니다.");
        join.userPwd2.focus();
        return false;
    }


    // 이름 입력 안했을 시
    if (document.join.name.value.length == 0) {
        alert("이름 입력은 필수입니다.");
        join.name.focus();
        return false;
    }

    // 닉네임 입력 안했을 시
    if (document.join.nick.value.length == 0) {
        alert("닉네임 입력은 필수입니다.");
        join.nick.focus();
        return false;
    }

    // 우편번호 입력 안했을 시
    if (document.join.zipcode.value.length == 0) {
        alert("우편번호 입력은 필수입니다.");
        join.zipcode.focus();
        return false;
    }

    // 주소 입력 안했을 시
    if (document.join.address.value.length == 0) {
        alert("주소 입력은 필수입니다.");
        join.address.focus();
        return false;
    }

    // 비밀번호와 비밀번호 확인 값이 다를 시
    if(document.join.userPwd.value != document.join.userPwd2.value){
        alert("비밀번호와 확인 값을 확인하세요.");
        join.userPwd2.focus();
        return false;
    }

    // 아이디 중복확인 안했을 시 함수
    if (document.join.hidden_idCheck.value.length == 0) {
        alert("아이디 중복 체크를 하지 않았습니다.");
        join.userId.focus();
        return false;
    }

    /**비밀번호 유효성 검사**/
    var pw = document.join.userPwd.value;
    var num = pw.search(/[0-9]/g);
    var eng = pw.search(/[a-z]/ig);
    var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

    if (pw.length < 10 || pw.length > 20) {
        alert("비밀번호를 10자리 ~ 20자리 이내로 입력해야합니다.");
        return false;
    } else if (pw.search(/\s/) != -1) {
        alert("비밀번호는 공백 없이 입력해주세요.");
        return false;
    } else if ((num < 0 && eng < 0) || (eng < 0 && spe < 0)
        || (spe < 0 && num < 0)) {
        alert("비밀번호는 영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해야합니다.");
        return false;
    }

    document.join.submit();
}

/** 아이디 중복확인* */
// 아이디 중복확인 클릭 시 함수
function idCheck(){
    // 로그인 서블릿에 get방식으로 정보 전달하여 작업
    // var url = "../IdCheck?userId=" + document.join.userId.value;

    var regulid = /^[a-zA-Z0-9]{4,12}$/;
    if (document.join.userId.value == "") {
        alert("아이디를 입력 해주세요.");
        document.join.userId.focus();
        return;
    }

    if(!regulid.test(document.join.userId.value)){
        alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다.");
        document.join.userId.focus();
        return false;
    }

    var url = "../IdCheck?userId=" + document.join.userId.value;
    window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=200");
}


// 아이디 중복확인 새 창에서 중복확인 완료된 아이디 버튼 클릭시
function idok(userId) {
    // var id = opener.join.userId.value;
    // var hidden_id = opener.join.hidden_idCheck.value;
    opener.join.userId.value = document.join.userId.value;
    opener.join.hidden_idCheck.value = document.join.userId.value;
    // self.close();

    window.close();
}

/**우편번호 찾기**/
// 우편번호찾기 최초 클릭 시 함수
function zipCheck(){
    url="../ZipSearch?search=n";
    window.open(url, "_blank_2", "toolbar=no, width=500, height=300, directories=no, status=yes, scrollbars=yes, menubar=no");
}