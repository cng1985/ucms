package com.quhaodian.ucms.plugs.qiniu;

import java.io.File;
import java.io.IOException;
import java.util.List;

import com.haoxuer.discover.plug.api.StoragePlugin;
import com.haoxuer.discover.plug.data.entity.PluginConfig;
import com.haoxuer.discover.plug.data.vo.FileInfo;
import com.young.security.md5.MD5Utils;
import org.springframework.stereotype.Component;

import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;


@Component("qiNiuStoragePlugin")
public class QiNiuStoragePlugin extends StoragePlugin {

    @Override
    public String getName() {
        // TODO Auto-generated method stub
        return "七牛云存储";
    }

    @Override
    public String getVersion() {
        // TODO Auto-generated method stub
        return "1.1";
    }

    @Override
    public String getAuthor() {
        // TODO Auto-generated method stub
        return "quhaodian";
    }

    @Override
    public String getSiteUrl() {
        return "http://www.quhaodian.com";
    }

    @Override
    public String getInstallUrl() {
        return "admin/storage_plugin/qiniu/install.htm";
    }

    @Override
    public String getUninstallUrl() {
        return "admin/storage_plugin/qiniu/uninstall.htm";
    }

    @Override
    public String getSettingUrl() {
        return "admin/storage_plugin/qiniu/setting.htm";
    }


    String domain;
    String url;

    @Override
    public void upload(String path, File file, String contentType) {
        PluginConfig pluginConfig = getPluginConfig();
        if (pluginConfig != null) {
            String accessKey = pluginConfig.getAttribute("accessKey");
            String secretKey = pluginConfig.getAttribute("secretKey");
            domain = pluginConfig.getAttribute("domain");
            url = pluginConfig.getAttribute("url");

            Auth auth = Auth.create(accessKey, secretKey);
            String token = auth.uploadToken(domain);
            UploadManager manager = new UploadManager();
            try {
                MD5Utils md5 = new MD5Utils(path);
                String key = md5.compute();
                String murl = url + key;
                Response r = manager.put(file, key, token);
            } catch (QiniuException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }


        }


    }

    @Override
    public String getUrl(String path) {
        PluginConfig pluginConfig = getPluginConfig();
        if (pluginConfig != null) {
            url = pluginConfig.getAttribute("url");
        }
        MD5Utils md5 = new MD5Utils(path);
        String key = md5.compute();
        String murl = url + key;
        return murl;
    }

    @Override
    public List<FileInfo> browser(String path) {
        // TODO Auto-generated method stub
        return null;
    }

}
