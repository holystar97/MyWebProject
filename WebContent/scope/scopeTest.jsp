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

//내장 변수 값 가져오기 
Object obj=pageContext.getAttribute("kor");
int kor=(int)obj;
int eng=(int)request.getAttribute("eng");
int mat=(int)session.getAttribute("mat");
String uname=(String)application.getAttribute("uname");

//출력 
out.print("1)pageContext 영역 :  "+ kor+ "<hr>");
out.print("2)request 영역: "+ eng+ "<hr>");
out.print("3)session 영역: "+ mat+ "<hr>");
out.print("4)application 영역: "+ uname+" <hr>");


/*
//내장 변수 삭제 
pageContext.removeAttribute("kor");
request.removeAttribute("eng");
session.removeAttribute("mat");
application.removeAttribute("uname");
out.print("*내장 변수 삭제 후*<hr>");
out.print("1) pageContext 영역: "+ pageContext.getAttribute("kor") +"<hr>");
out.print("2) request 영역 : "+request.getAttribute("eng")+"<hr>");
out.print("3) session 영역:" + session.getAttribute("mat")+"<hr>");
out.print("4) application 영역: "+ application.getAttribute("uname")+"<hr>");

*/


/*
request.setAttribute("aver", 85);
out.print(request.getAttribute("aver"));
*/
/*
out.print(request.getParameter("aver"));
*/
 
/*
	-페이지 이동
	1) <a href=""></a>
	2) <form action=""></form>
	3) location.href=""
	4) jsp:<jsp:forward page=""></jsp:forward> -액션 태그
	5) response.sendRedirect("")
*/

%>
	<!-- 1
	<a href="scopeResult.jsp">[SCOPE 결과 페이지 이동]</a>
	 --> 
	
	<!-- 2) 
	<form action="scopeResult.jsp">
		<button>[SCOPE결과 페이지로 이동]</button>
	</form>-->
	
	<!-- 3) 
	<script>
		alert("SCOPE 결과 페이지로 이동");
		location.href="scopeResult.jsp";
	</script>
	-->

	<%--4) 
	<jsp:forward page="scopeResult.jsp"></jsp:forward>
	--%>

	<%
		//5)
		//response.sendRedirect("scopeResult.jsp");
		
		
		//6) 페이지 이동
		String view="scopeResult.jsp";
		RequestDispatcher rd=request.getRequestDispatcher(view);
		rd.forward(request,response);
		
	%>
	
	

</body>
</html>