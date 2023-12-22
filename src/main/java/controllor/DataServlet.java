package controllor;

import com.alibaba.fastjson2.JSONObject;
import data.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

@WebServlet("/user/data")
public class DataServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //虚假数据，此数据要用HBaseAPI查询获取
        ArrayList<User> myData = new ArrayList<User>();
        Random random = new Random();
        for (int i =0; i < 20 ; i++){
            User myData1 = new User("user" + i, random.nextInt(100));
            myData.add(myData1);
        }
        //将数据转为json格式
        String data = JSONObject.toJSONString(myData);
        //响应数据
        resp.getWriter().write(data);
    }
}
