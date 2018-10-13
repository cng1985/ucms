define({ "api": [
  {
    "type": "post",
    "url": "/member/follow.htm",
    "title": "2.05 关注某个人",
    "version": "0.0.1",
    "name": "follow",
    "group": "2user",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "userToken",
            "description": "<p>用户令牌</p>"
          },
          {
            "group": "Parameter",
            "type": "long",
            "optional": false,
            "field": "id",
            "description": "<p>要关注人的id</p>"
          }
        ]
      }
    },
    "permission": [
      {
        "name": "none"
      }
    ],
    "description": "<p>关注某个人</p>",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Int",
            "optional": false,
            "field": "code",
            "description": "<p>状态码(默认为0)</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>状态消息</p>"
          }
        ]
      }
    },
    "filename": "doc/2user.js",
    "groupTitle": "2.0 用户模块",
    "sampleRequest": [
      {
        "url": "http://localhost:8080/web/rest/member/follow.htm"
      }
    ]
  },
  {
    "type": "get",
    "url": "/member/login.htm",
    "title": "2.03 通过账号密码登陆",
    "version": "0.0.1",
    "name": "login",
    "group": "2user",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "phone",
            "description": "<p>手机号码</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "password",
            "description": "<p>密码</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Request-Example:",
          "content": "{\n  \"commerce\": 1,\n  \"phone\":\"18229060103\",\n  \"password\":\"123456\"\n}",
          "type": "json"
        }
      ]
    },
    "permission": [
      {
        "name": "none"
      }
    ],
    "description": "<p>通过账号密码登陆</p>",
    "filename": "doc/2user.js",
    "groupTitle": "2.0 用户模块",
    "sampleRequest": [
      {
        "url": "http://localhost:8080/web/rest/member/login.htm"
      }
    ],
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Int",
            "optional": false,
            "field": "code",
            "description": "<p>状态码(默认为0)</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>消息</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "userToken",
            "description": "<p>用户token</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "name",
            "description": "<p>姓名</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "avatar",
            "description": "<p>头像</p>"
          },
          {
            "group": "Success 200",
            "type": "long",
            "optional": false,
            "field": "uid",
            "description": "<p>用户id</p>"
          }
        ]
      }
    }
  },
  {
    "type": "get",
    "url": "/member/loginoauth.htm",
    "title": "2.01 通过第三方登陆",
    "version": "0.0.1",
    "name": "loginOauth",
    "group": "2user",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "type",
            "description": "<p>第三方类型（wxapp）</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": ""
          }
        ]
      }
    },
    "permission": [
      {
        "name": "none"
      }
    ],
    "description": "<p>通过第三方登陆,要是没有用户信息，系统会创建一份用户信息</p>",
    "filename": "doc/2user.js",
    "groupTitle": "2.0 用户模块",
    "sampleRequest": [
      {
        "url": "http://localhost:8080/web/rest/member/loginoauth.htm"
      }
    ],
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Int",
            "optional": false,
            "field": "code",
            "description": "<p>状态码(默认为0)</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>消息</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "userToken",
            "description": "<p>用户token</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "name",
            "description": "<p>姓名</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "avatar",
            "description": "<p>头像</p>"
          },
          {
            "group": "Success 200",
            "type": "long",
            "optional": false,
            "field": "uid",
            "description": "<p>用户id</p>"
          }
        ]
      }
    }
  },
  {
    "type": "post",
    "url": "/member/myfollows.htm",
    "title": "2.04 我关注的人",
    "version": "0.0.1",
    "name": "myfollows",
    "group": "2user",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "userToken",
            "description": "<p>用户令牌</p>"
          },
          {
            "group": "Parameter",
            "type": "int",
            "optional": false,
            "field": "no",
            "description": "<p>页码</p>"
          },
          {
            "group": "Parameter",
            "type": "int",
            "optional": false,
            "field": "size",
            "description": "<p>分页大小</p>"
          }
        ]
      }
    },
    "permission": [
      {
        "name": "none"
      }
    ],
    "description": "<p>我关注的人</p>",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Int",
            "optional": false,
            "field": "code",
            "description": "<p>状态码(默认为0)</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>状态消息</p>"
          }
        ]
      }
    },
    "filename": "doc/2user.js",
    "groupTitle": "2.0 用户模块",
    "sampleRequest": [
      {
        "url": "http://localhost:8080/web/rest/member/myfollows.htm"
      }
    ]
  },
  {
    "type": "get",
    "url": "/member/update.htm",
    "title": "2.02 更新用户信息",
    "version": "0.0.1",
    "name": "update",
    "group": "2user",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "userToken",
            "description": "<p>用户令牌</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "avatar",
            "description": "<p>头像</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "name",
            "description": "<p>昵称</p>"
          }
        ]
      }
    },
    "permission": [
      {
        "name": "none"
      }
    ],
    "description": "<p>更新用户信息</p>",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Int",
            "optional": false,
            "field": "code",
            "description": "<p>状态码(默认为0)</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>状态消息</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "userToken",
            "description": "<p>用户令牌</p>"
          }
        ]
      }
    },
    "filename": "doc/2user.js",
    "groupTitle": "2.0 用户模块",
    "sampleRequest": [
      {
        "url": "http://localhost:8080/web/rest/member/update.htm"
      }
    ]
  },
  {
    "type": "post",
    "url": "/project/create.htm",
    "title": "3.01 创建项目",
    "version": "0.0.1",
    "name": "create",
    "group": "3project",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "userToken",
            "description": "<p>用户令牌</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "name",
            "description": "<p>项目名称</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "charger",
            "description": "<p>项目负责人</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "beginDate",
            "description": "<p>项目开始时间</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "deadline",
            "description": "<p>项目结束时间</p>"
          }
        ]
      }
    },
    "permission": [
      {
        "name": "none"
      }
    ],
    "description": "<p>创建项目</p>",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Int",
            "optional": false,
            "field": "code",
            "description": "<p>状态码(默认为0)</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>状态消息</p>"
          }
        ]
      }
    },
    "filename": "doc/3project.js",
    "groupTitle": "3.0 项目模块",
    "sampleRequest": [
      {
        "url": "http://localhost:8080/web/rest/project/create.htm"
      }
    ]
  },
  {
    "type": "post",
    "url": "/project/delete.htm",
    "title": "3.03 删除某个项目",
    "version": "0.0.1",
    "name": "delete",
    "group": "3project",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "userToken",
            "description": "<p>用户令牌</p>"
          },
          {
            "group": "Parameter",
            "type": "long",
            "optional": false,
            "field": "id",
            "description": "<p>项目id</p>"
          }
        ]
      }
    },
    "permission": [
      {
        "name": "none"
      }
    ],
    "description": "<p>删除某个项目</p>",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Int",
            "optional": false,
            "field": "code",
            "description": "<p>状态码(默认为0)</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>状态消息</p>"
          }
        ]
      }
    },
    "filename": "doc/3project.js",
    "groupTitle": "3.0 项目模块",
    "sampleRequest": [
      {
        "url": "http://localhost:8080/web/rest/project/delete.htm"
      }
    ]
  },
  {
    "type": "post",
    "url": "/project/exit.htm",
    "title": "3.08 退出某个项目",
    "version": "0.0.1",
    "name": "exit",
    "group": "3project",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "userToken",
            "description": "<p>用户令牌</p>"
          },
          {
            "group": "Parameter",
            "type": "long",
            "optional": false,
            "field": "id",
            "description": "<p>项目id</p>"
          }
        ]
      }
    },
    "permission": [
      {
        "name": "none"
      }
    ],
    "description": "<p>退出某个项目</p>",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Int",
            "optional": false,
            "field": "code",
            "description": "<p>状态码(默认为0)</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>状态消息</p>"
          }
        ]
      }
    },
    "filename": "doc/3project.js",
    "groupTitle": "3.0 项目模块",
    "sampleRequest": [
      {
        "url": "http://localhost:8080/web/rest/project/exit.htm"
      }
    ]
  },
  {
    "type": "post",
    "url": "/project/findbyid.htm",
    "title": "3.04 项目详情",
    "version": "0.0.1",
    "name": "findbyid",
    "group": "3project",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "userToken",
            "description": "<p>用户令牌</p>"
          },
          {
            "group": "Parameter",
            "type": "long",
            "optional": false,
            "field": "id",
            "description": "<p>项目id</p>"
          }
        ]
      }
    },
    "permission": [
      {
        "name": "none"
      }
    ],
    "description": "<p>项目详情</p>",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Int",
            "optional": false,
            "field": "code",
            "description": "<p>状态码(默认为0)</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>状态消息</p>"
          },
          {
            "group": "Success 200",
            "type": "long",
            "optional": false,
            "field": "id",
            "description": "<p>项目id</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "name",
            "description": "<p>项目名称</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "note",
            "description": "<p>项目内容</p>"
          },
          {
            "group": "Success 200",
            "type": "int",
            "optional": false,
            "field": "total",
            "description": "<p>项目任务总个数</p>"
          },
          {
            "group": "Success 200",
            "type": "int",
            "optional": false,
            "field": "finish",
            "description": "<p>项目完成任务数</p>"
          },
          {
            "group": "Success 200",
            "type": "object",
            "optional": false,
            "field": "charger",
            "description": "<p>项目负责人</p>"
          },
          {
            "group": "Success 200",
            "type": "object",
            "optional": false,
            "field": "charger.id",
            "description": "<p>项目负责人id</p>"
          },
          {
            "group": "Success 200",
            "type": "object",
            "optional": false,
            "field": "charger.name",
            "description": "<p>项目负责人姓名</p>"
          },
          {
            "group": "Success 200",
            "type": "object",
            "optional": false,
            "field": "charger.avatar",
            "description": "<p>项目负责人头像</p>"
          },
          {
            "group": "Success 200",
            "type": "array",
            "optional": false,
            "field": "tasks",
            "description": "<p>项目里面的任务</p>"
          },
          {
            "group": "Success 200",
            "type": "long",
            "optional": false,
            "field": "tasks.id",
            "description": "<p>项目里面的任务id</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "tasks.note",
            "description": "<p>任务内容</p>"
          },
          {
            "group": "Success 200",
            "type": "object",
            "optional": false,
            "field": "tasks.executor",
            "description": "<p>任务执行者</p>"
          },
          {
            "group": "Success 200",
            "type": "long",
            "optional": false,
            "field": "tasks.executor.id",
            "description": "<p>任务执行者id</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "tasks.executor.name",
            "description": "<p>任务执行者姓名</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "tasks.executor.avatar",
            "description": "<p>任务执行者头像</p>"
          }
        ]
      }
    },
    "filename": "doc/3project.js",
    "groupTitle": "3.0 项目模块",
    "sampleRequest": [
      {
        "url": "http://localhost:8080/web/rest/project/findbyid.htm"
      }
    ]
  },
  {
    "type": "post",
    "url": "/project/join.htm",
    "title": "3.07 自己加入某个项目",
    "version": "0.0.1",
    "name": "join",
    "group": "3project",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "userToken",
            "description": "<p>用户令牌</p>"
          },
          {
            "group": "Parameter",
            "type": "long",
            "optional": false,
            "field": "id",
            "description": "<p>项目id</p>"
          }
        ]
      }
    },
    "permission": [
      {
        "name": "none"
      }
    ],
    "description": "<p>自己加入某个项目</p>",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Int",
            "optional": false,
            "field": "code",
            "description": "<p>状态码(默认为0)</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>状态消息</p>"
          }
        ]
      }
    },
    "filename": "doc/3project.js",
    "groupTitle": "3.0 项目模块",
    "sampleRequest": [
      {
        "url": "http://localhost:8080/web/rest/project/join.htm"
      }
    ]
  },
  {
    "type": "post",
    "url": "/project/members.htm",
    "title": "3.06 获取项目成员",
    "version": "0.0.1",
    "name": "members",
    "group": "3project",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "userToken",
            "description": "<p>用户令牌</p>"
          },
          {
            "group": "Parameter",
            "type": "long",
            "optional": false,
            "field": "id",
            "description": "<p>项目id</p>"
          }
        ]
      }
    },
    "permission": [
      {
        "name": "none"
      }
    ],
    "description": "<p>获取项目成员</p>",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Int",
            "optional": false,
            "field": "code",
            "description": "<p>状态码(默认为0)</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>状态消息</p>"
          },
          {
            "group": "Success 200",
            "type": "array",
            "optional": false,
            "field": "list",
            "description": "<p>项目成员集合</p>"
          },
          {
            "group": "Success 200",
            "type": "long",
            "optional": false,
            "field": "list.id",
            "description": "<p>成员id</p>"
          },
          {
            "group": "Success 200",
            "type": "object",
            "optional": false,
            "field": "list.name",
            "description": "<p>创建人姓名</p>"
          },
          {
            "group": "Success 200",
            "type": "object",
            "optional": false,
            "field": "list.avatar",
            "description": "<p>创建人姓名</p>"
          }
        ]
      }
    },
    "filename": "doc/3project.js",
    "groupTitle": "3.0 项目模块",
    "sampleRequest": [
      {
        "url": "http://localhost:8080/web/rest/project/members.htm"
      }
    ]
  },
  {
    "type": "post",
    "url": "/project/my.htm",
    "title": "3.02 和我相关的项目",
    "version": "0.0.1",
    "name": "my",
    "group": "3project",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "userToken",
            "description": "<p>用户令牌</p>"
          },
          {
            "group": "Parameter",
            "type": "int",
            "optional": false,
            "field": "no",
            "description": "<p>页码</p>"
          },
          {
            "group": "Parameter",
            "type": "int",
            "optional": false,
            "field": "size",
            "description": "<p>分页大小</p>"
          }
        ]
      }
    },
    "permission": [
      {
        "name": "none"
      }
    ],
    "description": "<p>和我相关的项目</p>",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Int",
            "optional": false,
            "field": "code",
            "description": "<p>状态码(默认为0)</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>状态消息</p>"
          },
          {
            "group": "Success 200",
            "type": "array",
            "optional": false,
            "field": "list",
            "description": "<p>项目集合</p>"
          },
          {
            "group": "Success 200",
            "type": "long",
            "optional": false,
            "field": "list.id",
            "description": "<p>项目id</p>"
          },
          {
            "group": "Success 200",
            "type": "long",
            "optional": false,
            "field": "list.name",
            "description": "<p>项目名称</p>"
          },
          {
            "group": "Success 200",
            "type": "object",
            "optional": false,
            "field": "list.creater",
            "description": "<p>创建人信息</p>"
          },
          {
            "group": "Success 200",
            "type": "object",
            "optional": false,
            "field": "list.creater.name",
            "description": "<p>创建人姓名</p>"
          },
          {
            "group": "Success 200",
            "type": "object",
            "optional": false,
            "field": "list.creater.avatar",
            "description": "<p>创建人姓名</p>"
          }
        ]
      }
    },
    "filename": "doc/3project.js",
    "groupTitle": "3.0 项目模块",
    "sampleRequest": [
      {
        "url": "http://localhost:8080/web/rest/project/my.htm"
      }
    ]
  },
  {
    "type": "post",
    "url": "/project/update.htm",
    "title": "3.05 更新某个项目",
    "version": "0.0.1",
    "name": "update",
    "group": "3project",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "userToken",
            "description": "<p>用户令牌</p>"
          },
          {
            "group": "Parameter",
            "type": "long",
            "optional": false,
            "field": "id",
            "description": "<p>项目id</p>"
          },
          {
            "group": "Parameter",
            "type": "long",
            "optional": false,
            "field": "charger",
            "description": "<p>项目负责人id</p>"
          },
          {
            "group": "Parameter",
            "type": "long",
            "optional": false,
            "field": "deadline",
            "description": "<p>项目结束时间</p>"
          },
          {
            "group": "Parameter",
            "type": "long",
            "optional": false,
            "field": "beginDate",
            "description": "<p>项目开始时间</p>"
          },
          {
            "group": "Parameter",
            "type": "long",
            "optional": false,
            "field": "name",
            "description": "<p>项目名称</p>"
          }
        ]
      }
    },
    "permission": [
      {
        "name": "none"
      }
    ],
    "description": "<p>更新某个项目</p>",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Int",
            "optional": false,
            "field": "code",
            "description": "<p>状态码(默认为0)</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>状态消息</p>"
          }
        ]
      }
    },
    "filename": "doc/3project.js",
    "groupTitle": "3.0 项目模块",
    "sampleRequest": [
      {
        "url": "http://localhost:8080/web/rest/project/update.htm"
      }
    ]
  },
  {
    "type": "post",
    "url": "/task/comment.htm",
    "title": "4.05 评论任务",
    "version": "0.0.1",
    "name": "comment",
    "group": "4task",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "userToken",
            "description": "<p>用户令牌</p>"
          },
          {
            "group": "Parameter",
            "type": "long",
            "optional": false,
            "field": "id",
            "description": "<p>任务id</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "note",
            "description": "<p>任务内容</p>"
          }
        ]
      }
    },
    "permission": [
      {
        "name": "none"
      }
    ],
    "description": "<p>评论任务</p>",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Int",
            "optional": false,
            "field": "code",
            "description": "<p>状态码(默认为0)</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>状态消息</p>"
          }
        ]
      }
    },
    "filename": "doc/4task.js",
    "groupTitle": "4.0 任务模块",
    "sampleRequest": [
      {
        "url": "http://localhost:8080/web/rest/task/comment.htm"
      }
    ]
  },
  {
    "type": "post",
    "url": "/task/create.htm",
    "title": "4.01 创建任务",
    "version": "0.0.1",
    "name": "create",
    "group": "4task",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "userToken",
            "description": "<p>用户令牌</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "name",
            "description": "<p>任务名称</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "note",
            "description": "<p>任务详细内容</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "project",
            "description": "<p>项目id</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "beginDate",
            "description": "<p>任务开始时间</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "deadline",
            "description": "<p>任务截至日期</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "executor",
            "description": "<p>执行人id</p>"
          }
        ]
      }
    },
    "permission": [
      {
        "name": "none"
      }
    ],
    "description": "<p>创建任务</p>",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Int",
            "optional": false,
            "field": "code",
            "description": "<p>状态码(默认为0)</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>状态消息</p>"
          }
        ]
      }
    },
    "filename": "doc/4task.js",
    "groupTitle": "4.0 任务模块",
    "sampleRequest": [
      {
        "url": "http://localhost:8080/web/rest/task/create.htm"
      }
    ]
  },
  {
    "type": "post",
    "url": "/task/delete.htm",
    "title": "4.02 删除某个任务",
    "version": "0.0.1",
    "name": "delete",
    "group": "4task",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "userToken",
            "description": "<p>用户令牌</p>"
          },
          {
            "group": "Parameter",
            "type": "long",
            "optional": false,
            "field": "id",
            "description": "<p>任务id</p>"
          }
        ]
      }
    },
    "permission": [
      {
        "name": "none"
      }
    ],
    "description": "<p>删除某个任务</p>",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Int",
            "optional": false,
            "field": "code",
            "description": "<p>状态码(默认为0)</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>状态消息</p>"
          }
        ]
      }
    },
    "filename": "doc/4task.js",
    "groupTitle": "4.0 任务模块",
    "sampleRequest": [
      {
        "url": "http://localhost:8080/web/rest/task/delete.htm"
      }
    ]
  },
  {
    "type": "post",
    "url": "/task/findbyid.htm",
    "title": "4.03 任务详情",
    "version": "0.0.1",
    "name": "findbyid",
    "group": "4task",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "userToken",
            "description": "<p>用户令牌</p>"
          },
          {
            "group": "Parameter",
            "type": "long",
            "optional": false,
            "field": "id",
            "description": "<p>任务id</p>"
          }
        ]
      }
    },
    "permission": [
      {
        "name": "none"
      }
    ],
    "description": "<p>任务详情</p>",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Int",
            "optional": false,
            "field": "code",
            "description": "<p>状态码(默认为0)</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>状态消息</p>"
          },
          {
            "group": "Success 200",
            "type": "long",
            "optional": false,
            "field": "id",
            "description": "<p>任务id</p>"
          },
          {
            "group": "Success 200",
            "type": "int",
            "optional": false,
            "field": "state",
            "description": "<p>任务状态 0为未完成 1为完成</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "note",
            "description": "<p>任务内容</p>"
          },
          {
            "group": "Success 200",
            "type": "object",
            "optional": false,
            "field": "executor",
            "description": "<p>任务执行者</p>"
          },
          {
            "group": "Success 200",
            "type": "long",
            "optional": false,
            "field": "executor.id",
            "description": "<p>任务执行者id</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "executor.name",
            "description": "<p>任务执行者姓名</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "executor.avatar",
            "description": "<p>任务执行者头像</p>"
          },
          {
            "group": "Success 200",
            "type": "object",
            "optional": false,
            "field": "project",
            "description": "<p>项目信息</p>"
          },
          {
            "group": "Success 200",
            "type": "long",
            "optional": false,
            "field": "project.id",
            "description": "<p>项目id</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "project.name",
            "description": "<p>项目名称</p>"
          }
        ]
      }
    },
    "filename": "doc/4task.js",
    "groupTitle": "4.0 任务模块",
    "sampleRequest": [
      {
        "url": "http://localhost:8080/web/rest/task/findbyid.htm"
      }
    ]
  },
  {
    "type": "post",
    "url": "/task/page.htm",
    "title": "4.06 评论分页",
    "version": "0.0.1",
    "name": "page",
    "group": "4task",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "userToken",
            "description": "<p>用户令牌</p>"
          },
          {
            "group": "Parameter",
            "type": "long",
            "optional": false,
            "field": "id",
            "description": "<p>任务id</p>"
          },
          {
            "group": "Parameter",
            "type": "int",
            "optional": false,
            "field": "no",
            "description": "<p>页码</p>"
          },
          {
            "group": "Parameter",
            "type": "int",
            "optional": false,
            "field": "size",
            "description": "<p>分页大小</p>"
          }
        ]
      }
    },
    "permission": [
      {
        "name": "none"
      }
    ],
    "description": "<p>评论任务</p>",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Int",
            "optional": false,
            "field": "code",
            "description": "<p>状态码(默认为0)</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>状态消息</p>"
          },
          {
            "group": "Success 200",
            "type": "array",
            "optional": false,
            "field": "list",
            "description": "<p>数据集合</p>"
          },
          {
            "group": "Success 200",
            "type": "long",
            "optional": false,
            "field": "list.id",
            "description": "<p>评论id</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.note",
            "description": "<p>评论内容</p>"
          },
          {
            "group": "Success 200",
            "type": "object",
            "optional": false,
            "field": "list.member",
            "description": "<p>评论人</p>"
          },
          {
            "group": "Success 200",
            "type": "long",
            "optional": false,
            "field": "list.member.id",
            "description": "<p>评论人id</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.member.name",
            "description": "<p>评论人姓名</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.member.avatar",
            "description": "<p>评论人头像</p>"
          }
        ]
      }
    },
    "filename": "doc/4task.js",
    "groupTitle": "4.0 任务模块",
    "sampleRequest": [
      {
        "url": "http://localhost:8080/web/rest/task/page.htm"
      }
    ]
  },
  {
    "type": "post",
    "url": "/task/toggle.htm",
    "title": "4.07 任务状态切换",
    "version": "0.0.1",
    "name": "toggle",
    "group": "4task",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "userToken",
            "description": "<p>用户令牌</p>"
          },
          {
            "group": "Parameter",
            "type": "long",
            "optional": false,
            "field": "id",
            "description": "<p>任务id</p>"
          }
        ]
      }
    },
    "permission": [
      {
        "name": "none"
      }
    ],
    "description": "<p>任务状态切换</p>",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Int",
            "optional": false,
            "field": "code",
            "description": "<p>状态码(默认为0) 0未完成  1完成</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>状态消息</p>"
          }
        ]
      }
    },
    "filename": "doc/4task.js",
    "groupTitle": "4.0 任务模块",
    "sampleRequest": [
      {
        "url": "http://localhost:8080/web/rest/task/toggle.htm"
      }
    ]
  },
  {
    "type": "post",
    "url": "/task/update.htm",
    "title": "4.04 更新任务",
    "version": "0.0.1",
    "name": "update",
    "group": "4task",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "userToken",
            "description": "<p>用户令牌</p>"
          },
          {
            "group": "Parameter",
            "type": "long",
            "optional": false,
            "field": "id",
            "description": "<p>任务id</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "executor",
            "description": "<p>执行人id</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "deadline",
            "description": "<p>任务截至日期</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "note",
            "description": "<p>任务内容</p>"
          },
          {
            "group": "Success 200",
            "type": "Int",
            "optional": false,
            "field": "code",
            "description": "<p>状态码(默认为0)</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>状态消息</p>"
          }
        ]
      }
    },
    "permission": [
      {
        "name": "none"
      }
    ],
    "description": "<p>更新任务</p>",
    "filename": "doc/4task.js",
    "groupTitle": "4.0 任务模块",
    "sampleRequest": [
      {
        "url": "http://localhost:8080/web/rest/task/update.htm"
      }
    ]
  },
  {
    "type": "post",
    "url": "/team/create.htm",
    "title": "5.01 创建团队",
    "version": "0.0.1",
    "name": "create",
    "group": "5team",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "userToken",
            "description": "<p>用户令牌</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "name",
            "description": "<p>项目名称</p>"
          }
        ]
      }
    },
    "permission": [
      {
        "name": "none"
      }
    ],
    "description": "<p>创建团队</p>",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Int",
            "optional": false,
            "field": "code",
            "description": "<p>状态码(默认为0)</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>状态消息</p>"
          }
        ]
      }
    },
    "filename": "doc/5team.js",
    "groupTitle": "5.0 团队接口",
    "sampleRequest": [
      {
        "url": "http://localhost:8080/web/rest/team/create.htm"
      }
    ]
  },
  {
    "type": "post",
    "url": "/team/my.htm",
    "title": "5.02 我加入的团队",
    "version": "0.0.1",
    "name": "my",
    "group": "5team",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "userToken",
            "description": "<p>用户令牌</p>"
          }
        ]
      }
    },
    "permission": [
      {
        "name": "none"
      }
    ],
    "description": "<p>我加入的团队</p>",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Int",
            "optional": false,
            "field": "code",
            "description": "<p>状态码(默认为0)</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>状态消息</p>"
          },
          {
            "group": "Success 200",
            "type": "array",
            "optional": false,
            "field": "list",
            "description": "<p>团队集合</p>"
          },
          {
            "group": "Success 200",
            "type": "long",
            "optional": false,
            "field": "list.id",
            "description": "<p>团队id</p>"
          },
          {
            "group": "Success 200",
            "type": "long",
            "optional": false,
            "field": "list.name",
            "description": "<p>团队名称</p>"
          }
        ]
      }
    },
    "filename": "doc/5team.js",
    "groupTitle": "5.0 团队接口",
    "sampleRequest": [
      {
        "url": "http://localhost:8080/web/rest/team/my.htm"
      }
    ]
  }
] });
