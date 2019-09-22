package com.haoxuer.ucms.data;

import com.haoxuer.discover.user.data.service.UserInfoService;
import org.junit.Test;
import org.mockito.Mockito;
import org.mockito.verification.VerificationMode;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by quhaodian on 2016/10/25.
 */
public class UserServiceTest {

    @Test
    public void testReg() {
        // userInfoService.reg("quhaodian@quhaodian.com","admin","123456");
        HttpServletRequest request = Mockito.mock(HttpServletRequest.class);
        Mockito.when(request.getRequestURI()).thenReturn("/bbs/index.htm");
        Mockito.when(request.getRequestURL()).thenReturn(new StringBuffer("http://www.yichisancun.com/bbs/index.htm"));
        System.out.println(request.getRequestURI());
        System.out.println(request.getRequestURI());

        StringBuffer url = request.getRequestURL();
        String tempContextUrl = url.delete(url.length() - request.getRequestURI().length(), url.length()).toString();
        System.out.println(tempContextUrl);

    }
}
