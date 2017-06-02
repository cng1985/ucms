## 一尺三寸

> 一尺三寸 是自由自在的网站，你可以提问，投稿，了解股票信息，参加社区活动，全部代码开源。


### 技术选型：

* **服务端**

* SSH (Spring、SpringMVC、Hibernate）
* 安全权限 Shiro
* 搜索工具 Lucene
* 缓存 Ehcache
* 视图模板 freemarker 
* 其它 Jsoup、gson
* [disconver_hibernate](https://git.oschina.net/yichisancun/disconver)
* [imake](http://git.oschina.net/yichisancun/imake)

### 网站前端

* angularjs
* bootstrap
* WOW



### iwan 工程介绍

* iwan_api	api工程
* iwan_app	本地测试工程
* iwan_data	工程的controller，数据模块
* iwan_web	视图工程，不放代码，使用freemarker作为视图
* 工程数据库位置：sqls/iwandb.sql   登陆后台用户名admin  密码123456 启动工程到iwan目录，
输入mvn tomcat7:run 数据库配置文件：iwan_web(工程)/resources/jdbc.properties
* icore工程位置[icore](http://git.oschina.net/cng1985/icore)
* imake工程位置[imake](http://git.oschina.net/yichisancun/imake)

### icore 包介绍：


* com.ada.admin 后台管理功能
* com.ada.album 相册功能
* com.ada.area  地区功能
* com.ada.article 文章功能
* com.ada.data hibernate公共包
* com.ada.feed 动态功能
* com.ada.plugin 插件功能
* com.ada.question 问答功能
* com.ada.shiro shiro权限功能依赖用户模块
* com.ada.template* 各种代码生成工具
* com.ada.user 用户模块
* com.young.word 验证码生成
* com.young.security 各种安全工具

### 交流方式

* QQ群:366362344   [一尺三寸开源系统QQ群](http://jq.qq.com/?_wv=1027&k=2Kq3VgV)
* QQ:2601035599
* 微博：http://weibo.com/iwanspace

### 开源协议

如果您的网站使用了 icore, 请在网站页面页脚处保留 icore相关版权信息链接

### 网站地址
http://www.yichisancun.com

测试账号

运维：账号yunwei密码123456

文案：账号wenan密码123456

股票：账号stock密码123456

![网站首页](http://7xrn5v.com1.z0.glb.clouddn.com/1f70b77ab169a848b87b5de845737e4f "在这里输入图片标题")

