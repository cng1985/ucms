package com.haoxuer.ucms.service.ocr;

import com.baidu.aip.ocr.AipOcr;
import org.json.JSONObject;

import java.util.HashMap;

public class Apps {

  public static final String APP_ID = "11263289";
  public static final String API_KEY = "0IT3qnFGrbwl70CMuw9kdIj6";
  public static final String SECRET_KEY = "69hI44PhWj2wPj4HNu57FsYtvVFOjT7b";

  public static void main(String[] args) {
    // 初始化一个AipOcr
    AipOcr client = new AipOcr(APP_ID, API_KEY, SECRET_KEY);

    // 可选：设置网络连接参数
    client.setConnectionTimeoutInMillis(2000);
    client.setSocketTimeoutInMillis(60000);


    // 可选：设置log4j日志输出格式，若不设置，则使用默认配置
    // 也可以直接通过jvm启动参数设置此环境变量
    System.setProperty("aip.log4j.conf", "path/to/your/log4j.properties");

    // 调用接口
    String path = "D:\\证件\\timg.jpg";
    JSONObject res = client.businessCard(path, new HashMap<String, String>());
    System.out.println(res.toString(2));
    res= client.basicGeneralUrl("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1526734315012&di=e8a0939a11c7a1d463787d42c0fcffd7&imgtype=0&src=http%3A%2F%2Fpic20.nipic.com%2F20120414%2F9732420_110852529145_2.jpg",new HashMap<>());
    System.out.printf(res.toString());
  }
}
