<template>
  <div class="bs-theme-wrap">
    <!-- <div class="ztree-filter-container filter-container">
        <el-input
          v-model="queryForm.searchKey"
          placeholder="请输入数据集分组"
          clearable
          class="ztree-input bs-el-input"
          @keyup.enter.native="reSearch()"
          @clear="reSearch()"
        />
        <el-button
          :loading="loading"
          type="primary"
          icon="el-icon-search"
          @click="reSearch()"
        >
          查询
        </el-button>
      </div> -->
    <br class="br">
    <el-tabs v-model="activeName">
      <el-tab-pane label="分组" name="group" />
      <el-tab-pane label="类型" name="type" />
    </el-tabs>
    <div v-show="activeName == 'group'" class="left" style="height: 100px;">
      <div style="height: calc(100vh - 260px);">
        <el-scrollbar class="side-catalog-box">
          <div class="side-catalog-all side-catalog-item" :class="{ 'active-catalog': isAll }"
            @click="clickAllCatalog()">
            全部
          </div>
          <div v-for="(catalog, index) in catalogList" :key="index" class="side-catalog-item"
            :class="{ 'active-catalog': activeCatalog.id === catalog.id && !isAll }"
            @mouseenter="mouseenter(catalog.id)" @mouseleave="mouseleave" @click="clickCatalog(catalog)">
            <span class="catalog-name">{{ catalog.name }}</span>
            <el-dropdown
              :class="{ 'dropdown-show': (showDropdown && hoverItem === catalog.code) || activeCatalog.code === catalog.code }"
              class="page-list-dropdown" placement="bottom-start" node-key="id" trigger="click">
              <span class="el-dropdown-link menu-dropdown-link">
                <i class="el-icon-more"
                  :class="{ 'active-icon-more': activeCatalog.code === catalog.code && !isAll }" />
                <el-dropdown-menu slot="dropdown" class="dropdown-menu-box bs-el-dropdown-menu">
                  <el-dropdown-item @click.native="catalogEdit(catalog)">
                    编辑
                  </el-dropdown-item>
                  <el-dropdown-item class="delete-item" @click.native="catalogDel(catalog)">
                    删除
                  </el-dropdown-item>
                </el-dropdown-menu>
              </span>
            </el-dropdown>
          </div>
        </el-scrollbar>
      </div>

      <div class="scroll">
        <el-empty v-show="noData" />
        <div class="add-dataset-box" style="text-align: center;" @click="addRootNode">
          <!-- <el-button
                type="text"
                icon="el-icon-plus"
                @click="addRootNode"
              >
                <span style="color: var(--bs-el-color-primary);">新增分组</span>
              </el-button> -->

          <i class="el-icon-plus" />
          <div>新增分组</div>
        </div>
        <div v-loading="loading" class="loading" element-loading-text="正在加载数据"
          element-loading-spinner="el-icon-loading" />
      </div>

      <div v-show="rightClickForm.visible" class="ztreeNodeMenu" @mouseleave="rightClickForm.visible = false"
        @mouseenter="rightClickForm.visible = true" />
    </div>
    <div v-show="activeName == 'type'" class="left">
      <div class="left-tab-box">
        <ul>
          <li v-for="(_type, index) in datasetTypeList" :key="index"
            :class="{ 'tab-style': true, 'tab-active': _type.datasetType == curType }"
            @click="getTypeData(_type.datasetType)">
            <span>{{ _type.name }}</span>
          </li>
        </ul>
      </div>
    </div>
    <CategroyEditForm v-if="editFormVisible" ref="categroyEditForm" :app-code="appCode"
      @addOrUpdateNode="addOrUpdateNode" />
  </div>
</template>

<script>
// eslint-disable-next-line no-unused-vars
import { categoryDele, categoryRemove, getCategoryTree } from 'data-room-ui/js/utils/datasetConfigService';
import cloneDeep from 'lodash/cloneDeep';
import CategroyEditForm from './CategroyEditForm.vue';

