import Vue from 'vue'
import Vuex from 'vuex'
import getters from './getters'
import app from './modules/app'
import dict from './modules/dict'
import permission from './modules/permission'
import settings from './modules/settings'
import tagsView from './modules/tagsView'
import user from './modules/user'

// 集成dataroom大屏设计器
import { $dashboardStore } from '@gcpaas/dash-board-ui'
import { $dataRoomStore } from '@gcpaas/data-room-ui'

Vue.use(Vuex)

const store = new Vuex.Store({
  modules: {
    app,
    dict,
    user,
    tagsView,
    permission,
    settings,
    // 注册大屏设计器的store
    bigScreen: $dataRoomStore,
    // 注册仪表盘设计器的store
    dashboard: $dashboardStore
  },
  getters
})

export default store
