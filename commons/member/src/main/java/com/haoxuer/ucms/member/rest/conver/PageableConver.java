package com.haoxuer.ucms.member.rest.conver;

import com.haoxuer.discover.data.page.Pageable;
import com.haoxuer.discover.data.rest.core.Conver;
import com.haoxuer.ucms.member.api.domain.request.BasePageRequest;

public class PageableConver implements Conver<Pageable, BasePageRequest> {
    @Override
    public Pageable conver(BasePageRequest source) {
        Pageable result=new Pageable();
        result.setPageNo(source.getNo());
        result.setPageSize(source.getSize());
        return result;
    }
}
