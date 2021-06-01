<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>텍스트 스크롤</title>
    <style type="text/css">
        * {margin:0;padding:0;}
        #scroll {height:30px;}
    </style>
    <script type="text/javascript">
        function textScroll(scroll_el_id) {
            this.objElement = document.getElementById(scroll_el_id);
            this.objElement.style.position = 'relative';
            this.objElement.style.overflow = 'hidden';

            this.objLi = this.objElement.getElementsByTagName('li');
            this.height = this.objElement.offsetHeight; // li 엘리먼트가 움직이는 높이(외부에서 변경가능)
            this.num = this.objLi.length; // li 엘리먼트의 총 갯수
            this.totalHeight = this.height*this.num; // 총 높이
            this.scrollspeed = 2; // 스크롤되는 px
            this.objTop = new Array(); // 각 li의 top 위치를 저장
            this.timer = null;

            for(var i=0; i<this.num; i++){
                this.objLi[i].style.position = 'absolute';
                this.objTop[i] = this.height*i;
                this.objLi[i].style.top = this.objTop[i]+"px";
            }
        }

        textScroll.prototype.move = function(){
            for(var i=0; i<this.num; i++) {
                this.objTop[i] = this.objTop[i] - this.scrollspeed;
                this.objLi[i].style.top = this.objTop[i]+"px";
            }
            if(this.objTop[0]%this.height == 0){
                this.jump();
            }else{
                clearTimeout(this.timer);
                this.timer = setTimeout(this.name+".move()",50);
            }
        }

        textScroll.prototype.jump = function(){
            for(var i=0; i<this.num; i++){
                if(this.objTop[i] == this.height*(-2)){
                    this.objTop[i] = this.objTop[i] + this.totalHeight;
                    this.objLi[i].style.top = this.objTop[i]+"px";
                }
            }
            clearTimeout(this.timer);
            this.timer = setTimeout(this.name+".move()",3000);
        }

        textScroll.prototype.start = function() {
            this.timer = setTimeout(this.name+".move()",3000);
        }
    </script>
</head>
<body>

    <!-- li 엘리먼트들이 position:absolute 되므로 ul 엘리먼트에는 height 값이 있어야 합니다 -->
    <ul id="scroll">
        <li><a href="">1위</a></li>
        <li><a href="">2위</a></li>
        <li><a href="">3위</a></li>
        <li><a href="">4위</a></li>
        <li><a href="">5위</a></li>
        <li><a href="">6위</a></li>
        <li><a href="">7위</a></li>
        <li><a href="">8위</a></li>
        <li><a href="">9위</a></li>
        <li><a href="">10위</a></li>
    </ul>

    <script type="text/javascript">
        var real_search_keyword = new textScroll('scroll'); // 스크롤링 하고자하는 ul 엘리먼트의 id값을 인자로 넣습니다
        real_search_keyword.name = "real_search_keyword"; // 인스턴스 네임을 등록합니다
        real_search_keyword.start(); // 스크롤링 시작
    </script>

</body>
</html>