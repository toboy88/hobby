create database daydate default character set utf8 collate utf8_general_ci;
create user 'daydatemain'@'localhost' identified by 'A9WQQAiFwo';
grant select,insert,update,delete,create on daydate.* to 'daydatemain'@'localhost';
flush privileges;

CREATE TABLE IF NOT EXISTS `DbUser`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `loginName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trueName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `workId` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phoneNumber` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyEmailAccount` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyEmailDomain` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `privateEmailAddress` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dateOfEnterProject` date NULL DEFAULT NULL,
  `dateOfEnterCompany` date NULL DEFAULT NULL,
  `valid` tinyint(1) NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
)ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `DbWorkRecord`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `workId` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dateOfWork` date NULL DEFAULT NULL,
  `leaveInfo` int NULL DEFAULT NULL,
  `reasonOfLeave` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `startTime` time NULL DEFAULT NULL,
  `endTime` time NULL DEFAULT NULL,
  `valid` tinyint(1) NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
)ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `DbOvertimeRec`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `workId` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dateOfOvertime` date NULL DEFAULT NULL,
  `hourLength` int NULL DEFAULT NULL,
  `otStartTime` time NULL DEFAULT NULL,
  `otEndTime` time NULL DEFAULT NULL,
  `valid` tinyint(1) NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
)ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `DbDailyLog`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `workId` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `taskName` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dateOfWork` date NULL DEFAULT NULL,
  `hourLength` int NULL DEFAULT NULL,
  `finishPercentage` int NULL DEFAULT NULL,
  `preDateOfFinish` date NULL DEFAULT NULL,
  `hasProblem` tinyint(1) NULL DEFAULT NULL,
  `problemDescription` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `datetimeOfUpdate` date NULL DEFAULT NULL,
  `datetimeOfCreate` date NULL DEFAULT NULL,
  `valid` tinyint(1) NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
)ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `DbConsumeOvertime`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `workId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `workRecordId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `overtimeRecId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `consumeLength` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
)ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `DbUserProfile`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `workId` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vdiId` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vdiIp` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `valid` tinyint(1) NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
)ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

ALTER TABLE `DbDailyLog` ADD `taskType` VARCHAR (30) CHARACTER
SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;
ALTER TABLE `DbDailyLog` ADD `supporter` VARCHAR (30) CHARACTER
SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;
ALTER TABLE `DbDailyLog` ADD `jiraId` VARCHAR (30) CHARACTER
SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;

CREATE TABLE IF NOT EXISTS `DbUserRole`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roleIndex` int NOT NULL,
  `workId` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `valid` tinyint(1) NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
)ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `DbRolePermission`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roleIndex` int NOT NULL,
  `permission` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `valid` tinyint(1) NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
)ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

ALTER TABLE `DbDailyLog` ADD `realDateOfFinish` date NULL DEFAULT NULL;

CREATE TABLE IF NOT EXISTS `DbSalaryParameter`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `workId` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seqId` int NULL DEFAULT NULL,
  `baseSal` double(14,2) NULL DEFAULT NULL,
  `baseBonus` double(14,2) NULL DEFAULT NULL,
  `baseSociSecuLine` double(14,2) NULL DEFAULT NULL,
  `baseHousFundLine` double(14,2) NULL DEFAULT NULL,
  `effStartDay` date NULL DEFAULT NULL,
  `effEndDay` date NULL DEFAULT NULL,
  `valid` tinyint(1) NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
)ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `DbSalaryMonthly` (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `workId` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `salParaSeqId` int NULL DEFAULT NULL,
  `year` int NULL DEFAULT NULL,
  `month` int NULL DEFAULT NULL,
  `sociSecuAmount` double(14,2) NULL DEFAULT NULL,
  `sociSecuDesc` varchar(500) NULL DEFAULT NULL,
  `housFundAmount` double(14,2) NULL DEFAULT NULL,
  `housFundDesc` varchar(500) NULL DEFAULT NULL,
  `createDate` date NULL DEFAULT NULL,
  `updateDate` date NULL DEFAULT NULL,
  PRIMARY KEY(`id`) USING BTREE
)ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE IF NOT EXISTS `DbWorkTimeStatistics`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `workId` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `month` int NOT NULL,
  `year` int NOT NULL,
  `absentDays` double(14,2) NOT NULL,
  `absentExHours` int NOT NULL,
  `holidayDays` double(14,2) NOT NULL, 
  `overtimeHours` int NOT NULL, 
  `shiftHours` int NOT NULL, 
  `lastMonthOvertimeLeftHours` int NOT NULL,   
  `lastMonthOvertimeConsumeHours` int NOT NULL,
  `thisMonthOvertimeConsumeHours` int NOT NULL,
  `totalOvertimeConsumeHours` int NOT NULL, 
  `overtimeLeftOverHours` int NOT NULL,
  `valid` tinyint(1) NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
)ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

