package controllor;

import services.RegistService;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;

@WebServlet("/user")
public class RegistServlet extends HttpServlet {
    private final RegistService registService = new RegistService();
    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        String name = req.getParameter("name");
        String password = req.getParameter("password");

        System.out.println(name);
        System.out.println(password);
        registService.addUser(name,password);

    }
}