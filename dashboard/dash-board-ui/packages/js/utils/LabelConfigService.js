/*!
 * 标签管理
 */
// import { get, post } from 'dashPackages/js/utils/http'
import Vue from 'vue';

/**
 * 获取标签列表
 * @returns {*}
 */
const getLabelList = () => Vue.prototype.$dashboardAxios.get(`/label/getLabelList`)

/**
 * 获取标签
 * @param data
 * @returns {*}
 */
const labelList = (data) => Vue.prototype.$dashboardAxios.get(`/label/list`, data)

/**
 * 获取标签分类
 * @returns {*}
 */
const getLabelType = () => Vue.prototype.$dashboardAxios.get(`/label/getLabelType`)

/**
 * 根据种类移除标签
 * @param data
 * @returns {*}
 */
const removeLabelByType = (data) => Vue.prototype.$dashboardAxios.post(`/label/removeLabelByType`, data)

/**
 * 移除标签
 * @param id
 * @returns {*}
 */
const removeLabel = (id = '-1') => Vue.prototype.$dashboardAxios.get(`/label/removeLabel/${id}`)

/**
 * 检查重复标签
 * @param data
 * @returns {*}
 */
const checkRepeatLabel = (data) => Vue.prototype.$dashboardAxios.post(`/label/checkRepeat`, data)

/**
 * 新增/修改标签
 * @param data
 * @returns {*}
 */
const addOrUpdateLabel = (data) => Vue.prototype.$dashboardAxios.post(`/label/addOrUpdateLabel`, data)

/**
 * 获取标签详情
 * @param id
 * @returns {*}
 */
const getLabelDetail = (id = '-1') => Vue.prototype.$dashboardAxios.get(`/label/getLabelDetail/${id}`)

/**
 * 修改标签种类
 * @param data
 * @returns {*}
 */
const updateLabelType = (data) => Vue.prototype.$dashboardAxios.post(`/label/updateLabelType`, data)


/**
 * 根据标签id获取数据集id列表
 * @param id
 */
const getDataSetIdListByLabelId = (id = '-1') => Vue.prototype.$dashboardAxios.get(`/label/queryDataSetIdList/${id}`)

/**
 * 根据数据集id获取标签列表
 * @param id
 */
const getLabelListByDatasetId = (id = '-1') => Vue.prototype.$dashboardAxios.get(`/label/queryDataSetLabelList/${id}`)

export {
  getLabelList,
  labelList,
  getLabelType,
  removeLabelByType,
  removeLabel,
  checkRepeatLabel,
  addOrUpdateLabel,
  getLabelDetail,
  updateLabelType,
  getDataSetIdListByLabelId,
  getLabelListByDatasetId
}
