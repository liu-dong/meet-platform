import GeneratorView from '@/view/easycode/GeneratorView'
import GeneratorResultView from '@/view/easycode/GeneratorResultView'
import TemplateView from '@/view/easycode/TemplateView'

const easyCodeRouter = [
    {path: '/generatorView', name: 'generatorView', component: GeneratorView},
    {path: '/generatorResultView', name: 'generatorResultView', component: GeneratorResultView},
    {path: '/templateView', name: 'templateView', component: TemplateView}
]

export default easyCodeRouter
