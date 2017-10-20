package com.ada.iwan.apps;

import java.util.concurrent.TimeUnit;

import javax.sql.DataSource;

import org.skife.jdbi.v2.DBI;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.codahale.metrics.ConsoleReporter;
import com.codahale.metrics.Counter;
import com.codahale.metrics.Histogram;
import com.codahale.metrics.Meter;
import com.codahale.metrics.MetricRegistry;

public class GetStarted {
	static final MetricRegistry metrics = new MetricRegistry();

	public static void main(String args[]) {
		startReport();

		while (true) {
			pendingJobs.inc();
			Meter requests = metrics.meter("requests");
			requests.mark();
			wait5Seconds();
			
			final Histogram resultCounts =metrics.histogram("xx");
			resultCounts.update(pendingJobs.getCount());
		}
		
	}
    private static Counter pendingJobs = metrics.counter("dd");
	static void startReport() {
		ConsoleReporter reporter = ConsoleReporter.forRegistry(metrics).convertRatesTo(TimeUnit.SECONDS)
				.convertDurationsTo(TimeUnit.MILLISECONDS).build();
		reporter.start(10, TimeUnit.SECONDS);
		DriverManagerDataSource ds = new DriverManagerDataSource();
		ds.setDriverClassName("com.mysql.jdbc.Driver");
		ds.setUrl("jdbc:mysql://127.0.0.1:3306/iwan?characterEncoding=UTF-8");
		ds.setUsername("root");
		ds.setPassword("root");
		DataSource dataSource = ds;
		final DBI dbi = new DBI(dataSource);
//		dbi.setTimingCollector(new InstrumentedTimingCollector(metrics));
//		dataSource = MetricsSql.forRegistry(metrics)
//                .wrap("mysql", dataSource);
		

	}

	static void wait5Seconds() {
		try {
			Thread.sleep(2 * 1000);
		} catch (InterruptedException e) {
		}
	}
}