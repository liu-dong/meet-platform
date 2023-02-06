module.exports = {
    root: true,
    parserOptions: {
        parser: 'babel-eslint',
        sourceType: 'module'
    },
    env: {
        browser: true,
        node: true,
        es6: true
    },
    extends: ['plugin:vue/recommended', 'eslint:recommended'],

    // add your custom rules here
    // it is base on https://github.com/vuejs/eslint-config-vue
    rules: {
        'vue/max-attributes-per-line': [2, {
            'singleline': 5,
            'multiline': {
                'max': 2,
                'allowFirstLine': true
            }
        }],
        'vue/singleline-html-element-content-newline': 'off',
        'vue/multiline-html-element-content-newline': 'off',
        'vue/name-property-casing': ['error', 'PascalCase'],
        'vue/no-v-html': 'off',
        'vue/no-unused-vars': 'off',
        'vue/html-closing-bracket-spacing': ['error', {
            'startTag': 'never',
            'endTag': 'never',
            'selfClosingTag': 'never'
        }],


        /*(开始)这些规则是关于风格指南的(开始)*/
        // 在数组开括号后和闭括号前强制换行(不换行)
        'array-bracket-newline': [2, 'consistent'],
        // 强制数组方括号中使用一致的空格
        'array-bracket-spacing': [2, 'never'],
        // 强制数组元素间出现换行
        'array-element-newline': [2, 'consistent'],
        // 禁止或强制在代码块中开括号前和闭括号后有空格
        'block-spacing': [2, 'never'],
        // 强制在代码块中使用一致的大括号风格(允许左右括号在一行)
        'brace-style': [2, '1tbs', {
            'allowSingleLine': true
        }],
        // 强制使用骆驼拼写法命名约定
        'camelcase': [1, {
            'properties': 'always'
        }],
        // 要求或禁止末尾逗号
        'comma-dangle': [2, 'never'],
        // 要求在逗号前不添加空格，逗号后添加一个空格
        'comma-spacing': [2, {
            'before': false,
            'after': true
        }],
        //强制使用一致的逗号风格（要求逗号放在数组元素、对象属性或变量声明之后，且在同一行）
        'comma-style': [2, 'last'],
        // 要求或禁止文件末尾保留一行空行
        'eol-last': 2,

        // 要求或禁止在函数标识符和其调用之间有空格
        'func-call-spacing': 2,

        // 强制隐式返回的箭头函数体的位置
        'implicit-arrow-linebreak': 2,
        'indent': [2, 4, {
            'SwitchCase': 1,
            'ObjectExpression': 1
        }],
        'vue/html-indent': [2, 4],
        // jsx-quotes(使用单引号)
        'jsx-quotes': [2, 'prefer-single'],
        // 强制在对象字面量的属性中键和值之间使用一致的间距
        'key-spacing': [2, {
            'beforeColon': false,
            'afterColon': true
        }],
        // 强制在关键字前后使用一致的空格
        'keyword-spacing': [2, {
            'before': true,
            'after': true
        }],
        // 要求或禁止类成员之间出现空行
        'lines-between-class-members': 2,
        // 强制可嵌套的块的最大深度为4层
        'max-depth': [2, 4],
        // 强制一行的最大长度
        'max-len': [2, 120],
        // 强制最大行数
        'max-lines': [2, {"max": 400, "skipComments": true, "skipBlankLines": true}],
        // 强制对多行注释使用特定风格
        'multiline-comment-style': [2, "bare-block"],
        //禁止 if 语句作为唯一语句出现在 else 语句块中。
        'no-lonely-if': "error",
        // 禁止空格和 tab 的混合缩进
        'no-mixed-spaces-and-tabs': 2,
        // 禁止出现多行空行
        'no-multiple-empty-lines': [2, {
            'max': 2
        }],
        // 要求或禁止块内填充
        'padded-blocks': [2, 'never'],

        // 强制使用一致的反勾号、双引号或单引号
        'quotes': [2, 'single', {
            'avoidEscape': true,
            'allowTemplateLiterals': true
        }],
        // 要求或禁止使用分号代替 ASI
        'semi': [2, 'never'],
        // 强制分号之前和之后使用一致的空格
        'semi-spacing': [2, {
            'before': false,
            'after': true
        }],
        // 强制在块之前使用一致的空格
        'space-before-blocks': [2, 'always'],
        // 强制在 function的左括号之前使用一致的空格
        'space-before-function-paren': [2, 'never'],
        // 强制在圆括号内使用一致的空格
        'space-in-parens': [2, 'never'],
        // 要求操作符周围有空格
        'space-infix-ops': 2,
        // 强制在一元操作符前后使用一致的空格
        'space-unary-ops': [2, {
            'words': true,
            'nonwords': false
        }],
        // 强制在注释中 // 或 /* 使用一致的空格
        'spaced-comment': [2, 'always', {
            'markers': ['global', 'globals', 'eslint', 'eslint-disable', '*package', '!', ',']
        }],
        /*(结束)这些规则是关于风格指南的(结束)*/


        /*(开始)ES6(ES2015)相关风格(开始)*/
        // 要求箭头函数体使用大括号
        'arrow-body-style': [1, "as-needed"],
        // 强制箭头函数的箭头前后使用一致的空格
        'arrow-spacing': 2,
        // 要求在构造函数中有 super() 的调用
        'constructor-super': 2,
        // 强制 generator 函数中 * 号周围使用一致的空格
        'generator-star-spacing': [2, {
            'before': true,
            'after': true
        }],
        // 禁止修改类声明的变量
        'no-class-assign': 2,
        // 禁止在可能与比较操作符相混淆的地方使用箭头函数
        'no-confusing-arrow': 2,
        // 禁止修改 const 声明的变量
        'no-const-assign': 2,
        // 禁止类成员中出现重复的名称
        'no-dupe-class-members': 2,
        // 禁止重复模块导入
        'no-duplicate-imports': 2,
        // 禁止在对象中使用不必要的计算属性
        'no-useless-computed-key': 2,
        // 禁用不必要的构造函数
        'no-useless-constructor': 2,
        // 要求使用 let 或 const 而不是 var
        'no-var': 2,
        // 要求使用 const 声明那些声明后不再被修改的变量
        'prefer-const': 2,
        // 要求或禁止模板字符串中的嵌入表达式周围空格的使用
        'template-curly-spacing': [2, 'never'],
        /*(结束)ES6(ES2015)相关风格(结束)*/


        /*(开始)JavaScript 代码中可能的错误或逻辑错误(开始)*/
//强制 “for” 循环中更新子句的计数器朝着正确的方向移动
        'for-direction': 2,
        //禁止使用异步函数作为 Promise executor
        'no-async-promise-executor': 2,
        // 禁止与 -0 进行比较
        'no-compare-neg-zero': 2,
        //禁止在条件中使用常量表达式
        'no-constant-condition': 2,
        'handle-callback-err': [2, '^(err|error)$'],
        'new-cap': [2, {
            'newIsCap': true,
            'capIsNew': false
        }],
        'new-parens': 2,
        'no-array-constructor': 2,
        'no-caller': 2,
        'no-console': 'off',
        'no-cond-assign': 2,
        'no-control-regex': 0,
        'no-delete-var': 2,

        // 禁止 function 定义中出现重名参数
        'no-dupe-args': 2,
        //禁止对象字面量中出现重复的 key
        'no-dupe-keys': 2,
        // 禁止出现重复的 case 标签
        'no-duplicate-case': 2,
        // 禁止出现空语句块
        'no-empty': 2,
        // 禁止在正则表达式中使用空字符集
        'no-empty-character-class': 2,

        'no-eval': 2,
        'no-ex-assign': 2,
        'no-extend-native': 2,
        // 禁止不必要的布尔转换
        'no-extra-boolean-cast': 2,
        // 禁止不必要的括号(只在函数表达式周围禁止不必要的圆括号)
        'no-extra-parens': [2, 'functions'],
        // 禁止不必要的分号
        'no-extra-semi': 2,
        // 禁止对 function 声明重新赋值
        'no-func-assign': 2,
        'no-implied-eval': 2,
        // 禁止在嵌套的块中出现变量声明或 function 声明
        'no-inner-declarations': [2, 'both'],
        //禁止 RegExp 构造函数中存在无效的正则表达式字符串
        'no-invalid-regexp': 2,
        // 禁止不规则的空白
        'no-irregular-whitespace': 2,
        'no-iterator': 2,
        'no-label-var': 2,
        'no-labels': [2, {
            'allowLoop': false,
            'allowSwitch': false
        }],


        'no-native-reassign': 2,
        'no-negated-in-lhs': 2,
        // 禁止把全局对象作为函数调用
        'no-obj-calls': 2,
        'no-octal': 2,
        'no-octal-escape': 2,
        'no-path-concat': 2,
        'no-proto': 2,
        // 禁止正则表达式字面量中出现多个空格
        'no-regex-spaces': 2,
        'no-shadow-restricted-names': 2,
        'no-spaced-func': 2,
        // 禁用稀疏数组
        'no-sparse-arrays': 2,
        // 禁止在常规字符串中出现模板字面量占位符语法
        'no-template-curly-in-string': 2,
        'no-this-before-super': 2,

        'no-trailing-spaces': 2,
        'no-undef': 2,
        'no-undef-init': 2,
        //禁止出现令人困惑的多行表达式
        'no-unexpected-multiline': 2,

        'no-unneeded-ternary': [2, {
            'defaultAssignment': false
        }],
        // 禁止在 return、throw、continue 和 break 语句之后出现不可达代码
        'no-unreachable': 2,
        // 禁止在 finally 语句块中出现控制流语句
        'no-unsafe-finally': 2,
        // 禁止对关系运算符的左操作数使用否定操作符
        'no-unsafe-negation': 2,
        //禁止由于 await 或 yield的使用而可能导致出现竞态条件的赋值
        'require-atomic-updates': 2,
        /*'no-unused-vars': [1, {
            'vars': 'all',
            'args': 'none'
        }],*/
        'no-unused-vars': 'off',
        'no-useless-call': 2,
        'no-whitespace-before-property': 2,
        'no-with': 2,
        'one-var': [2, {
            'initialized': 'never'
        }],
        'operator-linebreak': [2, 'after', {
            'overrides': {
                '?': 'before',
                ':': 'before'
            }
        }],
        // 要求使用 isNaN() 检查 NaN
        'use-isnan': 2,
        // 强制 typeof 表达式与有效的字符串进行比较
        'valid-typeof': 2,
        'wrap-iife': [2, 'any'],
        'yield-star-spacing': [2, 'both'],
        'yoda': [2, 'never'],
        'no-debugger': process.env.NODE_ENV === 'production' ? 2 : 0,
        'object-curly-spacing': [2, 'always', {
            objectsInObjects: false
        }],
        /*(结束)JavaScript 代码中可能的错误或逻辑错误(结束)*/


        /*(开始)最佳实践的规则，帮助避免一些问题(开始)*/
        //强制 getter 和 setter 在对象中成对出现
        'accessor-pairs': 2,
        //强制数组方法的回调函数中有 return 语句
        'array-callback-return': 2,
        // 强制把变量的使用限制在其定义的作用域范围内
        'block-scoped-var': 2,
        // 强制类方法使用 this
        'class-methods-use-this': 2,
        // 指定程序中允许的最大环路复杂度
        'complexity': 2,
        // 要求 return 语句要么总是指定返回的值，要么不指定
        'consistent-return': 1,
        //强制所有控制语句使用一致的括号风格
        'curly': 2,
        //要求 switch 语句中有 default 分支
        'default-case': 2,
        //强制在点号之前或之后换行(表达式中的点号操作符应该和属性在同一行。)
        'dot-location': [2, 'property'],
        //强制尽可能地使用点号
        'dot-notation': 1,
        //要求使用 === 和 !==
        'eqeqeq': ['error', 'always', {'null': 'ignore'}],
        // 不允许在 case 子句中使用词法声明
        'no-case-declarations': 2,
        // 禁止出现空函数
        'no-empty-function': 2,
        // 禁止使用空解构模式
        'no-empty-pattern': 2,
        // 禁止在没有类型检查操作符的情况下与 null 进行比较
        'no-eq-null': 2,
        // 禁止不必要的 .bind() 调用
        'no-extra-bind': 2,
        // 禁用不必要的标签
        'no-extra-label': 2,
        // 禁止 case 语句落空
        'no-fallthrough': 2,
        // 禁止数字字面量中使用前导和末尾小数点
        'no-floating-decimal': 2,
        // 禁止对原生对象或只读的全局对象进行赋值
        'no-global-assign': 2,
        // 禁止使用短符号进行类型转换
        'no-implicit-coercion': 2,
        // 禁用不必要的嵌套块
        'no-lone-blocks': 2,
        // 禁止使用多个空格
        'no-multi-spaces': 2,
        // 禁止使用多行字符串
        'no-multi-str': 2,
        // 禁止使用 new 以避免产生副作用
        'no-new': 2,
        'no-new-object': 2,
        'no-new-require': 2,
        // 禁止 Symbolnew 操作符和 new 一起使用
        'no-new-symbol': 2,
        // 禁止对 String，Number 和 Boolean 使用 new 操作符
        'no-new-wrappers': 2,
        // 禁止多次声明同一变量
        'no-redeclare': 2,
        // 禁止在 return 语句中使用赋值语句
        'no-return-assign': [2, 'except-parens'],
        // 禁止自我赋值
        'no-self-assign': 2,
        // 禁止自身比较
        'no-self-compare': 2,
        // 禁用逗号操作符
        'no-sequences': 2,
        // 禁止抛出异常字面量
        'no-throw-literal': 2,
        // 禁用一成不变的循环条件
        'no-unmodified-loop-condition': 2,
        // 禁止出现未使用过的表达式
        // 'no-unused-expressions': 2,
        // 禁用出现未使用过的标
        'no-unused-labels': 2,
        // 禁止不必要的 catch 子句
        'no-useless-catch': 2,
        // 禁止不必要的字符串字面量或模板字面量的连接
        'no-useless-concat': 2,
        // 禁用不必要的转义字符
        'no-useless-escape': 2,
        // 禁止多余的 return 语句
        'no-useless-return': 2,
        // 要求所有的 var 声明出现在它们所在的作用域顶部
        'vars-on-top': 2,

        /*(结束)最佳实践的规则，帮助避免一些问题(结束)*/
    }
}
