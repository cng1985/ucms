package com.ada.ucms.apps;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.skife.jdbi.v2.DBI;
import org.skife.jdbi.v2.Handle;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

public class DBIApps {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		DriverManagerDataSource ds = new DriverManagerDataSource();
		ds.setDriverClassName("com.mysql.jdbc.Driver");
		ds.setUrl("jdbc:mysql://127.0.0.1:3306/iwan?characterEncoding=UTF-8");
		ds.setUsername("root");
		ds.setPassword("root");
		DataSource dataSource = ds;
		final DBI dbi = new DBI(dataSource);
		Handle handle=dbi.open();
		List<Map<String, Object>> ss=	handle.select("select * from activity limit 10");
		for (Map<String, Object> map : ss) {
			System.out.println(map.get("adddate").getClass());
		}
		handle.close();
		
	}

}
