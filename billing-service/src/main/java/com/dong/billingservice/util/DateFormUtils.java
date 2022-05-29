package com.dong.billingservice.util;

import com.alibaba.excel.util.StringUtils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 时间格式转换
 *
 * @author liudong 2022/5/12
 */
public class DateFormUtils {

    public static Date formatDate(String date) throws ParseException {
        return formatDate(date,"yyyy-MM-dd HH:mm:ss");
    }

    public static Date formatDate(String date,String format) throws ParseException {
        DateFormat df = new SimpleDateFormat(format);
        return df.parse(date);
    }

    public static String dateToString(Date date) throws ParseException {
        return dateToString(date,"yyyy-MM-dd HH:mm:ss");
    }

    public static String dateToString(Date date,String format) throws ParseException {
        if (date==null){
            return StringUtils.EMPTY;
        }
        DateFormat df = new SimpleDateFormat(format);
        return df.format(date);
    }
}
