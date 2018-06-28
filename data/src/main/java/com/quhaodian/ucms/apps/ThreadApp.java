package com.quhaodian.ucms.apps;

import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class ThreadApp {
  
  public static void main(String[] args) {
    ScheduledExecutorService service = Executors.newScheduledThreadPool(10);
    Future<String> future=  service.submit(new Callable<String>() {
      @Override
      public String call() throws Exception {
        return "hello";
      }
    });
    try {
      System.out.println(future.get());
      service.shutdown();
    } catch (InterruptedException e) {
      e.printStackTrace();
    } catch (ExecutionException e) {
      e.printStackTrace();
    }
  }
  
  private static void repeat(ScheduledExecutorService service) {
    service.scheduleAtFixedRate(new Runnable() {
      @Override
      public void run() {
        System.out.println("hi");
      }
    },2,5, TimeUnit.SECONDS);
  }
}
