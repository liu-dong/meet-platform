<template>
    <div class="menu-bar-container">
        <!-- logo -->
        <div class="logo" style="background-color: #38627a;">
            <img src="@/assets/2020.jpg" alt="logo"/>
<!--            <div>{{collapse?'':appName}}</div>-->
        </div>
        <!-- 导航菜单 -->
        <el-menu class="menu-bar-width" style="background-color: #2968a30c;">
            <!-- 导航菜单树组件，动态加载菜单 -->
<!--            <menu-tree v-for="item in navTree" :key="item.id" :menu="item">-->
<!--                <span>{{item}}</span>-->
<!--            </menu-tree>-->
        </el-menu>
    </div>
</template>

<script>
    export default {
    }
</script>

<style scoped lang="scss">
    .menu-bar-container {
        position: fixed;
        top: 0;
        left: 0;
        bottom: 0;
        z-index: 1020;
        .el-menu {
            position:absolute;
            top: 60px;
            bottom: 0;
            text-align: left;
            // background-color: #2968a30c;
        }
        .logo {
            position:absolute;
            top: 0;
            height: 60px;
            line-height: 60px;
            background: #545c64;
            cursor:pointer;
            img {
                width: 40px;
                height: 40px;
                border-radius: 0;
                margin: 10px 10px 10px 10px;
                float: left;
            }
            div {
                font-size: 25px;
                color: white;
                text-align: left;
                padding-left: 20px;
            }
        }
        .menu-bar-width {
            width: 200px;
        }
        .menu-bar-collapse-width {
            width: 65px;
        }
    }
</style>
