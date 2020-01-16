<template>
    <div class="headbar position-left" style="background-color: #38627a;" >
    </div>
</template>

<script>
    export default {
    }
</script>

<style scoped lang="scss">
    .headbar {
        position: fixed;
        top: 0;
        right: 0;
        z-index: 1030;
        height: 60px;
        line-height: 60px;
        border-color: rgba(180, 190, 190, 0.8);
        border-left-width: 1px;
        border-left-style: solid;
    }

    .hamburg {
        float: left;
    }

    .navbar {
        float: left;
    }

    .toolbar {
        float: right;
    }

    .lang-item {
        font-size: 16px;
        padding-left: 8px;
        padding-top: 8px;
        padding-bottom: 8px;
        cursor: pointer;
    }

    .lang-item:hover {
        font-size: 18px;
        background: #b0d6ce4d;
    }

    .user-info {
        font-size: 20px;
        color: #fff;
        cursor: pointer;

        img {
            width: 40px;
            height: 40px;
            border-radius: 10px;
            margin: 10px 0 10px 10px;
            float: right;
        }
    }

    .badge {
        line-height: 18px;
    }

    .position-left {
        left: 200px;
    }

    .position-collapse-left {
        left: 65px;
    }
</style>
