<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
</head>
<body>




<p><strong>글 내용 보기 </strong></p>
<table border="1">

<tr>
	<td>글번호</td>
	<td>${article.num}</td>
	<td>조회수</td>
	<td>${article.readcount}</td>
</tr>

<tr>
	<td>작성자</td>
	<td>${article.writer}</td>
	<td>작성일</td>
	<td>${article.reg_date}</td>
</tr>

<tr>
	<td>글제목</td>
	<td>${article.subject}</td>
</tr>

<tr>
	<td>글내용</td>
	<td colspan=3>
	<% //치환 변수 선언 
	pageContext.setAttribute("cn","\n"); //enter 
	pageContext.setAttribute("br","<br/>");// br 태그 
	%>
	<%--${article.content} --%>
	<!-- \n값이 <br/> 값으로 바꿔서 출력하게 함  -->
	${fn:replace(article.content, cn, '<br/>') }
	</td>
</tr>

<tr>
	<td colspan=4>
		<input type="button" value="글 수정" onclick="location.href='./bbsupdateform.do?num=${article.num}&pageNum=${pageNum}'">
		<input type="button" value="글 삭제" onclick="location.href='./bbsdeleteform.do?num=${article.num}&pageNum=${pageNum}'">	
		<input type="button" value="답변" onclick="location.href='./bbsform.do?num=${article.num}&ref=${article.ref}
																		&re_step=${article.re_step}&re_level=${article.re_level}'">
		<input type="button" value="목록" onclick="location.href='./bbslist.do?pageNum=${pageNum}'">	
	</td>

</tr>




</table>


</body>
</html>