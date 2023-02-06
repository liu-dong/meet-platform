import Index from '@/view/system/Index'
import MenuList from '@/view/system/MenuList'
import MenuDetail from '@/view/system/MenuDetail'
import AccountList from '@/view/system/AccountList'
import AccountDetail from '@/view/system/AccountDetail'
import PersonList from '@/view/system/PersonList'
import PersonDetail from '@/view/system/PersonDetail'
import RoleList from '@/view/system/RoleList'
import RoleDetail from '@/view/system/RoleDetail'
import RoleAccountDetail from '@/view/system/RoleAccountDetail'
import RolePermissionDetail from '@/view/system/RolePermissionDetail'
import Home from '@/view/system/Home'
import DictionaryList from '@/view/system/DictionaryList'
import DictionaryDetail from '@/view/system/DictionaryDetail'
import MenuTree from '@/view/system/MenuTree'
import PermissionList from '@/view/system/PermissionList'
import PermissionTree from '@/view/system/PermissionTree'
import PermissionDetail from '@/view/system/PermissionDetail'
import OrgList from "@/view/system/OrgList";
import OrgDetail from "@/view/system/OrgDetail";
import OrgPersonDetail from "@/view/system/OrgPersonDetail";

export const systemRouter = [
    {
        path: '/systemHome', name: 'systemHome', component: Home, children: [
            {path: '/index', name: 'index', component: Index},
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
            {path: '/dictionaryDetail', name: 'dictionaryDetail', component: DictionaryDetail},
            {path: '/dictionaryList', name: 'dictionaryList', component: DictionaryList},
            {path: '/permissionList', name: 'permissionList', component: PermissionList},
            {path: '/permissionTree', name: 'permissionTree', component: PermissionTree},
            {path: '/permissionDetail', name: 'permissionDetail', component: PermissionDetail},
            {path: '/orgList', name: 'orgList', component: OrgList},
            {path: '/orgDetail', name: 'orgDetail', component: OrgDetail},
            {path: '/orgPersonDetail', name: 'orgPersonDetail', component: OrgPersonDetail}
        ]
    }
]

export default systemRouter
