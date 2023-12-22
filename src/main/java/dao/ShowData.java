package dao;

import data.User;
import org.apache.hadoop.hbase.Cell;
import org.apache.hadoop.hbase.CellUtil;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;
import util.HbaseUtil;

import java.util.ArrayList;
import java.util.List;

public class ShowData {
    //查所有result2表
    public List<User> selectData(){
        List<User> list = new ArrayList<User>();
        Table result2 = HbaseUtil.getTable("result2");
        try {
            ResultScanner scanner = result2.getScanner(new Scan());
            for (Result result : scanner) {
                while (result.advance()){
                    Cell cell = result.current();
                    //公司名称
                    String cname = Bytes.toString(CellUtil.cloneRow(cell));
                    //工资
                    double salary = Double.parseDouble(Bytes.toString(CellUtil.cloneValue(cell)));
                    User myData = new User(cname, salary);
                    list.add(myData);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return  list ;
    }
}
