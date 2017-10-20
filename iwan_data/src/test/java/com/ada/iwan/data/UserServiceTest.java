package com.ada.iwan.data;

import com.ada.user.data.service.UserInfoService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by ada on 2016/10/25.
 */
public class UserServiceTest extends SpringTest {

    @Autowired
    UserInfoService userInfoService;

    @Test
    public  void testReg(){
       // userInfoService.reg("ada@ada.com","admin","123456");
    }
}
