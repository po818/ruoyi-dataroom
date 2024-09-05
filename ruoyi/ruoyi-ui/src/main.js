import Vue from 'vue';

import Cookies from 'js-cookie';

import Element from 'element-ui';
import './assets/styles/element-variables.scss';

import '@/assets/styles/index.scss'; // global css
import '@/assets/styles/ruoyi.scss'; // ruoyi css
import { download } from '@/utils/request';
import App from './App';
import directive from './directive'; // directive
import plugins from './plugins'; // plugins
import router from './router';
import store from './store';

import { getConfigKey } from "@/api/system/config";
import { getDicts } from "@/api/system/dict/data";
import { addDateRange, handleTree, parseTime, resetForm, selectDictLabel, selectDictLabels } from "@/utils/ruoyi";
import './assets/icons'; // icon
import './permission'; // permission control
// 分页组件
import Pagination from "@/components/Pagination";
// 自定义表格工具组件
import RightToolbar from "@/components/RightToolbar";
// 富文本组件
import Editor from "@/components/Editor";
// 文件上传组件
import FileUpload from "@/components/FileUpload";
// 图片上传组件
import ImageUpload from "@/components/ImageUpload";
// 图片预览组件
import ImagePreview from "@/components/ImagePreview";
// 字典标签组件
import DictTag from '@/components/DictTag';
// 头部标签组件
import VueMeta from 'vue-meta';
// 字典数据组件
import DictData from '@/components/DictData';

// 集成dataroom大屏设计器
import { getToken } from '@/utils/auth';
import { $dashboardAxios, registerConfig as registerConfigDashboard } from '@gcpaas/dash-board-ui';
import { $dataRoomAxios, registerConfig as registerConfigDataRoom } from '@gcpaas/data-room-ui';


registerConfigDataRoom({
  httpConfigs: {
    // 这里是大屏设计器对应的后端服务地址，可以为具体值，也可以在其他地方进行配置,注：ruo-yi框架内部配置的后端地址变量默认会加上dev-api路径，因此需要另外配置参数
    // 比如环境变量文件中，假设在 .env.development中配置了地址为：VUE_BIGSCREEN_BASE_URL='http://192.168.xx.xx:xxxx/xxx'
    // baseURL:'http://192.168.0.1:8081/server 或者 process.env.VUE_BIGSCREEN_BASE_URL',
    baseURL:'http://127.0.0.1:8080',
    // 这里是大屏文件的访问前缀，一般和后端配置的gc.starter.file.urlPrefix保持一致即可
    // fileUrlPrefix: 'http://192.168.0.1:8081/server/static',
    fileUrlPrefix: 'http://127.0.0.1:8080/static',
    //添加token
    headers: {
      Authorization: 'Bearer ' + getToken()
    }
  }
}, router)
// 将大屏的aixos实例挂载到Vue上
Vue.prototype.$dataRoomAxios = $dataRoomAxios

// 使用仪表盘提供的方法，进行后端服务地址注册
registerConfigDashboard({
  httpConfigs: {
    // 这里是仪表盘设计器对应的后端服务地址，可以为具体值，也可以在其他地方进行配置，注：ruo-yi框架内部配置的后端地址变量默认会加上dev-api路径，因此需要另外配置参数
    // 比如环境变量文件中，假设在 .env.development中配置了地址为：VUE_BIGSCREEN_BASE_URL='http://192.168.xx.xx:xxxx/xxx'
    baseURL:'http://127.0.0.1:8080',
    //添加token
    headers: {
      Authorization: 'Bearer ' + getToken()
    }
  }
}, router)
// 将仪表盘的aixos实例挂载到Vue上
Vue.prototype.$dashboardAxios = $dashboardAxios

// 全局方法挂载
Vue.prototype.getDicts = getDicts
Vue.prototype.getConfigKey = getConfigKey
Vue.prototype.parseTime = parseTime
Vue.prototype.resetForm = resetForm
Vue.prototype.addDateRange = addDateRange
Vue.prototype.selectDictLabel = selectDictLabel
Vue.prototype.selectDictLabels = selectDictLabels
Vue.prototype.download = download
Vue.prototype.handleTree = handleTree

// 全局组件挂载
Vue.component('DictTag', DictTag)
Vue.component('Pagination', Pagination)
Vue.component('RightToolbar', RightToolbar)
Vue.component('Editor', Editor)
Vue.component('FileUpload', FileUpload)
Vue.component('ImageUpload', ImageUpload)
Vue.component('ImagePreview', ImagePreview)

Vue.use(directive)
Vue.use(plugins)
Vue.use(VueMeta)
DictData.install()

/**
 * If you don't want to use mock-server
 * you want to use MockJs for mock api
 * you can execute: mockXHR()
 *
 * Currently MockJs will be used in the production environment,
 * please remove it before going online! ! !
 */

Vue.use(Element, {
  size: Cookies.get('size') || 'mini' // set element-ui default size
})

Vue.config.productionTip = false

new Vue({
  el: '#app',
  router,
  store,
  render: h => h(App)
})