export default {
  name: 'DatasetTypeTreeIndex',
  components: {
    CategroyEditForm
  },
  props: {
    datasetTypeList: {
      type: Array,
      default: () => (['original', 'custom', 'storedProcedure', 'json', 'script'])
    },
    appCode: {
      type: String,
      default: ''
    }
  },
  data: function () {
    return {
      activeName: 'group',
      categoryData: [],
      catalogList: [],
      showDropdown: false,
      hoverItem: null,
      isAll: true,
      activeCatalog: { // 激活的目录,点击其他非目录按钮时需要保持当前的菜单激活状态
        name: '',
        id: '',
        code: ''
      },
      curType: '-1',
      noData: false,
      loading: false,
      rightTableIsTransition: '',
      flatData: [],
      queryForm: {
        searchKey: ''
      },
      ztreeObj: '',
      nodeData: '',
      rightClickForm: {
        visible: false,
        org: {}
      },
      editTypeConstant: {
        deleteOrg: 'deleteOrg',
        editOrg: 'editOrg',
        addChildOrg: 'addChildOrg',
        addSiblingOrg: 'addSiblingOrg'
      },
      editFormVisible: false,
      ztreeSetting: {
        view: {
          dblClickExpand: false,
          showTitle: false,
          addHoverDom: (treeId, treeNode) => {
            const nodeObj = $('#' + treeNode.tId + '_a')
            nodeObj.css({ 'background-color': '#f6f7fb', cursor: 'pointer' })
          },
          removeHoverDom: (treeId, treeNode) => {
            const nodeObj = $('#' + treeNode.tId + '_a')
            nodeObj.css({ 'background-color': 'rgba(0,0,0,0)' })
          },
          addDiyDom: this.addDiyDom
        },
        callback: {
          onClick: this.getNodeData,
          onExpand: this.expandNode
        }
      },
      isBoth: false // 是否为全部
    }
  },
  computed: {},
  mounted() {
    // this.initLazyDatasetTypeTree()
    this.getCatalogList()
  },

  methods: {
    mouseenter(code) {
      this.showDropdown = true
      this.hoverItem = code
    },
    mouseleave() {
      this.showDropdown = false
    },
    // 点击全部
    clickAllCatalog() {
      this.isAll = true
      this.curType = '-1'
      this.$emit('nodeClick', { id: '', code: '', name: '' }, this.activeName)
    },
    // 点击目录
    clickCatalog(catalog) {
      this.currentCatalog = cloneDeep(catalog)
      this.activeCatalog = cloneDeep(catalog)
      this.isAll = false
      // this.$emit('getPageInfo', { isAll: false, page: catalog })
      this.curType = '-1'
      this.$emit('nodeClick', catalog, this.activeName)
    },
    // 关闭目录弹窗
    handleClose() {
      this.catalogVisible = false
      this.$refs.form.clearValidate()
    },
    // 新增编辑目录（点击确定）
    addOrEditCatalog() {
      this.$refs.form.validate(async (valid) => {
        if (!valid) {
          return
        }
        if (!this.currentCatalog.id) {
          this.$dataRoomAxios.post('/bigScreen/type/add',
            {
              ...this.currentCatalog,
              type: this.type || 'bigScreenCatalog'
            }).then(data => {
              this.catalogVisible = false
              this.getCatalogList()
              this.flag = true
              // 关闭页面菜单的弹窗
              this.closePageMenuDialog()
            }).catch(() => {
            })
        } else {
          this.$dataRoomAxios.post('/bigScreen/type/update', { ...this.currentCatalog, type: this.type || 'bigScreenCatalog' }).then(data => {
            this.catalogVisible = false
            this.getCatalogList()
          }).catch(() => {
          })
        }
      })
    },
    // 新增根节点
    addRootNode() {
      this.editFormVisible = true
      this.$nextTick(() => {
        this.$refs.categroyEditForm.tableName = 'r_dataset'
        this.$refs.categroyEditForm.dialogFormVisible = true
        this.$refs.categroyEditForm.init({ parentId: 0 }, true)
        this.$refs.categroyEditForm.radio = 0
        this.$refs.categroyEditForm.title = '新增分组'
        this.$refs.categroyEditForm.refId = ''
      })
    },
    addDiyDom(treeId, treeNode) {
      if (this.activeName === 'type') return
      if (treeNode.parentNode && treeNode.parentNode.id !== 2) return
      const aObj = $('#' + treeNode.tId + '_a')
      const editStr = "<span  id='diyBtn_" + treeNode.id + "' class='treeAddNode'>⋮</span>"
      aObj.after(editStr)
      const btn = $('#diyBtn_' + treeNode.id)
      if (btn) {
        const _this = this
        btn.bind('mouseenter', function () {
          if (treeNode.name === '全部' && treeNode.id === '') {
            _this.isBoth = true
          } else {
            _this.isBoth = false
          }
          _this.nodeData = treeNode
          _this.rightClickForm.org = treeNode
          _this.rightClickForm.visible = true
          let hieght = 0
          const nodeElObj = document.getElementById(treeNode.tId + '_a').getBoundingClientRect()
          const clientHeight = document.documentElement.clientHeight
          const clientY = nodeElObj.top + 34
          if (clientHeight - clientY < 200) {
            hieght = clientY - 200
            document.querySelector('.node-bottom-menu').style.display = 'none'
            const menu = document.querySelector('.node-top-menu')
            /* 菜单定位基于鼠标点击位置 */
            menu.style.display = ''
            menu.style.left = nodeElObj.right - 92 + 'px'
            menu.style.top = hieght + 20 + 25 + 'px'
            menu.style.position = 'fixed' // 为新创建的DIV指定绝对定位
            menu.style.width = 110 + 'px'
          } else {
            hieght = clientY
            document.querySelector('.node-top-menu').style.display = 'none'
            const menu = document.querySelector('.node-bottom-menu')
            /* 菜单定位基于鼠标点击位置 */
            menu.style.display = ''
            menu.style.left = nodeElObj.right - 92 + 'px'
            menu.style.top = hieght - 8 + 'px'
            menu.style.position = 'fixed' // 为新创建的DIV指定绝对定位
            menu.style.width = 110 + 'px'
          }
        })
        btn.bind('mouseout', function () {
          _this.rightClickForm.visible = false
        })
      }
    },
    catalogDel(catalog) {
      this.$confirm('分组删除后，分组下的数据集会被归纳至全部中，确定删除该分组？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning',
        customClass: 'bs-el-message-box'
      }).then(async () => {
        categoryRemove(catalog.id).then((data) => {
          this.$message.success('删除成功')
          this.getCatalogList()
        })
      }).catch()
    },
    // 编辑目录
    catalogEdit(catalog) {
      this.editFormVisible = true
      this.$nextTick(() => {
        this.$refs.categroyEditForm.tableName = 'r_dataset'
        this.$refs.categroyEditForm.dialogFormVisible = true
        this.$refs.categroyEditForm.init({ parentId: 0 }, true)
        this.$refs.categroyEditForm.radio = 0
        this.$refs.categroyEditForm.title = '编辑分组'
        this.$refs.categroyEditForm.refId = catalog.id
      })
    },
    // 查询分组
    getCatalogList() {
      this.pageLoading = true
      getCategoryTree({ type: 'dataset', moduleCode: this.appCode }).then((res) => {
        this.catalogList = res
      }).catch(() => {
      }).finally(() => {
        this.pageLoading = false
      })
    },

    // 初始化树节点
    initLazyDatasetTypeTree() {
      this.loading = true
      getCategoryTree({ type: 'dataset', moduleCode: this.appCode }).then((res) => {
        this.categoryData = res.map((item) => {
          return { isParent: item.hasChildren, ...item }
        })
        this.categoryData.unshift({ name: '全部', id: '', parentId: '0' })
        this.ztreeObj = $.fn.zTree.init($('#datasetTypeTree'), this.ztreeSetting, this.categoryData)
        this.$emit('reCategory')
      }).then((e) => {
        this.loading = false
      }).catch((e) => {
        this.loading = false
      })
    },
    // 节点展开
    expandNode(event, tree, nodeData) {
      if (nodeData.children) {
        nodeData.children.forEach((item) => {
          this.ztreeObj.showNode(item)
        })
      } else {
        this.loading = true
      }
    },
    // 未知
    expandedNodes() {
      if (this.rightTableIsTransition === 1) {
        this.$emit('expandedNodes', 1)
      } else {
        this.$emit('expandedNodes', this.flatTreeData(this.ztreeObj.getNodes()).length)
      }
      this.flatData = []
    },
    // filter方法
    filterNode(node) {
      const selfMatch = node.name.includes(this.queryForm.searchKey)
      const childMatch = false
      // 过滤非匹配的值
      return !(this.recursion(node, childMatch) || selfMatch)
    },
    // 子节点匹配 - 递归
    recursion(node, childMatch) {
      if (node.isParent) {
        for (let i = 0; i < node.children.length; i++) {
          if (node.children[i].name.includes(this.queryForm.searchKey)) {
            childMatch = true
            return childMatch
          } else {
            childMatch = this.recursion(node.children[i], childMatch)
          }
        }
      }
      return childMatch
    },
    // 查询
    reSearch() {
      this.activeName = 'group'
      if (this.queryForm.searchKey) {
        const treeObj = $.fn.zTree.getZTreeObj('datasetTypeTree')
        const nodes = treeObj.getNodesByParam('isHidden', true)
        treeObj.showNodes(nodes)
        const hiddenNodes = treeObj.getNodesByFilter(this.filterNode)
        treeObj.hideNodes(hiddenNodes)
        treeObj.expandAll(true)
      } else {
        this.initLazyDatasetTypeTree()
      }
    },
    // 节点点击事件
    getNodeData(treeId, treeNode, nodeData, clickFlag) {
      this.curType = '-1'
      this.$emit('nodeClick', nodeData, this.activeName)
    },
    // 类型点击事件
    getTypeData(datasetType) {
      this.curType = datasetType
      // this.ztreeObj.cancelSelectedNode()
      this.$emit('nodeClick', datasetType, this.activeName)
    },
    // 更多事件
    menuClick(editType) {
      // 删除节点
      if (editType === this.editTypeConstant.deleteOrg) {
        categoryDele(this.rightClickForm.org.id).then((res) => {
          if (res == 0) {
            this.deleteOrg(this.rightClickForm.org)
          } else {
            this.$message.error('当前节点下存在已定义数据集，无法删除')
          }
        })
        return
      }
      // 编辑节点
      this.editFormVisible = true
      if (editType === this.editTypeConstant.editOrg) {
        this.$nextTick(() => {
          this.$refs.categroyEditForm.type = 'dataset'
          this.$refs.categroyEditForm.dialogFormVisible = true
          this.$refs.categroyEditForm.init(this.rightClickForm.org, false)
          this.$refs.categroyEditForm.title = '编辑分组'
        })
        return
      }
      // 新增同级节点
      if (editType === this.editTypeConstant.addSiblingOrg) {
        this.$nextTick(() => {
          this.$refs.categroyEditForm.type = 'dataset'
          this.$refs.categroyEditForm.dialogFormVisible = true
          this.$refs.categroyEditForm.init(this.rightClickForm.org, true, editType)
          this.$refs.categroyEditForm.radio = 0
          this.$refs.categroyEditForm.title = '新增分组'
        })
        return
      }
      // 新增子节点
      if (editType === this.editTypeConstant.addChildOrg) {
        this.$nextTick(() => {
          this.$refs.categroyEditForm.type = 'dataset'
          this.$refs.categroyEditForm.dialogFormVisible = true
          this.$refs.categroyEditForm.init(this.rightClickForm.org, true, editType)
          this.$refs.categroyEditForm.radio = 1
          this.$refs.categroyEditForm.title = '新增分组'
        })
      }
    },
    flatTreeData(data) {
      data.forEach(item => {
        this.flatData.push(item)
        if (item.children) {
          this.flatTreeData(item.children)
        }
      })
      return this.flatData
    },
    // 删除分类
    deleteOrg(org) {
      this.$confirm('删除数据集分组，确定进行删除操作?', '提示',
        {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning',
          customClass: 'bs-el-message-box'
        }
      ).then(() => {
        if (!org.id) {
          return
        }
        categoryRemove(org.id).then((data) => {
          this.$message.success('操作成功')
          // this.ztreeObj.removeNode(org)
          // this.initLazyOrgTree()
          const removeNode = this.ztreeObj.getNodeByParam('id', org.id, null)
          this.ztreeObj.removeNode(removeNode)
          this.redrawTree()
          // 刷新右侧表格
          this.$emit('refreshData', org)
        })
      })
    },
    // 刷新右侧表格
    refreshData(cbObj) {
      // 刷新右侧表格
      this.$emit('refreshData', cbObj)
    },
    // 新增或修改节点
    addOrUpdateNode(params, isAdd) {
      if (!isAdd) {
        const editNode = this.ztreeObj.getNodeByParam('id', params.id, null)
        editNode.name = params.name
        this.ztreeObj.editName(editNode)
        this.ztreeObj.setEditable(false)
      } else {
        // 新增
        const parentNode = params.parentId === 0 ? null : this.ztreeObj.getNodeByParam('id', params.parentId, null)
        this.ztreeObj.addNodes(parentNode, params)
      }
      this.redrawTree()
    },
    // 重新绘制树
    redrawTree() {
      // 重新绘制ztree
      getCategoryTree({ type: 'dataset', moduleCode: this.appCode }).then((res) => {
        this.categoryData = res.map((item) => {
          return { isParent: item.hasChildren, ...item }
        })
        this.categoryData.unshift({ name: '全部', id: '', parentId: '0' })
      }).then((e) => {
        this.loading = false
      }).catch((e) => {
        this.loading = false
      })
    }
  }
}
</script>
<style lang="scss" scoped>
@import '../../assets/style/bsTheme.scss';

