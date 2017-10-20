package com.scribejava.apis;

import com.github.scribejava.core.builder.api.DefaultApi20;
import com.github.scribejava.core.model.OAuthConfig;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.oauth.OAuth20Service;

public class OsChinaOAuthServiceImpl extends OAuth20Service {

    public OsChinaOAuthServiceImpl(DefaultApi20 api, OAuthConfig config) {
        super(api, config);
    }

    @Override
    protected OAuthRequest createAccessTokenRequest(String code) {
        OAuthRequest request= super.createAccessTokenRequest(code);
//        if (!getConfig().hasGrantType()) {
//            request.addParameter(OAuthConstants.GRANT_TYPE, OAuthConstants.AUTHORIZATION_CODE);
//        }
        request.addParameter("dataType", "json");
        return request;
    }
    
   
}
