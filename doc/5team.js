/**
 * @apiDefine 5team 5.0 团队接口
 */


/**
 *
 * @api {post} /team/create.htm 5.01 创建团队
 *
 * @apiVersion 0.0.1
 *
 * @apiName create
 *
 * @apiGroup 5team
 *
 * @apiParam {String} userToken 用户令牌
 *
 * @apiParam {String} name 项目名称
 *
 * @apiPermission none
 *
 * @apiDescription 创建团队
 *
 * @apiSuccess {Int} code 状态码(默认为0)
 *
 * @apiSuccess {String} msg 状态消息
 *
 */


/**
 * @api {post} /team/my.htm 5.02 我加入的团队
 *
 * @apiVersion 0.0.1
 *
 * @apiName my
 *
 * @apiGroup 5team
 *
 * @apiParam {String} userToken 用户令牌
 *
 * @apiPermission none
 *
 * @apiDescription 我加入的团队
 *
 * @apiSuccess {Int} code 状态码(默认为0)
 *
 * @apiSuccess {String} msg 状态消息
 *
 * @apiSuccess {array} list 团队集合
 *
 * @apiSuccess {long} list.id 团队id
 *
 *  @apiSuccess {long} list.name 团队名称
 *
 */
