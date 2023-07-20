<template>
  <div>
    <el-menu
      :default-active="activeMenu"
      mode="horizontal"
      :background-color="variables.topMenuBg"
      :text-color="variables.menuText"
      :unique-opened="false"
      :active-text-color="variables.menuActiveText"
      :collapse-transition="false"
    >
      <navbar-item1/>
    </el-menu>
  </div>
</template>

<script>
import {mapGetters} from 'vuex'
import variables from '@/styles/variables.scss'
import NavbarItem1 from "@/layout/components/Navigationbar/NavbarItem1";

export default {
  components: {NavbarItem1},
  computed: {
    ...mapGetters([
      'sidebar'
    ]),
    routes() {
      return this.$router.options.routes
    },
    activeMenu() {
      const route = this.$route
      const {meta, path} = route
      // if set path, the sidebar will highlight the path you set
      if (meta.activeMenu) {
        return meta.activeMenu
      }
      return path
    },
    variables() {
      return variables
    },
  }
}
</script>
