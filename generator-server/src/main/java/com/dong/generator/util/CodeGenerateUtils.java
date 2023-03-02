package com.dong.generator.util;

import com.dong.commoncore.constant.SymbolConstant;
import com.dong.generator.web.model.dto.AttributeDTO;
import com.dong.generator.web.model.dto.CodeGenerateParamDTO;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;
import org.jetbrains.annotations.NotNull;
import org.springframework.util.CollectionUtils;

import java.io.*;
import java.nio.file.Files;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

/**
 * 代码生成主要方法
 *
 * @author LD
 */
public class CodeGenerateUtils {

    private static Connection conn;
    private static DatabaseMetaData meta;

    private static void openConnection() {
        try {
            if (conn == null || conn.isClosed()) {
                conn = JDBCUtils.getConnection();
                meta = conn.getMetaData();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * 生成代码文件
     *
     * @param map 元数据
     * @param dto 参数对象
     * @return 返回路径
     * @throws IOException       IO异常
     * @throws TemplateException 模板异常
     */
    public static String generate(Map<String, Object> map, CodeGenerateParamDTO dto) throws IOException, TemplateException {
        Configuration configuration = loadConfiguration();
        //获取模板
        Template template = configuration.getTemplate(dto.getTemplateName());
        //创建类文件
        File file = createJavaFile(dto);
        //创建Java文件的生成目录的输出流
        OutputStream outputStream = Files.newOutputStream(file.toPath());
        Writer writer = new OutputStreamWriter(outputStream);
        map.put("packageName", dto.getPackageName());
        //写入内容
        template.process(map, writer);
        outputStream.flush();
        outputStream.close();
        System.out.println("操作成功！");
        System.out.println("路径：" + file.getAbsolutePath());
        return file.getAbsolutePath();

    }

    /**
     * 创建Java文件
     *
     * @param dto
     * @return
     */
    @NotNull
    private static File createJavaFile(CodeGenerateParamDTO dto) {
        //生成文件目录
        String dirPath = dto.getGeneratePath() + SymbolConstant.BACKSLASH + dto.getPackageName().replace(SymbolConstant.DOT, SymbolConstant.BACKSLASH);
        File dir = new File(dirPath);
        //如果不存在目录，则创建
        if (!dir.exists()) {
            dir.mkdirs();
        }
        File file = new File(dir, dto.getFileName());
        //如果文件存在，则删除重新生成
        if (file.exists()) {
            file.delete();
        }
        return file;
    }

    /**
     * 加载配置
     *
     * @return
     * @throws IOException
     */
    @NotNull
    private static Configuration loadConfiguration() throws IOException {
        Configuration configuration = new Configuration(Configuration.VERSION_2_3_22);
        //classpath路径
        String classpath = Thread.currentThread().getContextClassLoader().getResource("").getPath();
        //模板路径
        String templatePath = classpath + "templates";
        configuration.setDirectoryForTemplateLoading(new File(templatePath));
        configuration.setDefaultEncoding("UTF-8");
        configuration.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
        return configuration;
    }

    /**
     * 批量生成代码
     *
     * @param dto 参数对象
     * @return 返回生成代码的路径
     * @throws Exception 异常
     */
    public static List<String> batchGenerate(CodeGenerateParamDTO dto) throws Exception {
        CodeGenerateUtils.openConnection();
        List<String> result = new ArrayList<>();
        if (CollectionUtils.isEmpty(dto.getTemplateNameList())) {
            return result;
        }
        String packageName = dto.getPackageName();
        //根据选择的模板循序生成所有代码
        for (String template : dto.getTemplateNameList()) {
            //生成包名
            dto.setPackageName(getPackageName(packageName, template));
            dto.setTemplateName(template);
            Set<Map.Entry<String, String>> entrySet = dto.getTableNameComment().entrySet();
            for (Map.Entry<String, String> entry : entrySet) {
                //获取类属性
                Map<String, Object> classProperty = getClassProperty(dto.getDatabaseName(), entry.getKey(), entry.getValue());
                //获取文件名
                String fileName = getFileName(entry.getKey(), template);
                dto.setFileName(fileName);
                //生成代码文件
                result.add(generate(classProperty, dto));
            }

        }
        return result;
    }

    /**
     * 根据表名和模板生成文件名
     *
     * @param tableName
     * @param templateName
     * @return
     */
    @NotNull
    private static String getFileName(String tableName, String templateName) {
        String fileName = toUpperCamel(tableName);
        fileName = fileName + byTemplateToClassName(templateName);
        return fileName;
    }

    /**
     * 根据模板生成包名
     *
     * @param packageName
     * @param template
     * @return
     */
    @NotNull
    private static String getPackageName(String packageName, String template) {
        return packageName + SymbolConstant.DOT + template.substring(0, template.lastIndexOf(SymbolConstant.DOT));
    }

    /**
     * 获取类属性（类名、类注释、作者、类属性）
     *
     * @param tableName 表名
     * @return 返回元数据
     * @throws Exception 异常
     */
    public static Map<String, Object> getClassProperty(String databaseName, String tableName, String classComment) throws Exception {
        Map<String, Object> result = new HashMap<>(4);
        result.put("className", toCamel(tableName));
        result.put("classComment", classComment);
        //获取电脑名称为创建人
        result.put("author", System.getenv().get("USERNAME"));
        List<String[]> tableColumnsInfo = DatabaseUtils.getTableColumnList(databaseName, tableName);
        List<AttributeDTO> attributeList = new ArrayList<>();
        for (String[] strings : tableColumnsInfo) {
            attributeList.add(new AttributeDTO(toCamel(strings[0]), convertDataType(strings[1]), strings[2]));
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
        if (!name.contains(SymbolConstant.UNDERLINE)) {
            // 不含下划线，仅将首字母小写
            return name;
        } else {
            String[] string = name.split(SymbolConstant.UNDERLINE);
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
     * 转为大驼峰（即首字母大写）
     *
     * @param name 名称
     * @return 返回转换后的字段名
     */
    public static String toUpperCamel(String name) {
        String result = CodeGenerateUtils.toCamel(name);
        return result.substring(0, 1).toUpperCase() + result.substring(1);
    }

    /**
     * 根据模板名字转类名
     *
     * @param templateName 模板名称
     * @return Java类名
     */
    public static String byTemplateToClassName(String templateName) {
        String result;
        String template = templateName.substring(0, templateName.lastIndexOf(SymbolConstant.DOT));
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
