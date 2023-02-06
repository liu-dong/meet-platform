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
        <el-tag effect="dark" type="danger">年度总支出：{{ statisticsValue.amountSum }}</el-tag>
        <el-tag effect="dark" type="warning">最大一笔支出：{{ statisticsValue.amountMax }}</el-tag>
        <el-tag effect="dark" type="success">每日平均支出：{{ statisticsValue.amountAvg }}</el-tag>
      </div>
    </div>
    <div id="main" style="width: 80%; height: 95%;margin-bottom: -20px"></div>
  </div>
</template>

<script>

import {statisticsBilling, statisticsBillingBySpendingType} from "@/api/billingDetails";
import dataCatalogUtils from "@/util/dataCatalogUtils";
import DataCatalog from "@/constant/dataCatalog";

export default {
  name: "SpendingTypeStatisticsByYear",
  data() {
    return {
      year: '2022',
      spendingTypeOption: [],
      statisticsValue: {
        amountSum: 0,
        amountMax: 0,
        amountAvg: 0,
      }
    }
  },
  async mounted() {
    this.spendingTypeOption = await dataCatalogUtils.getData(DataCatalog.spendingType);
    this.findYearStatisticsData()
  },
  methods: {
    getStatisticsValue() {
      let params = {
        date: this.year
      }
      statisticsBilling(params).then(res => {
        if (res['code'] === 200) {
          console.log(res.data)
          this.statisticsValue = res.data
        }
      })
    },
    findYearStatisticsData() {
      let params = {
        date: this.year
      }
      statisticsBillingBySpendingType(params).then(res => {
        if (res['code'] === 200) {
          this.getStatisticsValue()
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
        let spending = dataCatalogUtils.getName(item.spendingType, this.spendingTypeOption)
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
