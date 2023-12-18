package util;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Table;

import java.io.IOException;

public class HbaseUtil {
    static Configuration conf = HBaseConfiguration.create();
    static Connection conn = null;
    static Table table = null ;

    static {
        try {
            conn = ConnectionFactory.createConnection(conf);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    //获取Table对象
    public static Table getTable(String tablename){
        try {
            TableName user = TableName.valueOf(tablename);
            if (conn!= null){
                table = conn.getTable(user);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return table ;
    }

    public static  void close(){
        try {
            if (table != null){
                table.close();
            }
            if (conn != null){
                conn.close();
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
