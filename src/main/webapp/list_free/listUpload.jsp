<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!--Bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
            crossorigin="anonymous"></script>
    <link href="../css/style1.css?ver=1222s2 " rel="stylesheet" type="text/css">
    <title>글쓰기</title>
</head>
<body>
    <div id="container" class="container-lg" style="border: 1pt solid">
        <div id="listU_mainbox" class="container-lg">
            <div id="listU_titleheader" class="py-5 text-center" style="border: 1pt solid">
                <h2>글작성</h2>
                <hr class="my-4">
            </div>
            <div id="listU_row1" class="row" style="border: 1pt solid">
                <div id="listU_formatbox" class="col" style="border: 1pt solid">
                    <span>양식&nbsp;</span>
                    <select id="listU_format" class="form-select" aria-label="listU_format">
                        <option selected>토론 양식</option>
                        <option value="1">자유토론</option>
                        <option value="2">찬반토론</option>
                    </select>
                </div>
                <div id="listU_categorybox" class="col" style="border: 1pt solid">
                    <span>카테고리&nbsp;</span>
                    <select id="listU_category" class="form-select" aria-label="listU_category">
                        <option selected>카테고리</option>
                        <option value="1">사회</option>
                        <option value="2">건강</option>
                        <option value="3">연애</option>
                        <option value="4">학업</option>
                        <option value="5">직장</option>
                    </select>
                </div>
            </div>
            <div id="listU_titlebox" style="border: 1pt solid">
                <span>제목 </span>
                <input type="text" class="form-control" id="listU_titlebar" placeholder="제목" value=""
                       required="required"/>
            </div>
            <div id="listU_contentsbox" style="border: 1pt solid">
                <span>내용</span>
                <textarea class="form-control" id="listU_contentsarea" rows="20"></textarea>
            </div>
            <div id="listU_upload" style="border: 1pt solid">
                <span>파일 첨부</span>
                <input class="form-control" type="file" id="listU_uploadbar"/>
            </div>
            <div id="listU_buttonbox" class="col">
                <button class="btn btn-primary btn-lg" type="submit">저장</button>
                <button class="btn btn-primary btn-lg" type="submit">취소</button>
            </div>
        </div>
    </div>
</body>
</html>
