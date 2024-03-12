package jspservlet.servlet;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gnu.io.SerialPort;
import jspservlet.com.Control;
import jspservlet.dao.db.DbConnector;

/**
 * Servlet implementation class HomeServlet
 */
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DbConnector dbc =null;
		dbc =new DbConnector();
		String level3 = request.getParameter("level3");
		//people at home
		ServletContext application = request.getServletContext();
		Control c = new Control((SerialPort)application.getAttribute("hhh"));
		c.controlLight(level3);
//		String sql2 = "update measure_data set switch_status = ? where measure_time = (select max(measure_time)from measure_data) and hardware_equipment_e_id = 005 ";
//		PreparedStatement pstmt2 = null;
//		try {
//			pstmt2 = dbc.getConnection().prepareStatement(sql2);
//			pstmt2.setString(1, level3);
//			pstmt2.execute();
//			dbc.close();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
	}

}
