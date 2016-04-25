package org.iwan_data;

import com.github.scribejava.apis.GitHubApi;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

/**
 * Unit test for simple App.
 */
public class AppTest 
    extends TestCase
{
    /**
     * Create the test case
     *
     * @param testName name of the test case
     */
    public AppTest( String testName )
    {
        super( testName );
    }

    /**
     * @return the suite of tests being tested
     */
    public static Test suite()
    {
        return new TestSuite( AppTest.class );
    }

    /**
     * Rigourous Test :-)
     */
    public void testApp()
    {
        assertTrue( true );
    }
    
    public static void main(String[] args) {
    	final  OAuth20Service service = new ServiceBuilder()
                .apiKey("66e9bc9545ab3bcec49b")
                .apiSecret("a273f21ef3088dc4487dc90474c26c62d3a7b35f").callback("http://www.yichisancun.com/githublogin.htm").scope("user,public_repo")
                .build(GitHubApi.instance());
    	System.out.println(service.getAuthorizationUrl());
    	final  OAuth20Service service2= new ServiceBuilder()
                .apiKey("CTJlkYcnBaZCsi4GGgUk")
                .apiSecret("TlKrmPCKImAKEzk1ORZtdwooJKDIgXrF").callback("http://www.yichisancun.com/qqoschina.htm").responseType("code")
                .build(OschinaApi.instance());
    	System.out.println(service2.getAuthorizationUrl());
    	
    	OAuth2AccessToken token=	service.getAccessToken("242d6fc3cda12ee6d8d3");
    	System.out.println(token.getAccessToken());
    	
    	final OAuthRequest request = new OAuthRequest(Verb.GET, "https://api.github.com/user", service);
		service.signRequest(token, request); // the access token from step 4
    	final Response response = request.send();
    	System.out.println(response.getBody());
	}
}
