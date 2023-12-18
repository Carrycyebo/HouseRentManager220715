package controllor;

import services.RegisterService;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private final RegisterService registerService = new RegisterService();
    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {

        String name = req.getParameter("name");
        String uname = req.getParameter("uname");
        String password = req.getParameter("password");

        System.out.println(name);
        System.out.println(uname);
        System.out.println(password);
        registerService.addUser(name,uname,password);

    }
}