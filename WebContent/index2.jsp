<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>index.jsp</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <!-- CSS,JS import   -->
  <link rel="stylesheet" href="./css/mystyle.css">
   <script src="./js/myscript.js"></script>
  <style>
  </style>
</head>
<body>

<!-- 메인 카테고리 시작  -->
<nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">HOME</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="./bbs/bbsList.jsp">게시판</a></li>
        <li><a href="./notice/noticeList.jsp">공지사항</a></li>
        <li><a href="./member/loginForm.jsp">로그인</a></li>
        <li><a href="./pds/pdsList.jsp">포토갤러리</a></li>
        <li><a href="./mail/mailForm.jsp">메일보내기</a></li>
        
      </ul>
    </div>
  </div>
</nav>
<!-- 메인 카테고리 끝 -->

<!-- container 시작  -->
<div class="container-fluid bg-1 text-center">
  <h3 class="margin">Welcome To MyWeb</h3>
  <img src="./images/peach2.gif" class="img-responsive img-circle margin" style="display:inline" alt="Bird" width="350" height="350">
</div>

<!-- Third Container (Grid) -->
<div class="container-fluid bg-3 text-center">    
  <div class="row">
  
    <div class="col-sm-12">
     
    </div>
 
  </div>
</div>

<!-- container 끝-->

<!-- Footer -->
<footer class="container-fluid bg-4 text-center">
	Copyright &copy; 2020 MyWeb
</footer>

</body>
</html>
