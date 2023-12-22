package services;

import dao.RegistDao;

public class RegisterService {
    private RegistDao registDao = new RegistDao();
    //用户注册
    public void addUser(String name, String uname, String pwd){


        registDao.addUser(name,uname,pwd);
    }
}
