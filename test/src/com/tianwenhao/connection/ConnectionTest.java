package com.tianwenhao.connection;

import java.io.InputStream;
import java.sql.DriverManager;
import java.util.Properties;

import org.junit.Test;

public class ConnectionTest {
	@Test
	public void getConnection() throws Exception {
		InputStream is =ConnectionTest.class.getClassLoader().getResourceAsStream("jdbc.properties");
		Properties pros= new Properties();
		pros.load(is);
		
		String dbuser=pros.getProperty("dbuser");

		String dbpassword=pros.getProperty("dbpassword");
		String dburl=pros.getProperty("dburl");
		String dbdriverClass=pros.getProperty("dbdriverClass");
		
		Class.forName(dbdriverClass);
		
		java.sql.Connection conn=DriverManager.getConnection(dburl,dbuser,dbpassword);
		System.out.println(conn);
	}
	

}
