package com.tianwenhao3.util;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

/*
 * 操纵数据库的工具类
 * 
 * 
 */
public class JDBCUtils {
	/*
	 * 获取数据库的链接
	 * 
	 * 
	 */
	
	public static Connection getConnection() throws Exception {
		InputStream is =ClassLoader.getSystemClassLoader().getResourceAsStream("jdbc.properties");
		Properties pros= new Properties();
		pros.load(is);
		
		String dbuser=pros.getProperty("dbuser");

		String dbpassword=pros.getProperty("dbpassword");
		String dburl=pros.getProperty("dburl");
		String dbdriverClass=pros.getProperty("dbdriverClass");
		
		Class.forName(dbdriverClass);
		
		java.sql.Connection conn=DriverManager.getConnection(dburl,dbuser,dbpassword);
		return conn;
	}
/*
 * 关闭资源
 */
	public static void closeResource(Connection conn,PreparedStatement ps) {
		
		try {
			if(ps !=null)
			ps.close();
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		try {
			if(conn !=null)
			conn.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
	}
	}
public static void closeResource(Connection conn,PreparedStatement ps,ResultSet rs) {
		
		try {
			if(ps !=null)
			ps.close();
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		try {
			if(conn !=null)
			conn.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
	}
		try {
			if(rs !=null)
			rs.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
	}
	}
	
}
