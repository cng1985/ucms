package com.haoxuer.ucms.member.utils;

import org.springframework.util.StringUtils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

    public static String format(Date date){
        return format(date,"yyyy-MM-dd HH:mm");
    }
    public static String format(Date date,String str){
        String result="";
        try {
            SimpleDateFormat format=new SimpleDateFormat(str);
            result=format.format(date);
        }catch (Exception e){

        }
        return result;
    }
    public static String simple(Date date){
        return format(date,"yyyy-MM-dd");
    }
    public static String formatChines(Date date){
        return format(date,"yyyy年MM月dd HH:mm");
    }
}
