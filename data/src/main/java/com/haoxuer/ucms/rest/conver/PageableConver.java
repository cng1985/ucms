package com.haoxuer.ucms.rest.conver;

import com.haoxuer.discover.data.page.Pageable;
import com.haoxuer.discover.data.rest.core.Conver;
import com.haoxuer.discover.rest.base.RequestTokenPageObject;
import com.haoxuer.discover.rest.base.RequestUserTokenPageObject;

public class PageableConver implements Conver<Pageable, RequestUserTokenPageObject> {
  @Override
  public Pageable conver(RequestUserTokenPageObject source) {
    Pageable result = new Pageable();
    result.setPageSize(source.getSize());
    result.setPageNo(source.getNo());
    return result;
  }
}
