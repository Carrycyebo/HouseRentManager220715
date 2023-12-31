package com.renter.services;

import com.renter.dao.RegistDao;

public class RegisterService {
    private final RegistDao registDao = new RegistDao();
    //用户注册
    public int addAdmin(String name, String pwd){
        if (registDao.queryName(name)){
            return 1;
        }else {
            registDao.addAdmin(name, pwd);
            return 0;
        }
    }

    public int addUser(String email, String uname, String pwd){

        if (registDao.queryEmail(email)){
            return 1;
        }else {
            registDao.addUser(email,uname,pwd);
            return 0;
        }

    }
}
