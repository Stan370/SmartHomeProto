package jspservlet.servlet;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gnu.io.NoSuchPortException;
import gnu.io.PortInUseException;
import gnu.io.SerialPort;
import gnu.io.UnsupportedCommOperationException;
import jspservlet.com.Control;
import jspservlet.com.utl;
import jspservlet.dao.db.DbConnector;
import jspservlet.dao.db.Receiver;
import jspservlet.vo.Measure_data;
import jspservlet.vo.User1;

public class WelcomeServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	static int i=0;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User1 user = new User1(req.getParameter("username"),req.getParameter("password"),"102");
		PreparedStatement pstmt = null;
		DbConnector dbc = null;
		String sql = "select temperature,humidity,brightness,door,windows,switch_status from measure_data where measure_time = (select max(measure_time)from measure_data)";
		try {
			dbc = new DbConnector();
			pstmt = dbc.getConnection().prepareStatement(sql);
			ResultSet resultset = pstmt.executeQuery();
			Measure_data md = null;
			List<Measure_data> data = new ArrayList<Measure_data>();
			int i=1;
			while (resultset.next()) {
				md = new Measure_data();
				md.setTemperature(resultset.getDouble("temperature"));
				md.setHumidity(resultset.getDouble("humidity"));
				md.setBrightness(resultset.getInt("brightness"));
				md.setDoor(resultset.getBoolean("door"));
				md.setWindows(resultset.getBoolean("windows"));
				md.setSwitch_status(resultset.getBoolean("switch_status"));
				data.add(md);
				System.out.println(md.getBrightness()+i);
				i++;
			}

			req.setAttribute("measureList", data);
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

	@Override
	public void init() throws ServletException {
		super.init();
		try {
				SerialPort serialPort = utl.openSerialPort("COM5", 115200);
				ServletContext application = getServletContext();
				application.setAttribute("hhh", serialPort);
				Receiver re=new Receiver(new Control(serialPort));
				re.start();
				application.setAttribute("receive",re);

		} catch (NoSuchPortException e) {
			e.printStackTrace();
		} catch (PortInUseException e) {
			e.printStackTrace();
		} catch (UnsupportedCommOperationException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void destroy() {
		super.destroy();
		ServletContext application = getServletContext();

		Control c = new Control((SerialPort)application.getAttribute("hhh"));
		utl.closeSerialPort(c.serialPort);
	}
}