::v-deep .el-tabs {
  .el-tabs__header {
    margin: 0;

    .el-tabs__nav {
      width: 100%;

      .el-tabs__item {
        color: var(--bs-el-text);
        width: 50%;
        text-align: center;
      }

      .el-tabs__active-bar {
        display: none !important;
      }

      .el-tabs__item.is-active {
        color: var(--bs-el-color-primary) !important;
        border-bottom-color: var(--bs-el-border) !important;
      }
    }
  }
}

::v-deep .ztree {
  span {
    color: var(--bs-el-text);
  }

  li:hover {
    background: transparent !important;
    background-color: transparent !important;
  }

  .curSelectedNode {
    background: var(--bs-el-background-3) !important;
    background-color: var(--bs-el-background-3) !important;
  }

  a:hover {
    background: var(--bs-el-background-3) !important;
    background-color: var(--bs-el-background-3) !important;
  }
}

::v-deep .el-tabs__nav-wrap::after {
  display: none !important;
}

.left-tab-box ul li {
  font-size: 12px;
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
  -webkit-align-items: center;
  -ms-flex-align: center;
  align-items: center;
  height: 34px;
  line-height: 40px;
  cursor: pointer;
  padding-left: 20px;
  margin: 2px 0;

  &:hover,
  &.tab-active {
    background-color: #f2f7fe;
  }

  &.tab-active::before {
    content: "";
    height: 34px;
    line-height: 40px;
    position: absolute;
    left: 0;
    border-left: 4px solid var(--bs-el-color-primary);
  }
}

