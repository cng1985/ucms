package com.ada.iwan.data.template;

import java.io.File;

import com.ada.article.entity.SensitiveCategory;
import com.ada.data.entity.CatalogEntity;
import com.ada.imake.ChainMake;
import com.ada.iwan.data.entity.Note;
import com.ada.site.entity.SystemVersion;
import com.ada.user.entity.UserRole;

public class ChainApps {

	public static void main(String[] args) {

		File file = new File("D:\\mvnspace\\iwan\\iwan_web\\src\\main\\webapp\\WEB-INF\\ftl\\admin");
		ChainMake make = new ChainMake();
		make.setAction("com.ada.iwan.controller.admin");
		make.setView(file);
		make.setDao(false);
		make.setService(false);
		make.setAction(true);
		make.setView(false);
		// UserOauthToken.
		 make.makes(UserRole.class);
		// make.makes(UserOschina.class,UserOauthWeibo.class,UserQQ.class,UserGitHub.class);
		// new ChainMake().makes("com.ada.imakedemo.data.entity");

		Class<?> c = SensitiveCategory.class;
		Class<?> b = CatalogEntity.class;
		if (c.getSuperclass().equals(b)) {
			System.out.println("h");
		}


	}

}
