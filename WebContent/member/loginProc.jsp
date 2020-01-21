<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="ssi.jsp" %>
<!-- 본문시작 loginForm.jsp -->
<h3>* 로 그 인 *</h3>
<%
	String id=request.getParameter("id").trim();
	String passwd=request.getParameter("passwd").trim();
	dto.setId(id);
	dto.setPasswd(passwd);
	String mlevel=dao.loginProc(dto);
	if(mlevel==null){
		out.println("<p>아이디/비번 다시 한번 확인해주세요! ");
		out.println("<p><a href='javascript:history.back()'>[다시 시도]</a></p>");
	}else{
		//로그인 성공
		// 다른 페이지에서 로그인 상태를 공유할 수 있도록 
		session.setAttribute("s_id",id);
		session.setAttribute("s_passwd",passwd);
		session.setAttribute("s_mlevel",mlevel);
		
		//첫페이지로 이동
		String root=Utility.getRoot();
		response.sendRedirect(root+"/index.jsp");
		
		
	}// if end 
%>  
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>