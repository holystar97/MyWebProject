package net.pds;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.utility.DBClose;
import net.utility.DBOpen;

public class PdsDAO {

	private DBOpen dbopen=null;
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private StringBuilder sql=null;
	
	public PdsDAO() {
		dbopen=new DBOpen();
	}
		
	public int insert(PdsDTO dto) {
		int cnt=0;
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
		    sql.append(" INSERT INTO tb_pds(pdsno,wname,subject,passwd,filename,filesize,regdate) ");
		    sql.append(" VALUES ((SELECT NVL(MAX(pdsno),0)+1 FROM tb_pds) ");
		    sql.append("         , ?, ?, ?, ?, ?, sysdate) ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getPasswd());
			pstmt.setString(4, dto.getFilename());
			pstmt.setLong(5, dto.getFilesize());
			
			cnt=pstmt.executeUpdate();
			
		}catch(Exception e) {
			
		}finally {
			DBClose.close(con,pstmt);
		}
		return cnt;
	}
	
	
	public synchronized ArrayList<PdsDTO> list(){
		 ArrayList<PdsDTO> list=null;
		    try {
		      con=dbopen.getConnection();
		      StringBuilder sql=new StringBuilder();
		      sql.append(" SELECT pdsno, wname, subject, readcnt, regdate, filename ");
		      sql.append(" FROM tb_pds ");
		      sql.append(" ORDER BY regdate DESC ");
		      pstmt=con.prepareStatement(sql.toString());
		      rs=pstmt.executeQuery();
		      if(rs.next()){
		          list=new ArrayList<>();
		          do {
		            PdsDTO dto=new PdsDTO();
		            dto.setPdsno(rs.getInt("pdsno"));
		            dto.setWname(rs.getString("wname"));
		            dto.setSubject(rs.getString("subject"));
		            dto.setReadcnt(rs.getInt("readcnt"));
		            dto.setFilename(rs.getString("filename"));
		            dto.setRegdate(rs.getString("regdate"));
		            list.add(dto);
		          }while(rs.next());
		      }else{
		          list=null;
		      }//if end
		      
		    }catch (Exception e) {
		      System.out.println("목록실패:"+e);
		    }finally {
		      DBClose.close(con, pstmt, rs);
		    }//try end
		    return list;
		  }//list() end
	}

