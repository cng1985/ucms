package com.haoxuer.ucms.data.so;

import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Search;

import java.io.Serializable;

/**
* Created by imake on 2018年12月05日17:51:09.
*/
public class StockDaySo implements Serializable {

    @Search(name = "stock.name",operator = Filter.Operator.like)
    private String name;

    public String getName() {
    return name;
    }

    public void setName(String name) {
    this.name = name;
    }

}
