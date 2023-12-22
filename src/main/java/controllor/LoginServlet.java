package controllor;

import services.LoginService;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/login")
public class LoginServlet extends HttpServlet {
    private final LoginService loginService = new LoginService();
    @Override
    public void service(ServletRequest req, ServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("adminName");
        String password = req.getParameter("adminPasswd");

        int status = loginService.queryUser(name,password);
        if(status == 0){
            req.getRequestDispatcher("/page/admin/view/Manager.jsp").forward(req, resp);
        } else if (status == 1) {
            req.setAttribute("tip", "账号不存在！");
            req.getRequestDispatcher("/page/admin/adminLogin.jsp").forward(req, resp);
        }else {
            req.setAttribute("tip", "密码不正确！");
            req.getRequestDispatcher("/page/admin/adminLogin.jsp").forward(req, resp);
        }

    }
}