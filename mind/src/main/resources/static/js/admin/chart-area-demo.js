//날짜표기
var timestamp = Date.now();
var today = new Date(timestamp);

//현재 시점 기준 일주일 기간 표시
var day0 =new Date(timestamp);
var day1=new Date(timestamp-86400000);
var day2=new Date(timestamp-172800000);
var day3=new Date(timestamp-259200000);
var day4=new Date(timestamp-345600000);
var day5=new Date(timestamp-432000000);
var day6=new Date(timestamp-518400000);
var value6=0;var value5=0;var value4=0;var value3=0;var value2=0;var value1=0;var value0=0;

//기본값이 0, 일별 회원가입자 수
//async:false 해야 전역변수에 값 저장 가능
$.ajax({url:"plusCustomer/"+6000000,async:false,success:function(result){value6=result}});
$.ajax({url:"plusCustomer/"+5000000,async:false,success:function(result){value5=result}});
$.ajax({url:"plusCustomer/"+4000000,async:false,success:function(result){value4=result}});
$.ajax({url:"plusCustomer/"+3000000,async:false,success:function(result){value3=result}});
$.ajax({url:"plusCustomer/"+2000000,async:false,success:function(result){value2=result}});
$.ajax({url:"plusCustomer/"+1000000,async:false,success:function(result){value1=result}});
$.ajax({url:"plusCustomer/"+0,async:false,success:function(result){value0=result}});
	
// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

function number_format(number, decimals, dec_point, thousands_sep) {
  // *     example: number_format(1234.56, 2, ',', ' ');
  // *     return: '1 234,56'
  number = (number + '').replace(',', '').replace(' ', '');
  var n = !isFinite(+number) ? 0 : +number,
    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
    s = '',
    toFixedFix = function(n, prec) {
      var k = Math.pow(10, prec);
      return '' + Math.round(n * k) / k;
    };
  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
  if (s[0].length > 3) {
    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
  }
  if ((s[1] || '').length < prec) {
    s[1] = s[1] || '';
    s[1] += new Array(prec - s[1].length + 1).join('0');
  }
  return s.join(dec);
}

// Area Chart Example
var ctx = document.getElementById("myAreaChart");
var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: [day6.getMonth()+1+"."+day6.getDate(),
     day5.getMonth()+1+"."+day5.getDate(),
      day4.getMonth()+1+"."+day4.getDate(),
       day3.getMonth()+1+"."+day3.getDate(),
        day2.getMonth()+1+"."+day2.getDate(),
         day1.getMonth()+1+"."+day1.getDate(),
          day0.getMonth()+1+"."+day0.getDate()],
    datasets: [{
      label: "일일 회원 가입자수",
      lineTension: 0,
      backgroundColor: "rgba(78, 115, 223, 0.05)",
      borderColor: "rgba(78, 115, 223, 1)",
      pointRadius: 3,
      pointBackgroundColor: "rgba(78, 115, 223, 1)",
      pointBorderColor: "rgba(78, 115, 223, 1)",
      pointHoverRadius: 3,
      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
      pointHoverBorderColor: "rgba(78, 115, 223, 1)",
      pointHitRadius: 10,
      pointBorderWidth: 2,
      data: [value6, value5, value4, value3, value2, value1, value0],
    }],
  },
  options: {
    maintainAspectRatio: false,
        title: {
        display: true,
        text: '일일 가입자 수',
        fontSize:24,
    },
    layout: {
      padding: {
        left: 10,
        right: 25,
        top: 10,
        bottom: 0
      }
    },
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false,
          drawBorder: false
        },
        ticks: {
          maxTicksLimit: 7
        }
      }],
      yAxes: [{
	
        ticks: {
          maxTicksLimit: 5,
          padding: 10,
          // Include a dollar sign in the ticks
          callback: function(value, index, values) {
            return value+"명";
          }
        },
        gridLines: {
          color: "rgb(234, 236, 244)",
          zeroLineColor: "rgb(234, 236, 244)",
          drawBorder: false,
          borderDash: [2],
          zeroLineBorderDash: [2]
        }
      }],
    },
    legend: {
      display: false,
    },
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      titleMarginBottom: 10,
      titleFontColor: '#6e707e',
      titleFontSize: 14,
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      intersect: false,
      mode: 'index',
      caretPadding: 10,
      callbacks: {
        label: function(tooltipItem, chart) {
          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
          return number_format(tooltipItem.yLabel)+' 명';
        }
      }
    }
  }
});

