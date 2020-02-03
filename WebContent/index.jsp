<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
 .time{background-color:#ffffff; /*검정색*/
		color:#ffb3b3;      /*진한노랑색*/
		font-weight:bold;
		width:100%; height:50px;
		padding-top:20px;
		margin: auto 0;
		font-size:20px;
		text-align:center;
		border:0px solid black;}

  </style>
  
  <script>
 function showtime(){
   //alert("디지털시계 시작");
   //현재 날짜 및 시간을 id=clock에 출력하기

   var today=new Date();
   //alert(today);
   var str="";
   
   str += today.getFullYear() + ".";

   if(today.getMonth()+1<10){
     str += "0"; //글자갯수를 2자리로 맞추기 위해
   }
   str += (today.getMonth()+1) + ".";

   if(today.getDate()<10){
		str += "0";                      
   }//if end
   str += today.getDate() + ".";
  
   switch(today.getDay()) {
     case 0: str += " (일) "; break;
     case 1: str += " (월) "; break;
     case 2: str += " (화) "; break;
     case 3: str += " (수) "; break;
     case 4: str += " (목) "; break;
	 case 5: str += " (금) "; break;
	 case 6: str += " (토) "; break;
   }//switch end

    if(today.getHours()<12)  {
		  str += "AM ";
    } else {
		  str += "PM ";
    }//if end
	if(today.getHours()>=13)  { //시
		  str += (today.getHours()-12)+":";
	} else {
		  str += today.getHours()+":";
	}//if end

	if(today.getMinutes()<10) { //분
		  str += "0";
	} 		
	str += today.getMinutes()+":";

	if(today.getSeconds()<10) { //초
		  str += "0";
	} 
	str += today.getSeconds();

    document.getElementById("clock").innerHTML=str; 

    /*
       함수 자동 호출
	   - setInterval(함수이름, 1000)
	     ->1초마다 함수호출
	   - setTimeout(함수이름, 1000)
	     ->1초후 1번만 호출
		 ->function test(){
             setTimeout(test, 1000)
           }//setInterval()과 동일한 형태
	   - clearInterval() : 시간해제
	   - clearTimeout()  : 시간해제
    */

    //1초후에 showtime함수 호출
    timer=setTimeout(showtime, 1000);
 }//showtime() end

 //전역변수 선언 지역
 var timer;

 function killtime(){
     clearTimeout(timer); //시간해제
 }//killtime() end
 </script>
  
  
</head>
<body onload="showtime()">

<!-- 메인 카테고리 시작  -->
<nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">HOME</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="./bbs/bbsList.jsp">게시판</a></li>
        <li><a href="./notice/noticeList.jsp">공지사항</a></li>
        <li><a href="./member/loginForm.jsp">로그인</a></li>
        <li><a href="./pds/pdsList.jsp">포토갤러리</a></li>
        <li><a href="./mail/mailForm.jsp">메일보내기</a></li>
        <li><a href="./bbs2/bbslist.do">게시판(MVC)</a></li>
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
     	<!-- 디지털 시계  -->
     	<div id="clock" class="time"></div>
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
