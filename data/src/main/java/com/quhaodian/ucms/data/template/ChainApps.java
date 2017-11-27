package com.quhaodian.ucms.data.template;

import com.quhaodian.article.data.entity.SensitiveCategory;
import com.quhaodian.bbs.data.entity.Forum;
import com.quhaodian.bbs.data.entity.ForumPost;
import com.quhaodian.data.entity.CatalogEntity;
import com.quhaodian.imake.ChainMake;
import com.quhaodian.imake.template.hibernate.TemplateHibernateDir;
import com.quhaodian.imake.templates.adminlte.TemplateAdminLTE;
import com.quhaodian.imake.templates.simple.TemplateSimpleDir;

import java.io.File;

public class ChainApps {

	public static void main(String[] args) {

		File file = new File("E:\\mvnspace\\ucms\\web\\src\\main\\webapp\\WEB-INF\\ftl\\admin");
		ChainMake make = new ChainMake(TemplateAdminLTE.class, TemplateHibernateDir.class);
		make.setAction("com.quhaodian.ucms.controller.admin");
		make.setView(file);
		make.setDao(false);
		make.setService(false);
		make.setAction(false);
		make.setView(true);
		make.setMenus("1,15,16");
		 make.makes(Forum.class);
		// make.makes(UserOschina.class,UserOauthWeibo.class,UserQQ.class,UserGitHub.class);
		// new ChainMake().makes("com.quhaodian.imakedemo.data.entity");

		Class<?> c = SensitiveCategory.class;
		Class<?> b = CatalogEntity.class;
		if (c.getSuperclass().equals(b)) {
			System.out.println("h");
		}


	}

}
