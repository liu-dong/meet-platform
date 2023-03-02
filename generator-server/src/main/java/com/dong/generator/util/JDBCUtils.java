package com.dong.generator.util;

import java.sql.*;
import java.util.Properties;

/**
 * JDBC工具类
 *
 * @author LD
 */
public class JDBCUtils {

    private static Connection conn;
    private static DatabaseMetaData metaData;

    /**
     * 驱动
     */
    public static final String DRIVER = "com.mysql.jdbc.Driver";

    static {
        try {
            //初始化JDBC驱动并让驱动加载到jvm中
            Class.forName(DRIVER);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection createConnection(String url, String username, String password) {

        try {
            //连接数据库
            Properties props = new Properties();
            props.put("user", username);
            props.put("password", password);
            //设置连接属性,使得可获取到表的REMARK(备注)
            props.put("remarks", "true");
            props.put("useInformationSchema", "true");
            conn = DriverManager.getConnection(url, props);
            conn.setAutoCommit(true);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }

    public static Connection getConnection() {
        try {
            metaData = conn.getMetaData();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return conn;
    }

    public static DatabaseMetaData getMetaData() {

        return metaData;
    }

    /**
     * 关闭连接
     *
     * @param o
     */
    public static void close(Object o) {
        if (o == null) {
            return;
        }
        if (o instanceof ResultSet) {
            try {
                ((ResultSet) o).close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else if (o instanceof Statement) {
            try {
                ((Statement) o).close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else if (o instanceof Connection) {
            Connection c = (Connection) o;
            try {
                if (!c.isClosed()) {
                    c.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void close(ResultSet rs, Statement stmt, Connection conn) {
        close(rs);
        close(stmt);
        close(conn);
    }

    public static void close(ResultSet rs, Connection conn) {
        close(rs);
        close(conn);
    }

    public static void close() {
        close(conn);
    }
}
