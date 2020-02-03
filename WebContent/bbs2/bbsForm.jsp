<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문 시작 bbsForm.jsp-->
<strong>* 글/쓰/기 *</strong>
<br><br>
<form method="post" name="writeform" action="./bbsinsert.do">
<input type="hidden" name="num"      value="${num }">
<input type="hidden" name="ref"      value="${ref }">
<input type="hidden" name="re_step"   value="${re_step }">
<input type="hidden" name="re_level"  value="${re_level }">

<table class="table">
<tr>
  <td align="right" colspan="2">
      <a href="/myweb/bbs2/bbslist.do">글목록</a></td>
</tr>
<tr>
  <td>이름</td>
  <td><input type="text" name="writer"></td>
</tr>
<tr>
  <td>제목</td>
  <td><input type="text" name="subject"></td>
</tr>
<tr>
  <td>이메일</td>
  <td><input type="text" name="email"></td>
</tr>
<tr>
  <td>내용</td>
  <td><textarea name="content" rows="5" cols="40"></textarea></td>
</tr>
<tr>
  <td>비밀번호</td>
  <td><input type="password" name="passwd"></td>
</tr>
<tr>
  <td colspan="2" align="center">
  <input type="submit" value="글쓰기"   class="btn btn-primary">
  <input type="reset"  value="취소"     class="btn btn-primary">
  <input type="button" value="목록보기" class="btn btn-primary" onClick="location.href='./bbslist.do'">
  </td>
</tr>
</table>
</form>

<!-- 본문 끝 -->			
<%@ include file="../footer.jsp" %>