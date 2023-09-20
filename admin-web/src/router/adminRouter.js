import Layout from '@/layout'

export const adminRouter = [
  {
    path: '/menu',
    name: 'Menu',
    redirect: '/menuList',
    meta: { title: '菜单管理', icon: 'table' },
    component: Layout,
    children: [
      {
        path: '/menuList',
        name: 'menuList',
        meta: { title: '菜单列表', icon: 'table' },
        component: () => import('@/views/admin/MenuList.vue')
      },
      {
        path: '/menuTree',
        name: 'menuTree',
        meta: { title: '菜单树', icon: 'table' },
        component: () => import('@/views/admin/MenuTree.vue')
      },
      {
        hidden: true,
        path: '/menuDetail',
        name: 'menuDetail',
        meta: { title: '菜单详情', icon: 'form' },
        component: () => import('@/views/admin/MenuDetail.vue')
      }
    ]
  },
  {
    path: '/account',
    name: 'Account',
    redirect: '/accountList',
    component: Layout,
    children: [
      {
        path: '/accountList',
        name: 'accountList',
        meta: { title: '账号列表', icon: 'table' },
        component: () => import('@/views/admin/AccountList.vue')
      },
      {
        hidden: true,
        path: '/accountDetail',
        name: 'accountDetail',
        meta: { title: '账号详情', icon: 'form' },
        component: () => import('@/views/admin/AccountDetail.vue')
      }
    ]
  },
  {
    path: '/person',
    name: 'Person',
    redirect: '/personList',
    meta: { title: '人员管理', icon: 'table' },
    component: Layout,
    children: [
      {
        path: '/personList',
        name: 'personList',
        meta: { title: '人员列表', icon: 'table' },
        component: () => import('@/views/admin/PersonList.vue')
      },
      {
        hidden: true,
        path: '/personDetail',
        name: 'personDetail',
        meta: { title: '人员详情', icon: 'form' },
        component: () => import('@/views/admin/PersonDetail.vue')
      }
    ]
  },
  {
    path: '/role',
    name: 'Role',
    redirect: '/roleList',
    component: Layout,
    children: [
      {
        path: '/roleList',
        name: 'roleList',
        meta: { title: '角色列表', icon: 'table' },
        component: () => import('@/views/admin/RoleList.vue')
      },
      {
        hidden: true,
        path: '/roleDetail',
        name: 'roleDetail',
        meta: { title: '角色详情', icon: 'form' },
        component: () => import('@/views/admin/RoleDetail.vue')
      },
      {
        hidden: true,
        path: '/rolePermissionDetail',
        name: 'rolePermissionDetail',
        meta: { title: '角色权限详情', icon: 'form' },
        component: () => import('@/views/admin/RolePermissionDetail.vue')
      },
      {
        hidden: true,
        path: '/roleAccountDetail',
        name: 'roleAccountDetail',
        meta: { title: '角色账号详情', icon: 'form' },
        component: () => import('@/views/admin/RoleAccountDetail.vue')
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
        name: 'dataCatalogDetail',
        meta: { title: '数据字典详情', icon: 'form' },
        component: () => import('@/views/admin/DataCatalogDetail.vue')
      },
      {
        path: '/dataCatalogList',
        name: 'dataCatalogList',
        meta: { title: '数据字典列表', icon: 'table' },
        component: () => import('@/views/admin/DataCatalogList.vue')
      }
    ]
  },
  {
    path: '/permission',
    name: 'Permission',
    redirect: '/permissionList',
    meta: { title: '权限管理', icon: 'table' },
    component: Layout,
    children: [
      {
        path: '/permissionList',
        name: 'permissionList',
        meta: { title: '权限列表', icon: 'table' },
        component: () => import('@/views/admin/PermissionList.vue')
      },
      {
        path: '/permissionTree',
        name: 'permissionTree',
        meta: { title: '权限树', icon: 'table' },
        component: () => import('@/views/admin/PermissionTree.vue')
      },
      {
        hidden: true,
        path: '/permissionDetail',
        name: 'permissionDetail',
        meta: { title: '权限详情', icon: 'form' },
        component: () => import('@/views/admin/PermissionDetail.vue')
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
        name: 'orgList',
        meta: { title: '单位列表', icon: 'table' },
        component: () => import('@/views/admin/OrgList.vue')
      },
      {
        hidden: true,
        path: '/orgDetail',
        name: 'orgDetail',
        meta: { title: '单位详情', icon: 'form' },
        component: () => import('@/views/admin/OrgDetail.vue')
      },
      {
        hidden: true,
        path: '/orgPersonDetail',
        name: 'orgPersonDetail',
        meta: { title: '单位人员详情', icon: 'form' },
        component: () => import('@/views/admin/OrgPersonDetail.vue')
      }
    ]
  }
]

export default adminRouter
