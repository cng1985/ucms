package com.quhaodian.ucms.service.album;

import com.haoxuer.discover.album.data.entity.PhotoFeed;
import com.haoxuer.discover.album.data.service.PhotoFeedService;
import com.quhaodian.ucms.apps.ObjectFactory;

public class PhotoFeedApps {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		PhotoFeedService service=ObjectFactory.get().getBean(PhotoFeedService.class);
		
		PhotoFeed bean=new PhotoFeed();
		service.save(bean);
		try {
			Thread.sleep(3000l);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		service.update(bean);
	}

}
