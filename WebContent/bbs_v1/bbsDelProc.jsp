<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp"%>
<!-- 본문시작  bbsDelProc.jsp-->
<% 

		String passwd =request.getParameter("passwd").trim();
		int bbsno     =Integer.parseInt(request.getParameter("bbsno"));  
		
		dto.setPasswd(passwd);
		dto.setBbsno(bbsno);
	
	  int cnt=dao.delete(dto);
	  
	  if(cnt==0){
	    out.println("<p>글 삭제 실패했습니다</p>");
	    out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	  }else{
	    out.println("<script>");
	    out.println("  alert('게시글이 삭제되었습니다');");
	    out.println("  location.href='bbsList.jsp'");//목록페이지 이동
	    out.println("</script>");
	  }//if end
	
  
  %>
 
<!-- 본문끝  -->
<%@ include file="../footer.jsp"%>
