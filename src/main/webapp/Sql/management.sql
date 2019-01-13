# Host: localhost  (Version 5.6.39)
# Date: 2018-06-14 23:06:43
# Generator: MySQL-Front 6.0  (Build 2.20)


#
# Structure for table "classinfo"
#

CREATE TABLE `classinfo` (
  `ClassID` varchar(15) NOT NULL DEFAULT '' COMMENT '班级ID',
  `ClassName` varchar(20) DEFAULT NULL COMMENT '班级名称',
  `Grade` varchar(20) DEFAULT NULL COMMENT '年级',
  PRIMARY KEY (`ClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for table "companyfileinfo"
#

CREATE TABLE `companyfileinfo` (
  `CompanyFileID` varchar(50) NOT NULL DEFAULT '' COMMENT '公司文件ID',
  `CompanyFileName` varchar(50) DEFAULT NULL COMMENT '公司文件名称',
  `CompanyFilePlace` varchar(100) DEFAULT NULL COMMENT '公司文件位置',
  `UploadTime` date DEFAULT NULL COMMENT '上传时间',
  `CompanyID` varchar(15) DEFAULT NULL COMMENT '公司ID',
  `CompanyFileType` int(1) DEFAULT NULL COMMENT '文件类型',
  PRIMARY KEY (`CompanyFileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for table "companyinfo"
#

CREATE TABLE `companyinfo` (
  `CompanyID` varchar(15) NOT NULL DEFAULT '' COMMENT '公司ID',
  `CompanyName` varchar(10) DEFAULT NULL COMMENT '公司名称',
  `CompanyType1` int(1) DEFAULT '0' COMMENT '校内实训公司',
  `CompanyType2` int(1) DEFAULT '0' COMMENT '学校合作实训公司',
  `CompanyPassword` varchar(20) DEFAULT '123456' COMMENT '登录密码',
  `CompanyCity` varchar(20) DEFAULT NULL COMMENT '所在城市',
  `Contacts` varchar(20) DEFAULT NULL COMMENT '联系人',
  `CompanyPhone` varchar(15) DEFAULT NULL COMMENT '联系电话',
  `authorize` int(1) DEFAULT '0' COMMENT '是否授权 0：未授权 1 授权',
  PRIMARY KEY (`CompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for table "studentfileinfo"
#

CREATE TABLE `studentfileinfo` (
  `StudentFileID` varchar(50) NOT NULL DEFAULT '' COMMENT '学生文件ID',
  `StudentFileName` varchar(50) DEFAULT NULL COMMENT '学生文件名称',
  `StudentFilePlace` varchar(100) DEFAULT NULL COMMENT '学生文件位置',
  `StudentFileType` int(1) DEFAULT NULL COMMENT '学生文件类型',
  `UploadTime` date DEFAULT NULL COMMENT '上传时间',
  `StudentID` varchar(15) DEFAULT NULL COMMENT '学号',
  PRIMARY KEY (`StudentFileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for table "studentinfo"
#

CREATE TABLE `studentinfo` (
  `StudentID` varchar(20) NOT NULL DEFAULT '' COMMENT '学号',
  `StudentName` varchar(10) DEFAULT '' COMMENT '姓名',
  `StudentSex` varchar(5) DEFAULT '' COMMENT '性别',
  `StudentPhone` varchar(15) DEFAULT '' COMMENT '联系方式',
  `ClassID` varchar(15) DEFAULT '' COMMENT '班级ID',
  `TeacherID` varchar(15) DEFAULT '' COMMENT '导师ID',
  `TeacherResult` int(3) DEFAULT '0' COMMENT '教师成绩',
  `CompanyResult` int(3) DEFAULT '0' COMMENT '公司成绩',
  `TrainningResult` int(3) DEFAULT '0' COMMENT '总成绩',
  `Direction` varchar(10) DEFAULT '校内实训' COMMENT '实训去向,0：校内实训,1：合作公司,2：自行联系',
  `CompanyID` varchar(15) DEFAULT '' COMMENT '公司ID',
  `StudentPassword` varchar(20) DEFAULT '123456' COMMENT '登录密码',
  `CompanyName` varchar(20) DEFAULT '' COMMENT '自行联系公司名称',
  `ParentsPhone` varchar(15) DEFAULT '' COMMENT '家长联系方式',
  `StudentEmail` varchar(50) DEFAULT '' COMMENT '邮箱',
  `subject` varchar(100) DEFAULT '' COMMENT '实训题目（不可重复）',
  PRIMARY KEY (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for table "teacherinfo"
#

CREATE TABLE `teacherinfo` (
  `TeacherID` varchar(15) NOT NULL DEFAULT '' COMMENT '导师ID',
  `TeacherName` varchar(10) DEFAULT NULL COMMENT '姓名',
  `TeacherSex` varchar(5) DEFAULT '' COMMENT '性别',
  `TeacherPhone` varchar(15) DEFAULT NULL COMMENT '联系方式',
  `TeacherEmail` varchar(20) DEFAULT NULL COMMENT '邮箱',
  `Role` int(1) DEFAULT NULL COMMENT '角色',
  `TeacherPassword` varchar(20) DEFAULT '123456' COMMENT '登录密码',
  `endTime` varchar(20) DEFAULT NULL COMMENT '去向修改时间',
  PRIMARY KEY (`TeacherID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
