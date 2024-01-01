package com.renter.controllor;

import com.renter.data.Order;
import com.renter.data.User;
import com.renter.services.GetOrderService;
import com.renter.services.GetUserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/page/view/pages/admin/userList")
public class GetUserServlet extends HttpServlet {
    private final GetUserService getUserService = new GetUserService();
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int currentPage = 1;
        int pageSize = 10;

        String currentPageParam = req.getParameter("currentPage");
        String pageSizeParam = req.getParameter("pageSize");

        if (currentPageParam != null && pageSizeParam != null) {
            currentPage = Integer.parseInt(currentPageParam);
            pageSize = Integer.parseInt(pageSizeParam);
        }

        // 获取所有订单
        List<User> allUsers = getUserService.getUser();

        // 计算总共需要分成多少页
        int totalPage = allUsers.size() / pageSize;
        if (allUsers.size() % pageSize != 0) {
            totalPage++;
        }

        // 获取当前页需要显示的订单
        int start = (currentPage - 1) * pageSize;
        int end = Math.min(start + pageSize, allUsers.size());
        List<User> currentUsers = new ArrayList<>(allUsers.subList(start, end));

        // 将分页信息和订单发送到JSP页面
        req.setAttribute("totalPage", totalPage);
        req.setAttribute("currentPage", currentPage);
        req.setAttribute("pageSize", pageSize);
        req.setAttribute("currentUsers", currentUsers);
        req.getRequestDispatcher("/page/view/pages/admin/userManager.jsp").forward(req, resp);
    }


}
