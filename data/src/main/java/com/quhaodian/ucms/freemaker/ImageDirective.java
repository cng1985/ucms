package com.quhaodian.ucms.freemaker;

import com.haoxuer.discover.common.utils.DirectiveUtils;
import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

import java.io.IOException;
import java.io.Writer;
import java.util.Map;

public class ImageDirective implements TemplateDirectiveModel {
    @Override
    public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
        String src = DirectiveUtils.getString("src", params);
        Writer out = env.getOut();
        if (src != null) {
            if (src.startsWith("http")){
                out.append(src);

            }else{
                if (src.startsWith("/")){
                    src=src.substring(1);
                }
                out.append(domain+src);
            }
        }else {
            String def=DirectiveUtils.getString("def",params);
            if (def==null){
                return;
            }
            out.append(domain+def);
        }
    }

    private String domain;

    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }
}
