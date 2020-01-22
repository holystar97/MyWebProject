<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 pdsForm.jsp-->
<h3>* 사진 올리기 *</h3>
<form name="photoForm"
      method="post"
      enctype="multipart/form-data"
      action="pdsIns.jsp"
      onsubmit="return pdsCheck(this)">
<table class="table">
<tr>
    <th>성명</th>
    <td><input type="text" name="wname" size="20" maxlength="100" required autofocus></td>
</tr>
<tr>
    <th>제목</th>
    <td>
    	  <textarea rows="5" cols="30" name="subject"></textarea>
    </td>
</tr>
<tr>
    <th>비밀번호</th>
    <td><input type="password" name="passwd"></td>
</tr>
<tr>
    <th>첨부파일</th>
    <td><input type="file" name="filename"></td>
</tr>
<tr>
    <td colspan="2">
    	  <input type="submit" value="전송">
    	  <input type="reset"  value="취소">
    </td>
</tr>
</table>  
</form>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>