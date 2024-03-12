package jspservlet.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspservlet.dao.UserDAO;
import jspservlet.dao.impl.UserDAOImpl;
import jspservlet.dao.db.Utility;
import jspservlet.vo.User;

/**
 * Servlet implementation class RegistServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest req, HttpServletResponse res)
		    throws IOException, ServletException{
		doPost(req,res);
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String username=req.getParameter("username");
		String password=req.getParameter("password");
		String fid=req.getParameter("fid");
		User user=new User();
		user.setUsername(req.getParameter("username"));
		user.setPassword(req.getParameter("password"));
		user.setFamilyId(req.getParameter("fid"));
		Map<String,String> errors=new HashMap<String,String>();
		if(username==null||username.trim().isEmpty()) {
			errors.put("username", "请输入名字");
		}
		if(password==null||password.trim().isEmpty()) {
			errors.put("password", "请输入密码");
		}
		System.out.println(errors);
		
		UserDAO dao = new UserDAOImpl();   
	     Boolean flag=false;
	     try {
	     		flag = Utility.userInsert(Utility.trans(user));
				//flag = dao.addUser(user);
				System.out.println(flag);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println("error");
				e.printStackTrace();
		 }
	     if(flag){
	         req.getRequestDispatcher("regitSuccess.jsp").forward(req, res);
	         //res.sendRedirect("./welcome.jsp");
	     } 
		 else {
	         res.sendRedirect("regitFail.jsp");
	     }
	}
}
