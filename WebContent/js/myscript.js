/* myscript.js */
/* charset=utf-8 */

function bbsCheck(f){
  //this 자기자신
  //f = <form name=bbsfrm></form>이 대입
  
  //게시판 유효성검사
  //1) 작성자 2글자이상 입력
  var wname=f.wname.value;
  wname=wname.trim();
  if(wname.length<2){
	alert("작성자 2글자이상 입력해 주세요");
	f.wname.focus();//커서생성
	return false;
  }//if end
	
  //2) 제목 2글자이상 입력(과제)
  
  var subject=f.subject.value;
  subject=subject.trim();
  if(subject.length<2){
	alert("작성자 2글자이상 입력해 주세요");
	f.subject.focus();//커서생성
	return false;
  }//if end
  
  
  //3) 내용 2글자이상 입력(과제)
  var content=f.content.value;
  content=content.trim();
  if(content.length<2){
	alert("작성자 2글자이상 입력해 주세요");
	f.content.focus();//커서생성
	return false;
  }//if end
  
  
  
  
  //4) 비밀번호 4글자이상 입력
  var passwd=f.passwd.value;
  passwd=passwd.trim();
  if(passwd.length<4){
	alert("비밀번호 4글자이상 입력해 주세요");
	f.passwd.focus();
	return false;
  }//if end	
  
  //onsubmit이벤트에서 서버로 전송
  return true;
  
}//bbsCheck() end


function pwCheck(f){
	
	// 비밀번호가 4글자 이상 입력되었는지 검사
	var passwd=f.passwd.value;
	passwd=passwd.trim();
	if(passwd.length <4){
		alert("비밀번호 4글자 이상 입력해주세요 ");
		f.passwd.focus();
		return false;
	}

	var message="진행된 내용은 복구되지 않습니다."+ "\n 계속 진행하시겠습니까?";
	if(confirm(message)){
		return true;
	}else{
		return false;
	}	
}

function searchCheck(f){
	//검색어(word)를 입력해야만 서버로 전송
	var word=f.word.value;
	word=word.trim();
	if(word.length==0){
		alert("검색어를 입력하세요");
		return false;
	}
	return true;
}

function loginCheck(f){
	//로그인 유효성 검사 
	//1) 아이디 5~10글자 이내
	var id=f.s_id.value;
	  id=id.trim();
	  if(id.length>=5 && id.length <10){
		alert("아이디를  5글자이상 10글자 이내로 입력해 주세요");
		f.id.focus();
		return false;
	  }//if end	
	//2) 비밀번호 5~10글자 이내 
	  var pw=f.s_passwd.value;
	  pw=pw.trim();
	  if(pw.length>=5 && pw.length <10){
		alert("비밀번호를  5글자이상 10글자 이내로 입력해 주세요");
		f.pw.focus();
		return false;
	  }//if end	
	  
	return true;
}


function idCheck() {
	  //아이디 중복확인
		
	  //새창만들기(팝업)
	  //window.open("파일명", "새창이름", "다양한옵션들")
	  window.open("idCheckForm.jsp", "idwin"
			      ,"width=400, height=350");	
		
	}//idCheck() end

function emailCheck(){
	
}

function memberCheck(f){
	// 회원가입 유효성 검사
	//1) 아이디 5~10글자 이내 인지 ?
	//2) 비밀번호 5~10글자 이내인지 ?
	//3) 비밀번호와 비밀번호 확인이 서로 일치하는지? 
	//4) 이름 2~20글자 이내인지 ?
	//5) 이메일에 @문자가 있는지 ? 
	//6) 직업을 선택했는지 ? 
	var job=f.job.value;
	if(job=="0"){
		alert("직업 선택해주세요 ");
		return false;
	}
	return true;
}

function pdsCheck(f){
	
	//포토 갤러리 유효성 검사 
	// 1) 이름 
	// 2) 제목
	// 3) 비밀번호는 4~15글자 이내인지?
	// 4) 첨부파일
	var filename=f.filename.value;
	filename=filename.trim();
	if(filename.length==0){
		alert("첨부파일 선택해 주세요");
		return false;
	}else{
		//마지막 . 의 순서값을 가져오기 
		var dot=filename.lastIndexOf(".");
		if(dot==-1){ // . 기호가 없다면 
			alert("첨부 파일을 다시 선택해주세요 ");
			return false;
		}else{
			// 마지막 . 기호 이후 문자열만 자르기 
			var ext=filename.substr(dot+1);
			// 전부 소문자로 치환
			ext=ext.toLowerCase();
			if(ext=="png" || ext=="jpg"|| ext=="gif"){
				return true;
			}else{
				alert("이미지 파일만 가능합니다!! ");
				return false;
			}
		}
	}
	
}


