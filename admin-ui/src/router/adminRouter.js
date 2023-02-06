import MenuList from '@/view/admin/MenuList'
import MenuDetail from '@/view/admin/MenuDetail'
import AccountList from '@/view/admin/AccountList'
import AccountDetail from '@/view/admin/AccountDetail'
import PersonList from '@/view/admin/PersonList'
import PersonDetail from '@/view/admin/PersonDetail'
import RoleList from '@/view/admin/RoleList'
import RoleDetail from '@/view/admin/RoleDetail'
import RoleAccountDetail from '@/view/admin/RoleAccountDetail'
import RolePermissionDetail from '@/view/admin/RolePermissionDetail'
import Home from '@/view/admin/Home'
import DataCatalogList from '@/view/admin/DataCatalogList'
import DataCatalogDetail from '@/view/admin/DataCatalogDetail'
import MenuTree from '@/view/admin/MenuTree'
import PermissionList from '@/view/admin/PermissionList'
import PermissionTree from '@/view/admin/PermissionTree'
import PermissionDetail from '@/view/admin/PermissionDetail'
import OrgList from "@/view/admin/OrgList";
import OrgDetail from "@/view/admin/OrgDetail";
import OrgPersonDetail from "@/view/admin/OrgPersonDetail";

export const adminRouter = [
  {
    path: '/systemHome', name: 'systemHome', component: Home, children: [
      {path: '/menuList', name: 'menuList', component: MenuList},
      {path: '/menuTree', name: 'menuTree', component: MenuTree},
      {path: '/menuDetail', name: 'menuDetail', component: MenuDetail},
      {path: '/accountList', name: 'accountList', component: AccountList},
      {path: '/accountDetail', name: 'accountDetail', component: AccountDetail},
      {path: '/personList', name: 'personList', component: PersonList},
      {path: '/personDetail', name: 'personDetail', component: PersonDetail},
      {path: '/roleList', name: 'roleList', component: RoleList},
      {path: '/roleDetail', name: 'roleDetail', component: RoleDetail},
      {path: '/roleAccountDetail', name: 'roleAccountDetail', component: RoleAccountDetail},
      {path: '/rolePermissionDetail', name: 'rolePermissionDetail', component: RolePermissionDetail},
      {path: '/dataCatalogDetail', name: 'dataCatalogDetail', component: DataCatalogDetail},
      {path: '/dataCatalogList', name: 'dataCatalogList', component: DataCatalogList},
      {path: '/permissionList', name: 'permissionList', component: PermissionList},
      {path: '/permissionTree', name: 'permissionTree', component: PermissionTree},
      {path: '/permissionDetail', name: 'permissionDetail', component: PermissionDetail},
      {path: '/orgList', name: 'orgList', component: OrgList},
      {path: '/orgDetail', name: 'orgDetail', component: OrgDetail},
      {path: '/orgPersonDetail', name: 'orgPersonDetail', component: OrgPersonDetail}
    ]
  }
]

export default adminRouter
