/*!
 * 数据集管理
 */
// import { get, post } from 'dashPackages/js/utils/http'
import Vue from 'vue';

/**
 * 数据集分页查询
 * @param params
 * @param flag
 * @returns {*}
 */
const datasetPage = (params = {}, flag = false) => Vue.prototype.$dashboardAxios.get('/dataset/page', params, flag)

/**
 * 删除数据集前查询是否使用
 * @param params
 * @param flag
 * @returns {*}
 */
const datasetCheck = (id='-1', flag = false) => Vue.prototype.$dashboardAxios.post(`/dataset/deleteCheck/${id}`, {}, flag)

/**
 * 数据集列表查询
 * @param params
 * @param flag
 * @returns {*}
 */
const datasetList = (params = {}, flag = false) => Vue.prototype.$dashboardAxios.get('/dataset/list', params, flag)

/**
 * 数据集名称校验
 * @param params
 * @param flag
 * @returns {*}
 */
const nameCheckRepeat = (params = {}, flag = false) => Vue.prototype.$dashboardAxios.post('/dataset/checkRepeat', params, flag)

/**
 * 数据集新增
 * @param params
 * @param flag
 * @returns {*}
 */
const datasetAdd = (params = {}, flag = false) => Vue.prototype.$dashboardAxios.post('/dataset/add', params, flag)

/**
 * 数据集修改
 * @param params
 * @param flag
 * @returns {*}
 */
const datasetUpdate = (params = {}, flag = false) => Vue.prototype.$dashboardAxios.post('/dataset/update', params, flag)

/**
 * 删除数据集
 * @param id
 * @param flag
 * @returns {*}
 */
const datasetRemove = (id = '-1', flag = false) => Vue.prototype.$dashboardAxios.post(`/dataset/delete/${id}`, {}, flag)

/**
 * 数据集执行
 * @param params
 * @param flag
 * @returns {*}
 */
const datasetExecuteTest = (params = {}, flag = false) => Vue.prototype.$dashboardAxios.post('/dataset/execute/test', params, flag)

/**
 * 获取数据集详情
 * @param id
 * @param flag
 * @returns {*}
 */

const getDataset = (id = '-1', flag = false) => Vue.prototype.$dashboardAxios.get(`/dataset/info/${id}`, {}, flag)

/**
 * 获取数据集分类
 * @param r_dataset
 * @param flag
 * @returns {*}
 */
const getCategoryTree = (params = {}, flag = false) => Vue.prototype.$dashboardAxios.get('/category/queryTreeList', params, flag)

/**
 * 新增分类树节点
 * @param params
 * @param flag
 * @returns {*}
 */
const categoryAdd = (params = {}, flag = false) => Vue.prototype.$dashboardAxios.post('/category/add', params, flag)

/**
 * 编辑分类树节点
 * @param params
 * @param flag
 * @returns {*}
 */
const categoryUpdate = (params = {}, flag = false) => Vue.prototype.$dashboardAxios.post('/category/update', params, flag)

/**
 * 验证节点是否可删除
 * @param params
 * @param flag
 * @returns {*}
 */
const categoryDele = (id = '-1', flag = false) => Vue.prototype.$dashboardAxios.get(`/dataset/getCountByType/${id}`, {}, flag)


/**
 * 删除分类树节点
 * @param id
 * @param flag
 * @returns {*}
 */
const categoryRemove = (id = '-1', flag = false) => Vue.prototype.$dashboardAxios.post(`/category/delete/${id}`, {}, flag)

export {
  datasetPage,
  datasetList,
  datasetAdd,
  datasetUpdate,
  datasetRemove,
  nameCheckRepeat,
  datasetExecuteTest,
  getDataset,
  categoryDele,

  getCategoryTree,
  categoryAdd,
  categoryUpdate,
  categoryRemove,
  datasetCheck
}
