package org.iwan_data;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.ada.user.entity.UserInfo;
import com.ada.user.entity.UserOschina;
import com.ada.user.service.UserOschinaService;
import com.ada.user.service.UserQQService;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = { "/applicationContext.xml" })
// 当然 你可以声明一个事务管理 每个单元测试都进行事务回滚 无论成功与否
@Transactional
@Rollback(value = false)
public class UserQQTest {

	@Autowired
	UserOschinaService userOschinaService;
	
	@Test
	public void testLogin(){
		try {
			String redirect_uri = "http://www.yichisancun.com/oschinalogin.htm";
			String grant_type = "authorization_code";
			String client_secret = "TlKrmPCKImAKEzk1ORZtdwooJKDIgXrF";
			String client_id = "CTJlkYcnBaZCsi4GGgUk";
			String code="bINJLy";
			UserInfo oschina = userOschinaService.login(client_id, client_secret, grant_type, redirect_uri, code);
			} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
