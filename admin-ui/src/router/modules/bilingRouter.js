import BillingDetails from "@/view/billing/BillingDetails";
import BillingDetailsList from "@/view/billing/BillingDetailsList";
import BillingHome from "@/view/billing/BillingHome";

const billingRouter = [
    {path: '/billingHome', name: 'billingHome', component: BillingHome},
    {path: '/billingDetails', name: 'billingDetails', component: BillingDetails},
    {path: '/billingDetailsList', name: 'billingDetailsList', component: BillingDetailsList}
]

export default billingRouter

