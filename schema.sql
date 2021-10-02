CREATE DATABASE IF NOT EXISTS qjxt charset=utf8 COLLATE utf8_general_ci;
USE qjxt;
-- 表
-- 学生
-- 学生详情
-- 教师
-- 教师详情
-- 假条

-- 学生表
-- id 标志
-- account 账号
-- pwd 登录密码
CREATE TABLE IF NOT EXISTS tb_student
(
    id      integer         PRIMARY KEY auto_increment,
    account varchar(30)     UNIQUE,
    pwd     varchar(30)
) charset=utf8;

-- 学生详情表
-- id 标志
-- name 学生姓名
-- clazz 学生班级
-- uid 关联的学生的主键
CREATE TABLE IF NOT EXISTS tb_stuinfo
(
    id      integer         PRIMARY KEY auto_increment,
    name    varchar(20),
    clazz   varchar(20),
    uid     integer
) charset=utf8;

-- 教师表
-- id 标志
-- name 姓名
-- clazz 班级
-- uid 关联教师的主键
CREATE TABLE IF NOT EXISTS tb_teacher
(
    id      integer         PRIMARY KEY auto_increment,
    account varchar(30)     UNIQUE,
    pwd     varchar(30)
) charset=utf8;

-- 教师详情表
CREATE TABLE IF NOT EXISTS tb_teacherinfo
(
    id      integer         PRIMARY KEY auto_increment,
    name    varchar(20),
    clazz   varchar(20),
    tid     integer
) charset=utf8;

-- 假条表
-- id 标志
-- type 假条类型：事假，病假
-- reason 原因
-- start_time 开始时间
-- end_time 结束时间
-- status 假条状态：待审批，已准假，被驳回，已销假
-- uid 审核教师id
-- tid 请假学生 id
-- phone 学生电话
-- 这个语句拷贝过去，不然报错
CREATE TABLE IF NOT EXISTS tb_jiatiao
(
    id      integer                 PRIMARY KEY auto_increment,
    type    enum('事假', '病假')    DEFAULT '事假',
    reason  text,
    s_time  date,
    e_time  date,
    `status`  enum('待审批', '已准假', '被驳回', '已销假') DEFAULT '待审批',
    phone   varchar(50),
    uid     integer,
    tid     integer
) charset=utf8;
