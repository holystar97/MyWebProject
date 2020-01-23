<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="ssi.jsp"%>
<!-- 본문시작 pdsForm.jsp-->
<h3>* 포토 갤러리 *</h3>
<p><a href="pdsForm.jsp">[사진올리기]</a></p>

<%
	ArrayList<PdsDTO> list=dao.list();
	if(list==null){
		out.println("관련 자료 없음 !! ");
	}else{
%>
	전체 글 갯수 : <%=list.size() %>
	<br>
	<table class="table">
		<tr>
			<th>제목</th>
			<th>사진</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>
<%
	for(int i=0;i<list.size();i++){
		dto=list.get(i);
%>
		<tr>
			<td><%=dto.getSubject()%></td>
			<td><img style="width:150px; height:150px"src="../storage/<%=dto.getFilename()%>"></td>
			<td><%=dto.getWname()%></td>
			<td><%=dto.getReadcnt()%></td>
			<td><%=dto.getRegdate().substring(0,10)%></td>
		</tr>
<%
	}
	out.print("</table>");
	}
%>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>