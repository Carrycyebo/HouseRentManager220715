package dao;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.*;
import org.apache.hadoop.hbase.client.*;
import org.apache.hadoop.hbase.util.Bytes;
import util.HbaseUtil;

import java.io.IOException;

public class LoginDao {
    //管理员登录
    public  String queryUser(String name){
        Table table = HbaseUtil.getTable("HouseManager:admin");
        try {
            //指定rowkey，获取get对象
            Get get = new Get(Bytes.toBytes(name));
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
}
