<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.toron.dto.MemberBean, com.toron.dao.*" %>
<!DOCTYPE html>
<html>
<head>
	<!--Bootstrap-->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
            crossorigin="anonymous">
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
            crossorigin="anonymous"></script>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript">
		alert("회원가입 성공!");
	</script>
</head>
<body>
	<!-- ${member.getPhoto()} -->
	
	<div id="memberP_con" class="container-lg">
		<div id="memP_title">
			<h2>개인 정보 확인</h2>
			<hr class="my-4">
		</div>
		<form class="needs-validation" novalidate="" name="memberProfile">
			<div class="row g-3">
				<div id="member_photo_box">
					<!-- 파일 구현 후 수정 -->
					<img id="member_photo" src="image/${member.getPhoto() }" />
				</div>
				<div></div>
				
				<div class="col-sm-6">
					<span>아이디</span><span style="color: darkred;">&nbsp;*</span><br />
					<input type="text" name="id" class="form-control" id="join_idbar"
						placeholder="영문소문자/숫자, 4~16자" value="${member.getId() }" required="required"
						style="display: inline" />

				</div>

				<div class="col-sm-6">
					<span>닉네임</span><span style="color: darkred;">&nbsp;*</span> 
					<input type="text" name="nick" class="form-control" id="join_nickbar" value="${member.getNick()}"
						required="required" />
					<div class="invalid-feedback">Valid name is required.</div>
				</div>


				<div class="col-sm-6">
					<span>이름</span><span style="color: darkred;">&nbsp;*</span> 
					<input type="text" name="name" class="form-control" id="join_namebar" value="${member.getName()}"
						required="required" />
					<div class="invalid-feedback">Valid name is required.</div>
				</div>


				<div class="col-sm-6">
					<span>전화번호</span> <span style="color: darkred;">&nbsp;*</span>
					<input type="text" name="phone" class="form-control" id="join_phonebar" value="${member.getPhone()}" required="required" />
					<div class="invalid-feedback">Valid name is required.</div>
				</div>

				<div class="col-sm-6">
					<span>비밀번호</span><span style="color: darkred;">&nbsp;*</span> 
					<input type="password" name="pwd" class="form-control" id="join_pwbar"
						placeholder="영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자" value="${member.getPwd()}"
						required="required" />
					<div class="invalid-feedback">Valid password is required.</div>
				</div>
				<div class="col-sm-6">
					<span>비밀번호 확인</span><span style="color: darkred;">&nbsp;*</span> 
					<input type="password" name="pwd2" class="form-control" id="join_pwbar2"
						placeholder="영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자" value="${member.getPwd()}"
						required="required" />
					<div class="invalid-feedback">Valid password is required.</div>
				</div>

				<div style="width: 800px;" class="col-sm-6">
					<span>이메일</span> <span style="color: darkred;">&nbsp;*</span>
					<input type="email" name="email" class="form-control" id="join_emailbar" placeholder="email@example.com"
						value="${member.getEmail()}" required="required" />
					<div class="invalid-feedback">Valid name is required.</div>
				</div>

				<div class="col-sm-6">
					<span>우편번호</span><span style="color: darkred;">&nbsp;*</span><br />
					<input type="text" name="zipcode" class="form-control" id="join_postalbar"
						value="${member.getZipcode()}" required="required"
						style="display: inline" />

					<div class="invalid-feedback">Valid name is required.</div>
				</div>

				<div class="col-sm-6">
					<span>주소</span><span style="color: darkred;">&nbsp;*</span> 
					<input type="text" name="address" class="form-control" id="join_addressbar"
						value="${member.getAddress()}" required="required" />
					<div class="invalid-feedback">Valid name is required.</div>
				</div>
				<%
				
					request.setCharacterEncoding("UTF-8");
					
					String userId=(String)request.getAttribute("userId");
					MemberDAO dao=MemberDAO.getInstance();
					MemberBean m=dao.select_member_one(userId);
					
					//System.out.println(userId);
					
					//010100 (건강, 학업)
					String interests[]=m.getInterest();
				%>
				 
				<div class="my-3">
					<span>관심분야<br /></span>
					<div class="form-check">
						<input id="social" name="interest" type="checkbox"
							class="form-check-input" value="사회" <%out.println(interests[0].equals("1") ? "checked" : "");%>> 
							<label class="form-check-label" for="social">사회</label>
					</div>
					<div class="form-check">
						<input id="health" name="interest" type="checkbox"
							class="form-check-input" value="건강" <%out.println(interests[1].equals("1") ? "checked" : "");%>> 
							<label class="form-check-label" for="health">건강</label>
					</div>
					<div class="form-check">
						<input id="love" name="interest" type="checkbox"
							class="form-check-input" value="연애" <%out.println(interests[2].equals("1") ? "checked" : "");%>> 
							<label class="form-check-label" for="love">연애</label>
					</div>
					<div class="form-check">
						<input id="study" name="interest" type="checkbox"
							class="form-check-input" value="학업" <%out.println(interests[3].equals("1") ? "checked" : "");%>> <label
							class="form-check-label" for="study">학업</label>
					</div>
					<div class="form-check">
						<input id="work" name="interest" type="checkbox"
							class="form-check-input" value="직장" <%out.println(interests[4].equals("1") ? "checked" : "");%>> 
							<label class="form-check-label" for="work">직장</label>
					</div>
					<div class="form-check">
						<input id="etc" name="interest" type="checkbox"
							class="form-check-input" value="기타" <%out.println(interests[5].equals("1") ? "checked" : "");%>> 
							<label class="form-check-label" for="ect">기타</label>
					</div>
				</div>
				 

			</div>
			<!-- End of join_mainbox -->
			<div id="join_buttonbox">
				<input class="btn btn-success" type="button" value="로그인" onclick="location.href='login/loginForm.jsp'"/>
			</div>

		</form>
	</div>
</body>
</html>