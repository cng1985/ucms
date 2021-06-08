package com.haoxuer.ucms.freemaker;

import com.haoxuer.discover.config.data.entity.User;
import com.haoxuer.discover.user.shiro.utils.UserUtil;
import com.jagregory.shiro.freemarker.SecureTag;
import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateException;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Map;

@Component("userDirective")
public class UserDirective extends SecureTag {


    @Override
    public void render(Environment environment, Map map, TemplateDirectiveBody templateDirectiveBody) throws IOException, TemplateException {
        User user = UserUtil.getUser();
        if (user != null && user.getId() != null && user.getId() > 0) {
            this.renderBody(environment, templateDirectiveBody);
        } else {
        }

    }
}
