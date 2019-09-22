package com.haoxuer.ucms.service.stock.api.impl;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.haoxuer.ucms.service.stock.api.StockApi;
import com.haoxuer.ucms.service.stock.domain.StockDetailBack;
import com.haoxuer.ucms.service.stock.domain.StockInfo;
import com.haoxuer.ucms.service.stock.domain.StockTimePrice;
import com.haoxuer.ucms.service.factory.JsonFactory;
import com.haoxuer.ucms.service.stock.domain.StockListBack;

import java.util.ArrayList;
import java.util.List;
import jodd.http.HttpRequest;
import jodd.http.HttpResponse;
import jodd.util.StringUtil;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class StockListApiImpl implements StockApi {
  
  public StockListBack findStcokList(int page, int rows) {
    // TODO Auto-generated method stub
    String url = "http://apis.baidu.com/tehir/stockassistant/stocklist";
    HttpRequest request = HttpRequest.get(url);
    request.header("apikey", "93dc6d5e4999b89fd5dcaa6e8b52ead8");
    request.query("page", page);
    request.query("rows", rows);
    
    String body = request.send().body();
    body = StringUtil.convertCharset(body, "ISO-8859-1", "UTF-8");
    JsonFactory jf = new JsonFactory();
    Gson son = jf.gson();
    StockListBack result = son.fromJson(body, StockListBack.class);
    
    return result;
  }
  
  public StockDetailBack findByCode(String code) {
    String url = "http://apis.baidu.com/apistore/stockservice/stock";
    HttpRequest request = HttpRequest.get(url);
    request.header("apikey", "93dc6d5e4999b89fd5dcaa6e8b52ead8");
    if (code.startsWith("6")) {
      request.query("stockid", "sh" + code);
    } else if (code.startsWith("3")) {
      request.query("stockid", "sz" + code);
    } else if (code.startsWith("0")) {
      request.query("stockid", "sz" + code);
    }
    request.query("list", "其它");
    
    String body = request.send().body();
    body = StringUtil.convertCharset(body, "ISO-8859-1", "UTF-8");
    JsonParser parser = new JsonParser();
    JsonElement e = parser.parse(body);
    body = e.getAsJsonObject().get("retData").getAsJsonObject().get("stockinfo").getAsJsonArray().get(0).toString();
    
    System.out.println(body);
    
    
    JsonFactory jf = new JsonFactory();
    Gson son = jf.gson();
    StockDetailBack result = son.fromJson(body, StockDetailBack.class);
    
    return result;
  }

  @Override
  public List<StockInfo> stocks() {

    List<StockInfo> result=new ArrayList<>();
    String url = "http://quote.eastmoney.com/stock_list.html";
    HttpRequest request = HttpRequest.get(url);
    HttpResponse response = request.send();
    if (response.statusCode() == 200) {
      response.charset("gbk");
      String body = response.bodyText();
      Elements es = Jsoup.parse(body).select(".quotebody li");
      for (Element e : es) {
        String te = e.text();
        String name = te.substring(0, te.indexOf("("));
        String code = te.substring(te.indexOf("(") + 1, te.indexOf(")"));
        StockInfo stock = new StockInfo();
        stock.setName(name);
        stock.setSymbol(code);

        if (stock.getSymbol().startsWith("6")) {
          result.add(stock);
        } else if (stock.getSymbol().startsWith("0")) {
          result.add(stock);
        } else if (stock.getSymbol().startsWith("3")) {
          result.add(stock);
        } else {
          System.out.println("igone:" + stock.getName() + "-" + stock.getSymbol());
        }
      }
    }
    return result;
  }

  public static void main(String[] args) {
    //http://img1.money.126.net/data/hs/time/4days/1300135.json
    //http://img1.money.126.net/data/hs/time/today/1300135.json

    stock("2300746");
//    for (StockInfo stock : stocks) {
//      String code = "";
//      if (stock.getSymbol().startsWith("6")) {
//        stock("0" + stock.getSymbol());
//      } else if (stock.getSymbol().startsWith("0")) {
//        stock("1" + stock.getSymbol());
//      } else if (stock.getSymbol().startsWith("3")) {
//        stock("1" + stock.getSymbol());
//      }
//    }
    
  }

  private static void stockss() {
    StockListApiImpl api=new StockListApiImpl();
    List<StockInfo> stocks = api.stocks();

    System.out.println(stocks.size());
  }
  public static StockInfo time(String code){
    StockInfo result=null;
    String url = "http://img1.money.126.net/data/hs/time/today/" + code + ".json";
    HttpRequest request = HttpRequest.get(url);
    request.header("User-Agent","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0");
    HttpResponse response = request.send();
    if (response.statusCode() == 200) {
      response.charset("utf-8");
      String body = response.bodyText();
      JsonParser parser = new JsonParser();
      JsonElement root = parser.parse(body);
      JsonObject object = root.getAsJsonObject();
      result = new StockInfo();
      result.setName(object.get("name").getAsString());
      result.setSymbol(object.get("symbol").getAsString());
      result.setDate(object.get("date").getAsString());
      result.setLastVolume(object.get("lastVolume").getAsInt());
      result.setYestClose(object.get("yestclose").getAsFloat());

      JsonArray array = object.getAsJsonArray("data");
      List<StockTimePrice> prices = new ArrayList<StockTimePrice>();
      for (JsonElement element : array) {
        String time = element.getAsJsonArray().get(0).getAsString();
        float price = element.getAsJsonArray().get(1).getAsFloat();
        float avg = element.getAsJsonArray().get(2).getAsFloat();
        int size = element.getAsJsonArray().get(3).getAsInt();
        StockTimePrice stockTimePrice = new StockTimePrice();
        stockTimePrice.setTime(time);
        stockTimePrice.setPrice(price);
        stockTimePrice.setAvg(avg);
        stockTimePrice.setSize(size);
        prices.add(stockTimePrice);
      }
      result.setPrices(prices);

    }
    return  result;
  }
  private static void stock(String code) {
    StockInfo stock=  time(code);
    List<StockTimePrice> prices=stock.getPrices();
    int optional = prices.stream().mapToInt(item -> item.getSize()).reduce(0, Integer::sum);
    System.out.println(stock);
    System.out.println(optional);
    System.out.println(prices.size());
  }
  
}
