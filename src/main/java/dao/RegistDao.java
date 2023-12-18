package dao;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;
import util.HbaseUtil;

public class RegistDao {
    //用户注册
    public void addUser(String name ,String pwd){
        try {
            Table table = HbaseUtil.getTable("user");
            Put put1 = new Put(Bytes.toBytes(name));
            put1.addColumn(Bytes.toBytes("info"),Bytes.toBytes("name"),Bytes.toBytes(name));
            put1.addColumn(Bytes.toBytes("info"),Bytes.toBytes("pwd"),Bytes.toBytes(pwd));
            table.put(put1);
            table.close();
            HbaseUtil.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
