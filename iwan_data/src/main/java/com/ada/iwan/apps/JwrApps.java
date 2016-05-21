package com.ada.iwan.apps;

import java.security.Key;

import javax.crypto.spec.SecretKeySpec;

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
	}

}
