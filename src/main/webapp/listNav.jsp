<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
    // $(document).ready(function() {

        // $('a').hover().addClass('nav-link active');

        // $('a').hover( function() { $(this).addClass("nav-link active"); }, function() { $(this).removeClass("nav-link link-dark"); } );

        $('ul > a').toggle( function(){ $(this).removeClass("nav-link link-dark"); $(this).addClass("nav-link active"); }, function(){ $(this).removeClass("nav-link active"); $(this).addClass("nav-link link-dark"); } );


    // });

</script>
<style>
	.bg-light{
		background-color: #e8c992 !important;
	}
	
	li>a:hover{
		color:white !important;
	}
</style>

<div class="d-flex flex-column flex-shrink-0 p-3 bg-light" style="width: 280px; margin-top:50px; border: 3px solid #8e9c90; border-radius:30px;">
    <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
        <span class="fs-4"><font color="white"; style="font-family:'MaplestoryOTFLight';"><b>Type</b></font></span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
        <li class="nav-item">
            <a href="/semiprj_toron_in/ListIdx?type=0" class="nav-link link-dark" aria-current="page">
                <svg class="bi me-2" width="16" height="16"><use xlink:href="#home"></use></svg>
                전체글보기
            </a>
        </li>
        <li>
            <a href="/semiprj_toron_in/ListIdx?type=1" class="nav-link link-dark">
                <svg class="bi me-2" width="16" height="16"><use xlink:href="#speedometer2"></use></svg>
                자유토론
            </a>
        </li>
        <li>
            <a href="/semiprj_toron_in/ListIdx?type=2" class="nav-link link-dark">
                <svg class="bi me-2" width="16" height="16"><use xlink:href="#table"></use></svg>
                찬반토론
            </a>
        </li>
    </ul>
</div>