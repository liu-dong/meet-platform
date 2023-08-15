<template>
  <div class="navbar-container">
    <el-menu
      class="el-menu-demo"
      :default-active="activeMenu"
      mode="horizontal"
      :background-color="variables.navMenuBg"
      :text-color="variables.menuText"
      :unique-opened="false"
      :active-text-color="variables.menuActiveText"
      :collapse-transition="false"
    >
      <navbar-item v-for="route in routes" :key="route.path" :item="route" :base-path="route.path" />
    </el-menu>
    <avatar-item />
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import variables from '@/styles/variables.scss'
import NavbarItem from '@/layout/components/Navigationbar/NavbarItem'
import AvatarItem from '@/layout/components/Navigationbar/AvatarItem'

export default {
  components: { NavbarItem, AvatarItem },
  computed: {
    ...mapGetters([
      'sidebar'
    ]),
    routes() {
      return this.$router.options.routes
    },
    activeMenu() {
      const route = this.$route
      const { meta, path } = route
      // if set path, the sidebar will highlight the path you set
      if (meta.activeMenu) {
        return meta.activeMenu
      }
      return path
    },
    variables() {
      return variables
    }
  }
}
</script>
