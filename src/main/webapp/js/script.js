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
	return true;
}

/**아이디 중복확인**/
// 아이디 중복확인 클릭 시 함수
function idCheck(){
	if (document.join.userId.value == "") {
		alert("아이디를 입력 해주세요.");
		document.join.userId.focus();
		return;
	}
	// 로그인 서블릿에 get방식으로 정보 전달하여 작업
	var url = "../IdCheckServlet?userId=" + document.join.userId.value;
	window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=200");
}

// 아이디 중복확인 새 창에서 중복확인 완료된 아이디 사용 버튼 클릭시
function idok(userId) {
	opener.join.userId.value = document.join.userId.value;
	opener.join.hidden_idCheck.value = document.join.userId.value;
	self.close();
}

/**우편번호 찾기**/
// 우편번호찾기 최초 클릭 시 함수
function zipCheck(){
	url="../ZipSearchServlet?search=n";
	window.open(url, "_blank_2", "toolbar=no, width=500, height=300, directories=no, status=yes, scrollbars=yes, menubar=no");
}
