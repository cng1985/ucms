/**
 * @apiDefine 4task 4.0 任务模块
 */


/**
 * 
 *
 * @api {post} /task/create.htm 4.01 创建任务
 *
 * @apiVersion 0.0.1
 *
 * @apiName create
 *
 * @apiGroup 4task
 *
 * @apiParam {String} userToken 用户令牌
 *
 * @apiParam {String} name 任务名称
 *
 * @apiParam {String} note 任务详细内容
 *
 *  @apiParam {Long} project 项目id
 *
 * @apiParam {Long} beginDate 任务开始时间
 *
 * @apiParam {Long} deadline 任务截至日期
 *
 *
 * @apiParam {Long}  executor 执行人id
 *
 * @apiPermission none
 *
 * @apiDescription 创建任务
 *
 * @apiSuccess {Int} code 状态码(默认为0)
 *
 * @apiSuccess {String} msg 状态消息
 *
 */




/**
 * @api {post} /task/delete.htm 4.02 删除某个任务
 *
 * @apiVersion 0.0.1
 *
 * @apiName delete
 *
 * @apiGroup 4task
 *
 * @apiParam {String} userToken 用户令牌
 *
 * @apiParam {long} id 任务id
 *
 *
 * @apiPermission none
 *
 * @apiDescription 删除某个任务
 *
 * @apiSuccess {Int} code 状态码(默认为0)
 *
 * @apiSuccess {String} msg 状态消息
 *
 */


/**
 * @api {post} /task/findbyid.htm 4.03 任务详情
 *
 * @apiVersion 0.0.1
 *
 * @apiName findbyid
 *
 * @apiGroup 4task
 *
 * @apiParam {String} userToken 用户令牌
 *
 * @apiParam {long} id 任务id
 *
 *
 * @apiPermission none
 *
 * @apiDescription 任务详情
 *
 * @apiSuccess {Int} code 状态码(默认为0)
 *
 * @apiSuccess {String} msg 状态消息
 *
 * @apiSuccess {long} id 任务id
 *
 * @apiSuccess {int} state 任务状态 0为未完成 1为完成
 *
 * @apiSuccess {String} note 任务内容
 *
 * @apiSuccess {object} executor 任务执行者
 *
 * @apiSuccess {long} executor.id 任务执行者id
 *
 * @apiSuccess {String} executor.name 任务执行者姓名
 *
 * @apiSuccess {String} executor.avatar 任务执行者头像
 *
 *  @apiSuccess {object} project 项目信息
 *
 *  @apiSuccess {long} project.id 项目id
 *
 *  @apiSuccess {String} project.name 项目名称
 *
 */


/**
 * @api {post} /task/update.htm 4.04 更新任务
 *
 * @apiVersion 0.0.1
 *
 * @apiName update
 *
 * @apiGroup 4task
 *
 * @apiParam {String} userToken 用户令牌
 *
 * @apiParam {long} id 任务id
 *
 * @apiParam {Long}  executor 执行人id
 *
 * @apiSuccess {String} note 任务内容
 *
 * @apiParam {Long} deadline 任务截至日期
 *
 * @apiPermission none
 *
 * @apiDescription 更新任务
 *
 * @apiSuccess {Int} code 状态码(默认为0)
 *
 * @apiSuccess {String} msg 状态消息
 *
 */

/**
 * @api {post} /task/comment.htm 4.05 评论任务
 *
 * @apiVersion 0.0.1
 *
 * @apiName comment
 *
 * @apiGroup 4task
 *
 * @apiParam {String} userToken 用户令牌
 *
 * @apiParam {long} id 任务id
 *
 * @apiParam {String} note 任务内容
 *
 * @apiPermission none
 *
 * @apiDescription 评论任务
 *
 * @apiSuccess {Int} code 状态码(默认为0)
 *
 * @apiSuccess {String} msg 状态消息
 *
 */


/**
 * @api {post} /task/page.htm 4.06 评论分页
 *
 * @apiVersion 0.0.1
 *
 * @apiName page
 *
 * @apiGroup 4task
 *
 * @apiParam {String} userToken 用户令牌
 *
 * @apiParam {long} id 任务id
 *
 * @apiParam {int} no 页码
 *
 * @apiParam {int} size 分页大小
 *
 * @apiPermission none
 *
 * @apiDescription 评论任务
 *
 * @apiSuccess {Int} code 状态码(默认为0)
 *
 * @apiSuccess {String} msg 状态消息
 *
 *
 * @apiSuccess {array} list 数据集合
 *
 * @apiSuccess {long} list.id 评论id
 *
 * @apiSuccess {String} list.note 评论内容
 *
 * @apiSuccess {object} list.member 评论人
 *
 * @apiSuccess {long} list.member.id 评论人id
 *
 * @apiSuccess {String} list.member.name 评论人姓名
 *
 * @apiSuccess {String} list.member.avatar 评论人头像
 *
 */

/**
 * @api {post} /task/toggle.htm 4.07 任务状态切换
 *
 * @apiVersion 0.0.1
 *
 * @apiName toggle
 *
 * @apiGroup 4task
 *
 * @apiParam {String} userToken 用户令牌
 *
 * @apiParam {long} id 任务id
 *
 *
 * @apiPermission none
 *
 * @apiDescription 任务状态切换
 *
 * @apiSuccess {Int} code 状态码(默认为0) 0未完成  1完成
 *
 * @apiSuccess {String} msg 状态消息
 *
 */

