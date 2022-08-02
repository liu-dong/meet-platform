<template>
  <div style="width: 100%; height: 100%;display: flex;flex-flow: column;justify-content: center;align-items: center;">
    <div class="block" style="align-self: start">
      <el-date-picker
        v-model="year"
        value-format="yyyy"
        type="year"
        placeholder="选择月"
        @change="findYearStatisticsData"
      >
      </el-date-picker>
    </div>
    <div id="main" style="width: 80%; height: 95%;"></div>
  </div>
</template>

<script>

export default {
  name: "YearStatistics",
  data() {
    return {
      year: '2022-08',
    }
  },
  mounted() {
    this.findYearStatisticsData();
  },
  methods: {
    findYearStatisticsData() {
      console.log(this.year)
      let data = [
        {
          value: 335 + parseInt(this.year),
          name: '直接访问'
        },
        {
          value: 234 * parseInt(this.year),
          name: '联盟广告'
        },
        {
          value: 1548,
          name: '搜索引擎'
        }
      ]
      this.drawCharts(data)
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
    }
  }
}
</script>

<style scoped>

</style>
