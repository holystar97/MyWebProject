<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%--ssi, jsp 공통 페이지 --%>

<%
	//logout.jsp
	session.removeAttribute("s_id");
	session.removeAttribute("s_passwd");
	session.removeAttribute("s_mlevel");
	
	response.sendRedirect("loginForm.jsp");


%>


