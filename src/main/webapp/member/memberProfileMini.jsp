<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.toron.dto.*" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
    <!-- 미니 -->
    <div id="main_memobox" class="col">
        <div id="main_profile_photo">
            <img alt="profile" src="image/default.jpg" height="85px" width="90px"/>
        </div>

        <div id="main_profile_info">
            <font style="font-family:'MaplestoryOTFLight'; font-size:1em">${sessionScope.loginUser.id}</font> <br />
            <font style="font-family:'MaplestoryOTFLight';"><b>${sessionScope.loginUser.nick}</b></font>님 환영합니다. <br />
            <a style="color: green; text-decoration: none;" href="member/memberProfile.jsp">마이페이지</a>
        </div>
    </div>
</body>
</html>