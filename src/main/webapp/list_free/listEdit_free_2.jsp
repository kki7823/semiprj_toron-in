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
    <link href="css/style1.css?ver=s2a2 " rel="stylesheet" type="text/css">
    <script src="js/list.js" type="text/javascript"></script>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <title>글수정</title>
</head>
<body>
    <div id="container" class="container-lg" style="border: 1pt solid">
        <div id="listU_mainbox" class="container-lg">
            <div id="listU_titleheader" class="py-5 text-center" style="border: 1pt solid">
                <h2>글작성</h2>
                <hr class="my-4">
            </div>
            <form name="listU_from" action="ListUpload" method="post" enctype="multipart/form-data">
                <div id="listU_row1" class="row" style="border: 1pt solid">
                    <div id="listU_categorybox" class="col" style="border: 1pt solid">
                        <span>카테고리&nbsp;</span>
                        <select name="list_category" id="listU_category" class="form-select"
                                aria-label="listU_category">
                            <option value="0" selected>카테고리</option>
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
                    <input name="list_title" id="listU_titlebar" type="text" class="form-control" placeholder="제목"
                           required="required" value="${sessionScope.sList.title}"/>
                </div>
                <div id="listU_contentsbox">
                    <span>내용</span>
                    <textarea name="list_contents" id="listU_contentsarea" class="form-control" rows="20">${sessionScope.sList.content}</textarea>
                </div>
                <div id="listU_upload" style="border: 1pt solid">
                    <span>이미지 첨부</span>
                    <input name="list_upload" class="form-control" type="file" id="listU_uploadbar" />
                    <div class="list_img"><img id="listU_upload_img" src=""/></div>
                    <script>
                        $("#listU_uploadbar").change(function () {
                            if (this.files && this.files[0]) {
                                var reader = new FileReader;
                                reader.onload = function (data) {
                                    $(".list_img img").attr("src", data.target.result).width(500);
                                }
                                reader.readAsDataURL(this.files[0]);
                            }
                        });
                    </script>
                </div>
                <div id="listU_buttonbox" class="col">
                    <button class="btn btn-primary btn-lg" onclick="checkParam()">저장</button>
                    <button class="btn btn-primary btn-lg" onclick="window.location=document.referrer;">취소</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>