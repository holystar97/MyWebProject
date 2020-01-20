<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%--ssi, jsp 공통 페이지 --%>

<%@ page import="java.io.*"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.util.*"%>
<%@ page import ="net.utility.*"%>
<%@ page import ="net.bbs.*"%>

<jsp:useBean id ="dto" class="net.bbs.BbsDTO"></jsp:useBean>
<jsp:useBean id ="dao" class="net.bbs.BbsDAO"></jsp:useBean>

<%request.setCharacterEncoding("UTF-8"); %> 


<%
//검색관련
String col=request.getParameter("col");
String word=request.getParameter("word");
if(col==null){//검색 칼럼이 없다면  
	col="";
}
if(word==null){ // 검색어가 없다면 
	word="";
}

%>