<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<html>
<head>
    <!--Bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
            crossorigin="anonymous"></script>
    <link href="css/style.css?bjsgowa " rel="stylesheet" type="text/css">
    <script src="js/list.js" type="text/javascript"></script>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <title>글쓰기</title>
</head>
<body>
    <div id="container" class="container-lg">
        <div id="listU_mainbox" class="container-lg" style="background-color:#f2f2df;">
            <div id="listU_titleheader" class="py-5 text-center">
                <h2><font color="gray">글작성</font></h2>
                <hr class="my-4">
            </div>
            <form name="listU_from" action="ListUpload" method="post" enctype="multipart/form-data">
                <div id="listU_row1" class="row" style="padding: 10px;">
                
                    <div id="listU_formatbox" class="col">                    
                        <input type="text" name="list_id" value="${sessionScope.loginUser.id}" hidden="hidden">
                        <select name="list_type" id="listU_format" class="form-select" aria-label="listU_format"
                                onchange="hiddenContents()">
                            <option value="0" selected>토론 양식</option>
                            <option value="1">자유토론</option>
                            <option value="2">찬반토론</option>
                        </select>
                    </div>
                    
                    <div id="listU_categorybox" class="col">
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
                <div id="listU_titlebox" style="text-align:left; margin-left:10px;">
                    <input name="list_title" id="listU_titlebar" type="text" class="form-control" placeholder="제목"
                           required="required"/>
                </div>
                <div id="listU_contentsbox" style="margin-left:10px; margin-top:15px; margin-right:10px;">
                    <textarea placeholder="내용을 입력하시오" name="list_contents" id="listU_contentsarea" class="form-control" rows="20" style="resize:none;"></textarea>
                </div>
                <div id="listU_upload" style="margin-top: 15px; margin-left:10px;">
                    <input name="list_upload" class="form-control" type="file" id="listU_uploadbar"/>
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
                <div id="listU_buttonbox" class="col" style="margin-top:15px;">
                    <button class="btn btn-success" style="width: 100px; height:50px;" onclick="checkParam()">저장</button>
                    <button class="btn btn-success" style="width: 100px; height:50px;" onclick="window.location=document.referrer;">취소</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
