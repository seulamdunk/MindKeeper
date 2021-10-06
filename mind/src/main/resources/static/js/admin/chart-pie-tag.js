// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

var today = new Date();
//연령별 배열
var array = [0,0,0,0,0,0,0]
$.ajax({
	type:"GET",
	url:"customerList",
	async:false,
	success:function(result){
		var tblresult = result
		var year=0;
		var count = 0;
		
		//하나씩 뽑아서 생년월일 추출
		$.each(tblresult, function(i){
			if(tblresult[i].identityNum.length>1){
				var x=0
				//40년생 이상시 1900년도
				if(tblresult[i].identityNum.substr(0,2)>40){
					year=1900+(tblresult[i].identityNum.substr(0,2)*1)
					x = Math.floor((today.getFullYear()-year)/10)
				}else{
				//40년생 미만시 2000년도
					year=2000+(tblresult[i].identityNum.substr(0,2)*1)
					x = Math.floor((today.getFullYear()-year)/10)
				}
				//배열에 카운트
				switch(x){
					case 0: array[1]=array[1]+1; break;
					case 1: array[1]=array[1]+1; break;
					case 2: array[2]=array[2]+1; break;
					case 3: array[3]=array[3]+1; break;
					case 4: array[4]=array[4]+1; break;
					case 5: array[5]=array[5]+1; break;
					case 6: array[5]=array[5]+1; break;
				}
			}
		});
	
	}
	
});

// Pie Chart Example
var ctx = document.getElementById("myTagChart");
var myPieChart = new Chart(ctx, {
  type: 'pie',
  data: {
    labels: ["10대이하", "20대", "30대", "40대", "50대이상"],
    datasets: [{
      data: [array[1], array[2], array[3], array[4], array[5]],
      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc','#b1f4fc','#ff78db'],
      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf','#91c8cf','#d461b5'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 2,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 0,
  },
});
