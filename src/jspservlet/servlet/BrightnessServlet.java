package jspservlet.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gnu.io.SerialPort;
import jspservlet.com.Control;
import jspservlet.dao.db.DbConnector;

public class BrightnessServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String level = request.getParameter("level");
		ServletContext application = request.getServletContext();
		Control c = new Control((SerialPort)application.getAttribute("hhh"));
		application.setAttribute("gun",level);
		application.setAttribute("level",level);
		c.controlLight(level);
//		DbConnector dbc = null;
//		PreparedStatement pstmt = null;
//		String sql = "update measure_data set brightness = ? where measure_time = " +
//				"(select max(measure_time)from measure_data) and hardware_equipment_e_id = 002";
//		dbc = new DbConnector();
//		PrintWriter out = response.getWriter();
//		try {
//			pstmt = dbc.getConnection().prepareStatement(sql);
//			pstmt.setString(1, level);
//			pstmt.execute();
//			out.print(true);
//		} catch (SQLException e) {
//			e.printStackTrace();
//			out.print(false);
//		}
//		Another method using String from the smart home ^^
//		Receiver re = new Receiver();
//		String str = re.getStr();
//		String light1 = str.substring(str.indexOf("e:") + 3, str.indexOf("is") - 1);
//		System.out.println(light1);
//		request.setAttribute("light",light1);
//		String home = str.substring(str.indexOf("me:") + 4, str.indexOf("Hu"));
//		System.out.println(home);
//		if (home.equals("yes")) home = "1";
//		else home = "0";
//		String humi1 = str.substring(str.indexOf("mi:") + 4, str.indexOf("%"));
//		System.out.println(humi1);
//
//		String temp1 = str.substring(str.indexOf("mp:") + 4, str.indexOf("C"));
//		System.out.println(temp1);
//
//		String window = str.substring(str.indexOf("ow:") + 4, str.indexOf("doo"));
//		System.out.println(window);
//		if (window.equals("on")) window = "1";
//		else window = "0";
//		String door = str.substring(str.indexOf("or:") + 4, str.indexOf("*"));
//		System.out.println(door);
//		if (door.equals("on")) door = "1";
//		else door = "0";

	}

}
