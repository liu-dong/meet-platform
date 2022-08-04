<template>
  <div style="width: 100%; height: 100%;display: flex;flex-flow: column;justify-content: center;align-items: center;">
    <div class="block" style="align-self: start">
      <el-date-picker
        v-model="year"
        placeholder="选择年"
        type="year"
        value-format="yyyy"
        @change="findMonthlyBillingData"
      >
      </el-date-picker>
    </div>
    <div id="main" style="width: 80%; height: 95%;"></div>
  </div>
</template>

<script>
import dataCatalog from "@/utils/dataCatalog";
import {statisticsBillingByMonth} from "@/api/billingDetails";

export default {
  name: "MonthlyStatisticsByYear",
  data() {
    return {
      year: '2022',
      spendingTypeOption: [],
    }
  },
  async mounted() {
    this.spendingTypeOption = await dataCatalog.getData('spending_type');
    this.findMonthlyBillingData();
  },
  methods: {
    findMonthlyBillingData() {
      let params = {
        year: this.year
      }
      statisticsBillingByMonth(params).then(res => {
        if (res['code'] === 200) {
          console.log(res.data)
          let data = this.convertData(res.data)
          this.drawCharts(data[0], data[1])
        }
      })
    },
    drawCharts(xData, yData) {
      // 基于准备好的dom，初始化echarts实例
      let myChart = this.$echarts.init(document.getElementById('main'));
      // 绘制图表
      myChart.setOption({
        title: {
          text: '年度各月支出统计图',
          left: 'center'
        },
        xAxis: {
          data: xData,
          name: "月份"
        },
        yAxis: [{
          show: true,
          type: "value",
          name: '支出金额（元）',
          axisLine: {//y轴线的颜色以及宽度
            show: true,
            lineStyle: {
              // color: "#fff",
              width: 1,
              type: "solid"
            },
          },
        }],
        tooltip: {},
        series: [
          {
            type: 'bar',
            // stillShowZeroSum: false,//如果数据和为 0，不显示饼图
            data: yData,
            //显示数值
            itemStyle: {
              normal: {
                label: {
                  show: true, //开启显示
                  position: 'top', //在上方显示
                  textStyle: {
                    //数值样式
                    color: 'black',
                    fontSize: 12,
                  },
                },
              },
            },
          }
        ]
      });
    },
    convertData(data) {
      let result = []
      let xData = Object.keys(data).sort()
      let yData = []
      xData.forEach(item => {
        yData.push(data[item])
      })
      result[0] = xData
      result[1] = yData
      console.log('zhuzhuangtu:', result)
      return result;
    }
  }
}
</script>

<style scoped>

</style>
