package com.dong.generator.util;

import com.dong.generator.web.model.AttributeBean;
import com.dong.generator.web.model.GenerateParamInfoBean;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 代码生成主要方法
 *
 * @author LD
 */
public class CodeGenerateUtils {

    private static Connection conn;
    private static DatabaseMetaData meta;

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("数据库连接失败！");
        }
    }

    /**
     * 连接数据库
     *
     * @param url      数据库地址
     * @param user     用户名
     * @param password 密码
     */
    public static void openConnection(String url, String user, String password) {
        try {
            if (conn == null || conn.isClosed()) {
                conn = DriverManager.getConnection(url, user, password);
                meta = conn.getMetaData();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static void openConnection() {
        try {
            if (conn == null || conn.isClosed()) {
//                conn = DriverManager.getConnection(JDBCUtils.URL, JDBCUtils.USER, JDBCUtils.PASSWORD);
                conn = JDBCUtils.getConnection();
                meta = conn.getMetaData();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * 生成代码
     *
     * @param map  元数据
     * @param bean 参数对象
     * @return 返回路径
     * @throws IOException       IO异常
     * @throws TemplateException 模板异常
     */
    public static String generate(Map<String, Object> map, GenerateParamInfoBean bean) throws IOException, TemplateException {
        Configuration configuration = new Configuration(Configuration.VERSION_2_3_22);
        configuration.setDirectoryForTemplateLoading(new File("generator-server\\src\\main\\resources\\templates"));
        configuration.setDefaultEncoding("UTF-8");
        configuration.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
        Template template = configuration.getTemplate(bean.getTemplate());
        File dir = new File(bean.getGeneratePath() + "\\" + bean.getPackageName().replace(".", "\\"));
        if (!dir.exists()) {//如果不存在目录，则创建
            dir.mkdirs();
        }
        File file = new File(dir, bean.getFileName());
        if (file.exists()) {//如果文件存在，则删除重新生成
            file.delete();
        }
        OutputStream outputStream = new FileOutputStream(file); //java文件的生成目录
        Writer out = new OutputStreamWriter(outputStream);
        map.put("packageName", bean.getPackageName());
        template.process(map, out);
        outputStream.flush();
        outputStream.close();
        System.out.println("操作成功！");
        System.out.println("路径：" + dir.getAbsolutePath());
        return dir.getAbsolutePath();

    }

    /**
     * 批量生成代码
     *
     * @param bean 参数对象
     * @return 返回生成代码的路径
     * @throws Exception 异常
     */
    public static List<String> batchGenerate(GenerateParamInfoBean bean) throws Exception {
        CodeGenerateUtils.openConnection();
        List<String> result = new ArrayList<>();
        if (bean.getTemplateName() == null) {
            return result;
        }
        String packageName = bean.getPackageName();
        for (String template : bean.getTemplateName()) {//根据选择的模板循序生成所有代码
            bean.setPackageName(packageName + "." + template.substring(0, template.lastIndexOf(".")));
            bean.setTemplate(template);
            //获取元数据
            for (int i = 0; i < bean.getTableName().size(); i++) {
                Map<String, Object> data = getData(bean.getTableName().get(i), bean.getClassAnnotation().get(i));
                String fileName = toCamel(bean.getTableName().get(i));
                fileName = fileName.substring(0, 1).toUpperCase() + fileName.substring(1) + byTemplateToClassName(template);
                bean.setFileName(fileName);//文件名转成驼峰
                result.add(generate(data, bean));
            }
        }
//        conn.close();
        return result;
    }

    /**
     * 获取数据表的列信息
     *
     * @param databaseName 库名
     * @param tableName    表名
     * @return 返回字段信息，列信息数组的集合。List中每个元素是一个数组，代表一个列的信息；
     * 每个数组的元素1是列名，元素2是注释，元素3是类型
     */
    public static List<String[]> getTableColumnsInfo(String databaseName, String tableName) throws SQLException {
        ResultSet rs = meta.getColumns(databaseName, "%", tableName, "%");
        List<String[]> columnInfoList = new ArrayList<>();
        while (rs.next()) {
            String[] colInfo = new String[3];
            colInfo[0] = rs.getString("COLUMN_NAME");
            colInfo[1] = rs.getString("TYPE_NAME");
            colInfo[2] = rs.getString("REMARKS");
            columnInfoList.add(colInfo);
        }
        return columnInfoList;
    }

    /**
     * 获取数据
     *
     * @param tableName 表名
     * @return 返回元数据
     * @throws Exception 异常
     */
    public static Map<String, Object> getData(String tableName, String classAnnotation) throws Exception {
        Map<String, Object> result = new HashMap<>();
        result.put("className", toCamel(tableName));
        result.put("classAnnotation", classAnnotation);
        result.put("author", System.getenv().get("USERNAME"));//获取电脑名称为创建人
        List<String[]> tableColumnsInfo = getTableColumnsInfo("meet_chat", tableName);
        List<AttributeBean> attributeList = new ArrayList<>();
        for (String[] strings : tableColumnsInfo) {
            attributeList.add(new AttributeBean(toCamel(strings[0]), convertDataType(strings[1]), strings[2]));
        }
        result.put("propertyList", attributeList);
        return result;
    }

    /**
     * 转换数据类型
     *
     * @param dataType 数据类型
     * @return 返回转换后的数据类型
     */
    public static String convertDataType(String dataType) {
        String result;
        switch (dataType) {
            case "VARCHAR":
                result = "String";
                break;
            case "BIGINT":
                result = "Long";
                break;
            case "INT":
                result = "Integer";
                break;
            case "SMALLINT":
                result = "Short";
                break;
            case "DATETIME":
                result = "Date";
                break;
            case "DECIMAL":
                result = "BigDecimal";
                break;
            default:
                result = "Object";
                break;
        }
        return result;
    }

    /**
     * 转为驼峰
     *
     * @param name 名称
     * @return 返回转换后的字段名
     */
    public static String toCamel(String name) {
        StringBuilder result = new StringBuilder();
        name = name.toLowerCase();
        if (!name.contains("_")) {
            // 不含下划线，仅将首字母小写
            return name;
        } else {
            String[] string = name.split("_");
            for (int i = 0; i < string.length; i++) {
                if (i > 0) {
                    string[i] = string[i].substring(0, 1).toUpperCase() + string[i].substring(1);
                }
                result.append(string[i]);
            }
        }
        return result.toString();
    }

    /**
     * 根据模板名字转类名
     *
     * @param templateName 模板名称
     * @return Java类名
     */
    public static String byTemplateToClassName(String templateName) {
        String result;
        String template = templateName.substring(0, templateName.lastIndexOf("."));
        switch (template) {
            case "model":
                result = "DTO.java";
                break;
            case "service.impl":
                result = "ServiceImpl.java";
                break;
            case "dao":
                result = "JpaDao.java";
                break;
            default:
                result = template.substring(0, 1).toUpperCase() + template.substring(1) + ".java";
                break;
        }
        return result;
    }
}
