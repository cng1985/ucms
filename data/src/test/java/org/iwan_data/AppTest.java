package org.iwan_data;

import com.haoxuer.discover.useroauth.scribejava.apis.OschinaApi;
import java.io.IOException;
import java.util.concurrent.ExecutionException;

import com.github.scribejava.apis.GitHubApi;
import com.github.scribejava.apis.SinaWeiboApi20;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.github.scribejava.core.utils.OAuthEncoder;
import com.young.http.HttpConnection;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

/**
 * Unit test for simple App.
 */
public class AppTest extends TestCase {
	/**
	 * Create the test case
	 *
	 * @param testName
	 *            name of the test case
	 */
	public AppTest(String testName) {
		super(testName);
	}

	/**
	 * @return the suite of tests being tested
	 */
	public static Test suite() {
		return new TestSuite(AppTest.class);
	}

	/**
	 * Rigourous Test :-)
	 */
	public void testApp() {
		assertTrue(true);
	}

	public static void main(String[] args) throws IOException {

		x();

	}

	private static void weibo() throws IOException {
		final OAuth20Service service = new ServiceBuilder("2320531559")
				.apiSecret("bc4440c86d5be467f954b8e221ef6553").callback("http://www.yichisancun.com/weibologin.htm")
				.build(SinaWeiboApi20.instance());
		System.out.println(service.getAuthorizationUrl());

		OAuth2AccessToken token = null;
		try {
			token = service.getAccessToken("d75900573c5bc6a0e85f3f1f81d6b6b8");
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (ExecutionException e) {
			e.printStackTrace();
		}

		System.out.println(token);
	}

	private static void xxx() {
		try {
			String body = HttpConnection
					.connect(
							"http://www.oschina.net/action/openapi/token?client_id=CTJlkYcnBaZCsi4GGgUk&client_secret=TlKrmPCKImAKEzk1ORZtdwooJKDIgXrF&code=5hZCHj&redirect_uri=http%3A%2F%2Fwww.yichisancun.com%2Fqqoschina.htm&grant_type=authorization_code&dataType=json")
					.header("User-Agent", "Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101 Firefox/45.0")
					.execute().body();
			System.out.println(body);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private static void x() throws IOException {
		System.out.println(OAuthEncoder.encode("Q7kSBl"));
		final OAuth20Service service = new ServiceBuilder("66e9bc9545ab3bcec49b")
				.apiSecret("a273f21ef3088dc4487dc90474c26c62d3a7b35f")
				.callback("http://www.yichisancun.com/githublogin.htm").scope("user,public_repo")
				.build(GitHubApi.instance());
		System.out.println(service.getAuthorizationUrl());
		final OAuth20Service service2 = new ServiceBuilder("CTJlkYcnBaZCsi4GGgUk")
				.apiSecret("TlKrmPCKImAKEzk1ORZtdwooJKDIgXrF").callback("http://www.yichisancun.com/oschinalogin.htm")
				.responseType("code").build(OschinaApi.instance());
		System.out.println(service2.getAuthorizationUrl());

		//System.out.println(service2.getOauth2TokenUrl("vvYTJp"));
		OAuth2AccessToken token = null;
		try {
			token = service.getAccessToken("d7a6f143663b6e91dcf2");
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (ExecutionException e) {
			e.printStackTrace();
		}
		System.out.println(token.getAccessToken());
		// final OAuthRequest request = new OAuthRequest(Verb.GET,
		// "https://api.github.com/user", service);
		// service.signRequest(token, request); // the access token from step 4
		// final Response response = request.send();
		// System.out.println(response.getBody());
	}
}
