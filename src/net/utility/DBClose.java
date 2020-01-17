package net.utility;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBClose {
	
	public static void close(Connection con) {
		try {
			if(con!=null) {
				con.close();
				con=null;
			}
		}catch(Exception e){
			
		}
	}
	
	public static void close(Connection con, PreparedStatement pstmt) {
		try {
			if(pstmt!=null) {
				pstmt.close();
				pstmt=null;
			}
		}catch(Exception e){
			
		}
		try {
			if(con!=null) {
				con.close();
				con=null;
			}
		}catch(Exception e){
			
		}
	}
	
	
	public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		try {
			if(pstmt!=null) {
				pstmt.close();
				pstmt=null;
			}
		}catch(Exception e){
			
		}
		try {
			if(con!=null) {
				con.close();
				con=null;
			}
		}catch(Exception e){
			
		}
		try {
			if(rs!=null) {
				rs.close();
				rs=null;
			}
		}catch(Exception e){
			
		}
	}

}
