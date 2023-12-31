package com.renter.services;

import com.renter.dao.LoginDao;

public class LoginService {
    private final LoginDao loginDao = new LoginDao();
    //用户登录
    public int queryAdmin(String username, String passwd){
        String pwd = null;

        pwd = loginDao.queryAdmin(username);
        System.out.println(pwd);
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


    public int queryUser(String username, String passwd){
        String pwd = null;

        pwd = loginDao.queryAdmin(username);

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
