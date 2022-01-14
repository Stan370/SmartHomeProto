package com.tianwenhao2.preparestatement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import org.junit.Test;

import com.tianwenhao3.util.JDBCUtils;

public class preparedstatementquery {
	
	@Test
	public void testquery() {
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet resultset=null;
		try {
			conn = JDBCUtils.getConnection();
			
			String sql=" select temperature from measure_data where e_id in (select e_id from hardware_equipment where family_fid=(select family_fid from user where uid =?));";
			ps = conn.prepareStatement(sql);
			ps.setObject(1, "tom");
			
			resultset = ps.executeQuery();
			
			if(resultset.next()) {
		        
				double temperature = resultset.getDouble(1);
			
				String result=String.format("%.2f",temperature);
				System.out.println(result);
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			JDBCUtils.closeResource(conn, ps, resultset);
	}
		}
	
	@Test
	public void door() {
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet resultset=null;
		try {
			conn = JDBCUtils.getConnection();
			
			String sql=" select door from measure_data where e_id in (select e_id from hardware_equipment where family_fid=(select family_fid from user where uid =?));";
			ps = conn.prepareStatement(sql);
			ps.setObject(1, "tom");
			
			resultset = ps.executeQuery();
			
			if(resultset.next()) {
		       	boolean door = resultset.getBoolean(1);
		       	if(door=true) {
		       		System.out.println("open");
		       	}else {
		       		System.out.println("close");
		       	}
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			JDBCUtils.closeResource(conn, ps, resultset);
	}
		}

	@Test
	public void brightness() {
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet resultset=null;
		try {
			conn = JDBCUtils.getConnection();
			
			String sql=" select brightness from measure_data where e_id in (select e_id from hardware_equipment where family_fid=(select family_fid from user where uid =?));";
			ps = conn.prepareStatement(sql);
			ps.setObject(1, "tom");
			
			resultset = ps.executeQuery();
			
			if(resultset.next()) {
		        
				int brightness = resultset.getInt(1);
				System.out.println(brightness);
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			JDBCUtils.closeResource(conn, ps, resultset);
	}
		}
	

	
	public void humidity() {
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet resultset=null;
		try {
			conn = JDBCUtils.getConnection();
			
			String sql=" select humidity from measure_data where e_id in (select e_id from hardware_equipment where family_fid=(select family_fid from user where uid =?));";
			ps = conn.prepareStatement(sql);
			ps.setObject(1, "tom");
			
			resultset = ps.executeQuery();
			
			if(resultset.next()) {
		        
				double humidity = resultset.getDouble(1);
			
				String result=String.format("%.2f",humidity);
				System.out.println(result);
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			JDBCUtils.closeResource(conn, ps, resultset);
	}
		}
}
