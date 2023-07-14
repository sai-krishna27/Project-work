package com.table;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBdriver {
	public static final String DRIVER_NAME="com.mysql.jdbc.Driver";
	public static final String URL_NAME="jdbc:mysql://localhost:3306/quiz";
	public static final String USER_NAME="root";
	public static final String PASS_WORD="9014803544";
	
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName(DRIVER_NAME);
		Connection cn=DriverManager.getConnection(URL_NAME,USER_NAME,PASS_WORD);
		return cn;
	}
}
