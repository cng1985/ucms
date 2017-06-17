package com.ada.iwan.data.template;

import com.ada.article.entity.Article;
import com.ada.article.entity.SensitiveCategory;
import com.ada.data.entity.CatalogEntity;
import com.ada.imake.ChainMake;
import com.ada.imake.template.hibernate.TemplateHibernateDir;
import com.ada.imake.templates.simple.TemplateSimpleDir;
import com.ada.iwan.data.entity.Member;

import java.io.File;

public class ChainApps {

	public static void main(String[] args) {

		File file = new File("D:\\mvnspace\\iwan\\iwan_web\\src\\main\\webapp\\WEB-INF\\ftl\\admin");
		ChainMake make = new ChainMake(TemplateSimpleDir.class, TemplateHibernateDir.class);
		make.setAction("com.ada.iwan.controller.admin");
		make.setView(file);
		make.setDao(true);
		make.setService(true);
		make.setAction(true);
		make.setView(true);
		make.setMenus("1,53,70");
		// UserOauthToken.
		 make.makes(Member.class);
		// make.makes(UserOschina.class,UserOauthWeibo.class,UserQQ.class,UserGitHub.class);
		// new ChainMake().makes("com.ada.imakedemo.data.entity");

		Class<?> c = SensitiveCategory.class;
		Class<?> b = CatalogEntity.class;
		if (c.getSuperclass().equals(b)) {
			System.out.println("h");
		}


	}

}
