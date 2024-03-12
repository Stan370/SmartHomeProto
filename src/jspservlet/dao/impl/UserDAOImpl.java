package jspservlet.dao.impl;

import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletResponse;

import jspservlet.dao.UserDAO;
import jspservlet.dao.db.DbConnector;
import jspservlet.vo.User;

public class UserDAOImpl implements UserDAO {
	public boolean queryByUsername(User user) throws Exception {
		// TODO Auto-generated method stub
		int flag = 0;
		String sql = "select * from user where uid = ? and password = ?";
		PreparedStatement pstmt = null;
		DbConnector dbc = null;
		try {
			dbc = new DbConnector();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getPassword());

			ResultSet rs = pstmt.executeQuery();
			System.out.println(user.getUsername());
			if(rs.next()){
				return true;
			}else{
				System.out.println("Cannot find it");
				return false;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			dbc.close();
			pstmt.close();
		}
		return false;
	}

	public int addUser(User user) throws Exception {
		int flag = 0;
		int flag2 = 0;
		try {
			DbConnector dbc = new DbConnector();
			String sql = "select * from user where uid=?";
			String sql2 = "insert into user(uid,password,family_fid) values(?,?,?)";
			PreparedStatement pstmt = dbc.getConnection().prepareStatement(sql);
			PreparedStatement ps = dbc.getConnection().prepareStatement(sql2);
			pstmt.setString(1, user.getUsername());
			ResultSet rs = pstmt.executeQuery();
			System.out.println(user.getUsername());

			while (rs.next()) {
				System.out.println(rs.getString("uid"));
				if (rs.getString("uid").equals(user.getUsername())) {
					System.out.println("User " + user.getUsername() + " already exists");
					flag2++;
					return flag;
				}
			}
			if (flag2 == 0) {
				ps.setString(1, user.getUsername());
				ps.setString(2, user.getPassword());
				ps.setString(3, user.getFamilyId());
				System.out.println("Sign up success!");
				System.out.println(ps.executeUpdate());
				return ++flag;
			}
		} catch (SQLException e) {
			e.getStackTrace();
			System.out.println(e);
		} catch (NullPointerException e) {
			HttpServletResponse response = null;
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>alert(''); window.location='error.jsp' </script>");
			out.flush();
			out.close();
		}
		return flag;
	}

}
