/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.1.205
 Source Server Type    : MySQL
 Source Server Version : 50744 (5.7.44)
 Source Host           : 192.168.1.205:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 50744 (5.7.44)
 File Encoding         : 65001

 Date: 04/09/2024 09:53:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for big_screen_biz_component
-- ----------------------------
DROP TABLE IF EXISTS `big_screen_biz_component`;
CREATE TABLE `big_screen_biz_component`  (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '业务组件中文名称',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '业务组件编码，唯一标识符',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分组',
  `cover_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '封面图片文件路径',
  `vue_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'vue组件内容',
  `setting_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '组件配置内容',
  `order_num` bigint(64) NOT NULL DEFAULT 0 COMMENT '排序',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint(64) NULL DEFAULT 2 COMMENT '创建人',
  `update_by` bigint(64) NULL DEFAULT 2 COMMENT '更新人',
  `module_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模块编码',
  `del_flag` tinyint(2) NOT NULL DEFAULT 0 COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '业务组件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of big_screen_biz_component
-- ----------------------------

-- ----------------------------
-- Table structure for big_screen_file
-- ----------------------------
DROP TABLE IF EXISTS `big_screen_file`;
CREATE TABLE `big_screen_file`  (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '模块/类型',
  `original_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '原文件名',
  `new_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '新文件名',
  `extension` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '后缀名(如: txt、png、doc、java等)',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '访问路径',
  `size` bigint(64) NOT NULL DEFAULT 0 COMMENT '文件大小',
  `download_count` int(11) NOT NULL DEFAULT 0 COMMENT '下载次数',
  `user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '上传用户',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint(64) NULL DEFAULT 2 COMMENT '创建人',
  `update_by` bigint(64) NULL DEFAULT 2 COMMENT '更新人',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标记0:保留，1:删除',
  `bucket` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'gc-starter' COMMENT '桶名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '文件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of big_screen_file
-- ----------------------------

-- ----------------------------
-- Table structure for big_screen_map
-- ----------------------------
DROP TABLE IF EXISTS `big_screen_map`;
CREATE TABLE `big_screen_map`  (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父级地图id',
  `map_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地图编码',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地图名称',
  `geo_json` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '地图geoJson',
  `level` tinyint(2) NOT NULL DEFAULT 0 COMMENT '地图级别 0-世界 1-国家 2-省 3-市 4-区县',
  `uploaded_geo_json` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否已上传geoJson 0-否 1-是',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint(64) NULL DEFAULT 2 COMMENT '创建人',
  `update_by` bigint(64) NULL DEFAULT 2 COMMENT '更新人',
  `del_flag` tinyint(2) NOT NULL DEFAULT 0 COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '地图数据维护表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of big_screen_map
-- ----------------------------

-- ----------------------------
-- Table structure for big_screen_page
-- ----------------------------
DROP TABLE IF EXISTS `big_screen_page`;
CREATE TABLE `big_screen_page`  (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '页面中文名称',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '页面编码，页面唯一标识符',
  `cover_picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '封面图片文件路径',
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'custom' COMMENT '页面类型',
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '页面配置',
  `parent_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '父级目录编码',
  `order_num` bigint(64) NOT NULL DEFAULT 0 COMMENT '排序',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备忘',
  `app_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '所属应用编码',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint(64) NULL DEFAULT 2 COMMENT '创建人',
  `update_by` bigint(64) NULL DEFAULT 2 COMMENT '更新人',
  `del_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识符 1 删除 0未删',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1830905441814511619 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '页面基本信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of big_screen_page
-- ----------------------------
INSERT INTO `big_screen_page` VALUES (1830905441814511618, 'test', 'bigScreen_rf4C0Fmodn', '/cover\\bigScreen_rf4C0Fmodn.png', 'bigScreen', '{\"className\":\"com.gccloud.dataroom.core.module.manage.dto.DataRoomPageDTO\",\"appCode\":\"\",\"id\":\"1830905441814511618\",\"name\":\"test\",\"code\":\"bigScreen_rf4C0Fmodn\",\"icon\":\"00dataSourceSet\",\"coverPicture\":\"/cover\\\\bigScreen_rf4C0Fmodn.png\",\"iconColor\":\"#007aff\",\"orderNum\":0,\"remark\":\"\",\"style\":\"\",\"parentCode\":\"\",\"chartList\":[{\"className\":\"com.gccloud.dataroom.core.module.chart.components.CustomComponentChart\",\"version\":\"2023111401\",\"key\":\"mtPFiHcj\",\"code\":\"mtPFiHcj\",\"dataSource\":{\"className\":\"com.gccloud.dataroom.core.module.chart.components.datasource.DataSetDataSource\",\"source\":\"dataset\",\"businessKey\":\"\",\"dataSourceKey\":\"\",\"dataSetType\":\"1\",\"params\":{},\"dimensionField\":\"\",\"metricField\":\"\",\"seriesField\":\"\",\"dimensionFieldList\":[],\"metricFieldList\":[],\"seriesFieldList\":[],\"serverPagination\":false,\"pageSize\":10,\"colorField\":null,\"shapeField\":null,\"sizeField\":null,\"openField\":null,\"closeField\":null,\"lowField\":null,\"highField\":null,\"xfield\":null},\"showTitle\":true,\"title\":\"基础玉珏图\",\"name\":\"JiChuYuJueTu\",\"type\":\"customComponent\",\"w\":728,\"h\":497,\"x\":1147,\"y\":542,\"z\":10,\"group\":\"\",\"locked\":false,\"linkage\":{\"action\":{\"type\":\"js\",\"script\":\"\"},\"components\":[]},\"inParams\":[],\"theme\":{\"dark\":{\"color\":[\"#6b74e4\",\"#4391f4\",\"#38bbe5\",\"#69d6fd\",\"#36c6a0\"],\"backgroundStyle_fill\":\"rgba(0,0,0,0)\",\"xAxis_labelStyle_fill\":\"#e9e9e9\"},\"light\":{\"color\":[\"#6b74e4\",\"#4391f4\",\"#38bbe5\",\"#69d6fd\",\"#36c6a0\"],\"backgroundStyle_fill\":\"rgba(0,0,0,0)\",\"xAxis_labelStyle_fill\":\"#e9e9e9\"}},\"border\":{\"type\":\"\",\"titleHeight\":60,\"fontSize\":16,\"isTitle\":true,\"padding\":[16,16,16,16]},\"expression\":null,\"expressionCodes\":null,\"rotateX\":0,\"rotateY\":0,\"rotateZ\":0,\"perspective\":0,\"skewX\":0,\"skewY\":0,\"parentCode\":null,\"optionHandler\":null,\"dataHandler\":\"\",\"chartType\":\"RadialBar\",\"option\":\"{\\\"dataKey\\\":\\\"data\\\",\\\"appendPadding\\\":[0,0,0,0],\\\"data\\\":[],\\\"xField\\\":\\\"type\\\",\\\"yField\\\":\\\"value\\\",\\\"startAngle\\\":-1.5707963267948966,\\\"maxAngle\\\":270,\\\"radius\\\":0.8,\\\"color\\\":[\\\"#6b74e4\\\",\\\"#4391f4\\\",\\\"#38bbe5\\\",\\\"#69d6fd\\\",\\\"#36c6a0\\\"],\\\"colorField\\\":\\\"type\\\",\\\"innerRadius\\\":0.2,\\\"barStyle\\\":{\\\"lineCap\\\":\\\"round\\\"},\\\"minBarWidth\\\":10,\\\"maxBarWidth\\\":100,\\\"barBackground\\\":{\\\"style\\\":{\\\"fill\\\":\\\"rgba(0,0,0,0)\\\"}},\\\"xAxis\\\":{\\\"label\\\":{\\\"style\\\":{\\\"fill\\\":\\\"#e9e9e9\\\",\\\"fontSize\\\":12,\\\"fontWeight\\\":600}}},\\\"displayOption\\\":{\\\"serverPagination\\\":{\\\"enable\\\":false},\\\"pageSize\\\":{\\\"enable\\\":false},\\\"metricField\\\":{\\\"label\\\":\\\"指标\\\",\\\"enable\\\":true,\\\"multiple\\\":true},\\\"dimensionField\\\":{\\\"label\\\":\\\"维度\\\",\\\"enable\\\":true,\\\"multiple\\\":true},\\\"dimensionList\\\":{\\\"label\\\":\\\"维度\\\",\\\"enable\\\":false,\\\"multiple\\\":true},\\\"seriesField\\\":{\\\"enable\\\":false,\\\"required\\\":true},\\\"dataAllocation\\\":{\\\"enable\\\":true},\\\"params\\\":{\\\"enable\\\":true},\\\"dataSourceType\\\":{\\\"enable\\\":true}},\\\"theme\\\":\\\"transparent\\\"}\",\"setting\":[{\"field\":\"xField\",\"value\":\"\"},{\"field\":\"yField\",\"value\":\"\"},{\"field\":\"color\",\"value\":[\"#6b74e4\",\"#4391f4\",\"#38bbe5\",\"#69d6fd\",\"#36c6a0\"]},{\"field\":\"barStyle_lineCap\",\"value\":\"round\"},{\"field\":\"maxAngle\",\"value\":270},{\"field\":\"minBarWidth\",\"value\":10},{\"field\":\"maxBarWidth\",\"value\":100},{\"field\":\"backgroundStyle_fill\",\"value\":\"rgba(0,0,0,0)\"},{\"field\":\"xAxis_labelStyle_fill\",\"value\":\"#e9e9e9\"},{\"field\":\"xAxis_labelStyle_fontSize\",\"value\":12},{\"field\":\"xAxis_labelStyle_fontWeight\",\"value\":600},{\"field\":\"appendPadding\",\"value\":[0,0,0,0]}],\"category\":\"基础玉珏图\"},{\"className\":\"com.gccloud.dataroom.core.module.chart.components.ScreenCandlestickChart\",\"version\":\"2023071001\",\"key\":\"hMKKEKPT\",\"code\":\"hMKKEKPT\",\"dataSource\":{\"className\":\"com.gccloud.dataroom.core.module.chart.components.datasource.DataSetDataSource\",\"source\":\"dataset\",\"businessKey\":\"\",\"dataSourceKey\":\"\",\"dataSetType\":\"1\",\"params\":{},\"dimensionField\":\"\",\"metricField\":\"\",\"seriesField\":\"\",\"dimensionFieldList\":[],\"metricFieldList\":[],\"seriesFieldList\":[],\"serverPagination\":false,\"pageSize\":10,\"colorField\":null,\"shapeField\":null,\"sizeField\":null,\"openField\":\"\",\"closeField\":\"\",\"lowField\":\"\",\"highField\":\"\",\"xfield\":\"\"},\"showTitle\":true,\"title\":\"K线图\",\"name\":\"K线图\",\"type\":\"candlestick\",\"w\":556,\"h\":380,\"x\":1303,\"y\":85,\"z\":9,\"group\":\"\",\"locked\":false,\"linkage\":{\"action\":{\"type\":\"js\",\"script\":\"\"},\"components\":[]},\"inParams\":[],\"theme\":{\"dark\":{\"highColor\":\"#c23531\",\"lowColor\":\"#314656\",\"gridColor\":\"#314656\",\"xAxis_nameColor\":\"#fff\",\"xAxis_tickColor\":\"#fff\",\"xAxis_labelColor\":\"#fff\",\"xAxis_lineColor\":\"#fff\",\"yAxis_nameColor\":\"#fff\",\"yAxis_tickColor\":\"#fff\",\"yAxis_labelColor\":\"#fff\",\"yAxis_lineColor\":\"#fff\"},\"light\":{\"highColor\":\"#c23531\",\"lowColor\":\"#314656\",\"gridColor\":\"#314656\",\"xAxis_nameColor\":\"#fff\",\"xAxis_tickColor\":\"#fff\",\"xAxis_labelColor\":\"#fff\",\"xAxis_lineColor\":\"#fff\",\"yAxis_nameColor\":\"#fff\",\"yAxis_tickColor\":\"#fff\",\"yAxis_labelColor\":\"#fff\",\"yAxis_lineColor\":\"#fff\"}},\"border\":{\"type\":\"\",\"titleHeight\":60,\"fontSize\":16,\"isTitle\":true,\"padding\":[0,0,0,0]},\"expression\":null,\"expressionCodes\":null,\"rotateX\":0,\"rotateY\":0,\"rotateZ\":0,\"perspective\":0,\"skewX\":0,\"skewY\":0,\"customize\":{\"highColor\":\"#c23531\",\"lowColor\":\"#314656\",\"gridShow\":true,\"gridColor\":\"#314656\",\"gridWidth\":1,\"left\":50,\"right\":20,\"top\":20,\"bottom\":60,\"xAxis\":{\"name\":\"\",\"nameGap\":30,\"nameColor\":\"#fff\",\"nameSize\":16,\"position\":\"end\",\"tickWidth\":1,\"tickColor\":\"#fff\",\"labelColor\":\"#fff\",\"labelSize\":12,\"lineColor\":\"#fff\",\"lineWidth\":1},\"yAxis\":{\"name\":\"\",\"nameGap\":10,\"nameColor\":\"#fff\",\"nameSize\":16,\"position\":\"end\",\"tickWidth\":1,\"tickColor\":\"#fff\",\"labelColor\":\"#fff\",\"labelSize\":12,\"lineColor\":\"#fff\",\"lineWidth\":1}}},{\"className\":\"com.gccloud.dataroom.core.module.chart.components.ScreenSankeyChart\",\"version\":\"2023071001\",\"key\":\"nGdJFPNX\",\"code\":\"nGdJFPNX\",\"dataSource\":{\"className\":\"com.gccloud.dataroom.core.module.chart.components.datasource.DataSetDataSource\",\"source\":\"dataset\",\"businessKey\":\"\",\"dataSourceKey\":\"\",\"dataSetType\":\"1\",\"params\":{},\"dimensionField\":\"\",\"metricField\":\"\",\"seriesField\":\"\",\"dimensionFieldList\":[],\"metricFieldList\":[],\"seriesFieldList\":[],\"serverPagination\":false,\"pageSize\":10,\"colorField\":null,\"shapeField\":null,\"sizeField\":null,\"openField\":null,\"closeField\":null,\"lowField\":null,\"highField\":null,\"xfield\":null},\"showTitle\":true,\"title\":\"桑基图\",\"name\":\"桑基图\",\"type\":\"sankey\",\"w\":485,\"h\":220,\"x\":776,\"y\":93,\"z\":8,\"group\":\"\",\"locked\":false,\"linkage\":{\"action\":{\"type\":\"js\",\"script\":\"\"},\"components\":[]},\"inParams\":[],\"theme\":{\"dark\":{\"normal_labelColor\":\"#fff\",\"normal_itemBorderColor\":\"#aaa\",\"normal_lineColor\":\"gradient\",\"emphasis_labelColor\":\"#fff\",\"emphasis_itemBorderColor\":\"#aaa\",\"emphasis_lineColor\":\"gradient\"},\"light\":{\"normal_labelColor\":\"#fff\",\"normal_itemBorderColor\":\"#aaa\",\"normal_lineColor\":\"gradient\",\"emphasis_labelColor\":\"#fff\",\"emphasis_itemBorderColor\":\"#aaa\",\"emphasis_lineColor\":\"gradient\"}},\"border\":{\"type\":\"\",\"titleHeight\":60,\"fontSize\":16,\"isTitle\":true,\"padding\":[0,0,0,0]},\"expression\":null,\"expressionCodes\":null,\"rotateX\":0,\"rotateY\":0,\"rotateZ\":0,\"perspective\":0,\"skewX\":0,\"skewY\":0,\"customize\":{\"top\":20,\"bottom\":20,\"left\":20,\"right\":50,\"normal\":{\"labelPosition\":\"right\",\"labelColor\":\"#fff\",\"labelSize\":12,\"labelFontWeight\":\"bold\",\"itemBorderColor\":\"#aaa\",\"itemBorderWidth\":1,\"itemBorderType\":\"solid\",\"lineColor\":\"gradient\",\"lineCurveness\":0.5},\"emphasis\":{\"labelPosition\":\"right\",\"labelColor\":\"#fff\",\"labelSize\":12,\"labelFontWeight\":\"bold\",\"itemBorderColor\":\"#aaa\",\"itemBorderWidth\":1,\"itemBorderType\":\"solid\",\"lineColor\":\"gradient\",\"lineCurveness\":0.5}}},{\"className\":\"com.gccloud.dataroom.core.module.chart.components.CustomComponentChart\",\"version\":\"2023111401\",\"key\":\"EaDtpQCR\",\"code\":\"EaDtpQCR\",\"dataSource\":{\"className\":\"com.gccloud.dataroom.core.module.chart.components.datasource.DataSetDataSource\",\"source\":\"dataset\",\"businessKey\":\"\",\"dataSourceKey\":\"\",\"dataSetType\":\"1\",\"params\":{},\"dimensionField\":\"\",\"metricField\":\"\",\"seriesField\":\"\",\"dimensionFieldList\":[],\"metricFieldList\":[],\"seriesFieldList\":[],\"serverPagination\":false,\"pageSize\":10,\"colorField\":null,\"shapeField\":null,\"sizeField\":null,\"openField\":null,\"closeField\":null,\"lowField\":null,\"highField\":null,\"xfield\":null},\"showTitle\":true,\"title\":\"基础漏斗图\",\"name\":\"JiChuLouDouTu\",\"type\":\"customComponent\",\"w\":606,\"h\":702,\"x\":524,\"y\":334,\"z\":7,\"group\":\"\",\"locked\":false,\"linkage\":{\"action\":{\"type\":\"js\",\"script\":\"\"},\"components\":[]},\"inParams\":[],\"theme\":{\"dark\":{\"conversionTag_style_fill\":\"#e9e9e9\",\"color\":[\"#6b74e4\",\"#4391f4\",\"#38bbe5\",\"#69d6fd\",\"#36c6a0\"],\"label_style_fill\":\"#ffffff\",\"legendItemName_style_fill\":\"#e9e9e9\"},\"light\":{\"conversionTag_style_fill\":\"#e9e9e9\",\"color\":[\"#6b74e4\",\"#4391f4\",\"#38bbe5\",\"#69d6fd\",\"#36c6a0\"],\"label_style_fill\":\"#ffffff\",\"legendItemName_style_fill\":\"#e9e9e9\"}},\"border\":{\"type\":\"\",\"titleHeight\":60,\"fontSize\":16,\"isTitle\":true,\"padding\":[16,16,16,16]},\"expression\":null,\"expressionCodes\":null,\"rotateX\":0,\"rotateY\":0,\"rotateZ\":0,\"perspective\":0,\"skewX\":0,\"skewY\":0,\"parentCode\":null,\"optionHandler\":\"option.legend = option.legendEnable ? {position: option.legendPosition}: false;\\nwindow.conversionTagName = option.conversionTagName\\noption.conversionTag.formatter = (datum) => {\\n  const percentage = parseFloat(datum.$$percentage$$)\\n  return window.conversionTagName +  (percentage * 100).toFixed(2) + \'%\'\\n}\\nif (option.legendEnable) {\\n   option.legend.itemName = option.legendItemName\\n}\\n\",\"dataHandler\":\"data = data.sort((a, b) => b[option.yField] - a[option.yField])\",\"chartType\":\"Funnel\",\"option\":\"{\\\"dataKey\\\":\\\"data\\\",\\\"appendPadding\\\":[0,0,0,0],\\\"renderer\\\":\\\"canvas\\\",\\\"data\\\":[],\\\"color\\\":[\\\"#6b74e4\\\",\\\"#4391f4\\\",\\\"#38bbe5\\\",\\\"#69d6fd\\\",\\\"#36c6a0\\\"],\\\"xField\\\":\\\"stage\\\",\\\"yField\\\":\\\"number\\\",\\\"dynamicHeight\\\":false,\\\"isTransposed\\\":false,\\\"legendEnable\\\":false,\\\"legendLayout\\\":\\\"vertical\\\",\\\"legendPosition\\\":\\\"top\\\",\\\"legend\\\":false,\\\"legendItemName\\\":{\\\"style\\\":{\\\"fill\\\":\\\"#e9e9e9\\\",\\\"fontSize\\\":12,\\\"fontWeight\\\":400}},\\\"conversionTagName\\\":\\\"转化率\\\",\\\"shape\\\":\\\"funnel\\\",\\\"label\\\":{\\\"style\\\":{\\\"fill\\\":\\\"#ffffff\\\",\\\"opacity\\\":1,\\\"fontSize\\\":10}},\\\"conversionTag\\\":{\\\"offsetX\\\":10,\\\"offsetY\\\":0,\\\"style\\\":{\\\"fill\\\":\\\"#e9e9e9\\\",\\\"fontSize\\\":10},\\\"formatter\\\":\\\"((datum) => {\\\\n  const percentage = parseFloat(datum.$$percentage$$)\\\\n  return window.conversionTagName +  (percentage * 100).toFixed(2) + \'%\'\\\\n})\\\"},\\\"displayOption\\\":{\\\"serverPagination\\\":{\\\"enable\\\":false},\\\"pageSize\\\":{\\\"enable\\\":false},\\\"metricField\\\":{\\\"label\\\":\\\"指标\\\",\\\"enable\\\":true,\\\"multiple\\\":true},\\\"dimensionField\\\":{\\\"label\\\":\\\"维度\\\",\\\"enable\\\":true,\\\"multiple\\\":true},\\\"dimensionList\\\":{\\\"label\\\":\\\"维度\\\",\\\"enable\\\":false,\\\"multiple\\\":true},\\\"seriesField\\\":{\\\"enable\\\":false,\\\"required\\\":true},\\\"dataAllocation\\\":{\\\"enable\\\":true},\\\"params\\\":{\\\"enable\\\":true},\\\"dataSourceType\\\":{\\\"enable\\\":true}},\\\"theme\\\":\\\"transparent\\\"}\",\"setting\":[{\"field\":\"xField\",\"value\":\"\"},{\"field\":\"yField\",\"value\":\"\"},{\"field\":\"dynamicHeight\",\"value\":false},{\"field\":\"isTransposed\",\"value\":false},{\"field\":\"conversionTagName\",\"value\":\"转化率\"},{\"field\":\"conversionTag_style_fill\",\"value\":\"#e9e9e9\"},{\"field\":\"conversionTag_style_fontSize\",\"value\":10},{\"field\":\"color\",\"value\":[\"#6b74e4\",\"#4391f4\",\"#38bbe5\",\"#69d6fd\",\"#36c6a0\"]},{\"field\":\"label_style_fill\",\"value\":\"#ffffff\"},{\"field\":\"label_style_fontSize\",\"value\":10},{\"field\":\"legendEnable\",\"value\":false},{\"field\":\"legendPosition\",\"value\":\"top\"},{\"field\":\"legendItemName_style_fontSize\",\"value\":12},{\"field\":\"legendItemName_style_fontWeight\",\"value\":400},{\"field\":\"legendItemName_style_fill\",\"value\":\"#e9e9e9\"},{\"field\":\"appendPadding\",\"value\":[0,0,0,0]}],\"category\":\"基础漏斗图\"},{\"className\":\"com.gccloud.dataroom.core.module.chart.components.CustomComponentChart\",\"version\":\"2023111401\",\"key\":\"biHJQsje\",\"code\":\"biHJQsje\",\"dataSource\":{\"className\":\"com.gccloud.dataroom.core.module.chart.components.datasource.DataSetDataSource\",\"source\":\"dataset\",\"businessKey\":\"\",\"dataSourceKey\":\"\",\"dataSetType\":\"1\",\"params\":{},\"dimensionField\":\"\",\"metricField\":\"\",\"seriesField\":\"\",\"dimensionFieldList\":[],\"metricFieldList\":[],\"seriesFieldList\":[],\"serverPagination\":false,\"pageSize\":10,\"colorField\":null,\"shapeField\":null,\"sizeField\":null,\"openField\":null,\"closeField\":null,\"lowField\":null,\"highField\":null,\"xfield\":null},\"showTitle\":true,\"title\":\"基础矩形树图\",\"name\":\"JiChuJuXingShuTu\",\"type\":\"customComponent\",\"w\":470,\"h\":373,\"x\":24,\"y\":674,\"z\":6,\"group\":\"\",\"locked\":false,\"linkage\":{\"action\":{\"type\":\"js\",\"script\":\"\"},\"components\":[]},\"inParams\":[],\"theme\":{\"dark\":{\"label_style_color\":\"#FFFFFF\",\"color\":[\"#6b74e4\",\"#4391f4\",\"#38bbe5\",\"#69d6fd\",\"#36c6a0\"],\"legendItemName_style_fill\":\"#e9e9e9\"},\"light\":{\"label_style_color\":\"#FFFFFF\",\"color\":[\"#6b74e4\",\"#4391f4\",\"#38bbe5\",\"#69d6fd\",\"#36c6a0\"],\"legendItemName_style_fill\":\"#e9e9e9\"}},\"border\":{\"type\":\"\",\"titleHeight\":60,\"fontSize\":16,\"isTitle\":true,\"padding\":[16,16,16,16]},\"expression\":null,\"expressionCodes\":null,\"rotateX\":0,\"rotateY\":0,\"rotateZ\":0,\"perspective\":0,\"skewX\":0,\"skewY\":0,\"parentCode\":null,\"optionHandler\":\"\\noption.legend = option.legendEnable ? {position: setting.find(settingItem=>settingItem.field === \'legendPosition\').value} : false;\\n  if (option.legendEnable) {\\n    option.legend.itemName = option.legendItemName\\n  }\",\"dataHandler\":\"// 转换数据格式\\ndata = {\\n  name: \'root\',\\n  children: data?.map(d => ({\\n    ...d,\\n    name: d[option.colorField],\\n    value: d[option.valueField]\\n  }))\\n};\",\"chartType\":\"Treemap\",\"option\":\"{\\\"dataKey\\\":\\\"data\\\",\\\"appendPadding\\\":[0,0,0,0],\\\"renderer\\\":\\\"canvas\\\",\\\"data\\\":[],\\\"color\\\":[\\\"#6b74e4\\\",\\\"#4391f4\\\",\\\"#38bbe5\\\",\\\"#69d6fd\\\",\\\"#36c6a0\\\"],\\\"colorField\\\":\\\"name\\\",\\\"valueField\\\":\\\"value\\\",\\\"legendEnable\\\":false,\\\"legendLayout\\\":\\\"vertical\\\",\\\"legendPosition\\\":\\\"top\\\",\\\"legend\\\":false,\\\"legendItemName\\\":{\\\"style\\\":{\\\"fill\\\":\\\"#e9e9e9\\\",\\\"fontSize\\\":12,\\\"fontWeight\\\":400}},\\\"label\\\":{\\\"style\\\":{\\\"fontSize\\\":\\\"10\\\",\\\"fill\\\":\\\"#FFFFFF\\\"}},\\\"displayOption\\\":{\\\"serverPagination\\\":{\\\"enable\\\":false},\\\"pageSize\\\":{\\\"enable\\\":false},\\\"metricField\\\":{\\\"label\\\":\\\"指标\\\",\\\"enable\\\":true,\\\"multiple\\\":true},\\\"dimensionField\\\":{\\\"label\\\":\\\"维度\\\",\\\"enable\\\":true,\\\"multiple\\\":true},\\\"dimensionList\\\":{\\\"label\\\":\\\"维度\\\",\\\"enable\\\":false,\\\"multiple\\\":true},\\\"seriesField\\\":{\\\"enable\\\":false,\\\"required\\\":true},\\\"dataAllocation\\\":{\\\"enable\\\":true},\\\"params\\\":{\\\"enable\\\":true},\\\"dataSourceType\\\":{\\\"enable\\\":true}},\\\"theme\\\":\\\"transparent\\\"}\",\"setting\":[{\"field\":\"colorField\",\"value\":\"\"},{\"field\":\"valueField\",\"value\":\"\"},{\"field\":\"lable_style_fontSize\",\"value\":\"10\"},{\"field\":\"label_style_color\",\"value\":\"#FFFFFF\"},{\"field\":\"color\",\"value\":[\"#6b74e4\",\"#4391f4\",\"#38bbe5\",\"#69d6fd\",\"#36c6a0\"]},{\"field\":\"legendEnable\",\"value\":false},{\"field\":\"legendPosition\",\"value\":\"top\"},{\"field\":\"legendItemName_style_fontSize\",\"value\":12},{\"field\":\"legendItemName_style_fontWeight\",\"value\":400},{\"field\":\"legendItemName_style_fill\",\"value\":\"#e9e9e9\"},{\"field\":\"appendPadding\",\"value\":[0,0,0,0]}],\"category\":\"基础矩形树图\"},{\"className\":\"com.gccloud.dataroom.core.module.chart.components.CustomComponentChart\",\"version\":\"2023111501\",\"key\":\"ydcDBAxm\",\"code\":\"ydcDBAxm\",\"dataSource\":{\"className\":\"com.gccloud.dataroom.core.module.chart.components.datasource.DataSetDataSource\",\"source\":\"dataset\",\"businessKey\":\"\",\"dataSourceKey\":\"\",\"dataSetType\":\"1\",\"params\":{},\"dimensionField\":\"\",\"metricField\":\"\",\"seriesField\":\"\",\"dimensionFieldList\":[],\"metricFieldList\":[],\"seriesFieldList\":[],\"serverPagination\":false,\"pageSize\":10,\"colorField\":null,\"shapeField\":null,\"sizeField\":null,\"openField\":null,\"closeField\":null,\"lowField\":null,\"highField\":null,\"xfield\":null},\"showTitle\":true,\"title\":\"词云图\",\"name\":\"CiYunTu\",\"type\":\"customComponent\",\"w\":450,\"h\":320,\"x\":37,\"y\":331,\"z\":5,\"group\":\"\",\"locked\":false,\"linkage\":{\"action\":{\"type\":\"js\",\"script\":\"\"},\"components\":[]},\"inParams\":[],\"theme\":{\"dark\":{\"color\":[\"#6b74e4\",\"#4391f4\",\"#38bbe5\",\"#69d6fd\",\"#36c6a0\"]},\"light\":{\"color\":[\"#6b74e4\",\"#4391f4\",\"#38bbe5\",\"#69d6fd\",\"#36c6a0\"]}},\"border\":{\"type\":\"\",\"titleHeight\":60,\"fontSize\":16,\"isTitle\":true,\"padding\":[16,16,16,16]},\"expression\":null,\"expressionCodes\":null,\"rotateX\":0,\"rotateY\":0,\"rotateZ\":0,\"perspective\":0,\"skewX\":0,\"skewY\":0,\"parentCode\":null,\"optionHandler\":\"option.wordStyle.fontSize = [option.fontSizeMin, option.fontSizeMax]\\nlet wordFieldValue = setting.find(settingItem=>settingItem.field === \'wordField\').value\\nif (wordFieldValue) {\\n  option.colorField = wordFieldValue\\n}\",\"dataHandler\":\"\",\"chartType\":\"WordCloud\",\"option\":\"{\\\"dataKey\\\":\\\"data\\\",\\\"appendPadding\\\":[0,0,0,0],\\\"data\\\":[],\\\"wordField\\\":\\\"name\\\",\\\"weightField\\\":\\\"value\\\",\\\"colorField\\\":\\\"name\\\",\\\"color\\\":[\\\"#6b74e4\\\",\\\"#4391f4\\\",\\\"#38bbe5\\\",\\\"#69d6fd\\\",\\\"#36c6a0\\\"],\\\"wordStyle\\\":{\\\"fontFamily\\\":\\\"Verdana\\\",\\\"fontSize\\\":[18,60]},\\\"fontSizeMin\\\":18,\\\"fontSizeMax\\\":60,\\\"imageMask\\\":\\\"\\\",\\\"interactions\\\":[{\\\"type\\\":\\\"element-active\\\"}],\\\"state\\\":{\\\"active\\\":{\\\"style\\\":{\\\"lineWidth\\\":3}}},\\\"displayOption\\\":{\\\"serverPagination\\\":{\\\"enable\\\":false},\\\"pageSize\\\":{\\\"enable\\\":false},\\\"metricField\\\":{\\\"label\\\":\\\"指标\\\",\\\"enable\\\":true,\\\"multiple\\\":true},\\\"dimensionField\\\":{\\\"label\\\":\\\"维度\\\",\\\"enable\\\":true,\\\"multiple\\\":true},\\\"dimensionList\\\":{\\\"label\\\":\\\"维度\\\",\\\"enable\\\":false,\\\"multiple\\\":true},\\\"seriesField\\\":{\\\"enable\\\":false,\\\"required\\\":true},\\\"dataAllocation\\\":{\\\"enable\\\":true},\\\"params\\\":{\\\"enable\\\":true},\\\"dataSourceType\\\":{\\\"enable\\\":true}},\\\"theme\\\":\\\"transparent\\\"}\",\"setting\":[{\"field\":\"wordField\",\"value\":\"\"},{\"field\":\"weightField\",\"value\":\"\"},{\"field\":\"color\",\"value\":[\"#6b74e4\",\"#4391f4\",\"#38bbe5\",\"#69d6fd\",\"#36c6a0\"]},{\"field\":\"imageMask\",\"value\":\"\"},{\"field\":\"fontSizeMin\",\"value\":18},{\"field\":\"fontSizeMax\",\"value\":60},{\"field\":\"appendPadding\",\"value\":[0,0,0,0]}],\"category\":\"词云图\"},{\"className\":\"com.gccloud.dataroom.core.module.chart.components.CustomComponentChart\",\"version\":\"2023111401\",\"key\":\"iHHHTKfe_FyQPY_BGtiS\",\"code\":\"iHHHTKfe_FyQPY_BGtiS\",\"dataSource\":{\"className\":\"com.gccloud.dataroom.core.module.chart.components.datasource.DataSetDataSource\",\"source\":\"dataset\",\"businessKey\":\"\",\"dataSourceKey\":\"\",\"dataSetType\":\"1\",\"params\":{},\"dimensionField\":\"\",\"metricField\":\"\",\"seriesField\":\"\",\"dimensionFieldList\":[],\"metricFieldList\":[],\"seriesFieldList\":[],\"serverPagination\":false,\"pageSize\":10,\"colorField\":null,\"shapeField\":null,\"sizeField\":null,\"openField\":null,\"closeField\":null,\"lowField\":null,\"highField\":null,\"xfield\":null},\"showTitle\":true,\"title\":\"仪表盘\",\"name\":\"YiBiaoPan\",\"type\":\"customComponent\",\"w\":236,\"h\":233,\"x\":506,\"y\":92,\"z\":4,\"group\":\"\",\"locked\":false,\"linkage\":{\"action\":{\"type\":\"js\",\"script\":\"\"},\"components\":[]},\"inParams\":[],\"theme\":{\"dark\":{\"color1\":\"l(0) 0:#BEE8FF 1:#1DAEFF\",\"color2\":\"#FFFFFF\",\"statistic_title_style_color\":\"#FFFFFF\",\"statistic_content_style_color\":\"#FFFFFF\"},\"light\":{\"color1\":\"l(0) 0:#BEE8FF 1:#1DAEFF\",\"color2\":\"#FFFFFF\",\"statistic_title_style_color\":\"#FFFFFF\",\"statistic_content_style_color\":\"#FFFFFF\"}},\"border\":{\"type\":\"\",\"titleHeight\":60,\"fontSize\":16,\"isTitle\":true,\"padding\":[16,16,16,16]},\"expression\":null,\"expressionCodes\":null,\"rotateX\":0,\"rotateY\":0,\"rotateZ\":0,\"perspective\":0,\"skewX\":0,\"skewY\":0,\"parentCode\":null,\"optionHandler\":\"option.range.color = [option.color1, option.color2]\\n  let fix = option.statisticFixed\\n  option.statistic.title.formatter = ({ percent }) => `${(percent * 100).toFixed(fix)}%`\",\"dataHandler\":\"// 取返回数据列表的第一项指标值\\noption.percent = data[0][setting.filter(settingItem=>settingItem.field === \'percent\')[0].value]\",\"chartType\":\"Gauge\",\"option\":\"{\\\"dataKey\\\":\\\"percent\\\",\\\"appendPadding\\\":[0,0,0,0],\\\"data\\\":[],\\\"percent\\\":0.75,\\\"color1\\\":\\\"l(0) 0:#BEE8FF 1:#1DAEFF\\\",\\\"color2\\\":\\\"#FFFFFF\\\",\\\"range\\\":{\\\"color\\\":[\\\"l(0) 0:#BEE8FF 1:#1DAEFF\\\",\\\"#FFFFFF\\\"]},\\\"indicator\\\":{\\\"pointer\\\":{\\\"style\\\":{\\\"stroke\\\":\\\"#D0D0D0\\\"}},\\\"pin\\\":{\\\"style\\\":{\\\"stroke\\\":\\\"#D0D0D0\\\"}}},\\\"axis\\\":{\\\"label\\\":{\\\"formatter\\\":\\\"(function formatter(v) {\\\\n        return Number(v) * 100;\\\\n      })\\\"},\\\"subTickLine\\\":{\\\"count\\\":3}},\\\"statisticFixed\\\":0,\\\"statistic\\\":{\\\"title\\\":{\\\"offsetY\\\":-10,\\\"style\\\":{\\\"fontSize\\\":40,\\\"lineHeight\\\":2,\\\"fontFamily\\\":\\\"ds-digitalbold\\\",\\\"color\\\":\\\"#FFFFFF\\\"},\\\"formatter\\\":\\\"(({ percent }) => `${(percent * 100).toFixed(fix)}%`)\\\"},\\\"content\\\":{\\\"offsetY\\\":-45,\\\"content\\\":\\\"\\\",\\\"style\\\":{\\\"fontSize\\\":20,\\\"lineHeight\\\":2,\\\"color\\\":\\\"#FFFFFF\\\"}}},\\\"displayOption\\\":{\\\"serverPagination\\\":{\\\"enable\\\":false},\\\"pageSize\\\":{\\\"enable\\\":false},\\\"metricField\\\":{\\\"label\\\":\\\"指标\\\",\\\"enable\\\":true,\\\"multiple\\\":true},\\\"dimensionField\\\":{\\\"label\\\":\\\"维度\\\",\\\"enable\\\":true,\\\"multiple\\\":true},\\\"dimensionList\\\":{\\\"label\\\":\\\"维度\\\",\\\"enable\\\":false,\\\"multiple\\\":true},\\\"seriesField\\\":{\\\"enable\\\":false,\\\"required\\\":true},\\\"dataAllocation\\\":{\\\"enable\\\":true},\\\"params\\\":{\\\"enable\\\":true},\\\"dataSourceType\\\":{\\\"enable\\\":true}},\\\"theme\\\":\\\"transparent\\\",\\\"type\\\":\\\"\\\"}\",\"setting\":[{\"field\":\"percent\",\"value\":\"\"},{\"field\":\"type\",\"value\":\"\"},{\"field\":\"color1\",\"value\":\"l(0) 0:#BEE8FF 1:#1DAEFF\"},{\"field\":\"color2\",\"value\":\"#FFFFFF\"},{\"field\":\"statistic_title_style_color\",\"value\":\"#FFFFFF\"},{\"field\":\"statistic_title_style_fontSize\",\"value\":40},{\"field\":\"statistic_fixed\",\"value\":0},{\"field\":\"statistic_title_style_fontFamily\",\"value\":\"ds-digitalbold\"},{\"field\":\"statistic_content_content\",\"value\":\"\"},{\"field\":\"statistic_content_style_color\",\"value\":\"#FFFFFF\"},{\"field\":\"statistic_content_style_fontSize\",\"value\":20},{\"field\":\"statistic_content_offsetY\",\"value\":-45},{\"field\":\"statistic_title_offsetY\",\"value\":-10},{\"field\":\"appendPadding\",\"value\":[0,0,0,0]}],\"category\":\"仪表盘\"},{\"className\":\"com.gccloud.dataroom.core.module.chart.components.CustomComponentChart\",\"version\":\"2023111401\",\"key\":\"iHHHTKfe_FyQPY\",\"code\":\"iHHHTKfe_FyQPY\",\"dataSource\":{\"className\":\"com.gccloud.dataroom.core.module.chart.components.datasource.DataSetDataSource\",\"source\":\"dataset\",\"businessKey\":\"\",\"dataSourceKey\":\"\",\"dataSetType\":\"1\",\"params\":{},\"dimensionField\":\"\",\"metricField\":\"\",\"seriesField\":\"\",\"dimensionFieldList\":[],\"metricFieldList\":[],\"seriesFieldList\":[],\"serverPagination\":false,\"pageSize\":10,\"colorField\":null,\"shapeField\":null,\"sizeField\":null,\"openField\":null,\"closeField\":null,\"lowField\":null,\"highField\":null,\"xfield\":null},\"showTitle\":true,\"title\":\"仪表盘\",\"name\":\"YiBiaoPan\",\"type\":\"customComponent\",\"w\":236,\"h\":233,\"x\":264,\"y\":89,\"z\":3,\"group\":\"\",\"locked\":false,\"linkage\":{\"action\":{\"type\":\"js\",\"script\":\"\"},\"components\":[]},\"inParams\":[],\"theme\":{\"dark\":{\"color1\":\"l(0) 0:#BEE8FF 1:#1DAEFF\",\"color2\":\"#FFFFFF\",\"statistic_title_style_color\":\"#FFFFFF\",\"statistic_content_style_color\":\"#FFFFFF\"},\"light\":{\"color1\":\"l(0) 0:#BEE8FF 1:#1DAEFF\",\"color2\":\"#FFFFFF\",\"statistic_title_style_color\":\"#FFFFFF\",\"statistic_content_style_color\":\"#FFFFFF\"}},\"border\":{\"type\":\"\",\"titleHeight\":60,\"fontSize\":16,\"isTitle\":true,\"padding\":[16,16,16,16]},\"expression\":null,\"expressionCodes\":null,\"rotateX\":0,\"rotateY\":0,\"rotateZ\":0,\"perspective\":0,\"skewX\":0,\"skewY\":0,\"parentCode\":null,\"optionHandler\":\"option.range.color = [option.color1, option.color2]\\n  let fix = option.statisticFixed\\n  option.statistic.title.formatter = ({ percent }) => `${(percent * 100).toFixed(fix)}%`\",\"dataHandler\":\"// 取返回数据列表的第一项指标值\\noption.percent = data[0][setting.filter(settingItem=>settingItem.field === \'percent\')[0].value]\",\"chartType\":\"Gauge\",\"option\":\"{\\\"dataKey\\\":\\\"percent\\\",\\\"appendPadding\\\":[0,0,0,0],\\\"data\\\":[],\\\"percent\\\":0.75,\\\"color1\\\":\\\"l(0) 0:#BEE8FF 1:#1DAEFF\\\",\\\"color2\\\":\\\"#FFFFFF\\\",\\\"range\\\":{\\\"color\\\":[\\\"l(0) 0:#BEE8FF 1:#1DAEFF\\\",\\\"#FFFFFF\\\"]},\\\"indicator\\\":{\\\"pointer\\\":{\\\"style\\\":{\\\"stroke\\\":\\\"#D0D0D0\\\"}},\\\"pin\\\":{\\\"style\\\":{\\\"stroke\\\":\\\"#D0D0D0\\\"}}},\\\"axis\\\":{\\\"label\\\":{\\\"formatter\\\":\\\"(function formatter(v) {\\\\n        return Number(v) * 100;\\\\n      })\\\"},\\\"subTickLine\\\":{\\\"count\\\":3}},\\\"statisticFixed\\\":0,\\\"statistic\\\":{\\\"title\\\":{\\\"offsetY\\\":-10,\\\"style\\\":{\\\"fontSize\\\":40,\\\"lineHeight\\\":2,\\\"fontFamily\\\":\\\"ds-digitalbold\\\",\\\"color\\\":\\\"#FFFFFF\\\"},\\\"formatter\\\":\\\"(({ percent }) => `${(percent * 100).toFixed(fix)}%`)\\\"},\\\"content\\\":{\\\"offsetY\\\":-45,\\\"content\\\":\\\"\\\",\\\"style\\\":{\\\"fontSize\\\":20,\\\"lineHeight\\\":2,\\\"color\\\":\\\"#FFFFFF\\\"}}},\\\"displayOption\\\":{\\\"serverPagination\\\":{\\\"enable\\\":false},\\\"pageSize\\\":{\\\"enable\\\":false},\\\"metricField\\\":{\\\"label\\\":\\\"指标\\\",\\\"enable\\\":true,\\\"multiple\\\":true},\\\"dimensionField\\\":{\\\"label\\\":\\\"维度\\\",\\\"enable\\\":true,\\\"multiple\\\":true},\\\"dimensionList\\\":{\\\"label\\\":\\\"维度\\\",\\\"enable\\\":false,\\\"multiple\\\":true},\\\"seriesField\\\":{\\\"enable\\\":false,\\\"required\\\":true},\\\"dataAllocation\\\":{\\\"enable\\\":true},\\\"params\\\":{\\\"enable\\\":true},\\\"dataSourceType\\\":{\\\"enable\\\":true}},\\\"theme\\\":\\\"transparent\\\",\\\"type\\\":\\\"\\\"}\",\"setting\":[{\"field\":\"percent\",\"value\":\"\"},{\"field\":\"type\",\"value\":\"\"},{\"field\":\"color1\",\"value\":\"l(0) 0:#BEE8FF 1:#1DAEFF\"},{\"field\":\"color2\",\"value\":\"#FFFFFF\"},{\"field\":\"statistic_title_style_color\",\"value\":\"#FFFFFF\"},{\"field\":\"statistic_title_style_fontSize\",\"value\":40},{\"field\":\"statistic_fixed\",\"value\":0},{\"field\":\"statistic_title_style_fontFamily\",\"value\":\"ds-digitalbold\"},{\"field\":\"statistic_content_content\",\"value\":\"\"},{\"field\":\"statistic_content_style_color\",\"value\":\"#FFFFFF\"},{\"field\":\"statistic_content_style_fontSize\",\"value\":20},{\"field\":\"statistic_content_offsetY\",\"value\":-45},{\"field\":\"statistic_title_offsetY\",\"value\":-10},{\"field\":\"appendPadding\",\"value\":[0,0,0,0]}],\"category\":\"仪表盘\"},{\"className\":\"com.gccloud.dataroom.core.module.chart.components.CustomComponentChart\",\"version\":\"2023111401\",\"key\":\"iHHHTKfe\",\"code\":\"iHHHTKfe\",\"dataSource\":{\"className\":\"com.gccloud.dataroom.core.module.chart.components.datasource.DataSetDataSource\",\"source\":\"dataset\",\"businessKey\":\"\",\"dataSourceKey\":\"\",\"dataSetType\":\"1\",\"params\":{},\"dimensionField\":\"\",\"metricField\":\"\",\"seriesField\":\"\",\"dimensionFieldList\":[],\"metricFieldList\":[],\"seriesFieldList\":[],\"serverPagination\":false,\"pageSize\":10,\"colorField\":null,\"shapeField\":null,\"sizeField\":null,\"openField\":null,\"closeField\":null,\"lowField\":null,\"highField\":null,\"xfield\":null},\"showTitle\":true,\"title\":\"仪表盘\",\"name\":\"YiBiaoPan\",\"type\":\"customComponent\",\"w\":236,\"h\":233,\"x\":17,\"y\":85,\"z\":2,\"group\":\"\",\"locked\":false,\"linkage\":{\"action\":{\"type\":\"js\",\"script\":\"\"},\"components\":[]},\"inParams\":[],\"theme\":{\"dark\":{\"color1\":\"l(0) 0:#BEE8FF 1:#1DAEFF\",\"color2\":\"#FFFFFF\",\"statistic_title_style_color\":\"#FFFFFF\",\"statistic_content_style_color\":\"#FFFFFF\"},\"light\":{\"color1\":\"l(0) 0:#BEE8FF 1:#1DAEFF\",\"color2\":\"#FFFFFF\",\"statistic_title_style_color\":\"#FFFFFF\",\"statistic_content_style_color\":\"#FFFFFF\"}},\"border\":{\"type\":\"\",\"titleHeight\":60,\"fontSize\":16,\"isTitle\":true,\"padding\":[16,16,16,16]},\"expression\":null,\"expressionCodes\":null,\"rotateX\":0,\"rotateY\":0,\"rotateZ\":0,\"perspective\":0,\"skewX\":0,\"skewY\":0,\"parentCode\":null,\"optionHandler\":\"option.range.color = [option.color1, option.color2]\\n  let fix = option.statisticFixed\\n  option.statistic.title.formatter = ({ percent }) => `${(percent * 100).toFixed(fix)}%`\",\"dataHandler\":\"// 取返回数据列表的第一项指标值\\noption.percent = data[0][setting.filter(settingItem=>settingItem.field === \'percent\')[0].value]\",\"chartType\":\"Gauge\",\"option\":\"{\\\"dataKey\\\":\\\"percent\\\",\\\"appendPadding\\\":[0,0,0,0],\\\"data\\\":[],\\\"percent\\\":0.75,\\\"color1\\\":\\\"l(0) 0:#BEE8FF 1:#1DAEFF\\\",\\\"color2\\\":\\\"#FFFFFF\\\",\\\"range\\\":{\\\"color\\\":[\\\"l(0) 0:#BEE8FF 1:#1DAEFF\\\",\\\"#FFFFFF\\\"]},\\\"indicator\\\":{\\\"pointer\\\":{\\\"style\\\":{\\\"stroke\\\":\\\"#D0D0D0\\\"}},\\\"pin\\\":{\\\"style\\\":{\\\"stroke\\\":\\\"#D0D0D0\\\"}}},\\\"axis\\\":{\\\"label\\\":{\\\"formatter\\\":\\\"(function formatter(v) {\\\\n        return Number(v) * 100;\\\\n      })\\\"},\\\"subTickLine\\\":{\\\"count\\\":3}},\\\"statisticFixed\\\":0,\\\"statistic\\\":{\\\"title\\\":{\\\"offsetY\\\":-10,\\\"style\\\":{\\\"fontSize\\\":40,\\\"lineHeight\\\":2,\\\"fontFamily\\\":\\\"ds-digitalbold\\\",\\\"color\\\":\\\"#FFFFFF\\\"},\\\"formatter\\\":\\\"(({ percent }) => `${(percent * 100).toFixed(fix)}%`)\\\"},\\\"content\\\":{\\\"offsetY\\\":-45,\\\"content\\\":\\\"\\\",\\\"style\\\":{\\\"fontSize\\\":20,\\\"lineHeight\\\":2,\\\"color\\\":\\\"#FFFFFF\\\"}}},\\\"displayOption\\\":{\\\"serverPagination\\\":{\\\"enable\\\":false},\\\"pageSize\\\":{\\\"enable\\\":false},\\\"metricField\\\":{\\\"label\\\":\\\"指标\\\",\\\"enable\\\":true,\\\"multiple\\\":true},\\\"dimensionField\\\":{\\\"label\\\":\\\"维度\\\",\\\"enable\\\":true,\\\"multiple\\\":true},\\\"dimensionList\\\":{\\\"label\\\":\\\"维度\\\",\\\"enable\\\":false,\\\"multiple\\\":true},\\\"seriesField\\\":{\\\"enable\\\":false,\\\"required\\\":true},\\\"dataAllocation\\\":{\\\"enable\\\":true},\\\"params\\\":{\\\"enable\\\":true},\\\"dataSourceType\\\":{\\\"enable\\\":true}},\\\"theme\\\":\\\"transparent\\\",\\\"type\\\":\\\"\\\"}\",\"setting\":[{\"field\":\"percent\",\"value\":\"\"},{\"field\":\"type\",\"value\":\"\"},{\"field\":\"color1\",\"value\":\"l(0) 0:#BEE8FF 1:#1DAEFF\"},{\"field\":\"color2\",\"value\":\"#FFFFFF\"},{\"field\":\"statistic_title_style_color\",\"value\":\"#FFFFFF\"},{\"field\":\"statistic_title_style_fontSize\",\"value\":40},{\"field\":\"statistic_fixed\",\"value\":0},{\"field\":\"statistic_title_style_fontFamily\",\"value\":\"ds-digitalbold\"},{\"field\":\"statistic_content_content\",\"value\":\"\"},{\"field\":\"statistic_content_style_color\",\"value\":\"#FFFFFF\"},{\"field\":\"statistic_content_style_fontSize\",\"value\":20},{\"field\":\"statistic_content_offsetY\",\"value\":-45},{\"field\":\"statistic_title_offsetY\",\"value\":-10},{\"field\":\"appendPadding\",\"value\":[0,0,0,0]}],\"category\":\"仪表盘\"},{\"className\":\"com.gccloud.dataroom.core.module.chart.components.ScreenTextChart\",\"version\":\"2023111401\",\"key\":\"1725356892627\",\"code\":\"makTycrY\",\"dataSource\":{\"className\":\"com.gccloud.dataroom.core.module.chart.components.datasource.DataSetDataSource\",\"source\":\"static\",\"businessKey\":\"\",\"dataSourceKey\":\"\",\"dataSetType\":\"1\",\"params\":{},\"dimensionField\":\"\",\"metricField\":\"\",\"seriesField\":\"\",\"dimensionFieldList\":[],\"metricFieldList\":[],\"seriesFieldList\":[],\"serverPagination\":false,\"pageSize\":10,\"colorField\":null,\"shapeField\":null,\"sizeField\":null,\"openField\":null,\"closeField\":null,\"lowField\":null,\"highField\":null,\"xfield\":null},\"showTitle\":true,\"title\":\"文本\",\"name\":\"文本\",\"type\":\"texts\",\"w\":200,\"h\":60,\"x\":860,\"y\":0,\"z\":1,\"group\":\"\",\"locked\":false,\"linkage\":{\"action\":{\"type\":\"js\",\"script\":\"\"},\"components\":[]},\"inParams\":[],\"theme\":{\"dark\":{\"color\":\"left,#ffffff,#ffffff\"},\"light\":{\"color\":\"left,#ffffff,#ffffff\"}},\"border\":{\"type\":\"\",\"titleHeight\":60,\"fontSize\":30,\"isTitle\":true,\"padding\":[0,0,0,0]},\"expression\":\"return \",\"expressionCodes\":[],\"rotateX\":0,\"rotateY\":0,\"rotateZ\":0,\"perspective\":0,\"skewX\":0,\"skewY\":0,\"customize\":{\"fontSize\":20,\"fontWeight\":700,\"fontFamily\":\"\",\"color\":\"left,#ffffff,#ffffff\",\"title\":\"监控大屏\",\"align\":\"center\",\"letterSpacing\":1}},{\"className\":\"com.gccloud.dataroom.core.module.chart.components.ScreenBorderChart\",\"version\":\"2023071001\",\"key\":\"mnDFbyNR\",\"code\":\"mnDFbyNR\",\"dataSource\":{\"className\":\"com.gccloud.dataroom.core.module.chart.components.datasource.DataSetDataSource\",\"source\":\"dataset\",\"businessKey\":\"\",\"dataSourceKey\":\"\",\"dataSetType\":\"1\",\"params\":{},\"dimensionField\":\"\",\"metricField\":\"\",\"seriesField\":\"\",\"dimensionFieldList\":[],\"metricFieldList\":[],\"seriesFieldList\":[],\"serverPagination\":false,\"pageSize\":10,\"colorField\":null,\"shapeField\":null,\"sizeField\":null,\"openField\":null,\"closeField\":null,\"lowField\":null,\"highField\":null,\"xfield\":null},\"showTitle\":true,\"title\":\"边框十一\",\"name\":\"边框十一\",\"type\":\"border11\",\"w\":1920,\"h\":1080,\"x\":0,\"y\":0,\"z\":0,\"group\":\"\",\"locked\":false,\"linkage\":{\"action\":{\"type\":\"js\",\"script\":\"\"},\"components\":[]},\"inParams\":[],\"theme\":{\"dark\":{\"borderMainColor\":\"#83bff6\",\"borderSecondaryColor\":\"#00CED1\",\"backgroundColor\":\"\",\"colorType\":\"single\",\"gradientColor0\":\"#83bff6\",\"gradientColor1\":\"#188df0\"},\"light\":{\"borderMainColor\":\"#83bff6\",\"borderSecondaryColor\":\"#00CED1\",\"backgroundColor\":\"\",\"colorType\":\"single\",\"gradientColor0\":\"#83bff6\",\"gradientColor1\":\"#188df0\"}},\"border\":null,\"expression\":null,\"expressionCodes\":null,\"rotateX\":0,\"rotateY\":0,\"rotateZ\":0,\"perspective\":0,\"skewX\":0,\"skewY\":0,\"customize\":{\"borderMainColor\":\"#83bff6\",\"borderSecondaryColor\":\"#00CED1\",\"backgroundColor\":\"\",\"title\":\"\",\"titleWidth\":250,\"colorType\":\"single\",\"gradientColor0\":\"#83bff6\",\"gradientColor1\":\"#188df0\",\"gradientDirection\":\"to right\",\"opacity\":100}}],\"pageTemplateId\":null,\"type\":\"bigScreen\",\"pageConfig\":{\"w\":1920,\"h\":1080,\"bgColor\":\"#151a26\",\"lightBgColor\":\"#f5f7fa\",\"bg\":null,\"lightBg\":null,\"customTheme\":\"dark\",\"opacity\":100.0,\"cacheDataSets\":[],\"fitMode\":\"auto\",\"refreshConfig\":[]},\"isPreview\":false}', '', 0, '', '', '2024-09-03 18:06:41', '2024-09-03 17:47:28', NULL, NULL, 0);

-- ----------------------------
-- Table structure for big_screen_page_preview
-- ----------------------------
DROP TABLE IF EXISTS `big_screen_page_preview`;
CREATE TABLE `big_screen_page_preview`  (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '页面编码，页面唯一标识符',
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '页面配置',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '页面预览缓存表，每日定时删除' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of big_screen_page_preview
-- ----------------------------

-- ----------------------------
-- Table structure for big_screen_page_template
-- ----------------------------
DROP TABLE IF EXISTS `big_screen_page_template`;
CREATE TABLE `big_screen_page_template`  (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '模板名称',
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '模板分类',
  `config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '模板配置',
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '缩略图',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '备注',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint(64) NULL DEFAULT 2 COMMENT '创建人',
  `update_by` bigint(64) NULL DEFAULT 2 COMMENT '更新人',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标记0:保留，1:删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '页面模板表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of big_screen_page_template
-- ----------------------------

-- ----------------------------
-- Table structure for big_screen_type
-- ----------------------------
DROP TABLE IF EXISTS `big_screen_type`;
CREATE TABLE `big_screen_type`  (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `order_num` bigint(64) NOT NULL DEFAULT 0 COMMENT '排序',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint(64) NULL DEFAULT 2 COMMENT '创建人',
  `update_by` bigint(64) NULL DEFAULT 2 COMMENT '更新人',
  `del_flag` tinyint(2) NOT NULL DEFAULT 0 COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '大屏、资源库、组件库分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of big_screen_type
-- ----------------------------

-- ----------------------------
-- Table structure for dashboard_biz_component
-- ----------------------------
DROP TABLE IF EXISTS `dashboard_biz_component`;
CREATE TABLE `dashboard_biz_component`  (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '业务组件中文名称',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '业务组件编码，唯一标识符',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分组',
  `cover_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '封面图片文件路径',
  `vue_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'vue组件内容',
  `setting_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '组件配置内容',
  `order_num` bigint(64) NOT NULL DEFAULT 0 COMMENT '排序',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint(64) NULL DEFAULT 2 COMMENT '创建人',
  `update_by` bigint(64) NULL DEFAULT 2 COMMENT '更新人',
  `module_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模块编码',
  `del_flag` tinyint(2) NOT NULL DEFAULT 0 COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1825431553715593219 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '业务组件表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dashboard_biz_component
-- ----------------------------
INSERT INTO `dashboard_biz_component` VALUES (1825431553715593218, '1', 'bizComponent_AUq7LqVK2n', '', '', NULL, NULL, 0, '', '2024-08-19 15:16:11', '2024-08-19 15:16:11', NULL, NULL, '', 0);

-- ----------------------------
-- Table structure for dashboard_file
-- ----------------------------
DROP TABLE IF EXISTS `dashboard_file`;
CREATE TABLE `dashboard_file`  (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '模块/类型',
  `original_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '原文件名',
  `new_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '新文件名',
  `extension` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '后缀名(如: txt、png、doc、java等)',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '访问路径',
  `size` bigint(64) NOT NULL DEFAULT 0 COMMENT '文件大小',
  `download_count` int(11) NOT NULL DEFAULT 0 COMMENT '下载次数',
  `user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '上传用户',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint(64) NULL DEFAULT 2 COMMENT '创建人',
  `update_by` bigint(64) NULL DEFAULT 2 COMMENT '更新人',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标记0:保留，1:删除',
  `bucket` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'gc-starter' COMMENT '桶名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '文件表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dashboard_file
-- ----------------------------

-- ----------------------------
-- Table structure for dashboard_page
-- ----------------------------
DROP TABLE IF EXISTS `dashboard_page`;
CREATE TABLE `dashboard_page`  (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '页面中文名称',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '页面编码，页面唯一标识符',
  `cover_picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '封面图片文件路径',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '页面图标',
  `icon_color` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图标颜色',
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'custom' COMMENT '页面类型',
  `layout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组件布局，记录组件的相对位置和顺序',
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '表单属性，只有表单类型时才有这个值',
  `parent_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '父级目录编码',
  `order_num` bigint(64) NOT NULL DEFAULT 0 COMMENT '排序',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备忘',
  `model_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '模型编码',
  `app_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '所属应用编码',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint(64) NULL DEFAULT 2 COMMENT '创建人',
  `update_by` bigint(64) NULL DEFAULT 2 COMMENT '更新人',
  `del_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识符 1 删除 0未删',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1825431435503329282 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '页面基本信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dashboard_page
-- ----------------------------
INSERT INTO `dashboard_page` VALUES (1, '1', 'component_WSOwZgQQhU', '', '00dataSourceSet', '#007aff', 'component', '', '{\"className\":\"com.gccloud.dashboard.core.module.manage.dto.DashboardPageDTO\",\"appCode\":null,\"id\":null,\"name\":\"1\",\"code\":\"component_WSOwZgQQhU\",\"icon\":\"00dataSourceSet\",\"coverPicture\":null,\"iconColor\":\"#007aff\",\"orderNum\":0,\"remark\":\"\",\"style\":\"\",\"parentCode\":\"\",\"chartList\":[],\"pageTemplateId\":\"\",\"type\":\"component\",\"pageConfig\":{\"bgColor\":\"#F5F7FA\",\"bg\":null,\"titleLineWidth\":null,\"titleLineColor\":null,\"titleFontSize\":null,\"titleFontColor\":null,\"refreshConfig\":null}}', '', 0, '', '', '', '2024-07-19 09:42:54', '2024-07-19 09:42:54', NULL, NULL, 1);
INSERT INTO `dashboard_page` VALUES (1825431063284015106, '1', 'dashboard_HuifVsKU1e', '', '00dataSourceSet', '#007aff', 'dashboard', '', '{\"className\":\"com.gccloud.dashboard.core.module.manage.dto.DashboardPageDTO\",\"appCode\":null,\"id\":null,\"name\":\"1\",\"code\":\"dashboard_HuifVsKU1e\",\"icon\":\"00dataSourceSet\",\"coverPicture\":null,\"iconColor\":\"#007aff\",\"orderNum\":0,\"remark\":\"\",\"style\":\"\",\"parentCode\":null,\"chartList\":[],\"pageTemplateId\":\"\",\"type\":\"dashboard\",\"pageConfig\":{\"bgColor\":\"#F5F7FA\",\"bg\":null,\"titleLineWidth\":null,\"titleLineColor\":null,\"titleFontSize\":null,\"titleFontColor\":null,\"refreshConfig\":null}}', '', 0, '', '', '', '2024-08-19 15:14:15', '2024-08-19 15:14:15', NULL, NULL, 0);
INSERT INTO `dashboard_page` VALUES (1825431435503329281, '1', 'component_knnJxxKUIw', '', '00dataSourceSet', '#007aff', 'component', '', '{\"className\":\"com.gccloud.dashboard.core.module.manage.dto.DashboardPageDTO\",\"appCode\":null,\"id\":null,\"name\":\"1\",\"code\":\"component_knnJxxKUIw\",\"icon\":\"00dataSourceSet\",\"coverPicture\":null,\"iconColor\":\"#007aff\",\"orderNum\":0,\"remark\":\"\",\"style\":\"\",\"parentCode\":\"\",\"chartList\":[],\"pageTemplateId\":\"\",\"type\":\"component\",\"pageConfig\":{\"bgColor\":\"#F5F7FA\",\"bg\":null,\"titleLineWidth\":null,\"titleLineColor\":null,\"titleFontSize\":null,\"titleFontColor\":null,\"refreshConfig\":null}}', '', 0, '', '', '', '2024-08-19 15:15:43', '2024-08-19 15:15:43', NULL, NULL, 1);

-- ----------------------------
-- Table structure for dashboard_page_template
-- ----------------------------
DROP TABLE IF EXISTS `dashboard_page_template`;
CREATE TABLE `dashboard_page_template`  (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '模板名称',
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '模板分类',
  `config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '模板配置',
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '缩略图',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '备注',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint(64) NULL DEFAULT 2 COMMENT '创建人',
  `update_by` bigint(64) NULL DEFAULT 2 COMMENT '更新人',
  `del_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标记0:保留，1:删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '页面模板表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dashboard_page_template
-- ----------------------------

-- ----------------------------
-- Table structure for dashboard_type
-- ----------------------------
DROP TABLE IF EXISTS `dashboard_type`;
CREATE TABLE `dashboard_type`  (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `order_num` bigint(64) NOT NULL DEFAULT 0 COMMENT '排序',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint(64) NULL DEFAULT 2 COMMENT '创建人',
  `update_by` bigint(64) NULL DEFAULT 2 COMMENT '更新人',
  `del_flag` tinyint(2) NOT NULL DEFAULT 0 COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1814119191061430275 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '大屏、资源库、组件库分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dashboard_type
-- ----------------------------
INSERT INTO `dashboard_type` VALUES (1814119191061430274, '1', 'dashboardCatalog_Mkaag2o9Fl', 'dashboardCatalog', 0, '2024-07-24 11:12:08', '2024-07-19 10:04:55', NULL, NULL, 1);

-- ----------------------------
-- Table structure for ds_category_tree
-- ----------------------------
DROP TABLE IF EXISTS `ds_category_tree`;
CREATE TABLE `ds_category_tree`  (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ids` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'id序列',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `parent_id` bigint(64) NULL DEFAULT NULL COMMENT '父级ID',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `module_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint(64) NULL DEFAULT 2 COMMENT '创建人',
  `update_by` bigint(64) NULL DEFAULT 2 COMMENT '更新人',
  `del_flag` tinyint(2) NOT NULL DEFAULT 0 COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1830910357693988867 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据集种类树' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ds_category_tree
-- ----------------------------
INSERT INTO `ds_category_tree` VALUES (1830910357693988866, '1830910357693988866', 'test', 0, 'dataset', '', '2024-09-03 18:07:00', '2024-09-03 18:07:00', NULL, NULL, 0);

-- ----------------------------
-- Table structure for ds_dataset
-- ----------------------------
DROP TABLE IF EXISTS `ds_dataset`;
CREATE TABLE `ds_dataset`  (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `type_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL DEFAULT NULL COMMENT '种类ID',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `dataset_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据集类型（自定义数据集 custom、模型数据集model、原始数据集original、API数据集api、JSON数据集 json）',
  `module_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL DEFAULT NULL COMMENT '模块编码',
  `editable` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否可编辑，0 不可编辑 1 可编辑',
  `source_id` bigint(32) NULL DEFAULT NULL COMMENT '数据源ID',
  `cache` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否对执行结构缓存 0 不缓存 1 缓存',
  `config` longtext CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL COMMENT '数据集配置',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint(64) NULL DEFAULT 2 COMMENT '创建人',
  `update_by` bigint(64) NULL DEFAULT 2 COMMENT '更新人',
  `del_flag` tinyint(2) NOT NULL DEFAULT 0 COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_mysql500_ci COMMENT = '数据集表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ds_dataset
-- ----------------------------

-- ----------------------------
-- Table structure for ds_dataset_label
-- ----------------------------
DROP TABLE IF EXISTS `ds_dataset_label`;
CREATE TABLE `ds_dataset_label`  (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dataset_id` bigint(32) NULL DEFAULT NULL COMMENT '数据集ID',
  `label_id` bigint(32) NULL DEFAULT NULL COMMENT '标签ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_mysql500_ci COMMENT = '数据集与标签关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ds_dataset_label
-- ----------------------------

-- ----------------------------
-- Table structure for ds_datasource
-- ----------------------------
DROP TABLE IF EXISTS `ds_datasource`;
CREATE TABLE `ds_datasource`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `source_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源名称',
  `source_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源类型',
  `driver_class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '连接驱动',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '连接url',
  `host` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主机',
  `port` int(16) NULL DEFAULT NULL COMMENT '端口',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '密码',
  `module_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模块编码',
  `table_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `editable` tinyint(2) NULL DEFAULT 0 COMMENT '是否可编辑，0 不可编辑 1 可编辑',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint(64) NULL DEFAULT 2 COMMENT '创建人',
  `update_by` bigint(64) NULL DEFAULT 2 COMMENT '更新人',
  `del_flag` tinyint(2) NOT NULL DEFAULT 0 COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据源配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ds_datasource
-- ----------------------------

-- ----------------------------
-- Table structure for ds_label
-- ----------------------------
DROP TABLE IF EXISTS `ds_label`;
CREATE TABLE `ds_label`  (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `label_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL DEFAULT NULL COMMENT '标签名称',
  `label_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL DEFAULT NULL COMMENT '标签类型',
  `label_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL DEFAULT NULL COMMENT '标签描述',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint(64) NULL DEFAULT 2 COMMENT '创建人',
  `update_by` bigint(64) NULL DEFAULT 2 COMMENT '更新人',
  `del_flag` tinyint(2) NOT NULL DEFAULT 0 COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_mysql500_ci COMMENT = '标签' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ds_label
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 206 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-07-16 15:09:36', 'admin', '2024-07-18 18:45:22', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-07-16 15:09:36', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-07-16 15:09:36', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-07-16 15:09:36', 'admin', '2024-07-24 11:11:29', '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-07-16 15:09:36', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-07-16 15:09:36', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 201 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '一级', 0, '管理员', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-16 15:09:34', 'admin', '2024-09-03 17:40:16');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-07-16 15:09:34', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-07-16 15:09:34', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-07-16 15:09:34', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-07-16 15:09:34', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-07-16 15:09:34', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-07-16 15:09:34', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-07-16 15:09:34', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-07-16 15:09:34', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-07-16 15:09:34', '', NULL);
INSERT INTO `sys_dept` VALUES (200, 100, '0,100', '二级', 0, NULL, NULL, NULL, '0', '0', 'admin', '2024-07-19 11:07:52', 'admin', '2024-09-03 17:40:28');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 118 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-07-16 15:09:36', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-07-16 15:09:36', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-07-16 15:09:36', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-07-16 15:09:36', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 417 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (416, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-03 17:35:10');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2098 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 2, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-07-16 15:09:34', 'lny', '2024-07-29 14:37:33', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 3, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2024-07-16 15:09:34', 'lny', '2024-07-29 14:37:36', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 4, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-07-16 15:09:34', 'admin', '2024-07-29 14:36:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-07-16 15:09:34', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-07-16 15:09:34', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-07-16 15:09:34', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-07-16 15:09:34', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-07-16 15:09:34', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-07-16 15:09:34', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-07-16 15:09:34', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-07-16 15:09:34', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-07-16 15:09:34', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-07-16 15:09:34', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-07-16 15:09:34', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-07-16 15:09:34', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-07-16 15:09:34', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-07-16 15:09:34', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-07-16 15:09:34', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-07-16 15:09:34', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-07-16 15:09:34', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-07-16 15:09:34', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-07-16 15:09:34', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-07-16 15:09:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-07-16 15:09:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-07-16 15:09:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-07-16 15:09:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-07-16 15:09:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-07-16 15:09:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-07-16 15:09:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-07-16 15:09:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-07-16 15:09:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-07-16 15:09:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-07-16 15:09:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-07-16 15:09:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-07-16 15:09:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-07-16 15:09:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-07-16 15:09:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-07-16 15:09:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-07-16 15:09:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-07-16 15:09:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-07-16 15:09:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-07-16 15:09:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-07-16 15:09:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-07-16 15:09:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-07-16 15:09:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-07-16 15:09:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-07-16 15:09:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-07-16 15:09:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '设计器', 0, 1, 'design', NULL, NULL, 1, 0, 'M', '0', '0', '', 'dashboard', 'admin', '2024-07-17 16:00:27', 'admin', '2024-09-03 17:40:01', '');
INSERT INTO `sys_menu` VALUES (2007, '大屏设计器', 2006, 1, 'bigscreen', 'design/bigscreen/index', NULL, 1, 0, 'C', '0', '0', 'screen:view', 'dashboard', 'admin', '2024-07-17 16:20:44', 'admin', '2024-07-23 17:58:54', '');
INSERT INTO `sys_menu` VALUES (2008, '仪表盘设计器', 2006, 2, 'dashboard', 'design/dashboard/index', NULL, 1, 0, 'C', '0', '0', 'dashboard:view', 'chart', 'admin', '2024-07-18 10:43:26', 'admin', '2024-07-23 17:59:07', '');
INSERT INTO `sys_menu` VALUES (2009, '大屏查看', 2007, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'screen:view', '#', 'admin', '2024-07-19 18:00:00', 'admin', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2010, '大屏新增', 2007, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'screen:add', '#', 'admin', '2024-07-19 18:00:00', '', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2011, '大屏编辑', 2007, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'screen:update', '#', 'admin', '2024-07-19 18:00:00', '', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2012, '大屏删除', 2007, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'screen:delete', '#', 'admin', '2024-07-19 18:00:00', 'admin', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2013, '数据源查看', 2007, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'datasource:view', '#', 'admin', '2024-07-19 18:00:00', '', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2014, '数据源新增', 2007, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'datasource:add', '#', 'admin', '2024-07-19 18:00:00', '', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2015, '数据源编辑', 2007, 7, '', NULL, NULL, 1, 0, 'F', '0', '0', 'datasource:update', '#', 'admin', '2024-07-19 18:00:00', '', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2016, '数据源删除', 2007, 8, '', NULL, NULL, 1, 0, 'F', '0', '0', 'datasource:delete', '#', 'admin', '2024-07-19 18:00:00', '', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2017, '数据源测试', 2007, 9, '', NULL, NULL, 1, 0, 'F', '0', '0', 'datasource:test', '#', 'admin', '2024-07-19 18:00:00', '', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2018, '数据集详情', 2007, 10, '', NULL, NULL, 1, 0, 'F', '0', '0', 'dataset:view', '#', 'admin', '2024-07-19 18:00:00', '', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2019, '数据集新增', 2007, 11, '', NULL, NULL, 1, 0, 'F', '0', '0', 'dataset:add', '#', 'admin', '2024-07-19 18:00:00', '', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2020, '数据集编辑', 2007, 12, '', NULL, NULL, 1, 0, 'F', '0', '0', 'dataset:update', '#', 'admin', '2024-07-19 18:00:00', '', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2021, '数据集删除', 2007, 13, '', NULL, NULL, 1, 0, 'F', '0', '0', 'dataset:delete', '#', 'admin', '2024-07-19 18:00:00', '', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2022, '数据集数据获取接口', 2007, 14, '', NULL, NULL, 1, 0, 'F', '0', '0', 'dataset:execute', '#', 'admin', '2024-07-19 18:00:00', '', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2023, '数据集分组查询接口', 2007, 15, '', NULL, NULL, 1, 0, 'F', '0', '0', 'dataset:category', '#', 'admin', '2024-07-19 18:00:00', '', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2024, '数据集分组操作权限(增删改)', 2007, 16, '', NULL, NULL, 1, 0, 'F', '0', '0', 'dataset:category:edit', '#', 'admin', '2024-07-19 18:00:00', '', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2025, '数据集标签查询接口', 2007, 17, '', NULL, NULL, 1, 0, 'F', '0', '0', 'dataset:label', '#', 'admin', '2024-07-19 18:00:00', '', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2026, '数据集标签操作(增删改)', 2007, 18, '', NULL, NULL, 1, 0, 'F', '0', '0', 'dataset:label:edit', '#', 'admin', '2024-07-19 18:00:00', '', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2027, '仪表盘查看', 2008, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'dashboard:view', '#', 'admin', '2024-07-19 18:00:00', 'admin', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2028, '仪表盘新增', 2008, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'dashboard:add', '#', 'admin', '2024-07-19 18:00:00', '', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2029, '仪表盘编辑', 2008, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'dashboard:update', '#', 'admin', '2024-07-19 18:00:00', '', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2030, '仪表盘删除', 2008, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'dashboard:delete', '#', 'admin', '2024-07-19 18:00:00', 'admin', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2031, '数据源查看', 2008, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'datasource:view', '#', 'admin', '2024-07-19 18:00:00', '', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2032, '数据源新增', 2008, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'datasource:add', '#', 'admin', '2024-07-19 18:00:00', '', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2033, '数据源编辑', 2008, 7, '', NULL, NULL, 1, 0, 'F', '0', '0', 'datasource:update', '#', 'admin', '2024-07-19 18:00:00', '', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2034, '数据源删除', 2008, 8, '', NULL, NULL, 1, 0, 'F', '0', '0', 'datasource:delete', '#', 'admin', '2024-07-19 18:00:00', '', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2035, '数据源测试', 2008, 9, '', NULL, NULL, 1, 0, 'F', '0', '0', 'datasource:test', '#', 'admin', '2024-07-19 18:00:00', '', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2036, '数据集详情', 2008, 10, '', NULL, NULL, 1, 0, 'F', '0', '0', 'dataset:view', '#', 'admin', '2024-07-19 18:00:00', '', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2037, '数据集新增', 2008, 11, '', NULL, NULL, 1, 0, 'F', '0', '0', 'dataset:add', '#', 'admin', '2024-07-19 18:00:00', '', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2038, '数据集编辑', 2008, 12, '', NULL, NULL, 1, 0, 'F', '0', '0', 'dataset:update', '#', 'admin', '2024-07-19 18:00:00', '', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2039, '数据集删除', 2008, 13, '', NULL, NULL, 1, 0, 'F', '0', '0', 'dataset:delete', '#', 'admin', '2024-07-19 18:00:00', '', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2040, '数据集数据获取接口', 2008, 14, '', NULL, NULL, 1, 0, 'F', '0', '0', 'dataset:execute', '#', 'admin', '2024-07-19 18:00:00', '', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2041, '数据集分组查询接口', 2008, 15, '', NULL, NULL, 1, 0, 'F', '0', '0', 'dataset:category', '#', 'admin', '2024-07-19 18:00:00', '', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2042, '数据集分组操作权限(增删改)', 2008, 16, '', NULL, NULL, 1, 0, 'F', '0', '0', 'dataset:category:edit', '#', 'admin', '2024-07-19 18:00:00', '', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2043, '数据集标签查询接口', 2008, 17, '', NULL, NULL, 1, 0, 'F', '0', '0', 'dataset:label', '#', 'admin', '2024-07-19 18:00:00', '', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2044, '数据集标签操作(增删改)', 2008, 18, '', NULL, NULL, 1, 0, 'F', '0', '0', 'dataset:label:edit', '#', 'admin', '2024-07-19 18:00:00', '', '2024-07-19 18:00:00', '');
INSERT INTO `sys_menu` VALUES (2052, '资源库查询', 2007, 19, '', NULL, NULL, 1, 0, 'F', '0', '0', 'file:view', '#', 'admin', '2024-07-24 09:09:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2053, '资源库上传', 2007, 20, '', NULL, NULL, 1, 0, 'F', '0', '0', 'file:upload', '#', 'admin', '2024-07-24 09:10:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2054, '资源库下载', 2007, 21, '', NULL, NULL, 1, 0, 'F', '0', '0', 'file:download', '#', 'admin', '2024-07-24 09:10:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2055, '资源库删除', 2007, 22, '', NULL, NULL, 1, 0, 'F', '0', '0', 'file:delete', '#', 'admin', '2024-07-24 09:10:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2056, '组件库查询', 2007, 23, '', NULL, NULL, 1, 0, 'F', '0', '0', 'component:view', '#', 'admin', '2024-07-24 09:17:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2057, '组件库新增', 2007, 24, '', NULL, NULL, 1, 0, 'F', '0', '0', 'component:add', '#', 'admin', '2024-07-24 09:17:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2058, '组件库编辑', 2007, 25, '', NULL, NULL, 1, 0, 'F', '0', '0', 'component:update', '#', 'admin', '2024-07-24 09:18:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2059, '组件库删除', 2007, 26, '', NULL, NULL, 1, 0, 'F', '0', '0', 'component:delete', '#', 'admin', '2024-07-24 09:18:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2060, '地图数据查询', 2007, 27, '', NULL, NULL, 1, 0, 'F', '0', '0', 'map:view', '#', 'admin', '2024-07-24 09:18:47', 'admin', '2024-08-01 16:03:53', '');
INSERT INTO `sys_menu` VALUES (2061, '地图数据新增', 2007, 28, '', NULL, NULL, 1, 0, 'F', '0', '0', 'map:add', '#', 'admin', '2024-07-24 09:19:00', 'admin', '2024-08-01 16:03:59', '');
INSERT INTO `sys_menu` VALUES (2062, '地图数据编辑', 2007, 29, '', NULL, NULL, 1, 0, 'F', '0', '0', 'map:update', '#', 'admin', '2024-07-24 09:19:15', 'admin', '2024-08-01 16:04:04', '');
INSERT INTO `sys_menu` VALUES (2063, '地图数据删除', 2007, 30, '', NULL, NULL, 1, 0, 'F', '0', '0', 'map:delete', '#', 'admin', '2024-07-24 09:19:38', 'admin', '2024-08-01 16:04:10', '');
INSERT INTO `sys_menu` VALUES (2064, '资源库查询', 2008, 19, '', NULL, NULL, 1, 0, 'F', '0', '0', 'file:view', '#', 'admin', '2024-07-24 09:09:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2065, '资源库上传', 2008, 20, '', NULL, NULL, 1, 0, 'F', '0', '0', 'file:upload', '#', 'admin', '2024-07-24 09:10:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2066, '资源库下载', 2008, 21, '', NULL, NULL, 1, 0, 'F', '0', '0', 'file:download', '#', 'admin', '2024-07-24 09:10:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2067, '资源库删除', 2008, 22, '', NULL, NULL, 1, 0, 'F', '0', '0', 'file:delete', '#', 'admin', '2024-07-24 09:10:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2068, '组件库查询', 2008, 23, '', NULL, NULL, 1, 0, 'F', '0', '0', 'component:view', '#', 'admin', '2024-07-24 09:17:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2069, '组件库新增', 2008, 24, '', NULL, NULL, 1, 0, 'F', '0', '0', 'component:add', '#', 'admin', '2024-07-24 09:17:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2070, '组件库编辑', 2008, 25, '', NULL, NULL, 1, 0, 'F', '0', '0', 'component:update', '#', 'admin', '2024-07-24 09:18:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2071, '组件库删除', 2008, 26, '', NULL, NULL, 1, 0, 'F', '0', '0', 'component:delete', '#', 'admin', '2024-07-24 09:18:25', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-07-16 15:09:36', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-07-16 15:09:36', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 518 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-07-16 15:09:34', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-07-16 15:09:34', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-07-16 15:09:34', '', NULL, '超级管理员');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 100, 'admin', '管理员', '00', 'admin@163.com', '15888888888', '1', '', '$2a$10$lKpY1P/iftb8DqK9BBWAsOaHXTbo8x/Jhq6/gJOj53spGCCeNaXFq', '0', '0', '127.0.0.1', '2024-09-03 17:35:10', 'admin', '2024-07-16 15:09:34', '', '2024-09-03 17:35:10', '管理员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);

SET FOREIGN_KEY_CHECKS = 1;
