package com.ada.iwan.data.template;

import java.io.File;

import com.ada.imake.ChainMake;
import com.ada.user.entity.UserGitHub;
import com.ada.user.entity.UserOauthToken;
import com.ada.user.entity.UserOauthWeibo;
import com.ada.user.entity.UserOschina;
import com.ada.user.entity.UserQQ;

public class ChainApps {

	public static void main(String[] args) {

		File file = new File("D:\\workspace\\iwan\\iwan_web\\src\\main\\webapp\\WEB-INF\\ftl\\admin");
		ChainMake make = new ChainMake();
		make.setAction("com.ada.iwan.controller.admin");
		make.setView(file);
		make.setDao(false);
		make.setService(false);
		make.setAction(true);
		make.setView(true);
        //UserOauthToken.
		make.make(UserOauthToken.class);
		//make.makes(UserOschina.class,UserOauthWeibo.class,UserQQ.class,UserGitHub.class);
		// new ChainMake().makes("com.ada.imakedemo.data.entity");

	}

}
