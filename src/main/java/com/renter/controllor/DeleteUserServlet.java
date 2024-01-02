package com.renter.controllor;

import com.renter.dao.DeleteUserDao;
import com.renter.data.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/page/view/pages/admin/delete")
public class DeleteUserServlet extends HttpServlet {
    private final DeleteUserDao deleteUser = new DeleteUserDao();
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User delete = new User();
        String del = req.getParameter("delemail");

        delete.setEmail(del);
        boolean status = deleteUser.deleteUser(delete);

        if (status) {
            // 返回成功响应
            resp.sendRedirect("/page/view/pages/status/sucDeleteUser.jsp");
        } else {
            // 设置响应头的 Content-Type 值
            resp.setContentType("text/plain;charset=UTF-8");
            // 返回失败响应
            resp.getWriter().write("用户删除失败！返回重试！");
        }
    }
}