ALTER TABLE `DbWorkTimeStatistics` ADD `datetimeOfUpdate` datetime NULL DEFAULT NULL;
ALTER TABLE `DbWorkTimeStatistics` ADD `datetimeOfCreate` datetime NULL DEFAULT NULL;
ALTER TABLE `DbWorkTimeStatistics` ADD `realWorkDays` double(14,2) NULL DEFAULT NULL;
ALTER TABLE `DbWorkTimeStatistics` ADD `realWorkHours` int NULL DEFAULT NULL;

CREATE TABLE IF NOT EXISTS `DbProjectTask`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `workId` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `workName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,  
  `projectId` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jiraId` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,  
  `jiraTaskName` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dateOfStart` date NULL DEFAULT NULL,
  `dateOfEnd` date NULL DEFAULT NULL,
  `finishPercentage` int NULL DEFAULT NULL,
  `realDateOfFinish` date NULL DEFAULT NULL,
  `valid` tinyint(1) NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
)ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

ALTER TABLE `DbProjectTask` ADD `verified` tinyint(1) NULL DEFAULT NULL;
ALTER TABLE `DbProjectTask` ADD `assignerWorkId` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;

CREATE TABLE IF NOT EXISTS `DbOtHoliApply`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `workId` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dateOfWork` date NULL DEFAULT NULL,
  `leaveInfo` int NULL DEFAULT NULL,
  `reasonOfLeave` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `startTime` time NULL DEFAULT NULL,
  `endTime` time NULL DEFAULT NULL,
  `isApproved` tinyint(1) NULL DEFAULT 0,
  `active` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
)ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

ALTER TABLE `DbUser` ADD `dateOfLeaveProject` date NULL DEFAULT NULL;
update `DbUser` set dateOfLeaveProject = '2099-12-31';

ALTER TABLE `DbOtHoliApply` ADD `shijianum` int NULL DEFAULT 0;
ALTER TABLE `DbOtHoliApply` ADD `bingjianum` int NULL DEFAULT 0;
ALTER TABLE `DbOtHoliApply` ADD `nianjianum` int NULL DEFAULT 0;
ALTER TABLE `DbOtHoliApply` ADD `qitajianum` int NULL DEFAULT 0;
ALTER TABLE `DbOtHoliApply` ADD `tiaoxiunum` int NULL DEFAULT 0;

ALTER TABLE `DbUser` ADD `defaultDayBeginTime` time NULL DEFAULT NULL;
ALTER TABLE `DbUser` ADD `defaultDayEndTime` time NULL DEFAULT NULL;
ALTER TABLE `DbUser` ADD `defaultNoonrestBeginTime` time NULL DEFAULT NULL;
ALTER TABLE `DbUser` ADD `defaultAfternoonBeginTime` time NULL DEFAULT NULL;

ALTER TABLE `DbOtHoliApply` ADD `defaultDayBeginTime` time NULL DEFAULT NULL;
ALTER TABLE `DbOtHoliApply` ADD `defaultDayEndTime` time NULL DEFAULT NULL;
ALTER TABLE `DbOtHoliApply` ADD `defaultNoonrestBeginTime` time NULL DEFAULT NULL;
ALTER TABLE `DbOtHoliApply` ADD `defaultAfternoonBeginTime` time NULL DEFAULT NULL;

ALTER TABLE `DbWorkRecord` ADD `otHoliApplyid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;

ALTER TABLE `DbDailyLog` ADD `isCharge` tinyint(1) NULL DEFAULT 0;
CREATE TABLE IF NOT EXISTS `DbWorkTimeStatisticsReportHistory`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `month` int NOT NULL,
  `year` int NOT NULL,
  `fileName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `filePath` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authWorkId` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `datetimeCreated` datetime NULL DEFAULT NULL;
  `valid` tinyint(1) NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
)ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;
ALTER TABLE `DbProjectTask` ADD `jiraStatus` varchar(30) NULL;
ALTER TABLE `DbProjectTask` ADD `sourceType` tinyint(1) DEFAULT 1;
--1:Daydate系统的，2:来自Jira的
ALTER TABLE `DbProjectTask` ADD `taskType` tinyint(1) DEFAULT 1;
--1:普通bug，2:需求变更，3:普通任务
update DbProjectTask set sourceType=2 where 1=1;
update DbProjectTask set taskType=1 where 1=1;
ALTER TABLE `DbProjectTask` ADD `parentJiraId` varchar(30) NULL;
ALTER TABLE `DbProjectTask` ADD `isNewReq` tinyint(1) DEFAULT 0;