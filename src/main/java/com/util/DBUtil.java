package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
  
   public static Connection getConnection()
   {
	   Connection con=null;
	   try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user","root","Raj@Mysql1902");
	} catch (ClassNotFoundException e) {

		e.printStackTrace();
	} catch (SQLException e) {

		e.printStackTrace();
	}
	   return con;
	   
	   
   }
//   public static void main(String[] args) {
//    DBUtil.getConnection();
//    
//}
   
}
