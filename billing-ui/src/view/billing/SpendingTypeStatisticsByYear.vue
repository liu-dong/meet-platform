<template>
  <div class="container">
    <div class="block top">
      <el-date-picker
        v-model="year"
        placeholder="选择年"
        type="year"
        value-format="yyyy"
        @change="findYearStatisticsData"
      >
      </el-date-picker>
      <div class="top-right">
        <el-tag effect="dark" type="danger">最大一类支出</el-tag>
        <el-tag effect="dark" type="warning">最大一笔支出</el-tag>
        <el-tag effect="dark" type="success">每月平均支出</el-tag>
      </div>
    </div>
    <div id="main" style="width: 80%; height: 95%;margin-bottom: -20px"></div>
  </div>
</template>

<script>

import {statisticsBillingBySpendingType} from "@/api/billingDetails";
import dataCatalog from "@/utils/dataCatalog";

export default {
  name: "SpendingTypeStatisticsByYear",
  data() {
    return {
      year: '2022',
      spendingTypeOption: [],
    }
  },
  async mounted() {
    this.spendingTypeOption = await dataCatalog.getData('spending_type');
    this.findYearStatisticsData();
  },
  methods: {
    findYearStatisticsData() {
      let params = {
        date: this.year
      }
      statisticsBillingBySpendingType(params).then(res => {
        if (res['code'] === 200) {
          console.log(res.data)
          let data = this.convertData(res.data)
          this.drawCharts(data)
        }
      })
    },
    drawCharts(data) {
      // 基于准备好的dom，初始化echarts实例
      let myChart = this.$echarts.init(document.getElementById('main'));
      // 绘制图表
      myChart.setOption({
        title: {
          text: '月度支出统计图',
          left: 'center'
        },
        tooltip: {},
        series: [
          {
            type: 'pie',
            stillShowZeroSum: false,//如果数据和为 0，不显示饼图
            data: data,
            // radius: '50%'//半径
          }
        ]
      });
    },
    convertData(data) {
      return data.map(item => {
        let spending = dataCatalog.getName(item.spendingType, this.spendingTypeOption)
        if (spending !== '暂无内容') {
          return {
            value: item.sum,
            name: spending
          }
        }
      })
    }
  }
}
</script>

<style scoped>
.container {
  width: 100%;
  height: 100%;
  display: flex;
  flex-flow: column;
  justify-content: center;
  align-items: center;
}

.top {
  width: 100%;
  margin-bottom: 20px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.top-right {
  width: 30%;
  display: flex;
  justify-content: space-around;
  align-items: center;
}
</style>
