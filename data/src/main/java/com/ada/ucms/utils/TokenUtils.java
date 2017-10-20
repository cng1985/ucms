package com.ada.ucms.utils;

import java.security.Key;
import java.util.Calendar;
import java.util.UUID;

import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;
import org.springframework.web.util.CookieGenerator;
import org.springframework.web.util.WebUtils;

import com.young.security.utils.Base64;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.impl.compression.CompressionCodecs;
import io.jsonwebtoken.impl.crypto.MacProvider;

public class TokenUtils {
	private static final String CLIENTID = "clientid";

	private static Logger logger = LoggerFactory.getLogger("ada");

	private static String base64 = "+mXj6RM95anXJjtGfxNx5fAyX1CR+mbU1AvLHEjOO8cRBaoPQVxjMSqhAqNF OV41h233sKmN5FA8jW1KS/tS4Q==";

	public void addCookie(HttpServletResponse response, String cookieValue) {
		Assert.notNull(response, "HttpServletResponse must not be null");
		Cookie cookie = new Cookie(CLIENTID, cookieValue);
		Integer maxAge = 3600;
		if (maxAge != null) {
			cookie.setMaxAge(maxAge);
		}
		// cookie.setHttpOnly(true);
		response.addCookie(cookie);
	}

	public static String getToken(HttpServletRequest request) {
		String token = "";
		Cookie cookie = WebUtils.getCookie(request, CLIENTID);
		if (cookie != null) {
			String value = cookie.getValue();
			if (StringUtils.hasText(value)) {
				token = value;
			}
		}
		return token;
	}

	public static String getId(HttpServletRequest request) {
		String id = "";
		String token = "";
		Cookie cookie = WebUtils.getCookie(request, CLIENTID);
		if (cookie != null) {
			String value = cookie.getValue();
			if (StringUtils.hasText(value)) {
				token = value;
			}
		}
		if (token != null) {
			try {
				Jws<Claims> c = Jwts.parser().setSigningKey(base64).parseClaimsJws(token);
				c.getSignature();
				id = c.getBody().getSubject();
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		return id;
	}

	public static void visit(HttpServletRequest request, HttpServletResponse response) {
		String token = TokenUtils.getToken(request);
		if (token != null && token.length() > 5) {

			try {
				Jws<Claims> c = Jwts.parser().setSigningKey(base64).parseClaimsJws(token);
				c.getSignature();
				Integer visit = c.getBody().get("visit", Integer.class);
				if (visit == null) {
					logger.info("visit没值");
					visit = 1;
				}
				logger.info("visit:" + visit);
				visit++;
				String id = c.getBody().getSubject();
				Calendar calendar = Calendar.getInstance();
				calendar.add(Calendar.YEAR, 1);
				Key key = MacProvider.generateKey();
				Key key1 = new SecretKeySpec(Base64.decode(base64), key.getFormat());

				String s = Jwts.builder().claim("visit", visit).setSubject(id).signWith(SignatureAlgorithm.HS512, key1)
						.setExpiration(calendar.getTime()).compressWith(CompressionCodecs.GZIP).compact();

				CookieGenerator generator = new CookieGenerator();
				generator.setCookieName(CLIENTID);
				generator.setCookieHttpOnly(true);
				generator.setCookieMaxAge(-1);
				generator.addCookie(response, s);
			} catch (Exception e) {
				e.printStackTrace();
				initDefault(response);
				logger.info("token无效，初始化");
			}
		} else {
			logger.info("token没有，初始化");
			initDefault(response);
		}

	}

	private static void initDefault(HttpServletResponse response) {

		String id = UUID.randomUUID().toString();
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.YEAR, 1);
		Key key = MacProvider.generateKey();
		Key key1 = new SecretKeySpec(Base64.decode(base64), key.getFormat());
		String token = Jwts.builder().setSubject(id).claim("visit", 1).signWith(SignatureAlgorithm.HS512, key1)
				.setExpiration(calendar.getTime()).compressWith(CompressionCodecs.GZIP).compact();

		CookieGenerator generator = new CookieGenerator();
		generator.setCookieName(CLIENTID);
		generator.setCookieHttpOnly(true);
		generator.setCookieMaxAge(-1);
		generator.addCookie(response, token);
	}

	public static void setToken(HttpServletResponse response, String id) {
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.YEAR, 1);
		Key key = MacProvider.generateKey();
		Key key1 = new SecretKeySpec(Base64.decode(base64), key.getFormat());
		String s = Jwts.builder().setSubject(id).signWith(SignatureAlgorithm.HS512, key1)
				.setExpiration(calendar.getTime()).compressWith(CompressionCodecs.GZIP).compact();

		CookieGenerator generator = new CookieGenerator();
		generator.setCookieName(CLIENTID);
		generator.setCookieHttpOnly(true);
		generator.setCookieMaxAge(3600);
		generator.addCookie(response, s);

		CookieGenerator generator2 = new CookieGenerator();
		generator2.setCookieName("cid");
		generator2.addCookie(response, id);
		// Integer maxAge = 36000;
		// if (maxAge != null) {
		// cookie.setMaxAge(maxAge);
		// }
		// cookie.setHttpOnly(true);

	}

	public static void main(String[] args) {
		Key key = MacProvider.generateKey();
		Key key1 = new SecretKeySpec(Base64.decode(base64), key.getFormat());
		String s = Jwts.builder().setSubject(UUID.randomUUID().toString()).signWith(SignatureAlgorithm.HS256, key1)
				.compressWith(CompressionCodecs.GZIP).compact();
		System.out.println(s);
	}
}
