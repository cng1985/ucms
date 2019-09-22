package com.haoxuer.ucms.member.data.so;

import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Search;
import lombok.Data;

import java.io.Serializable;

/**
* Created by imake on 2019年09月22日16:06:49.
*/
@Data
public class MemberSo implements Serializable {

    @Search(name = "name",operator = Filter.Operator.like)
    private String name;

}
