package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect {
	 
	private static Connection conn;
	
	public static Connection getconn() {
		
		try {
			
			if (conn==null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal","root","161855209");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	

}
