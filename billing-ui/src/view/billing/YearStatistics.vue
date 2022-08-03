<template>
  <div style="width: 100%; height: 100%;display: flex;flex-flow: column;justify-content: center;align-items: center;">
    <div class="block" style="align-self: start">
      <el-date-picker
        v-model="year"
        value-format="yyyy"
        type="year"
        placeholder="选择年"
        @change="findYearStatisticsData"
      >
      </el-date-picker>
    </div>
    <div id="main" style="width: 80%; height: 95%;"></div>
  </div>
</template>

<script>

import {statisticsBillingBySpendingType} from "@/api/billingDetails";
import dataCatalog from "@/utils/dataCatalog";

export default {
  name: "YearStatistics",
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
        if (spending !== '暂无内容'){
          return  {
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

</style>
