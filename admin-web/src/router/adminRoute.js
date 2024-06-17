import Layout from '@/layout'

/**
 * 注意: 当路由的子路由数量至少为1时，子菜单才会显示
 * 具体详情参考: https://panjiachen.github.io/vue-element-admin-site/guide/essentials/router-and-nav.html
 *
 * hidden: true                   如果设置为true，该项将不会在侧边栏中显示(默认是false)
 * alwaysShow: true               如果设置为true，将始终显示根菜单
 *                                如果没有设置alwaysShow且子路由数量超过一个时，
 *                                它会变成嵌套模式，否则不显示根菜单
 * redirect: noRedirect           如果设置了noRedirect，则在面包屑中不会重定向
 * name:'router-name'             名称由<keep-alive>使用(必须设置!!!)
 * meta : {
 *    roles: ['admin','editor']    控制页面角色(你可以设置多个角色)
 *    title: 'title'               显示在侧边栏和面包屑中的名称(推荐设置)
 *    icon: 'svg-name'/'el-icon-x' 在侧边栏中显示的图标
 *    breadcrumb: false            如果设置为false，该项将隐藏在面包屑中(默认是true)
 *    activeMenu: '/example/list'  如果设置了路径，侧边栏将高亮你设置的路径
 * }
 */
export const adminRoute = [
  {
    path: '/user',
    name: 'User',
    redirect: '/userList',
    component: Layout,
    meta: { title: '用户管理', icon: 'table', roles: ['SuperAdmin', 'Admin'] },
    children: [
      {
        path: '/accountList',
        name: 'AccountList',
        meta: { title: '账号列表', icon: 'table', roles: ['SuperAdmin', 'Admin'] },
        component: () => import('@/views/admin/AccountList.vue')
      },
      {
        hidden: true,
        path: '/accountDetail',
        name: 'AccountDetail',
        meta: { title: '账号详情', icon: 'form', roles: ['SuperAdmin', 'Admin'] },
        component: () => import('@/views/admin/AccountDetail.vue')
      },
      {
        path: '/userList',
        name: 'UserList',
        meta: { title: '用户列表', icon: 'table', roles: ['SuperAdmin', 'Admin'] },
        component: () => import('@/views/admin/UserList.vue')
      },
      {
        hidden: true,
        path: '/userDetail',
        name: 'UserDetail',
        meta: { title: '用户详情', icon: 'form', roles: ['SuperAdmin', 'Admin'] },
        component: () => import('@/views/admin/UserDetail.vue')
      },
      {
        hidden: true,
        path: '/userRoleDetail',
        name: 'UserRoleDetail',
        meta: { title: '用户角色详情', icon: 'form', roles: ['SuperAdmin', 'Admin'] },
        component: () => import('@/views/admin/UserRoleDetail.vue'),
        props: true
      }
    ]
  },
  {
    path: '/role',
    name: 'Role',
    redirect: '/roleList',
    alwaysShow: true,
    meta: { title: '角色管理', icon: 'table', roles: ['SuperAdmin', 'Admin'] },
    component: Layout,
    children: [
      {
        path: '/roleList',
        name: 'RoleList',
        meta: { title: '角色列表', icon: 'table', roles: ['SuperAdmin', 'Admin'] },
        component: () => import('@/views/admin/RoleList.vue')
      },
      {
        hidden: true,
        path: '/roleDetail',
        name: 'RoleDetail',
        meta: { title: '角色详情', icon: 'form', roles: ['SuperAdmin', 'Admin'] },
        component: () => import('@/views/admin/RoleDetail.vue')
      },
      {
        hidden: true,
        path: '/rolePermissionDetail',
        name: 'RolePermissionDetail',
        meta: { title: '角色权限详情', icon: 'form', roles: ['SuperAdmin', 'Admin'] },
        component: () => import('@/views/admin/RolePermissionDetail.vue')
      },
      {
        hidden: true,
        path: '/roleAccountDetail',
        name: 'RoleAccountDetail',
        meta: { title: '角色账号详情', icon: 'form', roles: ['SuperAdmin', 'Admin'] },
        component: () => import('@/views/admin/RoleAccountDetail.vue')
      }
    ]
  },
  {
    path: '/permission',
    name: 'Permission',
    redirect: '/permissionList',
    meta: { title: '权限管理', icon: 'table', roles: ['SuperAdmin', 'Admin'] },
    component: Layout,
    children: [
      {
        path: '/permissionList',
        name: 'PermissionList',
        meta: { title: '权限列表', icon: 'table', roles: ['SuperAdmin', 'Admin'] },
        component: () => import('@/views/admin/PermissionList.vue')
      },
      {
        path: '/permissionTree',
        name: 'PermissionTree',
        meta: { title: '权限树', icon: 'table', roles: ['SuperAdmin', 'Admin'] },
        component: () => import('@/views/admin/PermissionTree.vue')
      },
      {
        hidden: true,
        path: '/permissionDetail',
        name: 'PermissionDetail',
        meta: { title: '权限详情', icon: 'form', roles: ['SuperAdmin', 'Admin'] },
        component: () => import('@/views/admin/PermissionDetail.vue')
      }
    ]
  },
  {
    path: '/menu',
    name: 'Menu',
    redirect: '/menuList',
    meta: { title: '菜单管理', icon: 'table', roles: ['SuperAdmin', 'Admin'] },
    component: Layout,
    children: [
      {
        path: '/menuList',
        name: 'MenuList',
        meta: { title: '菜单列表', icon: 'table', roles: ['SuperAdmin', 'Admin'] },
        component: () => import('@/views/admin/MenuList.vue')
      },
      {
        path: '/menuTree',
        name: 'MenuTree',
        meta: { title: '菜单树', icon: 'table', roles: ['SuperAdmin', 'Admin'] },
        component: () => import('@/views/admin/MenuTree.vue')
      },
      {
        hidden: true,
        path: '/menuDetail',
        name: 'MenuDetail',
        meta: { title: '菜单详情', icon: 'form', roles: ['SuperAdmin', 'Admin'] },
        component: () => import('@/views/admin/MenuDetail.vue')
      }
    ]
  },
  {
    path: '/org',
    name: 'Org',
    redirect: '/orgList',
    component: Layout,
    children: [
      {
        path: '/orgList',
        name: 'OrgList',
        meta: { title: '单位列表', icon: 'table', roles: ['SuperAdmin', 'Admin'] },
        component: () => import('@/views/admin/OrgList.vue')
      },
      {
        hidden: true,
        path: '/orgDetail',
        name: 'OrgDetail',
        meta: { title: '单位详情', icon: 'form', roles: ['SuperAdmin', 'Admin'] },
        component: () => import('@/views/admin/OrgDetail.vue')
      },
      {
        hidden: true,
        path: '/orgPersonDetail',
        name: 'OrgPersonDetail',
        meta: { title: '单位人员详情', icon: 'form', roles: ['SuperAdmin', 'Admin'] },
        component: () => import('@/views/admin/OrgPersonDetail.vue')
      }
    ]
  },
  {
    path: '/person',
    name: 'Person',
    redirect: '/personList',
    meta: { title: '人员管理', icon: 'table', roles: ['SuperAdmin', 'Admin'] },
    component: Layout,
    children: [
      {
        path: '/personList',
        name: 'PersonList',
        meta: { title: '人员列表', icon: 'table', roles: ['SuperAdmin', 'Admin'] },
        component: () => import('@/views/admin/PersonList.vue')
      },
      {
        hidden: true,
        path: '/personDetail',
        name: 'PersonDetail',
        meta: { title: '人员详情', icon: 'form', roles: ['SuperAdmin', 'Admin'] },
        component: () => import('@/views/admin/PersonDetail.vue')
      }
    ]
  },
  {
    path: '/dataCatalog',
    name: 'DataCatalogList',
    redirect: '/dataCatalogList',
    component: Layout,
    children: [
      {
        hidden: true,
        path: '/dataCatalogDetail',
        name: 'DataCatalogDetail',
        meta: { title: '数据字典详情', icon: 'form', roles: ['SuperAdmin', 'Admin'] },
        component: () => import('@/views/admin/DataCatalogDetail.vue')
      },
      {
        path: '/dataCatalogList',
        name: 'DataCatalogList',
        meta: { title: '数据字典列表', icon: 'table', roles: ['SuperAdmin', 'Admin'] },
        component: () => import('@/views/admin/DataCatalogList.vue')
      }
    ]
  }
]

export default adminRoute
