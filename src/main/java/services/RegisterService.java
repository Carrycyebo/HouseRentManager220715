package services;

import dao.RegistDao;

public class RegisterService {
    private RegistDao registDao = new RegistDao();
    //用户注册
    public void addUser(String name, String uname, String pwd){
        //业务逻辑判断
        //1、判断用户名是否存在  通过get查询

        //2、如果用户名不存在，才可以存储数据
        registDao.addUser(name,uname,pwd);
    }
}
