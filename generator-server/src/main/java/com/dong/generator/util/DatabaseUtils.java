package com.dong.generator.util;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author liudong
 * @date 2023/3/2
 */
public class DatabaseUtils {


    public static void main(String[] args) {
//        getDataBaseInfo();  //获取数据库信息
//        getSchemasInfo(); //获取数据库所有Schema
//        getCatalogList(); //获取数据库所有Catalog
//        getTableList("my_data");  //获取某用户下所有的表
        getTablesInfo();  //获取表信息
//        getPrimaryKeysInfo(); //获取表主键信息
//        getIndexInfo();  //获取表索引信息
        getColumnsInfo(); //获取表中列值信息
    }

    /**
     * 获取数据库相关信息
     */
    public static void getDataBaseInfo() {
        System.out.println("=========================获取数据库相关信息=========================");
        Connection conn = JDBCUtils.getConnection();
        ResultSet rs = null;
        try {
            DatabaseMetaData metaData = conn.getMetaData();
            System.out.println("数据库已知的用户: " + metaData.getUserName());
            System.out.println("数据库的系统函数的逗号分隔列表: " + metaData.getSystemFunctions());
            System.out.println("数据库的时间和日期函数的逗号分隔列表: " + metaData.getTimeDateFunctions());
            System.out.println("数据库的字符串函数的逗号分隔列表: " + metaData.getStringFunctions());
            System.out.println("数据库供应商用于 'schema' 的首选术语: " + metaData.getSchemaTerm());
            System.out.println("数据库URL: " + metaData.getURL());
            System.out.println("是否允许只读:" + metaData.isReadOnly());
            System.out.println("数据库的产品名称:" + metaData.getDatabaseProductName());
            System.out.println("数据库的版本:" + metaData.getDatabaseProductVersion());
            System.out.println("驱动程序的名称:" + metaData.getDriverName());
            System.out.println("驱动程序的版本:" + metaData.getDriverVersion());
            System.out.println("数据库列表:" + metaData.getCatalogs());
            System.out.print("数据库中使用的表类型：");

            rs = metaData.getTableTypes();
            while (rs.next()) {
                System.out.print(rs.getString("TABLE_TYPE") + "、");
            }
            System.out.println();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(rs, conn);
        }

        System.out.println("=========================获取数据库相关信息=========================");
    }

