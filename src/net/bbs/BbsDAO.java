package net.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.utility.DBClose;
import net.utility.DBOpen;

public class BbsDAO {

	private DBOpen dbopen=null;
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private StringBuilder sql=null;
	
	public BbsDAO() {
		dbopen=new DBOpen();
	}
	
	public int insert(BbsDTO dto) {
		int cnt=0;
		
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
			
			sql.append(" INSERT INTO tb_bbs(bbsno, wname, subject, content, passwd, grpno, ip) ");
			sql.append(" VALUES ( (select nvl(max(bbsno),0)+1 from tb_bbs) ");
			sql.append(",?,?,?,?,(select nvl(max(bbsno),0)+1 from tb_bbs),? )");
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4,dto.getPasswd());
			pstmt.setString(5,dto.getIp());
			
			cnt=pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println("데이터 추가 실패 : " +e);
		}finally {
			DBClose.close(con,pstmt);
		}
		return cnt; // 행 추가 성공 여부 리턴 
	}
	
	public ArrayList<BbsDTO> list(){
		
		ArrayList<BbsDTO> list=null;
	
		try {
		      con=dbopen.getConnection();
		      sql=new StringBuilder();
		      sql.append(" SELECT bbsno, wname, subject, readcnt, indent, regdt");
		      sql.append(" FROM tb_bbs");
		      sql.append(" ORDER BY grpno DESC, ansnum ASC");
		      
		      pstmt=con.prepareStatement(sql.toString());
		      rs=pstmt.executeQuery();
		      if(rs.next()){
		        //전체행 저장
		        list=new ArrayList<>();
		        do {
		          //한줄저장
		          BbsDTO dto=new BbsDTO();
		          dto.setBbsno(rs.getInt("bbsno"));
		          dto.setWname(rs.getString("wname"));
		          dto.setSubject(rs.getString("subject"));
		          dto.setReadcnt(rs.getInt("readcnt"));
		          dto.setIndent(rs.getInt("indent"));
		          dto.setRegdt(rs.getString("regdt"));    
		          list.add(dto);
		        }while(rs.next());
		        
		      }else {
		        list=null;
		      }//if end
		      
		    }catch (Exception e) {
		      System.out.println("목록실패:"+e);
		    }finally {
		      DBClose.close(con, pstmt, rs);
		    }//try end
		    
		    return list;
		
	}
	
	
	public BbsDTO read(int bbsno) {
		
		BbsDTO dto = null;
		try {
			con=dbopen.getConnection();
		      sql=new StringBuilder();
		      sql.append(" SELECT bbsno, wname, subject, content, readcnt, grpno, ip, regdt");
		      sql.append(" FROM tb_bbs ");
		      sql.append(" WHERE bbsno=? ");
		      
		      pstmt=con.prepareStatement(sql.toString());
		      pstmt.setInt(1, bbsno);
		      
		      rs=pstmt.executeQuery();
		      if(rs.next()){
		        dto=new BbsDTO();
		        dto.setBbsno(rs.getInt("bbsno"));
		        dto.setWname(rs.getString("wname"));
		        dto.setSubject(rs.getString("subject"));
		        dto.setContent(rs.getString("content"));
		        dto.setReadcnt(rs.getInt("readcnt"));
		        dto.setGrpno(rs.getInt("grpno"));
		        dto.setRegdt(rs.getString("regdt"));
		        dto.setIp(rs.getString("ip"));
		      }else {
		        dto=null;
		      }//if end
			
			
		}catch(Exception e) {
			System.out.println("상세보기 실패 : "+ e);
		}finally {
			DBClose.close(con,pstmt,rs);
		}
		return dto;
		
	}
	
		public void incrementCnt(int bbsno) {
			
			try {
				con=dbopen.getConnection();
				sql=new StringBuilder();
				sql.append(" UPDATE tb_bbs ");
				sql.append(" SET readcnt=readcnt+1 ");
				sql.append(" WHERE bbsno=? ");
				pstmt=con.prepareStatement(sql.toString());
				pstmt.setInt(1, bbsno);
				pstmt.executeUpdate();
			
			}catch(Exception e) {
				System.out.println("조회수 증가 실패 : "+ e);
			}finally {
				DBClose.close(con,pstmt);	
			}
		}
	
	
		 public int delete(BbsDTO dto) {
			  int cnt=0;
			  try {
				  con=dbopen.getConnection();
				  sql=new StringBuilder();
				  sql.append("DELETE FROM tb_bbs ");
				  sql.append(" WHERE bbsno=? and passwd=? ");
				  pstmt=con.prepareStatement(sql.toString());
				  pstmt.setInt(1,dto.getBbsno());
				  pstmt.setString(2,dto.getPasswd());
				  cnt=pstmt.executeUpdate();
			  }catch(Exception e){
				  System.out.println("삭제 실패 : " + e);
			  }finally {
				  DBClose.close(con,pstmt,rs);
			  }
			  return cnt;
		  }
	
	
		 public int reply(BbsDTO dto) {
			 
			 int cnt=0;
			 try { 
				 con=dbopen.getConnection();
				 sql=new StringBuilder();
				 //1) 부모글 정보를 가져오기 (select문)
				 //( 그룹번호, 들여쓰기 ,글순서 ) 
				 int grpno=0, indent=0, ansnum=0;
				 sql.append(" SELECT grpno, indent, ansnum ");
				 sql.append(" FROM tb_bbs ");
				 sql.append(" WHERE bbsno=? ");
				 
				 pstmt=con.prepareStatement(sql.toString());
				 pstmt.setInt(1, dto.getBbsno());
				 rs=pstmt.executeQuery();
				 
				 if(rs.next()) {
					 // 그룹번호 : 부모 그룹번호 그대로 가져오기 
					 grpno=rs.getInt("grpno");
					 // 들여쓰기 :부모 들여쓰기 + 1 
					 indent=rs.getInt("indent")+1;
					 // 글 순서 : 부모 글 순서 + 1 
					 ansnum=rs.getInt("ansnum")+1;
				 }
				
		
				 //2) 글순서 다시 조정하기 (update문)
		
				 sql.delete(0, sql.length());
				 sql.append(" UPDATE tb_bbs ");
				 sql.append(" SET ansnum=ansnum+1 ");
				 sql.append(" WHERE grpno=? AND ansnum>=? ");
				 pstmt=con.prepareStatement(sql.toString());
				 pstmt.setInt(1, grpno);
				 pstmt.setInt(2, ansnum);
				 pstmt.executeUpdate();
				 
				 //3) 답변글 추가하기  (insert문)
				 
				 sql.delete(0, sql.length());
				 sql.append(" INSERT INTO tb_bbs(bbsno, wname, subject, content, passwd, ip, grpno, indent, ansnum) ");
				sql.append(" VALUES ( (select nvl(max(bbsno),0)+1 from tb_bbs) ");
				 sql.append(" ,?,?,?,?,?,?,?,? ) ");
				
				pstmt=con.prepareStatement(sql.toString());
				pstmt.setString(1, dto.getWname());
				pstmt.setString(2, dto.getSubject());
				pstmt.setString(3, dto.getContent());
				pstmt.setString(4,dto.getPasswd());
				pstmt.setString(5,dto.getIp());
				pstmt.setInt(6,grpno);
				pstmt.setInt(7,indent);
				pstmt.setInt(8,ansnum);
			
				cnt=pstmt.executeUpdate();
					 
				 
			 }catch(Exception e){
				  System.out.println("답변 실패 : " + e);
			 
			 }finally {
				  DBClose.close(con,pstmt,rs);
			 
			 }
			 
			 
			 return cnt;
			 
		 }
		 
		 
		 public BbsDTO update(int bbsno) {
			 BbsDTO dto=null;
			    try {
			    	
			      con=dbopen.getConnection();
			      sql=new StringBuilder();
			      sql.append(" SELECT wname,subject,content,passwd ");
			      sql.append(" FROM tb_bbs ");
			      sql.append(" WHERE bbsno=? ");
			      
			      pstmt=con.prepareStatement(sql.toString());
			      pstmt.setInt(1, bbsno);
			      
			      rs=pstmt.executeQuery();
			      if(rs.next()){
			        dto=new BbsDTO();
			        dto.setBbsno(rs.getInt("bbsno"));
			        dto.setWname(rs.getString("wname"));
			        dto.setSubject(rs.getString("subject"));
			        dto.setContent(rs.getString("content"));
			        dto.setPasswd(rs.getString("passwd"));
			        
			      }else {
			        dto=null;
			      }//if end
			    }catch (Exception e) {
			      System.out.println("상세보기실패:"+e);
			    }finally {
			      DBClose.close(con, pstmt, rs);
			    }//try end
			    return dto;
			  }//read() end
		 
		 
		 public int updateProc(BbsDTO dto) {
			  int cnt=0;
			  try {
				  con=dbopen.getConnection();
				  sql=new StringBuilder();
				  sql=new StringBuilder();
			      sql.append(" UPDATE tb_bbs ");
			      sql.append(" SET wname=? ");
			      sql.append(" ,subject=?, content=?, passwd=? ");
			      sql.append(" WHERE bbsno=?");
			      
				  pstmt=con.prepareStatement(sql.toString());
					  PreparedStatement pstmt=con.prepareStatement(sql.toString());
				      pstmt.setString(1,dto.getWname());
				      pstmt.setString(2, dto.getSubject());
				      pstmt.setString(3, dto.getContent());
				      pstmt.setString(4, dto.getPasswd());
				      pstmt.setInt(5, dto.getBbsno());
				      
				      cnt=pstmt.executeUpdate();

				    }catch (Exception e) {
				      System.out.println("수정실패:"+e);
				    }finally {
				      DBClose.close(con, pstmt, rs);
				    }//try end
				    
			  return cnt;
		  }
		 
		 
		 
		 
		 
		 public ArrayList<BbsDTO> list(String col,String word){
			 ArrayList<BbsDTO> list=null;
			 try {
				 con=dbopen.getConnection();
			      sql=new StringBuilder();
			      sql.append(" SELECT bbsno, wname, subject, readcnt, indent, regdt");
			      sql.append(" FROM tb_bbs");
			  
			      //검색어 있는지 ?
			      if(word.length()>=1) {
			    	  String search="";
			    	  if(col.equals("wname")) {
			    		search+= " WHERE wname LIKE '%"+ word+ "%' ";  
			    	  }else if(col.equals("subject")) {
			    			search+= " WHERE subject LIKE '%"+ word+ "%' ";  
			    	  }else if(col.equals("content LIKE '%"+ word)) {
			    		  search += " WHERE content LIKE '%" + word + "%' ";
			    	  }else if(col.equals("subject_content")) {
			    			search+= " WHERE subject LIKE '%"+ word+ "%' " ;
			    			search+="OR content LIKE '%"+word+"%'";
			    	  }
			    	  sql.append(search);
			      }
			      
			   		   
			      sql.append(" ORDER BY grpno DESC, ansnum ASC");
			      
			      pstmt=con.prepareStatement(sql.toString());
			      rs=pstmt.executeQuery();
			      if(rs.next()){
			        //전체행 저장
			        list=new ArrayList<>();
			        do {
			          //한줄저장
			          BbsDTO dto=new BbsDTO();
			          dto.setBbsno(rs.getInt("bbsno"));
			          dto.setWname(rs.getString("wname"));
			          dto.setSubject(rs.getString("subject"));
			          dto.setReadcnt(rs.getInt("readcnt"));
			          dto.setIndent(rs.getInt("indent"));
			          dto.setRegdt(rs.getString("regdt"));    
			          list.add(dto);
			        }while(rs.next());
			        
			      }else {
			        list=null;
			      }//if end
			 }catch(Exception e) {
				 System.out.println("목록 실패 : "+ e);
			 }finally {
				 DBClose.close(con,pstmt,rs);
			 }
			 return list;
		 }

		 public int count(String col,String word){
			int cnt=0;
			 try {
				 con=dbopen.getConnection();
			      sql=new StringBuilder();
			      sql.append(" SELECT COUNT(*) as cnt");
			      sql.append(" FROM tb_bbs");
			  
			      //검색어 있는지 ?
			      if(word.length()>=1) {
			    	  String search="";
			    	  if(col.equals("wname")) {
			    		search+= " WHERE wname LIKE '%"+ word+ "%' ";  
			    	  }else if(col.equals("subject")) {
			    			search+= " WHERE subject LIKE '%"+ word+ "%' ";  
			    	  }else if(col.equals("content LIKE '%"+ word)) {
			    		  search += " WHERE content LIKE '%" + word + "%' ";
			    	  }else if(col.equals("subject_content")) {
			    			search+= " WHERE subject LIKE '%"+ word+ "%' " ;
			    			search+="OR content LIKE '%"+word+"%'";
			    	  }
			    	  sql.append(search);
			      }
			      
			      
			      pstmt=con.prepareStatement(sql.toString());
			      rs=pstmt.executeQuery();
			      if(rs.next()){
			    	  cnt=rs.getInt("cnt");
			      }
			 }catch(Exception e) {
				 System.out.println("글 갯수 실패 : "+ e);
			 }finally {
				 DBClose.close(con,pstmt,rs);
			 }
			 return cnt;
		 }
		 
		 
		 
		 
		  public ArrayList<BbsDTO> list(String col, String word, int nowPage, int recordPerPage){
		    ArrayList<BbsDTO> list=null;
		    
		    // 페이지당 출력할 레코드 갯수 (10개를 기준)
		    // 1 page : WHERE r>=1 AND r<=10
		    // 2 page : WHERE r>=11 AND r<=20
		    // 3 page : WHERE r>=21 AND r<=30
		    int startRow = ((nowPage-1) * recordPerPage) + 1 ;
		    int endRow   = nowPage * recordPerPage;
		    
		    try{
		      con=dbopen.getConnection();
		      sql=new StringBuilder();
		      
		      word = word.trim(); //검색어의 좌우 공백 제거      
		      if(word.length()==0) {
		        
		        //검색을 하지 않는 경우
		        sql.append(" SELECT bbsno,subject,wname,readcnt,indent,regdt, r");
		        sql.append(" FROM( SELECT bbsno,subject,wname,readcnt,indent,regdt, rownum as r");
		        sql.append("       FROM ( SELECT bbsno,subject,wname,readcnt,indent,regdt");
		        sql.append("              FROM tb_bbs");
		        sql.append("              ORDER BY grpno DESC, ansnum ASC");
		        sql.append("           )");
		        sql.append("     )");
		        sql.append(" WHERE r>=" + startRow + " AND r<=" + endRow) ;
		        
		      } else {
		        
		        //검색을 하는 경우
		        sql.append(" SELECT bbsno,subject,wname,readcnt,indent,regdt, r");
		        sql.append(" FROM( SELECT bbsno,subject,wname,readcnt,indent,regdt, rownum as r");
		        sql.append("       FROM ( SELECT bbsno,subject,wname,readcnt,indent,regdt");
		        sql.append("              FROM tb_bbs");
		        
		        String search="";
		        if(col.equals("wname")) {
		          search += " WHERE wname LIKE '%" + word + "%'";
		        } else if(col.equals("subject")) {
		          search += " WHERE subject LIKE '%" + word + "%'";
		        } else if(col.equals("content")) {
		          search += " WHERE content LIKE '%" + word + "%'";
		        } else if(col.equals("subject_content")) {
		          search += " WHERE subject LIKE '%" + word + "%'";
		          search += " OR content LIKE '%" + word + "%'";
		        }
		        
		        sql.append(search);        
		        
		        sql.append("              ORDER BY grpno DESC, ansnum ASC");
		        sql.append("           )");
		        sql.append("     )");
		        sql.append(" WHERE r>=" + startRow + " AND r<=" + endRow) ;
		        
		      }//if end
		      
		      pstmt=con.prepareStatement(sql.toString());
		      rs=pstmt.executeQuery();
		      if(rs.next()){
		        list=new ArrayList<>();
		        do{
		          BbsDTO dto=new BbsDTO();
		          dto.setBbsno(rs.getInt("bbsno"));
		          dto.setSubject(rs.getString("subject"));
		          dto.setWname(rs.getString("wname"));
		          dto.setReadcnt(rs.getInt("readcnt"));
		          dto.setRegdt(rs.getString("regdt"));
		          dto.setIndent(rs.getInt("indent"));
		          list.add(dto);
		        }while(rs.next());
		      }//if end
		      
		    }catch(Exception e) {
		      System.out.println("목록 페이징 실패: "+e);
		    }finally {
		      DBClose.close(con, pstmt, rs);
		    }//try end   
		    return list;
		  }//list() end  
		  
}
