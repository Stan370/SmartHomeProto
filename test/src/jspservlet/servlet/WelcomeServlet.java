package jspservlet.servlet;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspservlet.db.DbConnector;
import jspservlet.vo.Measure_data;

public class WelcomeServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PreparedStatement pstmt = null;
		DbConnector dbc = null;
		String sql = "select temperature,humidity,brightness,door,windows,buzzer,theft,vibration_sensor,human_infrared from measure_data where family_fid in (select family_fid from user where uid=?);";
		try {
			String username = (String) req.getSession().getAttribute("username");
			dbc = new DbConnector();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, username);
			ResultSet resultset = pstmt.executeQuery();
			Measure_data md = null;
			List<Measure_data> datas = new ArrayList<Measure_data>();
			while (resultset.next()) {
				md = new Measure_data();
				md.setTemperature(resultset.getDouble("temperature"));
				md.setHumidity(resultset.getDouble("humidity"));
				md.setBrightness(resultset.getInt("brightness"));
				md.setDoor(resultset.getBoolean("door"));
				md.setWindows(resultset.getBoolean("windows"));
				md.setBuzzer(resultset.getBoolean("buzzer"));
				md.setTheft(resultset.getBoolean("theft"));
				md.setVibration_sensor(resultset.getBoolean("vibration_sensor"));
				md.setHuman_infrared(resultset.getBoolean("human_infrared"));
				datas.add(md);
			}
			req.setAttribute("measureList", datas);
			resultset.close();
			pstmt.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		req.getRequestDispatcher("welcome.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}
