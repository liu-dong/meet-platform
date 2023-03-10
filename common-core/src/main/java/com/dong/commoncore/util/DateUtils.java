package com.dong.commoncore.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Date;

/**
 * 时间格式转换
 *
 * @author liudong 2022/5/12
 */
public class DateUtils {

    public static Date formatDate(String date) throws ParseException {
        return formatDate(date, "yyyy-MM-dd HH:mm:ss");
    }

    public static Date formatDate(String date, String format) throws ParseException {
        DateFormat df = new SimpleDateFormat(format);
        return df.parse(date);
    }

    public static String dateToString(Date date) {
        return dateToString(date, "yyyy-MM-dd HH:mm:ss");
    }

    public static String dateToString(Date date, String format) {
        if (date == null) {
            return "";
        }
        DateFormat df = new SimpleDateFormat(format);
        return df.format(date);
    }

    /**
     * LocalDateTime 转 Date
     *
     * @param ldt
     * @return
     */
    public static Date toDate(LocalDateTime ldt) {
        ZonedDateTime zonedDateTime = ldt.atZone(ZoneId.systemDefault());
        Instant instant = zonedDateTime.toInstant();
        return Date.from(instant);
    }

    /**
     * Date 转 LocalDateTime
     *
     * @param date
     * @return
     */
    public static LocalDateTime toLocalDateTime(Date date) {
        Instant instant = date.toInstant();
        return LocalDateTime.ofInstant(instant, ZoneId.systemDefault());
    }
}
