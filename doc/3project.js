/**
 * @apiDefine 3project 3.0 项目模块
 */


/**
 *
 *
 * @api {post} /project/create.htm 3.01 创建项目
 *
 * @apiVersion 0.0.1
 *
 * @apiName create
 *
 * @apiGroup 3project
 *
 * @apiParam {String} userToken 用户令牌
 *
 * @apiParam {String} name 项目名称
 *
 * @apiParam {Long} charger 项目负责人
 *
 * @apiParam {Long} beginDate 项目开始时间
 *
 * @apiParam {Long} deadline 项目结束时间
 *
 * @apiPermission none
 *
 * @apiDescription 创建项目
 *
 * @apiSuccess {Int} code 状态码(默认为0)
 *
 * @apiSuccess {String} msg 状态消息
 *
 */


/**
 * @api {post} /project/my.htm 3.02 和我相关的项目
 *
 * @apiVersion 0.0.1
 *
 * @apiName my
 *
 * @apiGroup 3project
 *
 * @apiParam {String} userToken 用户令牌
 *
 * @apiParam {int} no 页码
 *
 * @apiParam {int} size 分页大小
 *
 *
 * @apiPermission none
 *
 * @apiDescription 和我相关的项目
 *
 * @apiSuccess {Int} code 状态码(默认为0)
 *
 * @apiSuccess {String} msg 状态消息
 *
 * @apiSuccess {array} list 项目集合
 *
 * @apiSuccess {long} list.id 项目id
 *
 *  @apiSuccess {long} list.name 项目名称
 *
 *  @apiSuccess {object} list.creater 创建人信息
 *
 *  @apiSuccess {object} list.creater.name 创建人姓名
 *
 * @apiSuccess {object} list.creater.avatar 创建人姓名
 */


/**
 * @api {post} /project/delete.htm 3.03 删除某个项目
 *
 * @apiVersion 0.0.1
 *
 * @apiName delete
 *
 * @apiGroup 3project
 *
 * @apiParam {String} userToken 用户令牌
 *
 * @apiParam {long} id 项目id
 *
 *
 * @apiPermission none
 *
 * @apiDescription 删除某个项目
 *
 * @apiSuccess {Int} code 状态码(默认为0)
 *
 * @apiSuccess {String} msg 状态消息
 *
 */


/**
 * @api {post} /project/findbyid.htm 3.04 项目详情
 *
 * @apiVersion 0.0.1
 *
 * @apiName findbyid
 *
 * @apiGroup 3project
 *
 * @apiParam {String} userToken 用户令牌
 *
 * @apiParam {long} id 项目id
 *
 *
 * @apiPermission none
 *
 * @apiDescription 项目详情
 *
 * @apiSuccess {Int} code 状态码(默认为0)
 *
 * @apiSuccess {String} msg 状态消息
 *
 * @apiSuccess {long} id 项目id
 *
 * @apiSuccess {String} name 项目名称
 *
 * @apiSuccess {String} note 项目内容
 *
 * @apiSuccess {int} total 项目任务总个数
 *
 *@apiSuccess {int} finish 项目完成任务数
 *
 *@apiSuccess {object} charger 项目负责人
 *
 * @apiSuccess {object} charger.id 项目负责人id
 *
 * @apiSuccess {object} charger.name 项目负责人姓名
 *
 * @apiSuccess {object} charger.avatar 项目负责人头像
 *
 * @apiSuccess {array} tasks 项目里面的任务
 *
 * @apiSuccess {long} tasks.id 项目里面的任务id
 *
 * @apiSuccess {String} tasks.note 任务内容
 *
 *  @apiSuccess {object} tasks.executor 任务执行者
 *
 *  @apiSuccess {long} tasks.executor.id 任务执行者id
 *
 *  @apiSuccess {String} tasks.executor.name 任务执行者姓名
 *
 *  @apiSuccess {String} tasks.executor.avatar 任务执行者头像
 *
 */

/**
 * @api {post} /project/update.htm 3.05 更新某个项目
 *
 * @apiVersion 0.0.1
 *
 * @apiName update
 *
 * @apiGroup 3project
 *
 * @apiParam {String} userToken 用户令牌
 *
 * @apiParam {long} id 项目id
 *
 * @apiParam {long}  charger 项目负责人id
 *
 *  @apiParam {long}  deadline 项目结束时间
 *
 *  @apiParam {long}  beginDate 项目开始时间
 *
 *  @apiParam {long}  name 项目名称
 *
 * @apiPermission none
 *
 * @apiDescription 更新某个项目
 *
 * @apiSuccess {Int} code 状态码(默认为0)
 *
 * @apiSuccess {String} msg 状态消息
 *
 */



/**
 * @api {post} /project/members.htm 3.06 获取项目成员
 *
 * @apiVersion 0.0.1
 *
 * @apiName members
 *
 * @apiGroup 3project
 *
 * @apiParam {String} userToken 用户令牌
 *
 * @apiParam {long} id 项目id
 *
 *
 * @apiPermission none
 *
 * @apiDescription 获取项目成员
 *
 * @apiSuccess {Int} code 状态码(默认为0)
 *
 * @apiSuccess {String} msg 状态消息
 *
 * @apiSuccess {array} list 项目成员集合
 *
 * @apiSuccess {long} list.id 成员id
 *
 *  @apiSuccess {object} list.name 创建人姓名
 *
 * @apiSuccess {object} list.avatar 创建人姓名
 *
 */


/**
 * @api {post} /project/join.htm 3.07 自己加入某个项目
 *
 * @apiVersion 0.0.1
 *
 * @apiName join
 *
 * @apiGroup 3project
 *
 * @apiParam {String} userToken 用户令牌
 *
 * @apiParam {long} id 项目id
 *
 * @apiPermission none
 *
 * @apiDescription 自己加入某个项目
 *
 * @apiSuccess {Int} code 状态码(默认为0)
 *
 * @apiSuccess {String} msg 状态消息
 *
 */

/**
 * @api {post} /project/exit.htm 3.08 退出某个项目
 *
 * @apiVersion 0.0.1
 *
 * @apiName exit
 *
 * @apiGroup 3project
 *
 * @apiParam {String} userToken 用户令牌
 *
 * @apiParam {long} id 项目id
 *
 * @apiPermission none
 *
 * @apiDescription 退出某个项目
 *
 * @apiSuccess {Int} code 状态码(默认为0)
 *
 * @apiSuccess {String} msg 状态消息
 *
 */




