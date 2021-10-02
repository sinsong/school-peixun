# school-peixun

某辣鸡学校集中实习/实训(peixun)，在实训中心指导老师的亲切指导下，手跟手抄下来的代码，并且经过一个晚上的血压飙升的前后端“整(dui)合(jie)”，终于将老师的杰(shi)作(shan)，“整(pin)合(jie)”到了一起。

## 简介

本次垃圾实训中两个项目仓库作为本仓库的子模组，分别为:

```
backend  - 后端: java, SpringBoot
frentend - 前端: React
```

### 后端

```
org.literal - 我的包名 (他们的包名都是 com.lanou)

org.literal.qjxt              - 主包 请假系统 (对没错，这个老师用拼音缩写)
org.literal.qjxt.controller   - 控制器
org.literal.qjxt.dao          - 数据访问对象
org.literal.qjxt.entity       - 实体类 (他们用的复数 entities 我用单数，这不是黑点，没毛病的)
org.literal.qjxt.service      - 服务接口
org.literal.qjxt.service.impl - 服务实现
```

### 前端

```
src/auth-provider.js - 提供认证系统的实现 (后面会用 Context 包装)

    /assets/*.svg - 登录界面的那两个图片

    /components/ - 全局组件
               /page-loading - 页面加载组件

    /context/ - 存放 React 的上下文
            /auth-context.js - 认证相关上下文
            /index.js        - 应用的统一上下文提供者，顺便 react-router 的 Router 组件也在这里

    /pages/ - 页面
          /att-list/       - 请假记录管理页面
          /attendance/     - 请假页面
          /authentication/ - 认证页面 (登录注册)
          /home/           - 主页 (也是 att-list 和 attendance 的容器)

    /utils/ - 辅助库
          /index.js      - 讲 React 组件剩下来的代码
          /http.js       - 发送请求的工具和自定义狗子
          /lazyimport.js - 带最小阈值的 React lazy 懒加载封装
          /use-async.js  - 用来跟踪 http.js 发送请求状态的辅助设施，也是自定义钩子

/middleware.js   - json-server 的中间件 (“你们跟着我写就对了”，然后他没讲这个)
/craco.config.js - craco 服务器，用来替代 react-script 然后传入 lessOptions 修改了一下 antd 的主题
/db.json         - json-server 服务器的数据库

/test - 这可是个好东西，不是课上教的，用 vscode 插件 rest-client 写法写的 http 请求，用来测后端
```

### 数据库

就在这个仓库根目录，schema.sql 带注释

## 如何运行本项目

### 后端

```bash
$ cd backend
$ mvn spring-boot:run
```

### 前端

```bash
$ cd frontend
$ npm i         # 或者 yarn install
$ npm run start # 或者 yarn start
```

## 后端接口

前端接口在历史中，而且都是用 json-server 做的 mock(大概是假数据和假数据库的意思吧)，这里看着后端代码总结后端接口

默认URL基址是 `http://localhost:8080/`

### `POST /user/register` - 注册

请求体

```json
{
    "user": {
        "account": "账户",
        "pwd": "密码"
    },
    "info": {
        "name": "姓名",
        "clazz": "班级"
    },
    "role": 0
}
```

- `"role": 0` 表示学生
- `"role": 1` 表示教师

响应

```json
{
    "status": 0,
    "msg": "注册成功"
}

```

- `status` 状态
- `"status": 0` 表示成功
- `"status": 1` 表示失败
- `msg` 消息

### `POST /user/login` - 登录

请求体

```json
{
    "user": {
        "account": "账户",
        "pwd": "密码"
    },
    "role": 0
}
```

响应同上，而且还是服务端返回密码的屑

### `POST /jt/addjt` - 添加假条

请求体

```json
{
    "type": "请假类型 enum{事假 | 病假}",
    "s_time": "开始时间",
    "e_time": "结束时间",
    "reason": "请假原因",
    "status": "请假状态 enum{待审批 | 已准假 | 被驳回 | 已销假}",
    "uid": "请假学生 id",
    "tid": "审批老师 id (该功能并没有在后端体现，太监了)",
    "phone": "请假学生手机号"
}
```

### `GET  /stu/searcjt` - 学生搜索假条

无参数输入

响应假条实体类的列表

### `GET  /teacher/searchjt` - 教师搜索假条

同上

### `GET  /teacher/updatejt` - 教师更新(批改/修改)假条

查询参数

```
status - 目标状态
jit    - 被修改假条的 id
```

## 趣事

### 名字

- 前端老师建项目的时候用的是 `ca`
- 前端项目一直使用 `请假系统` 这个名字
- 后端项目突然成了 `xjxt`(销假系统)
- (从各个方面可见前端后后端两个老师沟通了个屁)

### lombok

- 第一位 Java 老师带我们选了 lombok 依赖
- 第二位 Java 老师(“教”我们做后端项目的老师)问：“你们都装了lombok是吧？”
- （短暂的沉默）
- 我：（小声的）“装了”
- 既然有些同学没装，那就用 sts 源代码工具做了

### 前后端

- 第一位 Java 老师打电话给第二位 Java 老师，交流要交到哪里
- 前后端完全是两个接口
- 只给我们一天的时间“整合”（他们最喜欢用“整合”这个词了）

### 开发工具

- MySQL 8.x for Windows (啊，啊这，MySQL for Windows 是最难安装的软件之一(也可能没有之一))
- Spring Toolsuit (aka. sts)
- Vistual Studio Code (aka. vscode) 前端项目用这个写的

### 起名

- 学生一直叫 stu 占 3 个字符，全称 student 占 7 个字符
- 教师一直使用全称 teacher，占 7 个字符
- 然而学生不配拥有姓名

### 认证系统

- 前端使用 Authorization 头和类似 jwt 做法，存入 localStorage
- 后端使用 Servlet session / HTTP Cookie
- fetch 默认不发送 Cookie
- 前后端跨域 (`localhost:3000` & `localhost:8080`)
- f******************************************************************************************
- 后端提供 `WebConfig`，使用 `allowCredentials(true)`
- 前端给 fetch 传入 `credentials: 'include'`
