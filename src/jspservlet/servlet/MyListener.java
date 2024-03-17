import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class MyListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("===================Application Context Initialized！！！");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("===================Application Context Destroyed！！！");
    }
}

 class MyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public MyServlet() {
        super();
    }

    @Override
    public void init() throws ServletException {
        // Always call super.init() to ensure proper servlet initialization
        super.init();
        System.out.println("===================MyServlet启动！！！");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Implement your GET method logic here
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    @Override
    public void destroy() {
        System.out.println("===================MyServlet销毁！！！");
        // Perform any necessary cleanup here before the servlet is destroyed.
        super.destroy();
    }
}
