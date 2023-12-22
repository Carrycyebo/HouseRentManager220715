package services;

import dao.LoginDao;

import java.io.IOException;

public class LoginService {
    private final LoginDao loginDao = new LoginDao();
    //用户登录
    public int queryUser(String username, String passwd){
        String pwd = null;

        pwd = loginDao.queryUser(username);

        if (pwd != null){
            if (pwd.equals(passwd)){
                return 0;
            }else {
                return 2;
            }

        }else {
            return 1;
        }


    }
}
