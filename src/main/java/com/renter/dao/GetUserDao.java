package com.renter.dao;

import com.renter.data.Order;
import com.renter.data.User;
import com.renter.util.HbaseUtil;
import org.apache.hadoop.hbase.Cell;
import org.apache.hadoop.hbase.CellUtil;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class GetUserDao {
    public List<User> getUser() {
        List<User> userList = new ArrayList<>();
        Table table = HbaseUtil.getTable("HouseManager:user");
        try {
            ResultScanner scanner = table.getScanner(new Scan());
            for (Result result : scanner) {
                String email = Bytes.toString(result.getRow());
                String name = null;
                String passwd = null;
                String phone = null;
                String money = null;
                List<String> orderIds = null;

                for (Cell cell : result.listCells()) {
                    byte[] family = CellUtil.cloneFamily(cell);
                    byte[] qualifier = CellUtil.cloneQualifier(cell);
                    byte[] value = CellUtil.cloneValue(cell);
                    String column = Bytes.toString(family) + ":" + Bytes.toString(qualifier);

                    switch (column) {
                        case "info:uname":
                            name = Bytes.toString(value);
                            break;
                        case "info:passwd":
                            passwd = Bytes.toString(value);
                            break;
                        case "info:phone":
                            phone = Bytes.toString(value);
                            break;
                        case "info:money":
                            money = Bytes.toString(value);
                            break;
                        case "info:order_ids":
                            String orderIdsStr = Bytes.toString(value);
                            orderIds = Arrays.asList(orderIdsStr.split(","));
                            break;
                    }
                }

                User user = new User(email, name, passwd, phone, money, orderIds);
                System.out.println(user.getEmail());
                System.out.println(user.getName());
                System.out.println(user.getPasswd());
                userList.add(user);
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }

}
