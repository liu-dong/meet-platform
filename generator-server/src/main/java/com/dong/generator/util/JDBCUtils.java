package com.dong.generator.util;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;
import com.dong.generator.constant.DatabaseConstant;
import org.apache.commons.lang3.StringUtils;

import java.sql.*;
import java.util.Map;
import java.util.Properties;

/**
 * JDBC工具类
 *
 * @author LD
 */
public class JDBCUtils {


    /**
     * druid连接池
     */
    private static DruidDataSource dataSource;

    /**
     * 数据库连接
     */
    private static Connection conn;

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

    /**
     * 创建连接池
     *
     * @param url
     * @param username
     * @param password
     */
    public static void createConnectionPool(String url, String username, String password) {
        try {
            Map<String, String> properties = DatabaseConstant.DRUID_PROPERTIES;
            if (StringUtils.isNotBlank(url)) {
                properties.put("url", url);
            }
            if (StringUtils.isNotBlank(username)) {
                properties.put("username", username);
            }
            if (StringUtils.isNotBlank(password)) {
                properties.put("password", password);
            }
            dataSource = (DruidDataSource) DruidDataSourceFactory.createDataSource(properties);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    /**
     * 创建连接
     *
     * @param url
     * @param username
     * @param password
     */
    public static void createConnection(String url, String username, String password) {
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
    }

    /**
     * 获取连接
     *
     * @return
     */
    public static Connection getConnection() {
        if (conn == null) {
            try {
                conn = dataSource.getConnection();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return conn;
    }

    /**
     * 打开连接
     *
     * @return
     */
    public static void openConnection() {
        if (conn == null) {
            try {
                conn = dataSource.getConnection();

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
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
        } else if (o instanceof DruidDataSource) {
            DruidDataSource c = (DruidDataSource) o;
            if (!c.isClosed()) {
                c.close();
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
        close(dataSource);
    }
}
