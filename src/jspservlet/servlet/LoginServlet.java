package jspservlet.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jspservlet.vo.User1;
import jspservlet.dao.db.Utility;

public class LoginServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		User1 user = new User1(req.getParameter("username"),req.getParameter("password"),"102");
		Boolean  i = Utility.checkUser(user);
		//UserDAO dao = new UserDAOImpl();
//		try {
//			Boolean b = new Boolean(dao.queryByUsername(user));
//			flag = (b.equals(false)) ? 0 : 1;
//			System.out.println(flag);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		try{
			if (i) {
				HttpSession session = req.getSession();
				session.setAttribute("username", user.getUid());
				session.setAttribute("familyId", user.getFamily_fid());
	//			req.getRequestDispatcher("/welcome").forward(req, res);
				res.sendRedirect("./welcome");
			} else {
				res.sendRedirect("./error.jsp");
			}
		}
		catch (Exception e){
			e.printStackTrace();
		}
	}
}
