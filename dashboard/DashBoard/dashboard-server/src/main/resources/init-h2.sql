CREATE TABLE IF NOT EXISTS  dashboard_file
(
    id             BIGINT AUTO_INCREMENT NOT NULL COMMENT '主键',
    module         VARCHAR(255) NOT NULL DEFAULT '' COMMENT '模块/类型',
    original_name  VARCHAR(255) NOT NULL DEFAULT '' COMMENT '原文件名',
    new_name       VARCHAR(255) NOT NULL DEFAULT '' COMMENT '新文件名',
    extension      VARCHAR(20) NOT NULL DEFAULT '' COMMENT '后缀名(如: txt、png、doc、java等)',
    path           VARCHAR(255) NOT NULL DEFAULT '' COMMENT '路径',
    url            VARCHAR(255) NOT NULL DEFAULT '' COMMENT '访问路径',
    size           BIGINT NOT NULL DEFAULT '0' COMMENT '文件大小',
    download_count INT NOT NULL DEFAULT '0' COMMENT '下载次数',
    user_name      VARCHAR(20) NOT NULL DEFAULT '' COMMENT '上传用户',
    create_date    TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_date    TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    create_by      BIGINT DEFAULT 2 COMMENT '创建人',
    update_by      BIGINT DEFAULT 2 COMMENT '更新人',
    del_flag       TINYINT NOT NULL DEFAULT '0' COMMENT '删除标记0:保留，1:删除',
    bucket         VARCHAR(100) NOT NULL DEFAULT 'gc-starter' COMMENT '桶名称',
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS  dashboard_page (
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(100) NOT NULL DEFAULT '' COMMENT '页面中文名称',
    code        VARCHAR(255) NOT NULL DEFAULT '' COMMENT '页面编码，页面唯一标识符',
    cover_picture        VARCHAR(255) NOT NULL DEFAULT '' COMMENT '封面图片文件路径',
    icon        VARCHAR(100) NOT NULL DEFAULT '' COMMENT '页面图标',
    icon_color  VARCHAR(100) NOT NULL DEFAULT '' COMMENT '图标颜色',
    type        VARCHAR(100) NOT NULL DEFAULT 'custom' COMMENT '页面类型',
    layout      VARCHAR(255) NOT NULL DEFAULT '' COMMENT '组件布局，记录组件的相对位置和顺序',
    config      CLOB COMMENT '表单属性，只有表单类型时才有这个值',
    parent_code VARCHAR(255) NOT NULL DEFAULT '' COMMENT '父级目录编码',
    order_num   BIGINT NOT NULL DEFAULT '0' COMMENT '排序',
    remark      VARCHAR(100) NOT NULL DEFAULT '' COMMENT '备忘',
    model_code  VARCHAR(255) NOT NULL DEFAULT '' COMMENT '模型编码',
    app_code    VARCHAR(255) NOT NULL DEFAULT '' COMMENT '所属应用编码',
    update_date TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    create_date TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    create_by    BIGINT DEFAULT 2 COMMENT '创建人',
    update_by    BIGINT DEFAULT 2 COMMENT '更新人',
    del_flag    BOOLEAN NOT NULL DEFAULT FALSE COMMENT '删除标识符 1 删除 0未删'
);

CREATE TABLE IF NOT EXISTS  dashboard_page_template
(
    id bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
    name varchar(100) NOT NULL DEFAULT '' COMMENT '模板名称',
    type varchar(100) NOT NULL DEFAULT '' COMMENT '模板分类',
    config clob DEFAULT NULL COMMENT '模板配置',
    thumbnail varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图',
    remark varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
    update_date timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    create_date timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    create_by bigint null default 2 comment '创建人',
    update_by bigint null default 2 comment '更新人',
    del_flag tinyint NOT NULL DEFAULT '0' COMMENT '删除标记0:保留，1:删除',
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS  dashboard_type (
  id bigint AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
  name varchar(255) DEFAULT NULL COMMENT '名称',
  code varchar(255) DEFAULT NULL COMMENT '名称',
  type varchar(255) DEFAULT NULL COMMENT '名称',
  order_num bigint NOT NULL DEFAULT '0' COMMENT '排序',
  update_date timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  create_date timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  create_by bigint default 2 comment '创建人',
  update_by bigint default 2 comment '更新人',
  del_flag tinyint NOT NULL DEFAULT '0' COMMENT '删除标识'
);

CREATE TABLE IF NOT EXISTS  dashboard_biz_component (
    id             bigint      NOT NULL AUTO_INCREMENT,
    name           varchar(100) NOT NULL DEFAULT '' COMMENT '业务组件中文名称',
    code           varchar(255) NOT NULL DEFAULT '' COMMENT '业务组件编码，唯一标识符',
    type           varchar(255) NOT NULL DEFAULT '' COMMENT '分组',
    cover_picture  varchar(255) NOT NULL DEFAULT '' COMMENT '封面图片文件路径',
    vue_content    clob COMMENT 'vue组件内容',
    setting_content clob COMMENT '组件配置内容',
    order_num      bigint      NOT NULL DEFAULT '0' COMMENT '排序',
    remark         varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
    update_date    timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    create_date    timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    create_by      bigint      NULL DEFAULT 2 COMMENT '创建人',
    update_by      bigint      NULL DEFAULT 2 COMMENT '更新人',
    module_code    varchar(255) NOT NULL DEFAULT '' COMMENT '模块编码',
    del_flag       tinyint     NOT NULL DEFAULT '0' COMMENT '删除标识',
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS  ds_category_tree (
    id bigint AUTO_INCREMENT COMMENT '主键',
    ids clob COMMENT 'id序列',
    name varchar(255) DEFAULT NULL COMMENT '名称',
    parent_id bigint DEFAULT NULL COMMENT '父级ID',
    type varchar(255) NOT NULL,
    module_code varchar(255) DEFAULT NULL,
    update_date timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    create_date timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    create_by bigint null default 2 comment '创建人',
    update_by bigint null default 2 comment '更新人',
    del_flag tinyint NOT NULL DEFAULT '0' COMMENT '删除标识',
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS  ds_datasource (
    id bigint AUTO_INCREMENT COMMENT '主键',
    source_name varchar(255) DEFAULT NULL COMMENT '数据源名称',
    source_type varchar(255) DEFAULT NULL COMMENT '数据源类型',
    driver_class_name varchar(255) DEFAULT NULL COMMENT '连接驱动',
    url varchar(255) DEFAULT NULL COMMENT '连接url',
    host varchar(255) DEFAULT NULL COMMENT '主机',
    port int DEFAULT NULL COMMENT '端口',
    username varchar(255) DEFAULT NULL COMMENT '用户名',
    password clob COMMENT '密码',
    module_code varchar(255) DEFAULT NULL COMMENT '模块编码',
    table_name varchar(255) DEFAULT NULL COMMENT '表名',
    editable tinyint DEFAULT '0' COMMENT '是否可编辑，0 不可编辑 1 可编辑',
    remark varchar(255) DEFAULT NULL,
    update_date timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    create_date timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    create_by bigint null default 2 comment '创建人',
    update_by bigint null default 2 comment '更新人',
    del_flag tinyint NOT NULL DEFAULT '0' COMMENT '删除标识',
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS  ds_dataset (
    id bigint AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
    name varchar(255) DEFAULT NULL COMMENT '名称',
    code varchar(255) DEFAULT NULL COMMENT '编码',
    type_id varchar(255) DEFAULT NULL COMMENT '种类ID',
    remark clob COMMENT '描述',
    dataset_type varchar(64) NOT NULL COMMENT '数据集类型（自定义数据集 custom、模型数据集model、原始数据集original、API数据集api、JSON数据集 json）',
    module_code varchar(255) DEFAULT NULL COMMENT '模块编码',
    editable tinyint NOT NULL DEFAULT '0' COMMENT '是否可编辑，0 不可编辑 1 可编辑',
    source_id bigint DEFAULT NULL COMMENT '数据源ID',
    cache tinyint DEFAULT 0 NOT NULL COMMENT '是否对执行结构缓存 0 不缓存 1 缓存',
    config clob COMMENT '数据集配置',
    update_date timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    create_date timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    create_by bigint DEFAULT 2 COMMENT '创建人',
    update_by bigint DEFAULT 2 COMMENT '更新人',
    del_flag tinyint NOT NULL DEFAULT '0' COMMENT '删除标识'
);

CREATE TABLE IF NOT EXISTS  ds_label (
    id bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
    label_name varchar(255) DEFAULT NULL COMMENT '标签名称',
    label_type varchar(255) DEFAULT NULL COMMENT '标签类型',
    label_desc varchar(255) DEFAULT NULL COMMENT '标签描述',
    update_date timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    create_date timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    create_by bigint(64) NULL DEFAULT 2 COMMENT '创建人',
    update_by bigint(64) NULL DEFAULT 2 COMMENT '更新人',
    del_flag tinyint(2) NOT NULL DEFAULT '0' COMMENT '删除标识',
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS  ds_dataset_label (
  id bigint AUTO_INCREMENT COMMENT '主键',
  dataset_id bigint DEFAULT NULL COMMENT '数据集ID',
  label_id bigint DEFAULT NULL COMMENT '标签ID',
  PRIMARY KEY (id)
);