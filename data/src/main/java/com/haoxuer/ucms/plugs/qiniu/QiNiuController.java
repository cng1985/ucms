/*
 * 
 * 
 * 
 */
package com.haoxuer.ucms.plugs.qiniu;

import com.haoxuer.discover.plug.Message;
import com.haoxuer.discover.plug.data.entity.PluginConfig;
import com.haoxuer.discover.plug.data.service.PluginConfigService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;

/**
 * Controller - 本地文件存储
 * 
 * 
 * 
 */
@Controller("qiNiuController")
@RequestMapping("/admin/storage_plugin/qiniu")
public class QiNiuController {

	@Resource(name = "qiNiuStoragePlugin")
	private QiNiuStoragePlugin plugin;

	@Resource(name = "pluginConfigServiceImpl")
	private PluginConfigService pluginConfigService;


	/**
	 * 安装
	 */
	@RequestMapping(value = "/install")
	public String install( RedirectAttributes redirectAttributes) {
		if (!plugin.getIsInstalled()) {
			PluginConfig pluginConfig = new PluginConfig();
			pluginConfig.setPluginId(plugin.getId());
			pluginConfig.setIsEnabled(false);
			pluginConfigService.save(pluginConfig);
		}
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);

		return "redirect:/admin/storage_plugin/list.htm";
	}

	/**
	 * 卸载
	 */
	@RequestMapping(value = "/uninstall")
	public String uninstall(RedirectAttributes redirectAttributes) {
		if (plugin.getIsInstalled()) {
			PluginConfig pluginConfig = plugin.getPluginConfig();
			pluginConfigService.deleteById(pluginConfig.getId());
		}
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:/admin/storage_plugin/list.htm";
	}


	/**
	 * 设置
	 */
	@RequestMapping(value = "/setting", method = RequestMethod.GET)
	public String setting(ModelMap model) {
		PluginConfig pluginConfig = plugin.getPluginConfig();
		model.addAttribute("pluginConfig", pluginConfig);
		return "/admin/storage_plugin/setting_qiniu";
	}

	protected void addFlashMessage(RedirectAttributes redirectAttributes, Message message) {
		if (redirectAttributes != null && message != null) {
			redirectAttributes.addFlashAttribute("msg", message);
		}
	}
	protected static final Message SUCCESS_MESSAGE = new Message(Message.Type.success,"成功");

	/**
	 * 更新
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Integer order,String accessKey, String secretKey,String domain,String url,  RedirectAttributes redirectAttributes) {
		PluginConfig pluginConfig = plugin.getPluginConfig();
		pluginConfig.setIsEnabled(true);
		pluginConfig.setSortNum(order);
		pluginConfig.setAttribute("accessKey",accessKey);
		pluginConfig.setAttribute("secretKey",secretKey);
		pluginConfig.setAttribute("domain",domain);
		pluginConfig.setAttribute("url",url);

		pluginConfigService.update(pluginConfig);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:/admin/storage_plugin/list.htm";
	}

}