package com.renter.controllor;

import com.renter.data.Order;
import com.renter.data.User;
import com.renter.services.GetOrderService;
import com.renter.services.GetUserService;
import com.renter.services.LoginService;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/page/view/pages/user/myOrder")
public class QueryMyOrderServlet extends HttpServlet {
    private final GetOrderService getOrderService = new GetOrderService();
    private final GetUserService getUserService = new GetUserService();
    private final LoginService loginService = new LoginService();
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

        /*String searchQuery = req.getParameter("searchQuery")*/;
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("loggedInUser");

        User loggedUser = loginService.getUser(user.getEmail());

        System.out.println(loggedUser.getOrderIds());

        List<String> list = loggedUser.getOrderIds();

        List<Order> allOrders = getOrderService.queryMyOrder(list);

        if (allOrders != null){


            //System.out.println(queryOrder.getOrder_id());
            // 计算总共需要分成多少页
            int totalPage = allOrders.size() / pageSize;
            if (allOrders.size() % pageSize != 0) {
                totalPage++;
            }
            // 获取当前页需要显示的订单
            int start = (currentPage - 1) * pageSize;
            int end = Math.min(start + pageSize, allOrders.size());
            List<Order> currentOrders = new ArrayList<>(allOrders.subList(start, end));

            // 将分页信息和订单发送到JSP页面
            req.setAttribute("totalPage", totalPage);
            req.setAttribute("currentPage", currentPage);
            req.setAttribute("pageSize", pageSize);
            req.setAttribute("currentOrders", currentOrders);
            req.getRequestDispatcher("/page/view/pages/user/myOrder.jsp").forward(req, resp);
        } else {
            resp.getWriter().write("cw");
        }
    }
}
