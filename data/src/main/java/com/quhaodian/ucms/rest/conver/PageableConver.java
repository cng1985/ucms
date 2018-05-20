package com.quhaodian.ucms.rest.conver;

import com.quhaodian.data.page.Pageable;
import com.quhaodian.data.rest.core.Conver;
import com.quhaodian.discover.rest.base.RequestTokenPageObject;
import com.quhaodian.discover.rest.base.RequestUserTokenPageObject;

public class PageableConver implements Conver<Pageable, RequestUserTokenPageObject> {
  @Override
  public Pageable conver(RequestUserTokenPageObject source) {
    Pageable result = new Pageable();
    result.setSize(source.getSize());
    result.setNo(source.getNo());
    return result;
  }
}
