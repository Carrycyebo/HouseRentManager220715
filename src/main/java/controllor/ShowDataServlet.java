package controllor;

import com.alibaba.fastjson2.JSONObject;
import data.MyData;
import services.ShowDataService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/show")
public class ShowDataServlet extends HttpServlet {
    private ShowDataService service = new ShowDataService();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("----------");
        List<MyData> data = service.seleteData();
        String jsonData = JSONObject.toJSONString(data);
        System.out.println(jsonData);
        resp.getWriter().write(jsonData);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
