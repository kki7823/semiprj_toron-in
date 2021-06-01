<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<meta charset="UTF-8">

<div class="d-flex flex-column flex-shrink-0 p-3 bg-light" style="width: 280px;">
    <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
        <span class="fs-4">index</span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
        <li class="nav-item">
            <a href="ListIdx?type=0" class="nav-link active" aria-current="page">
                <svg class="bi me-2" width="16" height="16"><use xlink:href="#home"></use></svg>
                전체글보기
            </a>
        </li>
        <li>
            <a href="ListIdx?type=1" class="nav-link link-dark">
                <svg class="bi me-2" width="16" height="16"><use xlink:href="#speedometer2"></use></svg>
                자유토론
            </a>
        </li>
        <li>
            <a href="ListIdx?type=2" class="nav-link link-dark">
                <svg class="bi me-2" width="16" height="16"><use xlink:href="#table"></use></svg>
                찬반토론
            </a>
        </li>
    </ul>
</div>