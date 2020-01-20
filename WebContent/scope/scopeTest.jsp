<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scopeTest.jsp</title>
</head>
<body>
	<h3>웹 페이지의 SCOPE(유효범위)</h3>
<%
/*
	myweb 프로젝트에서 페이지들간에 값을 공유하기 위해 사용합니다
	-scope의 종류
	1) pageContext : 현재 페이지에서만 유효 (생략 가능 )
	2) request     : 부모 페이지와 자식 페이지만 유효 
	3) session     : 모든 페이지에서 유효 (사용자 개별 접근. 시간 )
	4) application : 모든 페이지에서 유효 (모든 사용자가 접근. 서버 정보 )

	-웹 페이지의 내장 변수 선언 형식 (별도의 자료형이 없다)
	1) pageContext.setAttribute("변수명",값);
	2) request.setAttribute("변수명",값);
	3) session.setAttribute("변수명",값);
	4) application.setAttribute("변수명",값);
	
	-내장 변수값 얻어오기
	1) pageContext.getAttribute("변수명",값);
	2) request.getAttribute("변수명",값);
	3) session.getAttribute("변수명",값);
	4) application.getAttribute("변수명",값);
	
	-내장변수 삭제하기 
	1) pageContext.removeAttribute("변수명",값);
	2) request.removeAttribute("변수명",값);
	3) session.removeAttribute("변수명",값);
	4) application.removeAttribute("변수명",값);

	
	//-각 scope에 내장 변수를 이용해서 값 올리기

*/
//-각 scope에 내장 변수를 이용해서 값 올리기
pageContext.setAttribute("kor",100);
request.setAttribute("eng",200);
session.setAttribute("mat",300);
application.setAttribute("uname","okdolsk");




%>



</body>
</html>