package com.dong.generator.util;

import com.dong.commoncore.constant.SymbolConstant;
import com.dong.commoncore.exception.GlobalException;
import com.dong.commoncore.util.CommonUtils;
import com.dong.generator.web.model.dto.AttributeDTO;
import com.dong.generator.web.model.dto.CodeGenerateParamDTO;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;
import org.apache.commons.lang3.StringUtils;
import org.jetbrains.annotations.NotNull;
import org.springframework.util.CollectionUtils;

import java.io.*;
import java.nio.file.Files;
import java.sql.SQLException;
import java.util.*;

/**
 * 代码生成主要方法
 *
 * @author LD
 */
public class CodeGenerateUtils {

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
        File templateFile = getTemplateFile(dto.getTemplatePath());
        Configuration configuration = loadConfiguration(templateFile);
        //获取模板
        Template template = configuration.getTemplate(dto.getTemplateName());
        //创建类文件
        File file = createJavaFile(dto);
        //创建Java文件的生成目录的输出流
        OutputStream outputStream = Files.newOutputStream(file.toPath());
        Writer writer = new OutputStreamWriter(outputStream);
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
     * @param templateFile 模板文件
     * @return
     * @throws IOException
     */
    @NotNull
    private static Configuration loadConfiguration(File templateFile) throws IOException {
        Configuration configuration = new Configuration(Configuration.VERSION_2_3_22);
        configuration.setDirectoryForTemplateLoading(templateFile);
        configuration.setDefaultEncoding("UTF-8");
        configuration.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
        return configuration;
    }

    /**
     * 获取模板文件
     *
     * @param templatePath
     * @return
     */
    @NotNull
    private static File getTemplateFile(String templatePath) {
        //classpath路径
        String classpath = Thread.currentThread().getContextClassLoader().getResource("").getPath();
        //模板路径
        if (StringUtils.isNotBlank(templatePath)) {
            templatePath = classpath + templatePath;
        } else {
            templatePath = classpath + "templates";
        }
        return new File(templatePath);
    }

    /**
     * 批量生成代码
     *
     * @param dto 参数对象
     * @return 返回生成代码的路径
     * @throws Exception 异常
     */
    public static List<String> batchGenerate(CodeGenerateParamDTO dto) throws Exception {
        List<String> result = new ArrayList<>();
        if (CollectionUtils.isEmpty(dto.getTemplateNameList())) {
            throw new GlobalException("代码模板不能为空！");
        }
        String packageName = dto.getPackageName();
        //根据选择的模板循序生成所有代码
        for (String template : dto.getTemplateNameList()) {
            //生成包名
            dto.setPackageName(getPackageName(packageName, template));
            dto.setTemplateName(template);
            Set<Map.Entry<String, String>> entrySet = dto.getTableNameComment().entrySet();
            for (Map.Entry<String, String> entry : entrySet) {
                //获取类成员属性
                String tableName = entry.getKey();
                List<AttributeDTO> attributeList = getColumnList(dto.getDatabaseName(), tableName);
                String className = tableName;
                //忽略表名前缀
                if (StringUtils.isNotBlank(dto.getIgnorePrefix())) {
                    className = tableName.replace(dto.getIgnorePrefix(), "");
                }
                //获取类属性
                Map<String, Object> classProperty = buildClassProperty(dto.getPackageName(), packageName, attributeList, tableName, className, entry.getValue());
                //获取文件名
                String fileName = getFileName(className, template);
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
        String fileName = CommonUtils.toUpperCamel(tableName);
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
        template = template.replace("list.", "");
        return packageName + SymbolConstant.DOT + template.substring(0, template.lastIndexOf(SymbolConstant.DOT));
    }

    /**
     * 构建类属性（类名、类注释、作者、类属性）
     *
     * @param packageName     包名
     * @param basePackageName 基础包名
     * @param attributeList   表字段属性
     * @param tableName       表名
     * @param className       类名
     * @param classComment    类注释
     * @return
     */
    public static Map<String, Object> buildClassProperty(String packageName, String basePackageName, List<AttributeDTO> attributeList, String tableName, String className, String classComment) {
        Map<String, Object> result = new HashMap<>(4);
        result.put("packageName", packageName);
        result.put("basePackageName", basePackageName);
        result.put("tableName", tableName);
        result.put("className", CommonUtils.toCamel(className));
        result.put("serialUID", genSerialID());
        result.put("classComment", classComment);
        //获取电脑名称为创建人
        result.put("author", System.getenv().get("USERNAME"));
        result.put("propertyList", attributeList);
        return result;
    }

    /**
     * 获取类成员属性
     *
     * @param databaseName
     * @param tableName
     * @return
     * @throws SQLException
     */
    @NotNull
    private static List<AttributeDTO> getColumnList(String databaseName, String tableName) throws SQLException {
        List<String[]> tableColumnsInfo = DatabaseUtils.getTableColumnList(databaseName, tableName);
        List<AttributeDTO> attributeList = new ArrayList<>();
        for (String[] strings : tableColumnsInfo) {
            attributeList.add(new AttributeDTO(strings[0], CommonUtils.toCamel(strings[0]), convertDataType(strings[1]), strings[2]));
        }
        return attributeList;
    }

    private static Object genSerialID() {
        return Math.abs(new Random().nextLong()) + "L;";
    }

    /**
     * 转换数据类型
     *
     * @param dataType 数据类型
     * @return 返回转换后的数据类型
     */
    public static String convertDataType(String dataType) {
        Map<String, String> dataTypeMap = new HashMap<>();
        dataTypeMap.put("VARCHAR", "String");
        dataTypeMap.put("BIGINT", "Long");
        dataTypeMap.put("INT", "Integer");
        dataTypeMap.put("SMALLINT", "Short");
        dataTypeMap.put("DATETIME", "Date");
        dataTypeMap.put("DATE", "Date");
        dataTypeMap.put("DECIMAL", "BigDecimal");
        String result = dataTypeMap.get(dataType);
        if (StringUtils.isBlank(result)) {
            result = "Object";
        }
        return result;
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
            case "entity":
                result = ".java";
                break;
            case "model.dto":
                result = "DTO.java";
                break;
            case "model.vo":
                result = "VO.java";
                break;
            case "model.list.dto":
                result = "ListDTO.java";
                break;
            case "model.list.vo":
                result = "ListVO.java";
                break;
            case "service.impl":
                result = "ServiceImpl.java";
                break;
            case "dao":
            case "repository":
                result = "Repository.java";
                break;
            default:
                result = template.substring(0, 1).toUpperCase() + template.substring(1) + ".java";
                break;
        }
        return result;
    }
}
