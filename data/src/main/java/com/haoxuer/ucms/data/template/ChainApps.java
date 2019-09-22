package com.haoxuer.ucms.data.template;

import com.haoxuer.discover.user.data.entity.UserLabel;
import com.haoxuer.imake.ChainMake;
import com.haoxuer.imake.template.hibernate.TemplateHibernateDir;
import com.haoxuer.imake.templates.adminlte.TemplateAdminLTE;

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
		make.setMenus("1,21,28");
		 make.makes(UserLabel.class);
		// make.makes(UserOschina.class,UserOauthWeibo.class,UserQQ.class,UserGitHub.class);
		// new ChainMake().makes("com.quhaodian.imakedemo.data.entity");



	}

}
