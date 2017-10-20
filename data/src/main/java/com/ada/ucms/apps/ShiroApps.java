package com.ada.ucms.apps;

import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.util.ByteSource;

/**
 * Created by cng19 on 2017/6/2.
 */
public class ShiroApps {
    public static void main(String[] args) {
        SimpleAuthenticationInfo aa = new SimpleAuthenticationInfo("ada", "123456", ByteSource.Util.bytes("ada".getBytes()), "young");
    }
}
