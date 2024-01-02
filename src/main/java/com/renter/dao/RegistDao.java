package com.renter.dao;

import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;
import com.renter.util.HbaseUtil;

import java.io.IOException;

public class RegistDao {
    //用户注册
    public void addAdmin(String name, String passwd){
        try {
            Table table = HbaseUtil.getTable("HouseManager:admin");
            Put put1 = new Put(Bytes.toBytes(name));
            put1.addColumn(Bytes.toBytes("info"),Bytes.toBytes("passwd"),Bytes.toBytes(passwd));
            table.put(put1);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void addUser(String email ,String uname,String passwd){
        try {
            Table table = HbaseUtil.getTable("HouseManager:user");
            Put put2 = new Put(Bytes.toBytes(email));
            put2.addColumn(Bytes.toBytes("info"),Bytes.toBytes("uname"),Bytes.toBytes(uname));
            put2.addColumn(Bytes.toBytes("info"),Bytes.toBytes("passwd"),Bytes.toBytes(passwd));
            put2.addColumn(Bytes.toBytes("info"),Bytes.toBytes("phone"),Bytes.toBytes(""));
            put2.addColumn(Bytes.toBytes("info"),Bytes.toBytes("money"),Bytes.toBytes("0"));
            put2.addColumn(Bytes.toBytes("info"),Bytes.toBytes("orderIds"),Bytes.toBytes("null"));
            table.put(put2);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public boolean queryEmail(String email) {
        Table table = HbaseUtil.getTable("HouseManager:user");
        boolean exists;
        Get get = new Get(Bytes.toBytes(email));
        try {
            exists = table.exists(get);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return exists;
    }

    public boolean queryName(String name) {
        Table table = HbaseUtil.getTable("HouseManager:admin");
        boolean exists;
        Get get = new Get(Bytes.toBytes(name));
        try {
            exists = table.exists(get);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return exists;
    }
}
