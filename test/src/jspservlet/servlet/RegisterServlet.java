package jspservlet.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jspservlet.dao.UserDAO;
import jspservlet.dao.impl.UserDAOImpl;
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
		//封装表单数据，调用UserService层，如果错误显示异常信息并保存到request域中
		String username=req.getParameter("username");
		String password=req.getParameter("password");
		String fid=req.getParameter("fid");
		User user=new User();
		user.setUsername(req.getParameter("username"));
		user.setPassword(req.getParameter("password"));
		user.setFamilyId(req.getParameter("fid"));
		//校验用户表单是否符合规范，用map来转错误信息
		Map<String,String> errors=new HashMap<String,String>();
		//校验用户名是否符合规范
		if(username==null||username.trim().isEmpty()) {
			errors.put("username", "用户名不能为空");
		}else if(username.length()<3||username.length()>15) {
			errors.put("username","用户名长度必须在3-15之间！");
		}
		//校验密码是否符合规范
		if(password==null||password.trim().isEmpty()) {
			errors.put("password", "密码不能为空");
		}else if(password.length()<3||password.length()>15) {
			errors.put("password","密码长度必须在3-15之间！");
		}
		System.out.println(errors);
		
		UserDAO dao = new UserDAOImpl();   
	     int flag = 0;
	     try {
				flag = dao.addUser(user);
				System.out.println(flag);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println("error");
				e.printStackTrace();
		 }
	     if(flag == 1){   
			 res.getWriter().write("注册成功");
	         req.getRequestDispatcher("regitSuccess.jsp").forward(req, res);
	         //res.sendRedirect("./welcome.jsp");
	     } 
		 else {
	         res.getWriter().write("注册失败");
	         res.sendRedirect("regitFail.jsp");
	     }
	}
}
