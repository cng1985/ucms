package com.quhaodian.ucms.data;

import com.haoxuer.discover.article.data.entity.SensitiveWord;
import com.haoxuer.discover.article.data.service.SensitiveWordService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;


public class SensitiveWordTest extends SpringTest {

	@Autowired
	SensitiveWordService wordService;

	@Test
	public void testadd() {
		
		
		String[] ws = new String[] { "囚徒", "阿扁推翻", "翻身", "阿宾", "阿賓", "挨了一炮", "爱液横流",
				"安街逆", "安局办公楼", "安局豪华", "安门事", "安眠藥", "案的准确", "八九民", "八九学",
				"八九政治", "把病人整", "把邓小平", "把学生整", "罢工门", "白黄牙签", "败培训", "办本科",
				"办理本科", "办理各种", "办理票据", "办理文凭", "办理真实", "办理证书", "办理资格", "办文凭",
				"办怔", "办证", "半刺刀", "辦毕业", "辦證", "谤罪获刑", "磅解码器", "磅遥控器",
				"宝在甘肃修", "保过答案", "报复执法", "爆发骚", "北省委门", "被打死", "被指抄袭", "被中共",
				"本公司担", "本无码", "毕业證", "变牌绝", "辩词与梦", "冰毒", "冰火毒", "冰火佳",
				"冰火九重", "冰火漫", "冰淫传", "冰在火上", "波推龙", "博彩娱", "博会暂停", "博园区伪",
				"不查都", "不查全", "不思四化", "布卖淫女", "部忙组阁", "部是这样", "才知道只生", "财众科技",
				"采花堂", "踩踏事", "苍山兰", "苍蝇水", "藏春阁", "藏獨", "操了嫂", "操嫂子", "策没有不",
				"插屁屁", "察象蚂", "拆迁灭", "车牌隐", "成人电", "成人卡通", "成人聊", "成人片", "成人视",
				"成人图", "成人文", "成人小", "城管灭", "惩公安", "惩贪难", "充气娃", "冲凉死", "抽着大中",
				"抽着芙蓉", "出成绩付", "出售发票", "出售军", "穿透仪器", "春水横溢", "纯度白", "纯度黄",
				"次通过考", "催眠水", "催情粉", "催情药", "催情藥", "挫仑", "达毕业证", "答案包",
				"答案提供", "打标语", "打错门", "打飞机专", "打死经过", "打死人", "打砸办公", "大鸡巴",
				"大雞巴", "大纪元", "大揭露", "大奶子", "大批贪官", "大肉棒", "大嘴歌", "代办发票",
				"代办各", "代办文", "代办学", "代办制", "代辦", "代表烦", "代開", "代考", "代理发票",
				"代理票据", "代您考", "代您考", "代写毕", "代写论", "代孕", "贷办", "贷借款", "贷开",
				"戴海静", "当代七整", "当官要精", "当官在于", "党的官", "党后萎", "党前干劲", "刀架保安",
				"导的情人", "导叫失", "导人的最", "导人最", "导小商", "到花心", "得财兼", "的同修",
				"灯草和", "等级證", "等屁民", "等人老百", "等人是老", "等人手术", "邓爷爷转", "邓玉娇",
				"地产之歌", "地下先烈", "地震哥", "帝国之梦", "递纸死", "点数优惠", "电狗", "电话监",
				"电鸡", "甸果敢", "蝶舞按", "丁香社", "丁子霖", "顶花心", "东北独立", "东复活", "东京热",
				"東京熱", "洞小口紧", "都当警", "都当小姐", "都进中央", "毒蛇钻", "独立台湾", "赌球网",
				"短信截", "对日强硬", "多美康", "躲猫猫", "俄羅斯", "恶势力操", "恶势力插", "恩氟烷",
				"儿园惨", "儿园砍", "儿园杀", "儿园凶", "二奶大", "发牌绝", "发票出", "发票代", "发票销",
				"發票", "法车仑", "法伦功", "法轮", "法轮佛", "法维权", "法一轮", "法院给废", "法正乾",
				"反测速雷", "反雷达测", "反屏蔽", "范燕琼", "方迷香", "防电子眼", "防身药水", "房贷给废",
				"仿真枪", "仿真证", "诽谤罪", "费私服", "封锁消", "佛同修", "夫妻交换", "福尔马林",
				"福娃的預", "福娃頭上", "福香巴", "府包庇", "府集中领", "妇销魂", "附送枪", "复印件生",
				"复印件制", "富民穷", "富婆给废", "改号软件", "感扑克", "冈本真", "肛交", "肛门是邻",
				"岡本真", "钢针狗", "钢珠枪", "港澳博球", "港馬會", "港鑫華", "高就在政", "高考黑",
				"高莺莺", "搞媛交", "告长期", "告洋状", "格证考试", "各类考试", "各类文凭", "跟踪器",
				"工程吞得", "工力人", "公安错打", "公安网监", "公开小姐", "攻官小姐", "共狗", "共王储",
				"狗粮", "狗屁专家", "鼓动一些", "乖乖粉", "官商勾", "官也不容", "官因发帖", "光学真题",
				"跪真相", "滚圆大乳", "国际投注", "国家妓", "国家软弱", "国家吞得", "国库折", "国一九五七",
				"國內美", "哈药直销", "海访民", "豪圈钱", "号屏蔽器", "和狗交", "和狗性", "和狗做",
				"黑火药的", "红色恐怖", "红外透视", "紅色恐", "胡江内斗", "胡紧套", "胡錦濤", "胡适眼",
				"胡耀邦", "湖淫娘", "虎头猎", "华国锋", "华门开", "化学扫盲", "划老公", "还会吹萧",
				"还看锦涛", "环球证件", "换妻", "皇冠投注", "黄冰", "浑圆豪乳", "活不起", "火车也疯",
				"机定位器", "机号定", "机号卫", "机卡密", "机屏蔽器", "基本靠吼", "绩过后付", "激情电",
				"激情短", "激情妹", "激情炮", "级办理", "级答案", "急需嫖", "集体打砸", "集体腐", "挤乳汁",
				"擠乳汁", "佳静安定", "家一样饱", "家属被打", "甲虫跳", "甲流了", "奸成瘾", "兼职上门",
				"监听器", "监听王", "简易炸", "江胡内斗", "江太上", "江系人", "江贼民", "疆獨", "蒋彦永",
				"叫自慰", "揭贪难", "姐包夜", "姐服务", "姐兼职", "姐上门", "金扎金", "金钟气", "津大地震",
				"津地震", "进来的罪", "京地震", "京要地震", "经典谎言", "精子射在", "警察被", "警察的幌",
				"警察殴打", "警察说保", "警车雷达", "警方包庇", "警用品", "径步枪", "敬请忍", "究生答案",
				"九龙论坛", "九评共", "酒象喝汤", "酒像喝汤", "就爱插", "就要色", "举国体", "巨乳",
				"据说全民", "绝食声", "军长发威", "军刺", "军品特", "军用手", "开邓选", "开锁工具", "開碼",
				"開票", "砍杀幼", "砍伤儿", "康没有不", "康跳楼", "考答案", "考后付款", "考机构", "考考邓",
				"考联盟", "考前答", "考前答案", "考前付", "考设备", "考试包过", "考试保", "考试答案",
				"考试机构", "考试联盟", "考试枪", "考研考中", "考中答案", "磕彰", "克分析", "克千术",
				"克透视", "空和雅典", "孔摄像", "控诉世博", "控制媒", "口手枪", "骷髅死", "快速办",
				"矿难不公", "拉登说", "拉开水晶", "来福猎", "拦截器", "狼全部跪", "浪穴", "老虎机",
				"雷人女官", "类准确答", "黎阳平", "李洪志", "李咏曰", "理各种证", "理是影帝", "理证件",
				"理做帐报", "力骗中央", "力月西", "丽媛离", "利他林", "连发手", "聯繫電", "炼大法",
				"两岸才子", "两会代", "两会又三", "聊视频", "聊斋艳", "了件渔袍", "猎好帮手", "猎枪销",
				"猎槍", "獵槍", "领土拿", "流血事", "六合彩", "六死", "六四事", "六月联盟", "龙湾事件",
				"隆手指", "陆封锁", "陆同修", "氯胺酮", "乱奸", "乱伦类", "乱伦小", "亂倫", "伦理大",
				"伦理电影", "伦理毛", "伦理片", "轮功", "轮手枪", "论文代", "罗斯小姐", "裸聊网", "裸舞视",
				"落霞缀", "麻古", "麻果配", "麻果丸", "麻将透", "麻醉狗", "麻醉枪", "麻醉槍", "麻醉藥",
				"蟆叫专家", "卖地财政", "卖发票", "卖银行卡", "卖自考", "漫步丝", "忙爱国", "猫眼工具",
				"毛一鲜", "媒体封锁", "每周一死", "美艳少妇", "妹按摩", "妹上门", "门按摩", "门保健",
				"門服務", "氓培训", "蒙汗药", "迷幻型", "迷幻药", "迷幻藥", "迷昏口", "迷昏药", "迷昏藥",
				"迷魂香", "迷魂药", "迷魂藥", "迷奸药", "迷情水", "迷情药", "迷藥", "谜奸药", "蜜穴",
				"灭绝罪", "民储害", "民九亿商", "民抗议", "明慧网", "铭记印尼", "摩小姐", "母乳家",
				"木齐针", "幕没有不", "幕前戲", "内射", "南充针", "嫩穴", "嫩阴", "泥马之歌", "你的西域",
				"拟涛哥", "娘两腿之间", "妞上门", "浓精", "怒的志愿", "女被人家搞", "女激情", "女技师",
				"女人和狗", "女任职名", "女上门", "女優", "鸥之歌", "拍肩神药", "拍肩型", "牌分析",
				"牌技网", "炮的小蜜", "陪考枪", "配有消", "喷尿", "嫖俄罗", "嫖鸡", "平惨案", "平叫到床",
				"仆不怕饮", "普通嘌", "期货配", "奇迹的黄", "奇淫散", "骑单车出", "气狗", "气枪", "汽狗",
				"汽枪", "氣槍", "铅弹", "钱三字经", "枪出售", "枪的参", "枪的分", "枪的结", "枪的制",
				"枪货到", "枪决女犯", "枪决现场", "枪模", "枪手队", "枪手网", "枪销售", "枪械制", "枪子弹",
				"强权政府", "强硬发言", "抢其火炬", "切听器", "窃听器", "禽流感了", "勤捞致", "氢弹手",
				"清除负面", "清純壆", "情聊天室", "情妹妹", "情视频", "情自拍", "氰化钾", "氰化钠",
				"请集会", "请示威", "请愿", "琼花问", "区的雷人", "娶韩国", "全真证", "群奸暴", "群起抗暴",
				"群体性事", "绕过封锁", "惹的国", "人权律", "人体艺", "人游行", "人在云上", "人真钱",
				"认牌绝", "任于斯国", "柔胸粉", "肉洞", "肉棍", "如厕死", "乳交", "软弱的国", "赛后骚",
				"三挫", "三级片", "三秒倒", "三网友", "三唑", "骚妇", "骚浪", "骚穴", "骚嘴",
				"扫了爷爷", "色电影", "色妹妹", "色视频", "色小说", "杀指南", "山涉黑", "煽动不明",
				"煽动群众", "上门激", "烧公安局", "烧瓶的", "韶关斗", "韶关玩", "韶关旭", "射网枪",
				"涉嫌抄袭", "深喉冰", "神七假", "神韵艺术", "生被砍", "生踩踏", "生肖中特", "圣战不息",
				"盛行在舞", "尸博", "失身水", "失意药", "狮子旗", "十八等", "十大谎", "十大禁", "十个预言",
				"十类人不", "十七大幕", "实毕业证", "实体娃", "实学历文", "士康事件", "式粉推", "视解密",
				"是躲猫", "手变牌", "手答案", "手狗", "手机跟", "手机监", "手机窃", "手机追", "手拉鸡",
				"手木仓", "手槍", "守所死法", "兽交", "售步枪", "售纯度", "售单管", "售弹簧刀", "售防身",
				"售狗子", "售虎头", "售火药", "售假币", "售健卫", "售军用", "售猎枪", "售氯胺", "售麻醉",
				"售冒名", "售枪支", "售热武", "售三棱", "售手枪", "售五四", "售信用", "售一元硬", "售子弹",
				"售左轮", "书办理", "熟妇", "术牌具", "双管立", "双管平", "水阎王", "丝护士", "丝情侣",
				"丝袜保", "丝袜恋", "丝袜美", "丝袜妹", "丝袜网", "丝足按", "司长期有", "司法黑",
				"私房写真", "死法分布", "死要见毛", "四博会", "四大扯", "个 四小码", "苏家屯集", "诉讼集团",
				"素女心", "速代办", "速取证", "酸羟亚胺", "蹋纳税", "太王四神", "泰兴幼", "泰兴镇中",
				"泰州幼", "贪官也辛", "探测狗", "涛共产", "涛一样胡", "特工资", "特码", "特上门",
				"体透视镜", "替考", "替人体", "天朝特", "天鹅之旅", "天推广歌", "田罢工", "田田桑",
				"田停工", "庭保养", "庭审直播", "通钢总经", "偷電器", "偷肃贪", "偷听器", "偷偷贪",
				"头双管", "透视功能", "透视镜", "透视扑", "透视器", "透视眼镜", "透视药", "透视仪",
				"秃鹰汽", "突破封锁", "突破网路", "推油按", "脱衣艳", "瓦斯手", "袜按摩", "外透视镜",
				"外围赌球", "湾版假", "万能钥匙", "万人骚动", "王立军", "王益案", "网民案", "网民获刑",
				"网民诬", "微型摄像", "围攻警", "围攻上海", "维汉员", "维权基", "维权人", "维权谈",
				"委坐船", "谓的和谐", "温家堡", "温切斯特", "温影帝", "溫家寶", "瘟加饱", "瘟假饱",
				"文凭证", "文强", "纹了毛", "闻被控制", "闻封锁", "瓮安", "我的西域", "我搞台独", "乌蝇水",
				"无耻语录", "无码专", "五套功", "五月天", "午夜电", "午夜极", "武警暴", "武警殴",
				"武警已增", "务员答案", "务员考试", "雾型迷", "西藏限", "西服进去", "希脏", "习进平",
				"习晋平", "席复活", "席临终前", "席指着护", "洗澡死", "喜贪赃", "先烈纷纷", "现大地震",
				"现金投注", "线透视镜", "限制言", "陷害案", "陷害罪", "相自首", "香港论坛", "香港马会",
				"香港一类", "香港总彩", "硝化甘", "小穴", "校骚乱", "协晃悠", "写两会", "泄漏的内",
				"新建户", "新疆叛", "新疆限", "新金瓶", "新唐人", "信访专班", "信接收器", "兴中心幼",
				"星上门", "行长王益", "形透视镜", "型手枪", "姓忽悠", "幸运码", "性爱日", "性福情",
				"性感少", "性推广歌", "胸主席", "徐玉元", "学骚乱", "学位證", "學生妹", "丫与王益",
				"烟感器", "严晓玲", "言被劳教", "言论罪", "盐酸曲", "颜射", "恙虫病", "姚明进去", "要人权",
				"要射精了", "要射了", "要泄了", "夜激情", "液体炸", "一小撮别", "遗情书", "蚁力神",
				"益关注组", "益受贿", "阴间来电", "陰唇", "陰道", "陰戶", "淫魔舞", "淫情女", "淫肉",
				"淫騷妹", "淫兽", "淫兽学", "淫水", "淫穴", "隐形耳", "隐形喷剂", "应子弹", "婴儿命",
				"咏妓", "用手枪", "幽谷三", "游精佑", "有奶不一", "右转是政", "幼齿类", "娱乐透视",
				"愚民同", "愚民政", "与狗性", "玉蒲团", "育部女官", "冤民大", "鸳鸯洗", "园惨案",
				"园发生砍", "园砍杀", "园凶杀", "园血案", "原一九五七", "原装弹", "袁腾飞", "晕倒型",
				"韵徐娘", "遭便衣", "遭到警", "遭警察", "遭武警", "择油录", "曾道人", "炸弹教", "炸弹遥控",
				"炸广州", "炸立交", "炸药的制", "炸药配", "炸药制", "张春桥", "找枪手", "找援交",
				"找政法委副", "赵紫阳", "针刺案", "针刺伤", "针刺事", "针刺死", "侦探设备", "真钱斗地",
				"真钱投注 真善忍", "真实文凭", "真实资格", "震惊一个民", "震其国土", "证到付款", "证件办",
				"证件集团", "证生成器", "证书办", "证一次性", "政府操", "政论区", "證件", "植物冰",
				"殖器护", "指纹考勤", "指纹膜", "指纹套", "至国家高", "志不愿跟", "制服诱", "制手枪",
				"制证定金", "制作证件", "中的班禅", "中共黑", "中国不强", "种公务员", "种学历证", "众像羔",
				"州惨案", "州大批贪", "州三箭", "宙最高法", "昼将近", "主席忏", "住英国房", "助考",
				"助考网", "专业办理", "专业代", "专业代写", "专业助", "转是政府", "赚钱资料", "装弹甲",
				"装枪套", "装消音", "着护士的胸", "着涛哥", "姿不对死", "资格證", "资料泄", "梓健特药",
				"字牌汽", "自己找枪", "自慰用", "自由圣", "自由亚", "总会美女", "足球玩法", "最牛公安",
				"醉钢枪", "醉迷药", "醉乙醚", "尊爵粉", "左转是政", "作弊器", "作各种证", "作硝化甘",
				"唑仑", "做爱小", "做原子弹", "做证件", "龟头", "龟公", "龜頭", "龚平", "黄色网站",
				"黄色网", "黄色电影", "黄色片", "黄色照片", "黄色激情小电影", "黄色激情", "黄色漫画",
				"黄色文学", "黄色影视", "黄色小说", "黄色小电影", "黄色图片", "黄色免费电影", "黄色书刊",
				"黄网导航", "黄站", "黄祸", "黄片", "黄海暗杀事件", "黄海暗杀", "黄海事件", "黄小说",
				"黃色電影", "黃色小電影", "黃色圖片", "黃海暗殺事件", "麻醉迷魂迷情", "麻醉迷幻極品",
				"麻醉迷幻极品", "麻果", "鸦片渣", "鸦片液", "骚穴骚水", "鸡巴", "鸡奸", "鸡吧", "鸡八",
				"魔难论", "高樹三姐妹", "高校骚乱", "高校騷亂", "高校群体事件", "高校暴亂", "高校暴乱",
				"高树三姐妹", "高效春药", "骚逼小说", "骚逼", "骚货", "骚痒", "骚水", "骚比", "骚屄",
				"骚婊", "骚姐姐", "骚姊姊", "骚妹", "骚女", "骆冰淫传", "騷逼", "騷穴", "香港黄大仙",
				"香港独立", "香港GHB迷幻水", "香港GHB水", "香功", "风骚侍女", "风骚", "风流教皇",
				"风流教师", "颠覆国家政权", "颠覆中国政权", "颠覆中华人民共和国政权", "顶得好深", "韶关事件",
				"鞭满", "靠你妈", "靓钕村", "靓穴", "青海无上师", "青楼十二房", "露逼", "露胸图", "露穴",
				"露毛", "露拉3D", "露乳图", "露乳", "霍比预言", "電車之狼", "雪山狮子旗", "雪山狮子",
				"雞雞", "雞巴", "雞八", "集体做爱", "陰部", "陰蒂", "陰莖", "陰茎", "陰穴", "陰毛",
				"陰核", "陰户", "陪裸", "陪睡觉", "降灾民", "阿娇艳照", "阿姨的偷窥", "阴阜", "阴门",
				"阴部", "阴道被捅", "阴道图", "阴道", "阴蒂", "阴茎增大", "阴茎", "阴胫", "阴肉",
				"阴纯", "阴精狂泻", "阴精", "阴穴", "阴水", "阴毛小穴", "阴毛", "阴核", "阴护", "阴户",
				"阴壁", "阴囊", "阴唇", "阴丘", "阴di", "阴dao", "阴chun", "阳精", "阳物",
				"阳具", "门徒会", "针刺事件", "金普提上师", "野外激情", "酱猪媳", "邪恶的党", "邪恶江泽民",
				"邪恶共产党", "邪恶党徒", "邪党", "邓笑贫", "邓矮子", "邓狗", "邓二世", "避孕膜", "逼穴",
				"逼真女下体", "逼痒", "逼毛", "逼样", "逼好痒", "造爱", "造业", "逗肛", "逗乳",
				"逃亡艳旅", "退出共产党", "退出共产", "退出党团队", "退出中共", "退党声明", "退党",
				"迷魂药激情", "迷魂洞", "迷藥迷魂藥", "迷殲藥", "迷歼药", "迷幻液", "迷奸表妹的小香穴", "迷奸",
				"迫害珐工力国际组织", "迫害法轮功", "达赖领奖", "达赖雪山狮子旗", "达米宣教会", "辽阳工潮",
				"辣妹艳书辣图屋", "辣妹午夜图书屋", "轮暴致死", "轮攻", "轮工", "轮子功", "轮奸虐杀",
				"轮奸抽插", "轮奸", "轮公", "转让冰毒配方", "转法轮", "转法论", "转化论", "车仑大法",
				"车仑", "轉法輪", "輪攻", "輪功", "輪公", "踩江", "跳蛋", "乱交", "超淫杂交女",
				"走入邪悟者", "赤色杀意", "赤匪", "赤化", "赤党", "贼民", "贱逼", "贱货", "贱比",
				"贱人", "贞操带手铐", "贞操", "買春堂", "调情", "谁是胡的接班人", "诺龙", "诺世纪", "诱奸",
				"诱人双峰", "话在肉身显现", "评共产党是什么", "论攻", "论功", "论公", "讲法传功", "護士24點",
				"警花肉搏强奸党", "警匪一家", "論攻", "論功", "論公", "解体中共", "视频裸聊", "视频脱衣",
				"观音法门", "小穴鸡巴", "西藏骚乱", "西藏青年大会", "西藏獨立", "西藏独立", "西藏独",
				"西藏流亡政府", "西藏正义", "西藏暴动", "西藏暴乱", "西藏基金会", "西藏国家民主党", "西藏国",
				"西藏作家组织", "西藏人民大起义运动", "西藏之页", "西藏之声", "西单民主墙", "裸陪", "裸聊合法",
				"裸聊", "裸网", "裸干", "裸女對對碰", "裸女对对碰", "裸体写真", "裙底走光", "被虐", "被插",
				"被人干", "行房", "血腥清场", "血溅人民天堂", "蠢猪", "蜜穴被插", "蜜液", "蜜洞",
				"蜜汁肉缝", "蜜汁", "蜜壶", "蜜唇", "蛤蟆转世", "虐杀", "虐恋", "虎膽雄心", "藏青会",
				"藏独", "藏春閣", "藏字石", "藏妇会", "藏历新年骚乱", "蒙独", "蒙古独", "蒙古牧民联合会",
				"蒙古回归", "蒙古之友", "蒋公", "萬人暴动", "菱恝", "菩提法门", "菩提教会", "菩提功",
				"菊花蕾", "菊花穴", "菊花洞", "菊穴", "菊爆", "菊暴", "莹莹成人论坛", "莹穴", "荡妇",
				"草你妈", "茳民", "茎精", "芳香型智悟气功", "花瓣蜜液", "艳门照", "艳遇编年史", "艳舞",
				"艳欲", "艳情电影", "色阅网", "色诱", "色色五月天", "色色", "色空寺", "色界论坛",
				"色猫论坛", "色狼网", "色狼網", "色狼俱乐部", "色狼", "色淫", "色欲", "色情電視",
				"色情论坛", "色情自拍", "色情网站", "色情网", "色情網站", "色情电视", "色情电影", "色情片",
				"色情服务", "色情影视", "色情小電影", "色情小说", "色情小电影", "色情导航", "色情圖片",
				"色情图片", "色情六月天", "色情五月天", "色情", "色性社区", "色性", "色屋图片", "色图亚洲",
				"色图", "色友", "舔阴", "舔遍", "舔逼", "舔花苞", "舔舐", "舔肛", "舔穴", "舔私处",
				"舔批", "舔弄小穴", "舔弄", "舔屁沟", "舔奶", "舔吮", "舔便", "舔下面", "舔xue",
				"舌头舔", "舌头添", "臺灣獨立", "臭作", "自由西藏学生运动", "自由西藏", "自由网",
				"自由亚洲电台", "自由亚洲", "自由亚州", "自然功", "自焚", "自烧", "自杀指南", "自杀手册",
				"自拍干炮", "自慰", "臀洞", "臀沟", "臀孔", "臀丘", "脱衣视频", "脱衣舞", "脱党",
				"脫衣舞", "脏独", "脏毒", "胯上套弄屁股", "胯上", "胡锦滔", "胡锦淘", "胡锦涛长子", "胡鍧",
				"胡进涛", "胡紧掏", "胡系", "胡的接班人", "胡瘟", "胡温保守派", "胡温", "胡派军委",
				"胡派人马", "胡派", "胡江风云", "胡江曾", "胡江关系", "胡江争斗", "胡江", "胡景涛",
				"胡中央", "胡下台", "胡j涛", "胡J涛", "背飞凫", "肾源", "肥穴", "肤白胸大", "股股下流",
				"肛插", "肛恋", "肛交淫水", "肏这", "肏穴", "肏破", "肏死", "肏我", "肏干", "肏屄",
				"肏娘", "肏妹妹", "肏妳", "肏她", "肏入", "肉茎", "肉缝", "肉穴", "肉洞抽插", "肉欲",
				"肉棒阴唇", "肉棒舔弄", "肉棒淫水", "肉棒对准穴口", "肉棒", "肉棍淫水", "肉根", "肉屄",
				"肉壶", "肉圈", "肉击", "肉具", "肉体交融", "肉丘", "老江", "老毛", "老师穴",
				"老师的穴", "老婊子", "老人政治", "群射", "群奸", "美腿寫真", "美腿写真", "美穴",
				"美眉图库", "美狐图片网", "美屄", "美少妇的哀羞", "美少女麻雀", "美少女", "美女黄色",
				"美女野球拳", "美女视频", "美女視頻", "美女裸体", "美女脱衣", "美女按摩", "美女护陪",
				"美女图坊", "美女出售", "美女全套", "美女做愛", "美女人体艺术", "美女上门", "美国维吾尔",
				"网络活动颠覆", "网上淫秽色情游戏", "缩阴", "绿坝娘之歌", "绿坝娘", "维多利亚包", "维吾尔信息社",
				"维吾尔人权", "绳虐", "统独论坛", "统独", "绝爱故事网", "练功群众", "纪股票市场五卅惨案",
				"纪念达赖喇嘛流亡49周年", "约会强暴药", "红血丝", "红色角落", "红潮谎言录", "红潮艳史",
				"红朝谎言录", "红智", "红志", "红兽", "維多利亞包", "絲襪寫真", "紧窄肉棒", "素女", "女孩",
				"紅智", "紅志", "精液", "粪青", "粗大的玩意", "粗口歌", "粉红小逼", "粉红小b", "粉嫩小洞",
				"簧片", "等你插", "第三道路党", "第三党", "第一次破处", "童屹", "窝囊的中国", "窝囊中国",
				"突厥斯坦", "空劲功", "空中民主墙", "穴里好痒", "穴里", "穴肉", "穴穴", "穴痒用力", "穴痒",
				"穴淫", "穴洞", "穴口舔弄", "穴口", "穴前庭", "秘處", "秘肉", "秘唇", "私密处",
				"福娃火车相撞地震", "福娃出事", "禅密功", "禁断少女", "禁忌试玩", "禁忌試玩", "禁室培欲",
				"神鬼妓", "神鬼18妓", "神雕外传之郭襄", "神通加持法", "神秘的死刑", "社会主义灭亡",
				"硅谷民主促进会", "破迷与正心", "破处", "砝轮", "砝伦", "砝仑", "石戈", "真耶稣教会",
				"真念", "真善忍", "真名三退", "看JJ", "百媚图库", "百万极品爽书", "白立朴", "白秀华",
				"白梦", "白军", "發輪", "發論", "發淪", "發倫", "癡漢是犯罪", "瘟家鸨", "瘟家宝",
				"瘟家", "瘟假鸨", "病业说", "疾病业债说", "疆独藏独", "疆独", "留园网", "男性服务", "男妓",
				"男女自慰用品", "男女秘事", "男女公关", "男公关", "男体图片", "电影色情", "电动葫芦",
				"电信路藏民", "用力骚穴", "用力抽插挺动", "生孩子没屁眼", "瓮安骚乱", "瓮安暴乱", "瑷液",
				"瑞安事件", "珐輪功", "珐工力学", "现在的政府", "现在的共产党", "现在的党", "现世现报",
				"王子淫传", "王八蛋", "玉蒲團", "玉蒲团之偷情宝鉴", "玉穴", "玉杵捣花径", "玉女淫情",
				"玉女吹箫", "猪聋畸", "猪毛", "猪操", "猪容", "猛男强奸", "猛操", "猛插", "狼友性息",
				"狼友俱乐部", "独立台湾会", "独立中文笔会", "独夫民贼", "独夫", "狠肏", "狗逼", "狗日的",
				"狗操", "狗屎", "狗娘养的", "狗卵子", "狗b", "狗B", "狅操", "狄玉明", "狂穴", "狂泻",
				"狂操", "狂搞", "狂插", "狂干", "犬交", "特务民运", "牛逼", "牛比", "爽电影", "爽片",
				"爽死", "爱滋村里的爱", "爱液", "爱上师娘的床", "爆菊", "爆破", "爆乳", "熟女俱乐部",
				"熟女之惑", "煞笔", "热比娅", "烂逼", "烂货", "烂比", "点对点裸聊", "炮轰密妃", "炮片",
				"炮图", "灵修团体", "灯草和尚", "灭共", "灭中共", "激情黄色", "激情電影", "激情诱惑",
				"激情视频", "激情視頻", "激情自拍", "激情聊天", "激情美女", "激情网站", "激情短片", "激情电话",
				"激情电影", "激情淫", "激情文學", "激情文学", "激情成人", "激情小電影", "激情小说",
				"激情小电影", "激情大片", "激情在线", "激情圖片", "激情图片", "激情图吧", "激情写真",
				"激情交友", "激情一刻现场脱", "潮吹", "漠视生命自私到了极点的中共政权", "满床春色", "湿穴",
				"温加饱", "温元凯", "温休曾退", "温云松", "温下台", "渗透中共", "清纯少妇", "清海无上师",
				"清海师父", "清华帮", "添阴", "添逼", "添空", "添你下面", "淫魔舞会", "淫魔抽送", "淫魔",
				"淫靡", "淫阴", "淫间道", "淫道", "淫逼", "淫贴图", "淫蟲", "淫虫", "淫虐", "淫蕩少婦",
				"淫蕩孕婦", "淫蕩丗家", "淫蕩", "淫荡少妇之白洁", "淫荡少妇", "淫荡娃娃", "淫荡妹妹", "淫荡妈",
				"淫荡套动", "淫荡", "淫色网站", "淫色小说", "淫色", "淫臀", "淫美贴图", "淫笑肉棒", "淫笑",
				"淫穴淫水", "淫秽词语", "淫秽电影", "淫秽", "淫男", "淫电影", "淫片", "淫液", "淫浪",
				"淫洞", "淫汁", "淫水鸡巴", "淫水胯下", "淫水肉洞", "淫水火棒", "淫水浓精", "淫水操逼",
				"淫水挺动", "淫水抽插", "淫水带出", "淫水好爽用力", "淫水好爽", "淫水乱伦", "淫民", "淫母",
				"淫欲", "淫棍", "淫术炼金士", "淫書", "淫暴", "淫情贴图", "淫情女老师", "淫情女教师",
				"淫影院", "淫影片", "淫影", "淫屄", "淫娘", "淫妻", "淫妹", "淫妇", "淫奸", "淫女老师",
				"淫女电影", "淫女在线", "淫女图", "淫女", "淫声鸡巴", "淫声猛插", "淫声", "淫图穴",
				"淫图乱伦", "淫图", "淫唇", "淫叫舒服", "淫叫用力", "淫叫玩弄", "淫叫快速抽插", "淫叫快速",
				"淫叫好舒服", "淫叫好爽", "淫叫", "淫兽肉棒", "淫兽学院", "淫兽学园", "淫传", "淫亂電影",
				"淫亂", "淫乱的女子", "淫乱电影", "淫乱", "淫书", "淫b", "淪攻", "淪功", "淪公",
				"涩色成人社区", "涩色在线", "涩媳妇", "涉台政局", "消业论", "消业之说", "消业", "涂运普",
				"海外护法", "浪淫", "浪妻", "浪叫要飞了", "浪叫", "流脑", "流水穴", "流氓警察", "流氓民运",
				"流氓无产者", "流亡藏人", "流亡中的自在", "流了好多的水", "流了好多水", "洪法交流", "洪法",
				"洪治", "洪水的志向", "洪智", "洪志", "洪巨平", "洪哲胜", "洪吟", "洪传", "津人治津",
				"泽民轮功", "波霸", "泡友", "法轮弟子", "法轮工", "法轮大法好", "法轮大法", "法轮功",
				"法轮公", "法轮佛法", "法轮义", "法车仑工力", "法輪功", "法輪", "法谪功", "法谪", "法论功",
				"法论", "法論", "法西藏主义", "法能功", "法纶", "法淪", "法沦", "法某功", "法抡功",
				"法抡", "法愣", "法囵", "法十轮十功", "法功", "法力像佛", "法倫", "法伦", "法仑功",
				"法仑", "法lun功", "法lun", "法X功", "法O功", "法L功", "法L", "法0功", "沦攻",
				"沦功", "沦公", "沙皇李长春", "沈昌功", "沈昌人体科技", "沁园春萨达姆", "江黑心", "江魔头",
				"江鬼", "江驴", "江路线", "江贼", "江责民", "江蛤蟆", "江胡", "江者民", "江老贼",
				"江罗集团", "江罗", "江系人马", "江系", "江祸心", "江神经", "江理论", "江猪媳", "江猪",
				"江独裁", "江牌", "江澤民", "江湖淫娘", "江浙民", "江流氓", "江派和胡派", "江派人马",
				"江派", "江泽民瑞士", "江泽民宋祖英", "江泽公审", "江氏集团", "江氏政治局", "江氏政治委员",
				"江氏家族", "江氏", "江毒", "江梳头", "江核心", "江昏君", "江择min", "江折民", "江戏子",
				"江恶人", "江家帮", "江宰民", "江宋", "江嫡系", "江则民", "江八点", "江作秀", "江人马",
				"江二世", "江主席一党专制", "江丑闻", "江三秀", "江三条腿", "江z民", "江ze民", "江core",
				"汕尾事件", "氵去车仑工力", "氵去", "水晶冰凤", "氯硝安定", "氯三苯乙烯", "氟硝西泮", "民阵",
				"民運", "民选参政", "民运分子", "民运信息中心", "民运", "民联", "民猪", "民殇", "民意论坛",
				"民主还专政", "民主评论", "民主论坛", "民主女神", "民主墙", "民主之声", "民主不能等待",
				"民为法执", "毛都露出", "毛贼东", "毛穴", "毛片", "毛爷爷复活", "毛派", "毛泽东复活",
				"毛时代大饥荒揭秘", "淫色贴图", "毛妹妹社区", "毛厕洞", "毛厕东", "毛共", "毛主席復活",
				"毛主席小平床", "毛主席复活", "毛一鮮", "母子情欲小说", "母子乱伦", "母之欲火", "殉道圣人",
				"死刑犯现场枪毙", "死刑犯图片", "死刑枪毙", "死亡筆記", "死亡笔记", "死亡日誌", "死亡日志",
				"武装反抗", "武藤蘭", "武藤兰", "武腾兰", "正邪大决战", "正派民运", "正法时期", "正法",
				"正念正行", "正念", "正信", "正义党论坛", "欲生欲死", "欲火高涨抽插", "欲火高涨", "欲望格鬥",
				"欲望格斗", "欲望地下城", "欲望候车室", "欲望之血", "欲仙欲死", "欧美色图", "欧美淫乱",
				"欧洲圆明网", "槍決現場", "槍決女犯", "梦网洪志", "梦娃网", "梦中的女孩", "梁擎墩", "格庵遗录",
				"根浴", "枪货到付款", "枪淫少妇", "枪油", "林彪事件真相", "极色社区", "极品穴", "李鸿智",
				"李鸿志", "李红痔", "李红智", "李红志", "李洪誌", "李洪痣", "李洪智", "李洪宽", "李洪X",
				"李弘旨", "李宏治", "李宏智", "李宏志", "李大轮子", "李大尸", "李三共志", "权斗", "杂种",
				"杀黑庄", "杀猪粉", "杀民迎佛", "杀庄一肖", "杀庄", "杀害学生", "杀人盗器官", "杀人事件",
				"朴鸣呼", "朱颜血", "朱溶剂", "朱毛", "朱基", "末世论", "末世劫难", "未来震源", "朝河蘭",
				"朝河兰", "會陰", "最淫官员", "最新黄站", "曾道人内部", "暴菊", "暴政", "暴干", "暴動",
				"暴动", "暴亂", "暴乱", "暧昧贴图论坛", "晶白体", "景德镇", "普提功", "是中国社会的爱滋病",
				"春藥", "春药嫩穴", "春药", "春宵", "春宫图", "春宫", "星光伴我淫", "昝爱宗", "昏迷剂",
				"昏藥", "昏药", "明星人体吧", "明慧", "明思网", "明心网", "明hui", "昆仑女神功",
				"旧民运", "日逼", "日死你", "日本幼女吃棒吞精淫图", "日本变态嫖客", "日月气功", "日批", "日您",
				"日你妈", "日你", "日他", "无帮国", "无官正", "无人性的政权", "新诸侯", "新语丝",
				"新观察论坛", "新约教会", "新疆獨立", "新疆独立", "新疆独", "新疆暴力", "新疆暴乱",
				"新疆反恐纪实", "新疆分裂主义", "新疆人七月四日哀悼", "新搪人电视台", "新搪人", "新唐人电视台",
				"新唐人晚会", "新党", "文革是毛的民主试验", "教徒人权", "救度众生说", "救度世人", "救度一切众生",
				"政治诉求", "政治恶棍", "政治小丑", "政治侦察学", "政治人祸的源头", "政府软弱", "政府无能",
				"放荡青春", "放入春药", "攻击党政", "支那猪", "支那", "支联会", "支持台湾独立", "操逼",
				"操蛋", "操穴", "操比", "操死", "操我", "操弄肉棒", "操弄", "操小逼", "操共产党",
				"操你媽", "操你娘", "操你妈", "操你", "操他", "操B", "擄童割器官", "摸胸", "摸奶门",
				"摸奶", "摩门教", "摩的司机大游行", "摇头玩", "摇头丸", "搞客吧", "搞个处女", "搖頭丸",
				"搔穴", "搅珠", "援藏网", "援交", "揭批书", "換妻", "插逼", "插进穴", "插进来",
				"插进你的下面", "插进你下面", "插肛", "插肉", "插穴", "插的好舒适", "插的好舒服", "插爆",
				"插插", "插我", "插弄", "插妹妹", "插她", "插女", "插入穴", "插你的下面", "插你",
				"插他", "插B", "提供小姐", "提供K粉", "推翻社会主义制度", "推翻专制独裁的共产党", "推油",
				"换妻俱乐部", "换偶", "捅我", "捅你", "挺胡", "挺动", "按摩棒", "按摩小姐", "择民",
				"招聘小姐", "招聘坐台少爷", "招聘坐台小姐", "招聘兼职美女", "招聘公主", "招妓", "招坐台少爷",
				"招坐台小姐", "招募小姐", "拍花子", "拍肩迷", "拍肩药", "拍肩粉", "拍肩神藥", "拍肩神",
				"拍丸", "拉萨事件", "拉帮游说", "抽送", "抽插搓揉乳房", "抽插", "抽捣", "抽弄",
				"抵制北京奥运", "报禁党禁", "报禁", "报码聊天", "护法", "护士的穴", "护士24点", "抢粮记",
				"抢圣火", "抡功", "抠逼", "抠b", "抗议中共当局", "找男", "找女", "打飞机口交打炮", "打炮",
				"打倒胡锦涛", "打倒温家宝", "打倒共产党", "打倒中共", "手淫", "我靠", "我草", "我的第一次外遇",
				"我的性启蒙", "我日", "我操你", "我操", "我包富婆", "我们自杀吧", "成佛做主", "成人频道",
				"成人電影", "成人雜誌", "成人配色", "成人贴图", "成人貼圖", "成人论坛", "成人論壇",
				"成人视频聊天", "成人视频", "成人表演", "成人聊天室", "成人网站", "成人网淫女", "成人网",
				"成人網站", "成人笑话", "成人笑", "成人站", "成人社區", "成人社区", "成人电影网", "成人电影",
				"成人激情聊天室", "成人激情", "成人漫画", "成人杂志", "成人文学", "成人性爱用品", "成人影院",
				"成人影视", "成人录像", "成人小说", "成人小說", "成人小电影", "成人导航", "成人在线电影",
				"成人在线", "成人圖片", "成人图片", "成人图库", "成人卫星频道", "成人午夜场", "成人俱乐部",
				"成人交友", "成人书库", "成人bt", "慈悲功", "惨绝人寰的大跃进", "惠澤社群", "惊暴双乳",
				"情色贴图", "情色论坛", "情色网", "情色电影", "情色文学", "情色影院", "情色影片", "情色帖图",
				"情色小说", "情色大片", "情色图片", "情色呻吟", "情色光碟", "情色", "情欲", "情杀",
				"情感陪护", "恶警", "恶党", "恩诺欣", "恐懼殺手", "恐惧杀手", "恐怖牢籠", "恐怖牢笼",
				"恐怖手段", "恐共", "性高潮", "性虐待", "性虐", "性虎", "性色社区", "性色", "性网站",
				"性網站", "性福人生", "性福", "性电影", "性爱网", "性爱电影", "性爱用品", "性爱日记",
				"性爱文学", "性爱文字", "性爱教育", "性爱教", "性爱录像", "性爱图片", "性爱", "性游戏",
				"性欲较强", "性欲泛滥", "性欲XY", "性欲", "性服务工作者", "性服务", "性教官", "性感美女写真",
				"性感猫装", "性感沙灘", "性感沙滩", "性感撲克", "性感扑克", "性愛電影", "性愛", "性息网",
				"性息", "性开放的", "性开放俱乐部", "性学教授", "性奴集中营", "性奴营", "性奴", "性器",
				"性启蒙老师", "性吧", "性友谊", "性免费电影", "性信息交友", "性伴侣", "性伙伴", "性交大赛",
				"性交", "性事", "快餐美女", "快餐小姐", "快操我", "心藏大恶", "强盗警察", "强烈抗议中共当局",
				"强暴", "强效失意药", "强效失忆药", "强姦", "强奸肉棒", "强奸淫水", "强奸制服", "强奸II",
				"强奸", "强j", "张戎", "弘法会", "弘法", "弄穴", "开苞", "开天目", "开垦民主",
				"开周天秘法", "建定防火", "建国党", "廣安事件", "庭妍奢恋", "废除劳教签名", "废统", "应招",
				"床第教战", "床上功夫", "广安事件", "广场事件", "幽幽性感写真网", "幼齿", "幼逼", "幼穴",
				"幼幼诱女", "幼女肉棒", "幼女", "幼交", "幼b", "平反六四", "干炮", "干死你", "干扰器",
				"干妳老母", "干妳娘", "干妳妈", "干妳", "干她", "干你娘", "干你妈逼", "干你妈b", "干你妈",
				"干你", "干他", "帮人怀孕", "师父法身", "巴哈依教", "巨波", "工运", "屠杀学生", "属灵教",
				"屙民", "屄裏", "屄友", "屄儿", "屁股肉棒", "屁穴", "屁眼", "就要摸图片网", "就爱色",
				"就去色色", "就去爱", "少爷坐台", "少年阿宾", "少妇自拍", "少妇穴", "少妇白洁", "少妇熟女",
				"少妇", "少女高潮", "少女峰", "少女俱乐部", "少儿勿入", "少儿不宜", "小鸡鸡", "小穴鸡巴淫水",
				"小穴淫液", "小穴好舒服", "小屄", "小姨子穴", "小姐招聘", "小姐招收", "小姐招募", "小姐快餐",
				"小姐坐台", "小姐口活打炮", "小姐上门", "小jj", "将则民", "射精", "射出来", "射乳",
				"封圣", "对共产党清算", "对中共的姑息就是对死难者的残忍", "富婆包我", "密穴", "寂寞少妇", "定情药",
				"定情粉", "官匪一家", "宗功", "宏法", "宏治", "宏恩", "宏志", "安魂网", "宇宙最高法理",
				"宇宙大法", "宇宙主佛", "它妈的", "学院暴动", "学运分子", "学运", "学自联", "学联",
				"学生暴动", "学生妹床上疯狂", "学生妹", "学生信仰", "学潮事件", "学潮", "嫩逼", "嫩穴你看",
				"嫩屄", "嫩b", "嫖雞", "嫖妓", "媽媽的他的", "媽個", "婬水", "婊子", "娇喘",
				"娇吟肉棒", "娇吟", "姐的穴", "姐开苞", "姐姐开苞", "妹的服务", "妹开苞", "妹妹穴",
				"妹妹的屄", "妹妹出售", "妓师", "妓女的口号", "妓女", "妈逼", "妈穴", "妈的", "妈批",
				"妈妈的他的", "妈了个逼", "妈个", "好痒", "好爽用力插穴", "好爽", "她的mm", "奸魔Ⅱ",
				"奸淫抽插", "奸淫", "奸杀", "奶子", "奶头真红", "女神欲望图库", "女神教", "女男出售",
				"女特服", "女性服务", "女孩上门", "女奴", "女士服务", "女友坊", "女体图片", "女体",
				"女伟哥", "女优片", "女优", "女人穴", "女人出售", "女ds", "套弄", "套动肉棒", "套动双乳",
				"套动", "夹紧肉棒", "失身药", "失身", "失意藥", "失忆药", "夫妻性事", "夫妻友论坛",
				"太阳圣殿教", "太王四神记", "太子黨", "天音功", "天音专辑", "天要灭中", "天父的儿女",
				"天灭中共", "天灭中", "天津事件", "天安门屠杀", "天安门大屠杀", "天安门事件", "大陆独裁者",
				"大陆同修", "大逼", "大记元", "大花逼", "大纪园", "大纪元杂志", "大纪元时报", "大纪元新闻网",
				"大紀元", "大禁", "大砝弟子", "大法洪传", "大法新闻社", "大法弟子", "大法师傅", "大法大纪园",
				"大法大福", "大法修炼者", "大法之声", "大法", "大庆工潮", "大宝法王", "大學騷亂", "大学骚乱",
				"大学艳遇史", "大学艳遇", "大学暴动", "大妓院", "大奶mm", "大圆满法", "大善大忍", "大史纪",
				"大参考", "大jj", "大b", "大B", "够鳋", "夜色激情导航", "夜总会公关", "夜场女模特",
				"夜场兼职", "夜勤病栋", "多美康安定片", "多夜情", "外蒙回归", "复临安息日会", "处男出售",
				"处女终结者", "处女穴", "处女出售", "塔克拉玛干人权联合会", "城市激情聊天室", "坚挺丰满的双峰",
				"坐台少爷", "坐台小姐", "坐台公关", "坐台", "坐交", "地震天谴", "地磅仪", "地下律师服务点",
				"圣灵重建教会", "圣殿教", "圣战组织", "土匪政府", "国际西藏运动", "国际援藏网", "国际声援西藏",
				"国色天香网", "国统纲领", "国统会", "国母宋祖英", "国之利刃", "回汉冲突", "回民猪", "回民暴动",
				"回忆六四", "四種當", "四种当", "四无目标", "四川独立", "四川独", "四川大地震异象揭密",
				"四二六社论", "四二五事件", "嗨药", "嗨妹", "嗑药", "喷雾迷药", "喷雾型迷药", "喷精",
				"喷潮", "喷你", "善恶有报", "售麻古", "售迷药", "售冰毒", "售k粉", "唐人电视台", "哲民",
				"和平演变道路已被中共堵死", "和平修练", "和奸成瘾", "吸吮阴肉", "吸吮淫水", "吸吮小穴", "含鸡鸡",
				"后面插", "同淫", "同性服务", "同性恋吧", "同志用品", "同志服务", "同居社區", "同居社区",
				"同化大珐返本归真", "同化大珐", "合一共融", "吃角子老虎", "台盟", "台獨", "台湾青年独立联盟",
				"台湾自由联盟", "台湾独立", "台湾独", "台湾有权独立", "台湾政论区", "台湾总统", "台湾性虎",
				"台湾建国运动组织", "台湾应该独立", "台湾国", "台湾团结联盟", "台湾共合国", "台湾AB成人导航",
				"台人制台", "台du", "叫鸡", "叫春", "叫床女优", "叫床", "叫小姐", "古方迷香", "口鉸",
				"口淫", "口活", "口交", "变频棒", "发骚", "发轮功陈果", "发轮功", "发轮", "发论功",
				"发论公", "发论", "发纶", "发浪", "发沦", "发正念", "发抡功", "发抡", "发情", "发囵",
				"发伦工", "发伦功", "发伦", "发仑da发", "发仑", "反禁摩签名", "反禁摩", "反社会主义",
				"反社会", "反攻大陆", "反对共产党", "反对共产主义", "反对党", "反宇宙", "反右题材", "反共言论",
				"反共传单", "反共", "反党", "反中游行", "反中共黑色暴力", "反中", "反G", "双腿间的禁地",
				"双性恋", "双峰", "双乳", "去色色", "去他娘的", "厦门大游行", "历史篡改者", "厅房公主",
				"卵蛋", "卖骚", "卖逼", "卖淫", "卖比", "卖春", "华藏功", "午夜激情", "升天",
				"千禧弘法", "十足十恶", "十大独裁", "十六世大宝法王", "十八禁", "十八摸", "十七大权力争霸战",
				"北京黑幕", "北京独立", "北京战争", "北京市委黑幕", "北京劲展鹏", "北京之春", "包房公主",
				"包娃衣", "包厢公主", "劣等人", "功学员", "功学", "功友弟子", "功友", "割肉人", "制服诱惑",
				"制作摇头丸配方", "则民", "出售麻古", "出售香港GHB迷幻水", "出售迷魂药", "出售迷药", "出售美女",
				"出售毒品配方", "出售春药性药", "出售妹妹", "出售大量冰毒K粉", "出售大量冰毒", "出售处男",
				"出售处女", "出售冰毒配方", "出售冰毒", "出售AV", "凌虐玉门", "净白体", "冰火", "农运",
				"军妓", "内争人权", "兼职美女", "兼职的妹妹", "兼职妹妹", "兼职哥哥", "兵运", "共黨",
				"共青背景", "共青团派", "共铲党", "共贼", "共產黨", "共独", "共残党", "共惨党", "共字玄机",
				"共奴", "共匪", "共军", "共党", "共产王朝", "共产极权", "共产无赖", "共产小丑",
				"共产党的末日", "共产党的报应", "共产党专制", "共产主义黑皮书", "共产专制", "共chang党",
				"共X党", "六四青年网", "六四血案", "六四母亲", "六四政变", "六四惨案", "六四屠杀", "六四屠城",
				"六四宣言", "六四学潮", "六四天网", "六四受难者家属证辞", "六四内部日记", "六四事件", "六四之役",
				"六九体位", "公子族", "公子党", "公关男", "公关小姐", "公关女", "公关夜总会", "公关坐台",
				"公产党", "公主包厢", "公主ktv", "八九学潮", "兩性淫亂", "全套美女", "全國二奶", "全国二奶",
				"入珠环", "党风日下", "党禁", "党棍官僚", "党棍", "党妈妈", "党内言事潮", "党内权争",
				"党内危机", "党保平安", "免费黄色电影", "免费铯狐艳书网", "免费激情电影", "免费偷拍", "免费a片",
				"先天健康法", "元极功", "僵贼民", "僵贼", "傻逼", "傻X", "傻B", "催情迷昏药", "催情液",
				"催情水", "催情春药", "催情", "偷欢", "偷情", "做鸡", "做要带套", "做爱", "做愛",
				"做台", "做ai", "倫攻", "倫功", "倫公", "侮辱老师", "使劲淫水", "你娘的", "你娘",
				"你妈逼", "你妈的", "你他妈", "作爱", "伴我淫", "伪水", "伪民运", "伪大", "伦攻",
				"伦功", "伦公", "传九退三", "伊斯兰运动", "伊扎布特", "任泽民", "任你淫", "以身护法",
				"以血护法", "他母亲", "他媽的", "他娘的", "他妈的", "人妻小说", "人妻", "亲蛋蛋",
				"亲吻蛋蛋", "亲共行动", "亲共媒体", "亲共分子", "亲jj", "亮穴", "京爆", "换妻俱乐部",
				"交换夫妻", "交媾", "交奸", "亡共者胡", "亡党", "亚洲色图", "亚洲自由电台", "亚洲自由之声",
				"亚洲无码穴", "亚洲床上色情", "五月天妹妹图片网", "五奶小青", "二逼", "二奶", "二B", "乳首",
				"乳球", "乳伦", "乳fang", "乱淫", "乱伦熟女", "乱伦小说", "乱伦", "乱伦小说",
				"乱交的故事", "乱交", "买枪", "买春堂", "买淫", "买春", "九评共产党", "九评公产党",
				"九评之一评共产党是什么", "九十三运动", "乖乖药", "乌鲁木齐暴动", "乌鲁木齐暴力事件", "乌鲁木齐事件",
				"主席忏悔", "为党不为国", "丰韵少妇", "丰乳肥臀", "丰乳美臀", "中正纪念歌", "中山公园哀悼",
				"中央黑幕", "中天一气功", "中国过渡政府", "中国社会进步党", "中国社会的艾滋病",
				"中国留学生与达赖喇嘛单独会谈记", "中国猪", "中国正义党", "中国支配下的朝鲜经济", "中国报禁",
				"中国成人通", "中国成人网站", "中国成人网", "中国性爱城", "中国性城", "中国共产党亡",
				"中国六四真相", "中南海黑幕", "中南海惊现东宫小朝廷", "中南海内斗", "中华联邦政府", "中华昆仑女神功",
				"中华人民正邪", "中共黑帮", "中共邪毒素", "中共邪党", "中共退党", "中共迫害", "中共走狗",
				"中共解体", "中共独裁", "中共腐败", "中共网特", "中共统治", "中共监狱", "中共的血旗",
				"中共的腐败与残暴", "中共的罪恶", "中共王朝", "中共独裁", "中共独枭", "中共特务组织",
				"中共流氓特务", "中共流氓政权", "中共流氓政府", "中共洗脑", "中共权力斗争", "中共暴政",
				"中共政治游戏", "中共政治流氓", "中共政坛腐败内幕", "中共成人影视网", "中共恶霸", "中共恐惧",
				"中共心中最大的恐惧", "中共当局", "中共帮凶", "中共帝国", "中共封锁", "中共封网", "中共太子",
				"中共内斗", "中共党魁", "中共党文化", "中共保命", "中共伪政权", "中共任用", "中共亡",
				"中共中央黑幕", "中共专制", "中共三大势力谁来执政", "个邪的党魔教", "个邪的党", "个人圆满说",
				"两性话", "两性私语", "两性狂情", "两性淫乱", "两性屋", "两性乐园", "两乳之间", "两个中国",
				"丝袜聊天室", "丝袜美腿", "丝袜美女", "丝袜写真", "丝腿乐园", "东突厥斯坦伊斯兰运动",
				"东突厥斯坦伊斯兰", "东突厥斯坦", "东突", "东社", "东土耳其斯坦", "东北风情熟女之惑", "东伊运",
				"业力轮", "业力回报", "世界通", "世界开运动功", "世界以利亚福音宣教会", "与表妹通奸", "下法轮",
				"下体", "上访军", "上海独立", "三退", "三脱", "三级电影", "三级片BT下载", "三級片",
				"三水法轮", "三挫仑", "三去车仑工力", "三去车仑", "三三九乘元功", "万法归一功", "丁香社区",
				"丁香五月天", "一起干大波妹妹", "一贯道", "一蚕缠", "一级黄电视", "一本道", "一夜激情",
				"一夜情迷奸", "一夜情俱乐部", "一夜情", "一夜性网性息网", "一夜性网", "一军两策", "一党私利",
				"一党独裁", "一党专政", "一党专制", "一中一台", "zifen", "zhuanfalun",
				"zhenshanren", "y蒂", "y茎", "y户", "yin部", "yin道", "yin毛",
				"yinshui", "yindi", "xuechao", "vip公主", "qingse", "mm穴",
				"lihongzhi", "ktv公主", "j巴", "j吧", "jiqingshaofu", "h图",
				"hongzhi", "fuck", "fa轮", "falungong", "falun", "e夜情", "b穴",
				"b痒", "b好痒", "bt成人", "bitch", "a片网", "av女", "X夜激情", "TNND",
				"TND", "TMD", "TAM", "SM虐待", "SM用品", "SEX情色论坛", "Party", "ONS",
				"LiHongzhi", "LHZ", "K粉冰出售", "K粉", "J巴", "H站", "H电影", "H片",
				"H图", "G点刺激棒", "GONG党", "GCD", "Fa轮功", "FalunDafa", "FaLun",
				"FUCK", "FL大法", "FL功", "FLG", "B样", "A片", "AV电影", "AV女色情自拍",
				"AV女优", "AV女", "AV出售", "9评共党", "97色色", "97狼图网", "91明星人体吧",
				"912事件", "89风波", "89学潮血腥屠杀", "89学潮大屠杀", "89事件", "64运动", "64惨案",
				"64大屠杀", "64事件", "3退", "1夜情", "18禁" };
		for (String string : ws) {
			SensitiveWord bean=new SensitiveWord();
			bean.setWord(string);
			wordService.save(bean);
		}
	}
}
