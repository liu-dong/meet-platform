<template>
    <div class="container">
        <!-- 导航菜单栏 -->
        <nar-bar></nar-bar>
        <!-- 头部区域 -->
        <head-bar></head-bar>
        <!-- 主内容区域 -->
        <main-content></main-content>
    </div>
</template>

<script>
    import NarBar from "../components/navigation/NarBar";
    import HeadBar from "../components/navigation/HeadBar";
    import MainContent from "../components/navigation/MainContent";

    export default {
        components: {
            NarBar,
            HeadBar,
            MainContent
        }
    }
</script>

<style scoped lang="scss">
    .container {
        position:absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        // background: rgba(224, 234, 235, 0.1);
    }
</style>
