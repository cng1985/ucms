package com.haoxuer.ucms.service.album;

import com.haoxuer.discover.album.data.entity.Category;
import com.haoxuer.discover.album.data.entity.Photo;
import com.haoxuer.discover.album.data.entity.Tag;
import com.haoxuer.discover.album.data.service.CategoryService;
import com.haoxuer.discover.album.data.service.PhotoService;
import com.haoxuer.discover.album.data.service.TagService;
import com.google.gson.Gson;
import jodd.http.HttpRequest;

import java.util.List;

public class Photo1Apps3 {

	
	public static void main(String[] args) {
		
	 
				CategoryService service = null;
				// TODO Auto-generated method stub
				Category category=service.findById("4e4d610cdf714d2966000000");;
				int max = downc(category);
				


	}

	private static int downc(Category category) {
		int max = category.getCount() / 30;
		for (int i = 0; i < max; i++) {
			try {
				add(0 + i * 30,category.getId());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return max;
	}

	private static void add(int start, String cata) {
		PhotoService service = null;
		TagService tagservice =null;

		HttpRequest request = HttpRequest
				.get("http://service.picasso.adesk.com/v1/wallpaper/category/"
						+ cata + "/wallpaper");
		request.query("order", "new");
		request.query("adult", "false");
		request.query("first", "0");
		request.query("skip", "" + start);
		request.query("limit", "30");

		String body = request.send().body();
		System.out.println(body);
		Gson gson = new Gson();
		WallpaperBack back = gson.fromJson(body, WallpaperBack.class);
		System.out.println(back);
		List<PhotoVo> cs = back.getRes().getWallpaper();
		for (PhotoVo photot : cs) {
			System.out.println(photot);
			List<String> tags = photot.getTag();
			Photo photo = new Photo();
			if (tags != null) {
				try {
					for (String string : tags) {
						if (string!=null&&string.length()>0) {
							tagservice.save(Tag.fromName(string));
							photo.getTags().add(Tag.fromName(string));
						}
						
					}
				} catch (Exception e) {
					e.printStackTrace();
				}

			}
			photo.setName(photot.getDesc());
			photo.setThumb(photot.getThumb());
			photo.setImg(photot.getImg());
			photo.setId(photot.getId());
			Category category1=new Category();
			category1.setId(cata);
			photo.setCategory(category1);
			try {
				service.save(photo);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
	}

}
