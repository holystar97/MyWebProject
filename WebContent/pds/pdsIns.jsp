<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="ssi.jsp"%>
<!-- 본문시작 pdsForm.jsp-->
<h3>* 사진 올리기 *</h3>
<%

	try{
		
		//1) 첨부된 파일 저장하기 
		String saveDirectory= application.getRealPath("/storage");
 		//저장 최대 용량(10M)
 		int maxPostSize=1024*1024*10;
 		//한글 인코딩
 		String encoding="UTF-8";
 		MultipartRequest mr=new MultipartRequest(request,saveDirectory,maxPostSize,encoding,new DefaultFileRenamePolicy());
 		
 		//2) storage 폴더에 저장된 파일명. 파일크기 가져오기 
		String item="";
 		String fileName="";
 		long filesize=0;
 		File file=null;
 		
		Enumeration files=mr.getFileNames();
		while(files.hasMoreElements()){
			item=(String)files.nextElement();
			fileName=mr.getFilesystemName(item);
			if(fileName!=null){
				file=mr.getFile(item);// 파일 담기
				if(file.exists()){
					// 파일이 존재하는지 ?
					filesize=file.length();
				}
			}
		}
		
		//3) tb_pds테이블에 행추가하기 
		String wname=mr.getParameter("wname").trim();
		String subject=mr.getParameter("subject").trim();
		String passwd=mr.getParameter("passwd").trim();
		
		dto.setWname(wname);
		dto.setSubject(subject);
		dto.setPasswd(passwd);
		dto.setFilename(fileName);
		dto.setFilesize(filesize);
		
		
		  int cnt=dao.insert(dto);
		  
		  if(cnt==0){
		    out.println("<p>사진 추가 실패했습니다</p>");
		    out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
		  }else{
		    out.println("<script>");
		    out.println("  alert('사진을 추가했습니다');");
		    out.println("  location.href='pdsList.jsp'");//목록페이지 이동
		    out.println("</script>");
		  }//if end
		
    		
   	}catch(Exception e){
   		out.print(e);
   		out.print("<p> 파일 업로드 실패 !! </p>");
   		out.print("<a href='javascript: history.back();'>[다시시도]</a>");
   		
   	}

%>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>