.ztree-input {
  margin-right: 10px !important;
}

.ztree-box {
  height: 100%;
  overflow: hidden;
}

.el-textarea__inner {
  color: var(--bs-el-text);
  background-color: var(--bs-el-background-1) !important;
}

.add-dataset-box {
  padding: 10px 0;
  box-sizing: border-box;
  display: flex;
  justify-content: center;
  align-items: center;
  border-radius: 10px;
  color: var(--bs-el-title);
  margin: -15px 18px;

  &:hover {
    background-color: var(--bs-background-1);
    cursor: pointer;
    // color: var(--bs-el-text);;
  }

  .el-icon-plus {
    padding: 0 5px;
  }
}

.bs-theme-wrap {
  height: 100%;
}

.tree-box {
  padding: 0 8px 10px 0;
  height: 100%;
}

.side-catalog-box {
  width: 100%;
  height: calc(100% - 50px);
  overflow-y: auto;

  .side-catalog-all {
    font-weight: bold;
  }

  .side-catalog-item {
    box-sizing: border-box;
    color: var(--bs-el-title);
    background-color: var(--bs-background-2);
    width: 100%;
    padding: 0px 10px;
    line-height: 36px;
    display: flex;
    justify-content: space-between;

    &:hover {
      cursor: pointer;
    }

    .el-icon-more {
      transform: rotate(90deg);
      color: var(--bs-el-title);
      font-weight: 400;
    }

    .active-icon-more {
      color: var(--bs-el-text);
    }

    .catalog-name {
      overflow: hidden;
      white-space: nowrap;
      text-overflow: ellipsis;
      -o-text-overflow: ellipsis;
    }

    .page-list-dropdown {
      opacity: 0;
    }

    .dropdown-show {
      opacity: 1;
    }
  }

  /*菜单激活时的样式*/
  .active-catalog {
    position: relative;
    background-color: rgba(var(--bs-el-color-primary-active), 0.4);
    color: var(--bs-el-text);

    &::before {
      content: '';
      position: absolute;
      left: 0;
      width: 4px;
      height: 36px;
      background-color: var(--bs-el-color-primary);
    }
  }
}
</style>
