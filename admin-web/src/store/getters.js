const getters = {
  sidebar: state => state.app.sidebar,
  device: state => state.app.device,
  token: state => state.user.token,
  avatar: state => state.user.avatar,
  nickname: state => state.user.nickname,
  roles: state => state.user.roles,
  permissions: state => state.user.permissions,
  addRouters: state => state.permission.addRouters,
  sidebarRouters: state => state.permission.sidebarRouters
}
export default getters
