package jspservlet.dao.db;

import java.lang.reflect.Field;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BasicTool {
	public static synchronized <T> List<T> getList(Class<T> clazz, String sql, Object...args){
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			conn = JDBCUtils.getConnection();
			ps = conn.prepareStatement(sql);
			for(int i=0;i<args.length;i++) {
				ps.setObject(i+1,args[i]);
			}
			rs = ps.executeQuery();
			//得到元数据
			ResultSetMetaData rsmd=rs.getMetaData();
			int columnCount=rsmd.getColumnCount();
			
			ArrayList<T> list = new ArrayList<T>();
			while(rs.next()) {
				T t=clazz.getDeclaredConstructor().newInstance();
				for(int i=0;i<columnCount;i++) {
					Object value=rs.getObject(i+1);
					String columnLabel=rsmd.getColumnLabel(i+1);
					Field field = t.getClass().getDeclaredField(columnLabel);
					field.setAccessible(true);
					field.set(t, value);
				}
				list.add(t);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		JDBCUtils.closeResource(conn, ps, rs);
		return null;
	}
	
	public static synchronized <T>T getInstance(Class<T> clazz, String sql, Object...args) {
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			conn = JDBCUtils.getConnection();
			ps = conn.prepareStatement(sql);
			for(int i=0;i<args.length;i++) {
				ps.setObject(i+1,args[i]);
			}
			rs = ps.executeQuery();
			//得到元数据
			ResultSetMetaData rsmd=rs.getMetaData();
			int columnCount=rsmd.getColumnCount();
			
			if(rs.next()) {
				T t=clazz.getDeclaredConstructor().newInstance();
				for(int i=0;i<columnCount;i++) {
					Object value=rs.getObject(i+1);
					String columnLabel=rsmd.getColumnLabel(i+1);
					Field field = t.getClass().getDeclaredField(columnLabel);
					field.setAccessible(true);
					field.set(t, value);
				}
				return t;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		JDBCUtils.closeResource(conn, ps, rs);
		return null;
	}
	
	public static synchronized Boolean insertInstance(String sql, Object...args) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = JDBCUtils.getConnection();
			ps = conn.prepareStatement(sql);
			//填充占位符
			for(int i=0;i<args.length;i++) {
				ps.setObject(i+1,args[i]);
			}
			//执行
			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			//关闭
			JDBCUtils.closeResource(conn, ps);
		}
		return true;
	}
	
	public static synchronized Boolean deleteInstance(String sql, Object...args) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = JDBCUtils.getConnection();
			ps = conn.prepareStatement(sql);
			//填充占位符
			for(int i=0;i<args.length;i++) {
				ps.setObject(i+1,args[i]);
			}
			//执行
			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			//关闭
			JDBCUtils.closeResource(conn, ps);
		}
		return true;
	}
	
	public static synchronized Boolean updateInstance(String sql, Object...args) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = JDBCUtils.getConnection();
			ps = conn.prepareStatement(sql);
			//填充占位符
			for(int i=0;i<args.length;i++) {
				ps.setObject(i+1,args[i]);
			}
			//执行
			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			//关闭
			JDBCUtils.closeResource(conn, ps);
		}
		return true;
	}
	
	public static void closeForeignConstraint() {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = JDBCUtils.getConnection();
			ps = conn.prepareStatement("set foreign_key_checks=0");
			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtils.closeResource(conn, ps);
		}
	}
	
	public static void openForeignConstraint() {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = JDBCUtils.getConnection();
			ps = conn.prepareStatement("set foreign_key_checks=1");
			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtils.closeResource(conn, ps);
		}
	}
}
