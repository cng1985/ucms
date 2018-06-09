package com.quhaodian.ucms.data.so;

import com.quhaodian.data.page.Filter;
import com.quhaodian.data.page.Search;
import java.io.Serializable;

/**
* Created by imake on 2018年05月19日18:48:51.
*/
public class StockSo implements Serializable {
  
  @Search(name = "name",operator = Filter.Operator.like)
  private String name;
  
  public String getName() {
    return name;
  }
  
  public void setName(String name) {
    this.name = name;
  }
}
