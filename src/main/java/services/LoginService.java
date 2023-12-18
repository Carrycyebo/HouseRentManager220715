package services;

import dao.LoginDao;

public class LoginService {
    private final LoginDao loginDao = new LoginDao();
    //用户登录
    public void queryUser(String username, String pwd){
        //业务逻辑判断
        //1、判断用户名是否存在  通过get查询

        //2、如果用户名不存在，才可以存储数据
        loginDao.queryUser(username,pwd);
    }
}
