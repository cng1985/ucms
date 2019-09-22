package com.haoxuer.ucms.apps;

import com.haoxuer.discover.generate.utils.RandomValue;
import jodd.http.HttpRequest;

import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

public class HackApp {

  public static void main(String[] args) {
    x();



  }

  private static void x() {
    for (int i = 0; i < 100; i++) {
      reg();
    }
  }

  private static void reg() {
    HttpRequest request= HttpRequest.post("https://www.haoxuer.com/register.htm");

    request.form("username",""+ RandomValue.getEmail(5,12));
    request.form("password",""+RandomValue.getTel());
    request.form("name",""+RandomValue.getChineseName());
    request.send().body();
  }
}
