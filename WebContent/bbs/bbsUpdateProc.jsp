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
	
	  int cnt=dao.updateProc(dto);
	    
      if(cnt==0){
    	  out.println("<p> 수정에  실패했습니다.</p>");
    	  out.println("<p><a href='javascript: history.back()'>[다시 시도]</a></p>");
      }else{
    	  out.println("<script>");
    	  out.println(" alert('수정되었습니다.');");
    	  out.println(" location.href='bbsList.jsp'"); // 목록페이지로 이동하는 명령어
    	  out.println("</script>");
      }

  
  %>
 
<!-- 본문끝  -->
<%@ include file="../footer.jsp"%>
