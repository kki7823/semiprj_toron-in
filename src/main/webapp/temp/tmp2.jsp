<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<String> list = new ArrayList<>();
    list.add("aaa");
    list.add("bbb");
    list.add("ccc");
    list.add("ddd");
    pageContext.setAttribute("list",list);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <c:forEach var="item" items="${list}" begin="0" end="3" step="1" varStatus="status">
        ${item}
    </c:forEach>
</body>
</html>
