<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ page import="java.sql.Timestamp" %>

<!-- 본문시작  -->
	여기에서 본문 내용을 작성하세요 !! 
	
	<!DOCTYPE html>
	<html>
	<meta charset="UTF-8">
	<title>글목록</title>
	</head>
	<body>
	
	<strong>* 글 목록  *</strong>
	<br/><br/>
	<table width="500">
	<tr>
		<td>전체 글 : ${count}</td>
		<td align ="center"><a href="./bbsform.do">글쓰기</a></td>
	</tr>
	</table>
	
	<c:if test="${count ==0}">
		<table width="500">
		<tr>
			<td>게시판에 글 없음 !  </td>
		</tr>
		</table>
	</c:if>
	
	<c:if test="${count>0}" >
		<table border="1">
			<tr>
				<td width="30">번호</td>
				<td>제목</td>
				<td width="80">작성자</td>
				<td width="100">작성일</td>
				<td width="50">조회</td>
				<td width="80">IP</td>
			</tr>
			
			<!-- fmt: formateDate 액션에서 Timestamp 객체를 사용하기 위해서  -->
			<c:set var ="today" value="<%=new Timestamp(System.currentTimeMillis()) %>"/>
			<c:set var ="today" value="${fn:substring(today,0,10}"/> <!-- 오늘 날짜 -->
			<c:forEach var ="article" items="${articleList}">
				<tr>
					<td>
						<c:out value="${number }" />
						<c:set var="number" value="${number-1}"/>
					</td>
					<td>
						<c:if test="${article.re_level>0}">
							<c:forEach var ="i" begin ="1" end ="${article.re_level}" step ="1">
									<img src="../images/reply.gif"/>
							</c:forEach>
						</c:if>
						<c:if test="${article.re_level==0}"></c:if>
						<a href="./bbscontent.do?num=${article.num} &pageNum=${pageNum}">${article.subject}</a>
						
						<c:set var="reg" value="${article.reg_date}"/>
						<c:set var ="date" vlaue="${fn:substring(reg,0,10)}"/>
						<!-- 게시글 날짜를 2012-12-02 -->
						<c:if test="${today ==date}">
							<img src="../images/new.gif"/>
						</c:if>
						
						<c:if test="${article.readcount>=20}">
							<img src="../images/hot.gif" border="0" height="16"/>
						</c:if>
						
					</td>
					
					<td><a href="mailto:${article.email} ">${article.writer}</a></td>
					<td>${date }</td>
					<td>${article.readcount }</td>
					<td>${article.ip }</td>
				
				</tr>
			</c:forEach>
			
		</table>
	
	</c:if>
	
	
	
	
	
	</body>
	</html>
	
	
	
	
<!-- 본문끝  -->
<%@ include file="../footer.jsp"%>
