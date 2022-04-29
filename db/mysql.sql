CREATE TABLE sys_user
(
    id          bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    username    varchar(50) NOT NULL COMMENT '用户名',
    password    varchar(100) COMMENT '密码',
    real_name   varchar(50) COMMENT '姓名',
    avatar      varchar(200) COMMENT '头像',
    gender      tinyint COMMENT '性别   0：男   1：女   2：未知',
    email       varchar(100) COMMENT '邮箱',
    mobile      varchar(20) COMMENT '手机号',
    org_id      bigint COMMENT '机构ID',
    super_admin tinyint COMMENT '超级管理员   0：否   1：是',
    status      tinyint COMMENT '状态  0：停用   1：正常',
    version     int COMMENT '版本号',
    deleted     tinyint COMMENT '删除标识  0：正常   1：已删除',
    creator     bigint COMMENT '创建者',
    create_time datetime COMMENT '创建时间',
    updater     bigint COMMENT '更新者',
    update_time datetime COMMENT '更新时间',
    primary key (id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT ='用户管理';

CREATE TABLE sys_org
(
    id          bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    pid         bigint COMMENT '上级ID',
    name        varchar(50) COMMENT '机构名称',
    sort        int COMMENT '排序',
    version     int COMMENT '版本号',
    deleted     tinyint COMMENT '删除标识  0：正常   1：已删除',
    creator     bigint COMMENT '创建者',
    create_time datetime COMMENT '创建时间',
    updater     bigint COMMENT '更新者',
    update_time datetime COMMENT '更新时间',
    primary key (id),
    key idx_pid (pid)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT ='机构管理';

create table sys_role
(
    id          bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    name        varchar(50) COMMENT '角色名称',
    remark      varchar(100) COMMENT '备注',
    data_scope  tinyint COMMENT '数据范围  0：全部数据  1：本部门及子部门数据  2：本部门数据  3：本人数据  4：自定义数据',
    org_id      bigint COMMENT '机构ID',
    version     int COMMENT '版本号',
    deleted     tinyint COMMENT '删除标识  0：正常   1：已删除',
    creator     bigint COMMENT '创建者',
    create_time datetime COMMENT '创建时间',
    updater     bigint COMMENT '更新者',
    update_time datetime COMMENT '更新时间',
    primary key (id),
    key idx_org_id (org_id)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8mb4 COMMENT ='角色管理';

create table sys_user_role
(
    id          bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    role_id     bigint COMMENT '角色ID',
    user_id     bigint COMMENT '用户ID',
    version     int COMMENT '版本号',
    deleted     tinyint COMMENT '删除标识  0：正常   1：已删除',
    creator     bigint COMMENT '创建者',
    create_time datetime COMMENT '创建时间',
    updater     bigint COMMENT '更新者',
    update_time datetime COMMENT '更新时间',
    primary key (id),
    key idx_role_id (role_id),
    key idx_user_id (user_id)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8mb4 COMMENT ='用户角色关系';

CREATE TABLE sys_post
(
    id          bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    post_code   varchar(100) COMMENT '岗位编码',
    post_name   varchar(100) COMMENT '岗位名称',
    sort        int COMMENT '排序',
    status      tinyint COMMENT '状态  0：停用   1：正常',
    version     int COMMENT '版本号',
    deleted     tinyint COMMENT '删除标识  0：正常   1：已删除',
    creator     bigint COMMENT '创建者',
    create_time datetime COMMENT '创建时间',
    updater     bigint COMMENT '更新者',
    update_time datetime COMMENT '更新时间',
    primary key (id)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8mb4 COMMENT ='岗位管理';

CREATE TABLE sys_user_post
(
    id          bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    user_id     bigint COMMENT '用户ID',
    post_id     bigint COMMENT '岗位ID',
    version     int COMMENT '版本号',
    deleted     tinyint COMMENT '删除标识  0：正常   1：已删除',
    creator     bigint COMMENT '创建者',
    create_time datetime COMMENT '创建时间',
    updater     bigint COMMENT '更新者',
    update_time datetime COMMENT '更新时间',
    primary key (id),
    key idx_user_id (user_id),
    key idx_post_id (post_id)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8mb4 COMMENT ='用户岗位关系';

create table sys_menu
(
    id          bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    pid         bigint COMMENT '上级ID，一级菜单为0',
    name        varchar(200) COMMENT '菜单名称',
    url         varchar(200) COMMENT '菜单URL',
    authority   varchar(500) COMMENT '授权标识(多个用逗号分隔，如：sys:menu:list,sys:menu:save)',
    type        tinyint COMMENT '类型   0：菜单   1：按钮   2：接口',
    open_style  tinyint COMMENT '打开方式   0：内部   1：外部',
    icon        varchar(50) COMMENT '菜单图标',
    sort        int COMMENT '排序',
    version     int COMMENT '版本号',
    deleted     tinyint COMMENT '删除标识  0：正常   1：已删除',
    creator     bigint COMMENT '创建者',
    create_time datetime COMMENT '创建时间',
    updater     bigint COMMENT '更新者',
    update_time datetime COMMENT '更新时间',
    primary key (id),
    key idx_pid (pid)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8mb4 COMMENT ='菜单管理';

create table sys_role_menu
(
    id          bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    role_id     bigint COMMENT '角色ID',
    menu_id     bigint COMMENT '菜单ID',
    version     int COMMENT '版本号',
    deleted     tinyint COMMENT '删除标识  0：正常   1：已删除',
    creator     bigint COMMENT '创建者',
    create_time datetime COMMENT '创建时间',
    updater     bigint COMMENT '更新者',
    update_time datetime COMMENT '更新时间',
    primary key (id),
    key idx_role_id (role_id),
    key idx_menu_id (menu_id)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8mb4 COMMENT ='角色菜单关系';

create table sys_role_data_scope
(
    id          bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    role_id     bigint COMMENT '角色ID',
    org_id      bigint COMMENT '机构ID',
    version     int COMMENT '版本号',
    deleted     tinyint COMMENT '删除标识  0：正常   1：已删除',
    creator     bigint COMMENT '创建者',
    create_time datetime COMMENT '创建时间',
    updater     bigint COMMENT '更新者',
    update_time datetime COMMENT '更新时间',
    primary key (id),
    key idx_role_id (role_id)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8mb4 COMMENT ='角色数据权限';

CREATE TABLE sys_oauth_client (
    id bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    client_id varchar(256) NOT NULL COMMENT '客户端id',
    client_secret varchar(256) COMMENT '客户端密钥',
    resource_ids varchar(256) COMMENT '资源ids',
    scope varchar(256) COMMENT '授权范围',
    authorized_grant_types varchar(256) COMMENT '授权类型',
    web_server_redirect_uri varchar(256) COMMENT '回调地址',
    authorities varchar(256) COMMENT '权限标识',
    access_token_validity int COMMENT '访问令牌有效期',
    refresh_token_validity int COMMENT '刷新令牌有效期',
    additional_information varchar(4096) COMMENT '附加信息',
    autoapprove varchar(128) COMMENT '自动授权',
    version     int COMMENT '版本号',
    deleted     tinyint COMMENT '删除标识  0：正常   1：已删除',
    creator     bigint COMMENT '创建者',
    create_time datetime COMMENT '创建时间',
    updater     bigint COMMENT '更新者',
    update_time datetime COMMENT '更新时间',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8mb4 COMMENT='客户端管理';

create table sys_dict_type
(
    id          bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    dict_type   varchar(100) NOT NULL COMMENT '字典类型',
    dict_name   varchar(255) NOT NULL COMMENT '字典名称',
    remark      varchar(255) COMMENT '备注',
    sort        int COMMENT '排序',
    version     int COMMENT '版本号',
    deleted     tinyint COMMENT '删除标识  0：正常   1：已删除',
    creator     bigint COMMENT '创建者',
    create_time datetime COMMENT '创建时间',
    updater     bigint COMMENT '更新者',
    update_time datetime COMMENT '更新时间',
    primary key (id)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8mb4 COMMENT ='字典类型';

create table sys_dict_data
(
    id           bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    dict_type_id bigint NOT NULL COMMENT '字典类型ID',
    dict_label   varchar(255) NOT NULL COMMENT '字典标签',
    dict_value   varchar(255) COMMENT '字典值',
    remark       varchar(255) COMMENT '备注',
    sort         int COMMENT '排序',
    version      int COMMENT '版本号',
    deleted      tinyint COMMENT '删除标识  0：正常   1：已删除',
    creator      bigint COMMENT '创建者',
    create_time  datetime COMMENT '创建时间',
    updater      bigint COMMENT '更新者',
    update_time  datetime COMMENT '更新时间',
    primary key (id)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8mb4 COMMENT ='字典数据';


INSERT INTO sys_user (id, username, password, real_name, gender, email, mobile, status, org_id, super_admin, version, deleted, creator, create_time, updater, update_time) VALUES (10000, 'admin', '{bcrypt}$2a$10$mW/yJPHjyueQ1g26WNBz0uxVPa0GQdJO1fFZmqdkqgMTGnyszlXxu', 'admin', 0, 'babamu@126.com', '13612345678', 1, null, 1, 0, 0, 10000, now(), 10000, now());
INSERT INTO sys_oauth_client (id, client_id, client_secret, resource_ids, scope, authorized_grant_types, web_server_redirect_uri, authorities, access_token_validity, refresh_token_validity, additional_information, autoapprove, version, deleted, creator, create_time, updater, update_time) VALUES (1, 'web', '123456', '', 'all', '["authorization_code","password","implicit","client_credentials","refresh_token"]', 'https://gitee.com/makunet', NULL, 43200, 604800, NULL, 'true', 0, 0, 10000, now(), 10000, now());
