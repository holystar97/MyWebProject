<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
<% 

	int bbsno     =Integer.parseInt(request.getParameter("bbsno")); 
 	String wname= request.getParameter("wname").trim();
	String subject= request.getParameter("subject").trim();
	String content= request.getParameter("content").trim();
	String passwd= request.getParameter("passwd").trim();
	String ip= request.getRemoteAddr();
	
   
	  dto.setBbsno(bbsno);
	  dto.setWname(wname);
	  dto.setSubject(subject);
	  dto.setContent(content);
	  dto.setPasswd(passwd);
	  dto.setIp(ip);
	
	  

  
  %>
 
<!-- 본문끝  -->
<%@ include file="../footer.jsp"%>
