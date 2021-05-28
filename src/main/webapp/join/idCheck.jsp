<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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
	<title>idcheck.jsp</title>
	
	<script src="js/script.js" type="text/javascript"></script>
</head>

<body>
	<h4><font color="green">아이디 중복확인 및 결과화면</font></h4>
	
	 <hr class="my-4">
	 
	<form action="IdCheckServlet" method="get" name="join">
		아이디&nbsp;&nbsp;<input type="text" name="userId" value="${userId }" />
		
		<input type="submit" class="btn btn-success" value="중복체크" />
		<br />
		
		<c:if test="${result ==1 }">
			<script type="text/javascript">
				opener.document.join.userId.value="";
			</script>
			${userId } 는 이미 사용중인 아이디입니다.
		</c:if>
		
		<c:if test="${result ==0 }">
			${userId } 는 사용가능한 아이디입니다.
			<input type="button" class="btn btn-success" style="margin-top: 5px" value="사용" onclick="idok('${userId }')"/>
		</c:if>
	</form>
</body>

</html>