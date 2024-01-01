package com.renter.dao;

import com.renter.data.Admin;
import com.renter.data.User;
import org.apache.hadoop.hbase.*;
import org.apache.hadoop.hbase.client.*;
import org.apache.hadoop.hbase.util.Bytes;
import com.renter.util.HbaseUtil;

import java.io.IOException;

public class LoginDao {
    //管理员登录
    public  String queryAdmin(String name){
        Table table = HbaseUtil.getTable("HouseManager:admin");
        try {
            //指定rowkey，获取get对象
            System.out.println(name);
            Get get = new Get(Bytes.toBytes(name));
            boolean exists = table.exists(get);
            System.out.println(name);
            if(exists){
                String pwd = null;
                //调用get方法，获取结果集
                Result result = table.get(get);
                //获取结果集的扫描器，即迭代器
                CellScanner sc = result.cellScanner();
                while (sc.advance()) {
                    //取出当前单元格对象
                    Cell cell = sc.current();
                    pwd = Bytes.toString(CellUtil.cloneValue(cell));
                }
                return pwd;
            }else {
                return null;
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }

    public String queryUser(String email){
        Table table = HbaseUtil.getTable("HouseManager:user");
        try {
            //指定rowkey，获取get对象
            Get get = new Get(Bytes.toBytes(email));
            boolean exists = table.exists(get);
            if(exists){

                String pwd = null;
                //调用get方法，获取结果集
                Result result = table.get(get);
                //获取结果集的扫描器，即迭代器
                CellScanner sc = result.cellScanner();

                while (sc.advance()) {
                    //取出当前单元格对象
                    Cell cell = sc.current();
                    byte[] family = CellUtil.cloneFamily(cell);
                    byte[] qualifier = CellUtil.cloneQualifier(cell);
                    byte[] value = CellUtil.cloneValue(cell);
                    String column = Bytes.toString(family) + ":" + Bytes.toString(qualifier);
                    if(column.equals("info:passwd")){
                        pwd = Bytes.toString(value);
                    }
                }
                return pwd;
            }else {
                return null;
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }

    public User getUser(String email){
        Table table = HbaseUtil.getTable("HouseManager:user");
        try {
            //指定rowkey，获取get对象
            Get get = new Get(Bytes.toBytes(email));
            boolean exists = table.exists(get);
            if(exists){
                User loggedUser = new User();
                loggedUser.setEmail(email);
                //调用get方法，获取结果集
                Result result = table.get(get);
                //获取结果集的扫描器，即迭代器
                CellScanner sc = result.cellScanner();
                while (sc.advance()) {
                    Cell cell = sc.current();
                    byte[] family = CellUtil.cloneFamily(cell);
                    byte[] qualifier = CellUtil.cloneQualifier(cell);
                    byte[] value = CellUtil.cloneValue(cell);

                    String column = Bytes.toString(family) + ":" + Bytes.toString(qualifier);
                    if (column.equals("info:passwd")) {
                        loggedUser.setPasswd(Bytes.toString(value));
                    } else if (column.equals("info:uname")) {
                        loggedUser.setName(Bytes.toString(value));
                    }
                }
                return loggedUser;
            }else {
                return null;
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }
}