    /**
     * 获得数据库中所有Schemas(对应于oracle中的Tablespace)
     */
    public static void getSchemasInfo() {
        System.out.println("=========================获得数据库中所有Schemas=========================");
        Connection conn = JDBCUtils.getConnection();
        ResultSet rs = null;
        try {
            DatabaseMetaData metaData = conn.getMetaData();
            rs = metaData.getSchemas();
            while (rs.next()) {
                String tableSchema = rs.getString("TABLE_SCHEMA");
                System.out.println(tableSchema);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(rs, conn);
        }
        System.out.println("=========================获得数据库中所有Schemas=========================");
    }

    /**
     * 获得数据库中所有Catalogs(即数据库名)
     */
    public static List<String> getCatalogList() {
        List<String> result = new ArrayList<>();
        Connection conn = JDBCUtils.getConnection();
        ResultSet rs = null;
        try {
            DatabaseMetaData metaData = conn.getMetaData();
            rs = metaData.getCatalogs();
            while (rs.next()) {
                String catalog = rs.getString(1);
                System.out.println(catalog);
                result.add(catalog);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(rs);
        }
        return result;
    }

    /**
     * 获取指定数据库中所有的表信息
     */
    public static List<Map<String, String>> getTableList(String databaseName) {
        List<Map<String, String>> result = new ArrayList<>();
        Connection conn = JDBCUtils.getConnection();
        ResultSet rs = null;
        try {
            DatabaseMetaData metaData = conn.getMetaData();
            String[] types = {"TABLE", "VIEW"};
            rs = metaData.getTables(databaseName, null, "%", types);
            while (rs.next()) {
                Map<String, String> map = new HashMap<>();
                //表名
                String tableName = rs.getString("TABLE_NAME");
                //表类型
                String tableType = rs.getString("TABLE_TYPE");
                //表备注
                String remarks = rs.getString("REMARKS");
                map.put("tableName", tableName);
                map.put("tableComment", remarks);
                map.put("tableType", tableType);
                result.add(map);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(rs);
        }
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
    public static List<String[]> getTableColumnList(String databaseName, String tableName) throws SQLException {
        Connection conn = JDBCUtils.getConnection();
        DatabaseMetaData metaData = conn.getMetaData();
        ResultSet rs = metaData.getColumns(databaseName, "%", tableName, "%");
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
     * 获取某表信息
     */
    public static void getTablesInfo() {
        ResultSet rs = null;
        Connection conn = JDBCUtils.getConnection();
        try {
            DatabaseMetaData metaData = conn.getMetaData();
            /**
             * 获取给定类别中使用的表的描述。
             * 方法原型:ResultSet getTables(String catalog,String schemaPattern,String tableNamePattern,String[] types);
             * catalog - 表所在的类别名称;""表示获取没有类别的列,null表示获取所有类别的列。
             * schema - 表所在的模式名称(oracle中对应于Tablespace);""表示获取没有模式的列,null标识获取所有模式的列; 可包含单字符通配符("_"),或多字符通配符("%");
             * tableNamePattern - 表名称;可包含单字符通配符("_"),或多字符通配符("%");
             * types - 表类型数组; "TABLE"、"VIEW"、"SYSTEM TABLE"、"GLOBAL TEMPORARY"、"LOCAL TEMPORARY"、"ALIAS" 和 "SYNONYM";null表示包含所有的表类型;可包含单字符通配符("_"),或多字符通配符("%");
             */
            rs = metaData.getTables("meet_chat", null, "group_chat", new String[]{"TABLE", "VIEW"});
            while (rs.next()) {
                String tableCat = rs.getString("TABLE_CAT");  //表类别(可为null)
                String tableSchemaName = rs.getString("TABLE_SCHEM");//表模式（可能为空）,在oracle中获取的是命名空间,其它数据库未知
                String tableName = rs.getString("TABLE_NAME");  //表名
                String tableType = rs.getString("TABLE_TYPE");  //表类型,典型的类型是 "TABLE"、"VIEW"、"SYSTEM TABLE"、"GLOBAL TEMPORARY"、"LOCAL TEMPORARY"、"ALIAS" 和 "SYNONYM"。
                String remarks = rs.getString("REMARKS");       //表备注

                System.out.println(tableCat + " - " + tableSchemaName + " - " + tableName + " - " + tableType + " - " + remarks);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            JDBCUtils.close(rs);
        }
    }

    /**
     * 获取表主键信息
     */
    public static void getPrimaryKeysInfo() {
        Connection conn = JDBCUtils.getConnection();
        ResultSet rs = null;
        try {
            DatabaseMetaData metaData = conn.getMetaData();
            /**
             * 获取对给定表的主键列的描述
             * 方法原型:ResultSet getPrimaryKeys(String catalog,String schema,String table);
             * catalog - 表所在的类别名称;""表示获取没有类别的列,null表示获取所有类别的列。
             * schema - 表所在的模式名称(oracle中对应于Tablespace);""表示获取没有模式的列,null标识获取所有模式的列; 可包含单字符通配符("_"),或多字符通配符("%");
             * table - 表名称;可包含单字符通配符("_"),或多字符通配符("%");
             */
            rs = metaData.getPrimaryKeys(null, null, "group_chat");

            while (rs.next()) {
                String tableCat = rs.getString("TABLE_CAT");  //表类别(可为null)
                String tableSchemaName = rs.getString("TABLE_SCHEM");//表模式（可能为空）,在oracle中获取的是命名空间,其它数据库未知
                String tableName = rs.getString("TABLE_NAME");  //表名
                String columnName = rs.getString("COLUMN_NAME");//列名
                short keySeq = rs.getShort("KEY_SEQ");//序列号(主键内值1表示第一列的主键，值2代表主键内的第二列)
                String pkName = rs.getString("PK_NAME"); //主键名称

                System.out.println(tableCat + " - " + tableSchemaName + " - " + tableName + " - " + columnName + " - " + keySeq + " - " + pkName);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(rs, conn);
        }
    }

    /**
     * 获取表索引信息
     */
    public static void getIndexInfo() {
        Connection conn = JDBCUtils.getConnection();
        ResultSet rs = null;
        try {
            DatabaseMetaData metaData = conn.getMetaData();
            /**
             * 获取给定表的索引和统计信息的描述
             * 方法原型:ResultSet getIndexInfo(String catalog,String schema,String table,boolean unique,boolean approximate)
             * catalog - 表所在的类别名称;""表示获取没有类别的列,null表示获取所有类别的列。
             * schema - 表所在的模式名称(oracle中对应于Tablespace);""表示获取没有模式的列,null标识获取所有模式的列; 可包含单字符通配符("_"),或多字符通配符("%");
             * table - 表名称;可包含单字符通配符("_"),或多字符通配符("%");
             * unique - 该参数为 true时,仅返回唯一值的索引; 该参数为 false时,返回所有索引;
             * approximate - 该参数为true时,允许结果是接近的数据值或这些数据值以外的值;该参数为 false时,要求结果是精确结果;
             */
            rs = metaData.getIndexInfo(null, null, "CUST_INTER_TF_SERVICE_REQ", false, true);
            while (rs.next()) {
                String tableCat = rs.getString("TABLE_CAT");  //表类别(可为null)
                String tableSchemaName = rs.getString("TABLE_SCHEM");//表模式（可能为空）,在oracle中获取的是命名空间,其它数据库未知
                String tableName = rs.getString("TABLE_NAME");  //表名
                boolean nonUnique = rs.getBoolean("NON_UNIQUE");// 索引值是否可以不唯一,TYPE为 tableIndexStatistic时索引值为 false;
                String indexQualifier = rs.getString("INDEX_QUALIFIER");//索引类别（可能为空）,TYPE为 tableIndexStatistic 时索引类别为 null;
                String indexName = rs.getString("INDEX_NAME");//索引的名称 ;TYPE为 tableIndexStatistic 时索引名称为 null;
                /**
                 * 索引类型：
                 *  tableIndexStatistic - 此标识与表的索引描述一起返回的表统计信息
                 *  tableIndexClustered - 此为集群索引
                 *  tableIndexHashed - 此为散列索引
                 *  tableIndexOther - 此为某种其他样式的索引
                 */
                short type = rs.getShort("TYPE");//索引类型;
                short ordinalPosition = rs.getShort("ORDINAL_POSITION");//在索引列顺序号;TYPE为 tableIndexStatistic 时该序列号为零;
                String columnName = rs.getString("COLUMN_NAME");//列名;TYPE为 tableIndexStatistic时列名称为 null;
                String ascOrDesc = rs.getString("ASC_OR_DESC");//列排序顺序:升序还是降序[A:升序; B:降序];如果排序序列不受支持,可能为 null;TYPE为 tableIndexStatistic时排序序列为 null;
                int cardinality = rs.getInt("CARDINALITY");   //基数;TYPE为 tableIndexStatistic 时,它是表中的行数;否则,它是索引中唯一值的数量。
                int pages = rs.getInt("PAGES"); //TYPE为 tableIndexStatisic时,它是用于表的页数,否则它是用于当前索引的页数。
                String filterCondition = rs.getString("FILTER_CONDITION"); //过滤器条件,如果有的话(可能为 null)。

                System.out.println(tableCat + " - " + tableSchemaName + " - " + tableName + " - " + nonUnique + " - " + indexQualifier + " - " + indexName + " - " + type + " - " + ordinalPosition + " - " + columnName + " - " + ascOrDesc + " - " + cardinality + " - " + pages + " - " + filterCondition);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(rs, conn);
        }
    }


    /**
     * 获取表中列值信息
     */
    @SuppressWarnings("AlibabaLowerCamelCaseVariableNaming")
    public static void getColumnsInfo() {
        System.out.println("=========================获取表中列值信息=========================");
        Connection conn = JDBCUtils.getConnection();
        ResultSet rs = null;

        try {
            /**
             * 设置连接属性,使得可获取到列的REMARK(备注)
             */
//            ((OracleConnection) conn).setRemarksReporting(true);
            DatabaseMetaData metaData = conn.getMetaData();
            /**
             * 获取可在指定类别中使用的表列的描述。
             * 方法原型:ResultSet getColumns(String catalog,String schemaPattern,String tableNamePattern,String columnNamePattern)
             * catalog - 表所在的类别名称;""表示获取没有类别的列,null表示获取所有类别的列。
             * schema - 表所在的模式名称(oracle中对应于Tablespace);""表示获取没有模式的列,null标识获取所有模式的列; 可包含单字符通配符("_"),或多字符通配符("%");
             * tableNamePattern - 表名称;可包含单字符通配符("_"),或多字符通配符("%");
             * columnNamePattern - 列名称; ""表示获取列名为""的列(当然获取不到);null表示获取所有的列;可包含单字符通配符("_"),或多字符通配符("%");
             */
            rs = metaData.getColumns(null, null, "group_chat", null);

            while (rs.next()) {
                String tableCat = rs.getString("TABLE_CAT");  //表类别（可能为空）
                String tableSchemaName = rs.getString("TABLE_SCHEM");  //表模式（可能为空）,在oracle中获取的是命名空间,其它数据库未知
                String tableName_ = rs.getString("TABLE_NAME");  //表名
                String columnName = rs.getString("COLUMN_NAME");  //列名
                int dataType = rs.getInt("DATA_TYPE");     //对应的java.sql.Types的SQL类型(列类型ID)
                String dataTypeName = rs.getString("TYPE_NAME");  //java.sql.Types类型名称(列类型名称)
                int columnSize = rs.getInt("COLUMN_SIZE");  //列大小
                int decimalDigits = rs.getInt("DECIMAL_DIGITS");  //小数位数
                int numPrecRadix = rs.getInt("NUM_PREC_RADIX");  //基数（通常是10或2） --未知
                /**
                 *  0 (columnNoNulls) - 该列不允许为空
                 *  1 (columnNullable) - 该列允许为空
                 *  2 (columnNullableUnknown) - 不确定该列是否为空
                 */
                int nullAble = rs.getInt("NULLABLE");  //是否允许为null
                String remarks = rs.getString("REMARKS");  //列描述
                String columnDef = rs.getString("COLUMN_DEF");  //默认值
                int charOctetLength = rs.getInt("CHAR_OCTET_LENGTH");    // 对于 char 类型，该长度是列中的最大字节数
                int ordinalPosition = rs.getInt("ORDINAL_POSITION");   //表中列的索引（从1开始）
                /**
                 * ISO规则用来确定某一列的是否可为空(等同于NULLABLE的值:[ 0:'YES'; 1:'NO'; 2:''; ])
                 * YES -- 该列可以有空值;
                 * NO -- 该列不能为空;
                 * 空字符串--- 不知道该列是否可为空
                 */
                String isNullAble = rs.getString("IS_NULLABLE");

                /**
                 * 指示此列是否是自动递增
                 * YES -- 该列是自动递增的
                 * NO -- 该列不是自动递增
                 * 空字串--- 不能确定该列是否自动递增
                 */
                //String isAutoincrement = rs.getString("IS_AUTOINCREMENT");   //该参数测试报错


                System.out.println(tableCat + " - " + tableSchemaName + " - " + tableName_ + " - " + columnName + " - " + dataType + " - " + dataTypeName + " - " + columnSize + " - " + decimalDigits + " - " + numPrecRadix + " - " + nullAble + " - " + remarks + " - " + columnDef + " - " + charOctetLength + " - " + ordinalPosition + " - " + isNullAble);

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            JDBCUtils.close(rs, conn);
        }
        System.out.println("=========================获取表中列值信息=========================");
    }
}
