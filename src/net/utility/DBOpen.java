package net.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBOpen {
	//데이터 베이스 연결 메소드 
	public Connection getConnection() {
		
		  String url     ="jdbc:oracle:thin:@localhost:1521:xe";
	      String user    ="system";
	      String password="1234";
	      String driver  ="oracle.jdbc.driver.OracleDriver";//ojdbc.jar    
	      Connection con=null;
	    
	      try {
	    	  Class.forName(driver);  
	  	      con=DriverManager.getConnection(url, user, password);
	    	  
	      }catch(Exception e) {
	    	 System.out.println("DB 연결 실패 : "+ e);
	      }
	      
		return con;
		
	} // getConnection() end
} // class end
