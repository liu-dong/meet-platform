package com.dong.demo.es.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.DateFormat;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;

import java.util.Date;
import java.util.List;

/**
 * @author liudong
 * @date 2023/5/6
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Document(indexName = "student")
public class Student {

    @Id
    @Field(store = true, type = FieldType.Keyword)
    private String sId;

    @Field(store = true, type = FieldType.Keyword)
    private String sName;

    @Field(store = true, type = FieldType.Text, analyzer = "ik_smart")
    //Text可以分词 ik_smart=粗粒度分词 ik_max_word 为细粒度分词
    private String sAddress;

    @Field(index = false, store = true, type = FieldType.Integer)
    private Integer sAge;

    @Field(index = false, store = true, type = FieldType.Date, format = DateFormat.basic_date_time)
    private Date sCreateTime;

    @Field(type = FieldType.Keyword)
    private String[] sCourseList; //数组类型 由数组中第一个非空值决定(这里数组和集合一个意思了)

    @Field(type = FieldType.Keyword)
    private List<String> sColorList; //集合类型 由数组中第一个非空值决定
}
