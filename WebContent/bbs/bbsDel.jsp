<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="ssi.jsp"%>
<!-- 본문시작  -->
	<h3>* 글 삭제 *</h3>
	<p><a href="bbsList.jsp">[글목록]</a></p>
	
	<form method="post" action="bbsDelProc.jsp" onsubmit="return pwCheck(this)">
		<input type="hidden"
       name="bbsno"
       value="<%=request.getParameter("bbsno")%>">   
       
       <input type="hidden"
       name="nowPage"
       value="<%=nowPage%>"> 
       
		<table class="table">
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="passwd" required></td>
				</tr>
				<tr>
					<td colspan="2">
					  <input type="submit" value="확인">
					</td>
				</tr>
		</table>
	</form>
	
<!-- 본문끝  -->
<%@ include file="../footer.jsp"%>
