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
		
		//쿠키(아이디 저장)
		String c_id=Utility.checkNull(request.getParameter("c_id"));
		Cookie cookie=null;
		if(c_id.equals("SAVE")){ // 아이디 저장 체크를 했다면
			//쿠키 변수 선언 
			//new Cookie("쿠키 변수명",값);
			cookie=new Cookie("c_id",id);
			//쿠키의 생존 기간, 1개월 
			cookie.setMaxAge(60*60*24*30);
			
		}else{
			cookie=new Cookie("c_id","");
			cookie.setMaxAge(0);
		}
		
		response.addCookie(cookie);
		//
		
		
		//첫페이지로 이동
		String root=Utility.getRoot();
		response.sendRedirect(root+"/index.jsp");
		
		
	}// if end 
%>  
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>