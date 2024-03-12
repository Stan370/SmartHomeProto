package jspservlet.dao.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnector {
	private final String DBDRIVER = "com.mysql.cj.jdbc.Driver";
	private final String DBURL = "jdbc:mysql://127.0.0.1:3306/smarthomemodel";
	private final String DBUSER = "root";
	private final String DBPASSWORD = "123456";
	private Connection conn = null;

	public DbConnector() {
		try {
			Class.forName(DBDRIVER);
			this.conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	public Connection getConnection() {
		System.out.println(conn);
		return this.conn;
	}

	public void close() {
		try {
			this.conn.close();
		} catch (Exception e) {
		}
	}
}
