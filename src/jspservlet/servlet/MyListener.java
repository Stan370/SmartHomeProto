package jspservlet.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class MyListener extends HttpServlet{
    private static final long serialVersionUID = 1L;
    public MyListener(){
    }

    public void init(){
        System.out.println("===================MyListener启动！！！");
    }

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
            throws ServletException, IOException{
    }

    public void destory(){
    }
}
