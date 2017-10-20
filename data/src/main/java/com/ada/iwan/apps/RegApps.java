package com.ada.iwan.apps;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by cng19 on 2017/7/23.
 */
public class RegApps {
    public static void main(String[] args) {
        Pattern pattern = Pattern.compile("([^\\|;]*)(?=;)");
        Matcher matcher = pattern.matcher("1|14580358.15,5638357.67;14580358.15,5638357.67|14580358.15,5638357.67;");
        System.out.printf(matcher.group());

    }
}
