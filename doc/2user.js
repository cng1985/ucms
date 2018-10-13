/**
 * @apiDefine 2user 2.0 用户模块
 */


/**
 * @apiDefine memberback
 *
 * @apiSuccess  {Int} code 状态码(默认为0)
 *
 * @apiSuccess  {String} msg 消息
 *
 * @apiSuccess  {String} userToken 用户token
 *
 *@apiSuccess  {String} name 姓名
 *
 * @apiSuccess  {String} avatar 头像
 *
 * @apiSuccess  {long} uid 用户id
 *
 */

/**
 * 
 * 
 * @api {get} /member/loginoauth.htm 2.01 通过第三方登陆
 *
 * @apiVersion 0.0.1
 *
 * @apiName loginOauth
 *
 * @apiGroup 2user
 *
 * @apiParam {String} type 第三方类型（wxapp）
 *
 * @apiParam {String} code
 *
 * @apiPermission none
 *
 * @apiDescription 通过第三方登陆,要是没有用户信息，系统会创建一份用户信息
 *
 * @apiUse  memberback
 *
 */


/**
 *
 *
 * @api {get} /member/update.htm 2.02 更新用户信息
 *
 * @apiVersion 0.0.1
 *
 * @apiName update
 *
 * @apiGroup 2user
 *
 * @apiParam {String} userToken 用户令牌
 *
 * @apiParam {String} avatar 头像
 *
 * @apiParam {String} name 昵称
 *
 * @apiPermission none
 *
 * @apiDescription 更新用户信息
 *
 * @apiSuccess {Int} code 状态码(默认为0)
 *
 * @apiSuccess {String} msg 状态消息
 *
 * @apiSuccess {String} userToken 用户令牌
 *
 */


/**
 *
 *
 * @api {get} /member/login.htm 2.03 通过账号密码登陆
 *
 * @apiVersion 0.0.1
 *
 *
 * @apiName login
 *
 * @apiGroup 2user
 *
 * @apiParam {String} phone 手机号码
 *
 * @apiParam {String} password 密码
 *
 * @apiPermission none
 *
 * @apiDescription 通过账号密码登陆
 *
 *
 *  *@apiParamExample {json} Request-Example:
 *     {
 *       "commerce": 1,
 *       "phone":"18229060103",
 *       "password":"123456"
 *     }
 *
 * @apiUse  memberback
 *
 */



/**
 *
 *
 * @api {post} /member/myfollows.htm 2.04 我关注的人
 *
 * @apiVersion 0.0.1
 *
 * @apiName myfollows
 *
 * @apiGroup 2user
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
 * @apiDescription 我关注的人
 *
 * @apiSuccess {Int} code 状态码(默认为0)
 *
 * @apiSuccess {String} msg 状态消息
 *
 *
 */


/**
 *
 *
 * @api {post} /member/follow.htm 2.05 关注某个人
 *
 * @apiVersion 0.0.1
 *
 * @apiName follow
 *
 * @apiGroup 2user
 *
 * @apiParam {String} userToken 用户令牌
 *
 * @apiParam {long} id  要关注人的id
 *
 * @apiPermission none
 *
 * @apiDescription 关注某个人
 *
 * @apiSuccess {Int} code 状态码(默认为0)
 *
 * @apiSuccess {String} msg 状态消息
 *
 *
 */


