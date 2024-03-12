package jspservlet.dao.db;

import java.sql.*;

public class JDBCUtils {
	private static Connection conn;
	private final String DBDRIVER = "c";
	private final String DBURL = "jdbc:mysql://127.0.0.1:3306/smarthomemodel";
	private final String DBUSER = "root";
	private final String DBPASSWORD = "123456";



	public static Connection getConnection() throws Exception {
		String user="root";
		String password="123456";
		String url="jdbc:mysql://localhost:3306/smarthomemodel?serverTimezone=UTC";
		String driver="com.mysql.cj.jdbc.Driver";
		//2.加载驱动
		Class.forName(driver);
		//3.获取连接
		Connection conn=DriverManager.getConnection(url,user,password);
		return conn;
	}

	
	public static void closeResource(Connection conn, PreparedStatement ps) {
		try {
			if(ps!=null);
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if(conn!=null)
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
	}

	public static void closeResource(Connection conn, PreparedStatement ps, ResultSet rs) {
		try {
			if(ps!=null);
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if(conn!=null)
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if(rs!=null)
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
