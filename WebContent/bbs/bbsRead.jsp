<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="ssi.jsp" %>
<!-- 본문시작  -->
	<h3>* 게시판 상세보기 *</h3>
	<p>
		<a href="bbsForm.jsp">[글쓰기]</a>
		&nbsp;&nbsp;
		<a href="bbsList.jsp">[글 목록]</a>
	</p>
	
	<%
		int bbsno=Integer.parseInt(request.getParameter("bbsno"));
		dto=dao.read(bbsno);
		if(dto==null){
		    out.println("글없음!!");
		  }else{
			  
			  //조회수 증가 
			  dao.incrementCnt(bbsno);
			  
	%>
		<table class="table table-hover" >
		<tr>
			<th>제목</th>
			<td><%=dto.getSubject()%></td>
		</tr>
		<tr>
			<th>내용</th>
			
			<td>
			
	<%
			//content에 특수문장 변환 	
			String content=dto.getContent();	
			content=content.replaceAll("'" , "&apos;");
			content=content.replaceAll("\"" ,"&quot;");
			content=content.replaceAll("<" , "&lt;");
			content=content.replaceAll(">" , "&gt;");
			content=content.replaceAll("\r\n" , "<br>");
			out.print(content);
			
	%>
			</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%=dto.getReadcnt()%></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=dto.getWname()%></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><%=dto.getRegdt()%></td>
		</tr>
		<tr>
			<th>IP</th>
			<td>
			   <%=dto.getIp()%>
			</td>
		</tr>
	
		</table>	
		<br>
		<input type="button" value="답변" onclick="location.href='bbsReply.jsp?bbsno=<%=bbsno%>'">
		<input type="button" value="수정" onclick="location.href='bbsUpdate.jsp?bbsno=<%=bbsno%>'">
		<input type="button" value="삭제" onclick="location.href='bbsDel.jsp?bbsno=<%=bbsno%>'">
<%	  
  }//if end
%>
	
<!-- 본문끝  -->
<%@ include file="../footer.jsp"%>