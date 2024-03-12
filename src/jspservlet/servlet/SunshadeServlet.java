package jspservlet.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspservlet.dao.db.DbConnector;

public class SunshadeServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String level2 = request.getParameter("level2");
		DbConnector dbc = null;
		PreparedStatement pstmt = null;
		String sql = "update measure_data set sunshade_angle = ? where measure_time = (select max(measure_time)from measure_data) ";
		dbc = new DbConnector();
		PrintWriter out = response.getWriter();
		try {
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, level2);
			pstmt.execute();
			out.print(true);
			dbc.close();
		} catch (SQLException e) {
			e.printStackTrace();
			out.print(false);
		}
		
	}
}
