/*!
 * 数据源管理
 */
// import { get, post } from 'dashPackages/js/utils/http'
import Vue from 'vue';

/**
 * 修改数据源
 * @param params
 * @param flag
 * @returns {*}
 */
const add = (params = {}, flag = false) => Vue.prototype.$dashboardAxios.post('/datasource/add', params, flag)

/**
 * 修改数据源
 * @param params
 * @param flag
 * @returns {*}
 */
const update = (params = {}, flag = false) => Vue.prototype.$dashboardAxios.post('/datasource/update', params, flag)

/**
 * 数据源名称校验
 * @param params
 * @param flag
 * @returns {*}
 */
const checkRepeat = (params = {}, flag = false) => Vue.prototype.$dashboardAxios.post('/datasource/checkRepeat', params, flag)

/**
 * 数据源连接测试
 * @param params
 * @param flag
 * @returns {*}
 */
const sourceLinkTest = (params = {}, flag = false) => Vue.prototype.$dashboardAxios.post('/datasource/testConnect', params, flag)

/**
 * 获取数据源列表
 * @param params
 * @param flag
 * @returns {*}
 */
const datasourcePage = (params = {}, flag = false) => Vue.prototype.$dashboardAxios.get('/datasource/page', params, flag)

/**
 * 获取数据源列表
 * @param params
 * @param flag
 * @returns {*}
 */
const datasourceList = (params = {}, flag = false) => Vue.prototype.$dashboardAxios.get('/datasource/list', params, flag)

/**
 * 删除数据源
 * @param id
 * @param flag
 * @returns {*}
 */
const sourceRemove = (id = '-1', flag = false) => Vue.prototype.$dashboardAxios.post(`/datasource/delete/${id}`, {}, flag)

/**
 * 获取数据源下表列表
 * @param id
 * @param flag
 * @returns {*}
 */
const getSourceTable = (id = '-1', flag = false) => Vue.prototype.$dashboardAxios.get(`/datasource/getTableList/${id}`, {}, flag)

/**
 * 删除数据源前查询是否使用
 * @param params
 * @param flag
 * @returns {*}
 */
const dataSourceCheck = (id='-1', flag = false) => Vue.prototype.$dashboardAxios.post(`/datasource/deleteCheck/${id}`, {}, flag)

/**
 * 获取数据源下视图列表
 * @param id
 * @param flag
 * @returns {*}
 */
const getSourceView = (id = '-1', flag = false) => Vue.prototype.$dashboardAxios.get(`/datasource/getViewList/${id}`, {}, flag)

/**
 * 获取数据源下表字段列表
 * @param sourceId
 * @param tableName
 * @param flag
 * @returns {Promise<*>}
 */
const getTableFieldList = (sourceId = '-1', tableName = '', flag = false) => Vue.prototype.$dashboardAxios.get(`/datasource/getFieldList/table/${sourceId}/${tableName}`, {}, flag)

export {
  add,
  update,
  checkRepeat,
  sourceLinkTest,
  datasourcePage,
  datasourceList,
  sourceRemove,
  getSourceTable,
  getSourceView,
  getTableFieldList,
  dataSourceCheck
}
