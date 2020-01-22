<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="ssi.jsp" %>
<%@ include file="auth.jsp" %>
<!-- 본문시작 loginForm.jsp -->
<h3>* 로 그 인 *</h3>
<%
	if(s_id.equals("guest") || s_passwd.equals("guest") || s_mlevel.equals("guest")){
		//로그인을 하지 않은 경우 
		
		//쿠키값 가져오기
		Cookie[] cookies =request.getCookies();
		String c_id="";
		if(cookies!=null){
			//쿠키가 존재하는지 ?
				for(int i=0; i<cookies.length;i++){
					Cookie cookie=cookies[i];
					//쿠키변수 c_id가 있는지 ?
					if(cookie.getName().equals("c_id")==true){
						c_id=cookie.getValue();
					}
				}
		}
		
%>
<form name="loginfrm"
      method="post"
      action="loginProc.jsp"
      onsubmit="return loginCheck(this)">
<table class="table">
<tr>
  <td>
     <input type="text" name="id" value="<%=c_id %>" placeholder="아이디" required>
  </td>
  <td rowspan="2">
     <input type="image" src="../images/bt_login.gif" style="cursor: pointer">
     <!--cusror:pointer는 커서 손모양 <input type=image>는 기본속성이 submit -->
  </td>
</tr>
<tr>
  <td>
     <input type="password" name="passwd" placeholder="비밀번호" required>
  </td>
</tr>
<tr>
  <td colspan="2">
     <input type="checkbox" name="c_id" value="SAVE" <%if(!(c_id.isEmpty())){out.print("checked");} %>>아이디저장
     &nbsp;&nbsp;
     <a href="agreement.jsp">회원가입</a>
     &nbsp;&nbsp;
     아이디/비번찾기
  </td>
</tr>
</table>
</form>
  
<%
}else{
  //로그인 성공했다면
  out.println("<strong>" + s_id + "</strong>님");
  out.println("<a href='logout.jsp'>[로그아웃]</a>");
  out.println("<br><br>");
  out.println("[회원정보수정]");
  out.println("[회원탈퇴]");
}//if end
%>  
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>