package net.pds;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
			sql.append(" INSERT INTO tb_pds(pdsno,wname,subject, ");
			sql.append(" passwd, filename, filesize, regdate) ");
			sql.append(" VALUES( (select nvl(max(pdsno),0)+1 from tb_pds ");
			sql.append(" ?,?,?,?,?,sydate");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(2, dto.getFilename());
			pstmt.setLong(2, dto.getFilesize());
			
			cnt=pstmt.executeUpdate();
			
		}catch(Exception e) {
			
		}finally {
			DBClose.close(con,pstmt);
		}
		return cnt;
	}
	
	
}
