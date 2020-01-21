<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>세션 session</h3>
<%
/*
	[session 내부 객체]
			-HttpSession session
			-요청한 사용자에게만 개별적 접근(요청한 나한테만 접근 가능)
			-선언한 세션 변수는 전역적 성격 (부모, 자식만 공유가 되는것이 아닙니다.ex 로그인한번 으로 쭉 블로그 이동)
			-일정	시간 동안 이벤트 가 발생되지 않으면 자동으로 삭제한다 (은행 서비스 5분 동안 사용하지 않으면 자동으로 로그아웃)
			(시간은 수동으로 지정을 할 수 있습니다.)


	out.print("현재 세션 유지 시간 ");
	out.print(session.getMaxInactiveInterval());
	out.print("초(30분)");
	out.print("<hr>");
*/

 /*
	//세션 유지 시간 변경
	//1 ) 
	session.setMaxInactiveInterval(60*10);
	out.print("변경 세션 유지 시간 ");
	out.print(session.getMaxInactiveInterval());
	out.print("초(10분)");
	out.print("<hr>");
	
	//2) web.xml 에서 수정 

	<!-- 세션 유지 시간 등록(20분) -->
	<session-config>
		<session-timeout>20</session-timeout>
	</session-config>

*/

//session 변수
// ->myweb프로젝트의 모든 페이지에서 공유되는 전역변수 
// -> 별도의 자료형이 없다 


	 //session 변수 선언 
	 //session.setAttribute("변수명", 값);
		session.setAttribute("s_id", "okdolsk");
		session.setAttribute("s_pw", "12341234");

	//세션변수값 가져오기
	Object obj=session.getAttribute("s_id");
	String s_id=(String)obj;
	String s_pw=(String)session.getAttribute("s_pw");
	
	out.print("세션 변수 s_id : "+ s_id + "<hr>");
	out.print("세션 변수 s_pw : "+ s_pw + "<hr>");

	// session 변수 강제 삭제 (로그아웃 ) -> null 값 
	
	session.removeAttribute("s_id");
	session.removeAttribute("s_pw");
	out.print("세션변수 삭제 후 <hr>");
	out.print("세션 변수 s_id :" + session.getAttribute("s_id"));
	out.print("세션 변수 s_pw :" + session.getAttribute("s_pw"));
	
	
	// session 변수값 전부 삭제
	session.invalidate();
	
	//session 객체에서 발급해주는 아이디 
	out.print("<hr>");
	out.print("세션 임시 아이디 : ");
	out.print(session.getId());
	out.print("<hr>");
	
	/*
		[application 내부 객체]
		-ServletContext application
		-서버에 대한 정보를 관리하는 객체
		-사용자 모두가 공유하는 전역적 성격의 객체 
	*/
	
	//bbs 폴더의 실제 물리적인 경로
	// 실제경로 D:\java1209\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\myweb\bbs
	// 웹 경로 http://localhost:8090/myweb/bbs
	out.print(application.getRealPath("/bbs"));
	out.print("<hr>");
	
	out.print(request.getRealPath("/bbs"));
	out.print("<hr>");
	//[response 내부 객체]
	//-> 요청한 사용자에게 응답해 줄 때 
	
			
	
%>
</body>
</html>