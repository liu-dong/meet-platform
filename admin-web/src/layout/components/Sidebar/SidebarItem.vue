<template>
  <div v-if="!item.hidden  && !item.alwaysShow && hasMenuPermission(item)">
    <!-- 本级菜单 -->
    <template
      v-if="hasOneShowingChild(item.children, item) && (!onlyOneChild.children || onlyOneChild.noShowingChildren)">
      <app-link v-if="onlyOneChild.meta" :to="resolvePath(onlyOneChild.path)">
        <el-menu-item :index="resolvePath(onlyOneChild.path)" :class="{'submenu-title-noDropdown':!isNest}">
          <item :icon="onlyOneChild.meta.icon || (item.meta && item.meta.icon)" :title="onlyOneChild.meta.title"/>
        </el-menu-item>
      </app-link>
    </template>
    <!-- 下级菜单 -->
    <el-submenu v-else ref="subMenu" :index="resolvePath(item.path)" popper-append-to-body>
      <template slot="title">
        <item v-if="item.meta" :icon="item.meta && item.meta.icon" :title="item.meta.title"/>
      </template>
      <sidebar-item
        v-for="child in item.children"
        :key="child.path"
        :is-nest="true"
        :item="child"
        :base-path="resolvePath(child.path)"
        class="nest-menu"
      />
    </el-submenu>
  </div>
</template>

<script>
import path from 'path'
import { isExternal } from '@/utils/validate'
import Item from './Item'
import AppLink from './Link'
import FixiOSBug from './FixiOSBug'

export default {
  name: 'SidebarItem',
  components: { Item, AppLink },
  mixins: [FixiOSBug],
  props: {
    // route object
    item: {
      type: Object,
      required: true
    },
    isNest: {
      type: Boolean,
      default: false
    },
    basePath: {
      type: String,
      default: ''
    }
  },
  data() {
    // To fix https://github.com/PanJiaChen/vue-admin-template/issues/237
    // TODO: refactor with render function
    // 仅有一个子菜单的临时变量
    this.onlyOneChild = null
    return {}
  },
  computed: {
    // 用户角色
    userRoles() {
      return this.$store.state.user.roles;
    }
  },
  methods: {
    // 判断是否有一个显示的子菜单
    hasOneShowingChild(children = [], parent) {
      const showingChildren = children.filter(item => {
        // 如果子菜单被设置隐藏，或者没有菜单权限，则不显示
        if (item.hidden || !this.hasMenuPermission(item)) {
          return false
        } else {
          // 否则添加到仅有一个子菜单的临时变量中
          this.onlyOneChild = item
          return true
        }
      })
      // 当只有一个子路由时，默认显示
      if (showingChildren.length === 1) {
        return true
      }

      // 没有子路由可显示时，则显示父节点路由
      if (showingChildren.length === 0) {
        if (this.hasMenuPermission(parent)) {
          // 如果父节点有权限，则只显示这一个父节点（即使它没有显示的子节点）
          this.onlyOneChild = { ...parent, path: '', noShowingChildren: true };
          return true;
        }
        return false
      }

      return false
    },
    // 处理路径
    resolvePath(routePath) {
      if (isExternal(routePath)) {
        return routePath
      }
      if (isExternal(this.basePath)) {
        return this.basePath
      }
      return path.resolve(this.basePath, routePath)
    },
    // 判断是否有菜单权限
    hasMenuPermission(item) {
      if (!item.meta || !item.meta.roles) {
        return true // 没有设置权限的默认显示
      }
      return item.meta.roles.some(role => this.userRoles.includes(role))
    }
  }
}
</script>
