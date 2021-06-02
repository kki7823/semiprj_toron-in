<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <!--Bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
            crossorigin="anonymous"></script>
    <script src="../js/list.js" type="text/javascript"></script>
    <link href="../css/style1.css?ver=1222 " rel="stylesheet" type="text/css">
    <%--    수정하기는 업로드 양식 그대로 사용--%>
    <title>수정하기</title>
</head>
<body>
    <div id="container" class="container-lg" style="border: 1pt solid">
        <form id="listU_mainbox" class="container-lg" action="../ListEdit" method="post">
            <div id="listU_titleheader" class="py-5 text-center" style="border: 1pt solid">
                <h2>수정하기</h2>
                <hr class="my-4">
            </div>
            <div id="listU_row1" class="row" style="border: 1pt solid">
                <div id="listU_categorybox" class="col" style="border: 1pt solid">
                    <span>카테고리&nbsp;</span>
                    <select id="listU_category" class="form-select" aria-label="listU_category">
                        <option value="0" selected>카테고리</option>
                        <option value="1">사회</option>
                        <option value="2">건강</option>
                        <option value="3">연애</option>
                        <option value="4">학업</option>
                        <option value="5">직장</option>
                    </select>
                </div>
                <input name="no" type="hidden" value="${sessionScope.sList.no}">
                <div id="listU_titlebox" style="border: 1pt solid">
                    <span>제목 </span>
                    <input name="title" type="text" class="form-control" id="listU_titlebar" placeholder="제목"
                           value="${sessionScope.sList.title}"
                           required="required"/>
                </div>
                <div id="listU_contentsbox" style="border: 1pt solid">
                    <span>내용</span>
                    <textarea name="content" class="form-control" id="listU_contentsarea"
                              rows="20">${sessionScope.sList.content}</textarea>
                </div>
                <div id="listU_upload" style="border: 1pt solid">
                    <span>파일 첨부</span>
                    <input name="file" class="form-control" type="file" id="listU_uploadbar"
                           value="${sessionScope.sList.upload}"/>
                </div>
                <div id="listU_buttonbox" class="col">
                    <button class="btn btn-primary btn-lg" type="submit">저장</button>
                    <button class="btn btn-primary btn-lg" type="button">취소</button>
                </div>
            </div>
        </form>
    </div>
</body>
</html>