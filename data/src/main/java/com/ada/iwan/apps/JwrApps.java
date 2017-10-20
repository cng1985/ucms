package com.ada.iwan.apps;

import java.security.Key;

import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.StringUtils;
import org.springframework.web.util.CookieGenerator;
import org.springframework.web.util.WebUtils;

import com.young.security.utils.Base64;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.InvalidClaimException;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.impl.compression.CompressionCodecs;
import io.jsonwebtoken.impl.crypto.MacProvider;
import io.jsonwebtoken.impl.crypto.RsaProvider;

public class JwrApps {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Key key = MacProvider.generateKey();
		RsaProvider.generateKeyPair();
		String base64 = Base64.encode(key.getEncoded());
		System.out.println(base64);
		Key key1 = new SecretKeySpec(Base64.decode(base64), key.getFormat());
		String s = Jwts.builder().setSubject("Joe").signWith(SignatureAlgorithm.HS512, key1).compressWith(CompressionCodecs.GZIP).compact();
		System.out.println(s);
		try {
			Jws<Claims> c = Jwts.parser().requireSubject("Joe").setSigningKey(base64).parseClaimsJws(s);
			System.out.println(c.getSignature());
			System.out.println(c.getBody().getSubject());
		} catch (InvalidClaimException ice) {
			ice.printStackTrace();
		}
		
		String token="";
		HttpServletRequest request=null;
		Cookie cookie = WebUtils.getCookie(request, "clientid");
		if (cookie != null) {
			String value = cookie.getValue();
			if (StringUtils.hasText(value)) {
				token = value;
			}
		}
		
		CookieGenerator generator=new CookieGenerator();
		HttpServletResponse response = null;
		generator.addCookie(response, "");

	}

}
