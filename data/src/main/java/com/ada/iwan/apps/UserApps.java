package com.ada.iwan.apps;

import com.ada.user.data.entity.UserInfo;
import com.ada.user.data.service.UserInfoService;
import org.springframework.dao.DataIntegrityViolationException;


public class UserApps {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		UserInfoService service = ObjectFactory.get().getBean(UserInfoService.class);
		try {
			UserInfo user = service.deleteById(1l);
			System.out.println(user);
		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
			System.out.println(e.getClass().getName());
		}
	
		System.out.println("xxx");
	}

	private static void x(UserInfoService service) {
		UserInfo user = service.findById(1l);
		System.out.println(user);
		user.getAttributes().put("sex", "男1");
		user.getAttributes().put("age", "1");
		service.update(user);
		user.getAttributes().clear();
		user.getAttributes().put("age", "1");
		service.update(user);
	}

}
