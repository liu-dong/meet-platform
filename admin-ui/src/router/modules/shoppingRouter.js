import ProductList from '@/view/shopping/ProductList'
import ProductDetail from '@/view/shopping/ProductDetail'
import OrderList from '@/view/shopping/OrderList'
import OrderDetail from '@/view/shopping/OrderDetail'
import ShoppingHome from '@/view/shopping/ShoppingHome'
import AccountList from '@/view/system/AccountList'
import AccountDetail from '@/view/system/AccountDetail'

const shoppingRouter = [
    {
        path: '/shoppingHome', name: 'shoppingHome', component: ShoppingHome, children: [
            {path: '/productList', name: 'productList', component: ProductList},
            {path: '/productDetail', name: 'productDetail', component: ProductDetail},
            {path: '/orderList', name: 'orderList', component: OrderList},
            {path: '/orderDetail', name: 'orderDetail', component: OrderDetail},
            {path: '/shoppingAccountList', name: 'accountList', component: AccountList},
            {path: '/accountDetail', name: 'accountDetail', component: AccountDetail}
        ]
    }

]

export default shoppingRouter
