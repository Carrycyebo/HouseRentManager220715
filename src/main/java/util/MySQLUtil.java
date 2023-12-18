package util;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import util.MySQLUtil;

public class MySQLUtil {
    private static final Properties props = new Properties();
    static {
        // 加载配置文件
        try {
            props.load(MySQLUtil.class.getResourceAsStream("db.properties"));
            // 加载驱动
            Class.forName(props.getProperty("driver"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private MySQLUtil() {
    }

    private static Connection getConn() throws Exception {
        Connection conn = null;
        conn = DriverManager.getConnection(props.getProperty("url"), props.getProperty("user"),
                props.getProperty("password"));
        return conn;
    }

    public static <T> List<T> query(String sql, Class<T> clazz, String... args) {
        List<T> results = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = getConn();
            ps = conn.prepareStatement(sql);
            if (args.length != 0) {
                for (int i = 1; i <= args.length; i++) {
                    ps.setObject(i, args[i - 1]);
                }
            }

            Constructor<T> cons = clazz.getConstructor();
            Field[] names = clazz.getDeclaredFields();
            rs = ps.executeQuery();
            while (rs.next()) {
                T obj = cons.newInstance();
                for (Field field : names) {
                    field.setAccessible(true);
                    field.set(obj, rs.getObject(field.getName()));
                }
                results.add(obj);
            }

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            close(conn, ps, rs);
        }
        return results;
    }

    public static boolean update(String sql, String... args) {
        int nums = 0;
        Connection connection = null;
        PreparedStatement pst = null;
        try {
            connection = getConn();
            pst = connection.prepareStatement(sql);
            // 设置占位符
            if (args.length != 0) {
                for (int i = 1; i <= args.length; i++) {
                    pst.setObject(i, args[i - 1]);
                }
            }
            nums = pst.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(connection, pst, null);
        }
        return nums>0;
    }

    public static void close(Connection conn, Statement pst, ResultSet res) {
        try {
            if (res != null) {
                res.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (pst != null) {
                pst.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
