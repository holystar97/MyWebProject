<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="ssi.jsp" %>

<!-- 본문시작 bblList.jsp -->

	<h3>* 게시판 목록 *</h3>
	<p><a href="bbsForm.jsp">[글쓰기]</a></p>
  <table class="table table-hover">
  <tr>
    <th>제목</th>
    <th>조회수</th>
    <th>작성자</th>
    <th>작성일</th>
  </tr>
  
<%
  //검색 목록 (col 칼럼명, word 검색어)
  ArrayList<BbsDTO> list=dao.list(col,word);
  if(list==null){
    out.println("<tr>");
    out.println("  <td colspan='4'><strong>관련 자료 없음!!</td>");
    out.println("</tr>");
  }else{
	  //오늘 날짜를 "2020-01-20" 문자열로 만들기 
	 String today=Utility.getDate();
	  
    for(int i=0; i<list.size(); i++){
      dto=list.get(i);
%>
      <tr>
       	<td style="text-align:left">
<%
		//답변 이미지 출력
			for(int n=1; n<=dto.getIndent(); n++){
			    out.println("<img src='../images/reply.gif'>");
			  }//for end
%>      
	

      <a href="bbsRead.jsp?bbsno=<%=dto.getBbsno()%>"><%=dto.getSubject()%></a>
<%
                 //조회수가 10이상이면 hot이미지 출력
                 if(dto.getReadcnt()>=10){
                   out.println("<img src='../images/hot.gif'>");                  
                 }//if end
                 
              // 오늘 작성한 글 제목 뒤에 new 이미지 출력
              //regdt에서 "년월일" 만 자르기 
              //->예) 2020-01-20
			String regdt=dto.getRegdt().substring(0,10);
            if(regdt.equals(today)){
            	out.println("<img src='../images/new.gif'>");
            }
%>	    
				
						
		</td>
       	<td><%=dto.getReadcnt()%></td>
       	<td><%=dto.getWname()%></td>
       	<td><%=dto.getRegdt().substring(0,10)%></td>
      </tr>
<%      
    }//for end
    
  //글갯수
    int totalRecord=dao.count(col, word); 
    out.println("<tr>");
    out.println("  <td colspan='4' style='text-align: center;'>");
    out.println("    글갯수 : <strong>");
    out.println(totalRecord);
    out.println("    </strong>");
    out.println("  </td>");
    out.println("</tr>");     
    
%>
    <!-- 검색 시작  -->
    	<td colspan="4" style="text-align: center; height: 50px">
 		<form action="bbsList.jsp" onsubmit="return searchCheck(this)">
 			<select name="col">
 				<option value="wname">작성자
 				<option value="subject">제목
 				<option value="content">내용
 				<option value="subject_content">제목+내용
 			</select>
 			<input type="text" name="word">
 			<input type="submit" value="검색">
 		</form>	   
    	</td>
    
    <!-- 검색 끝 -->
<%    
  }//if end
%>    
</table>
	

<!-- 본문끝  -->
<%@ include file="../footer.jsp"%>
