// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';
var arr1 = []
var arr2 = []
countTag()
function getSortedArr(array) { 
	// 1. 출연 빈도 구하기 
	const counts = array.reduce((pv, cv)=>{ 
		pv[cv] = (pv[cv] || 0) + 1; 
		return pv; 
	}, {}); 
	// 2. 요소와 개수를 표현하는 배열 생성 => [ [요소: 개수], [요소: 개수], ...] 
	const result = []; 
	for (let key in counts) { 
		result.push([key, counts[key]]); 
	} 
	// 3. 출현 빈도별 정리하기 
	result.sort((first, second) => { 
		// 정렬 순서 바꾸려면 return first[1] - second[1];
		return second[1] - first[1];
	}); 
	return result; 
}

function countTag(){
	$.ajax({
		url:"countTag",
		async:false,
		success:function(result){
		var tag = result;
        var cnt =0;
        
        // 태그 하니씩 배열
        var array = [];
		
		// 배열에 값 저장				
		$.each(tag, function(i){
			//게시글당 태그 수
            var len = tag[i].split('#').length
            if(len>2){
				for(var j=1;j<len;j++){
					//태그별 배열에 저장
					array[cnt]=(tag[i].split('#')[j])
					cnt+=1
				}
			}else if(len==2){
				array[cnt]=(tag[i].split('#')[1])
				cnt+=1
			}
        });
		for(var k=0;k<5;k++){
			//key 값 배열에 담기
			arr1[k]=getSortedArr(array)[k][0];
			//value 값 배열에 담기
			arr2[k]=getSortedArr(array)[k][1];
		}
		}, //end of success
		error:function(err){
			console.log(err)
		}
	})
	
}

$('#tag1').html('<i class="fas fa-circle" style="color:#FF6B6B"></i> '+arr1[0])
$('#tag2').html('<i class="fas fa-circle" style="color:#FFD573"></i> '+arr1[1])
$('#tag3').html('<i class="fas fa-circle" style="color:#8BF759"></i> '+arr1[2])
$('#tag4').html('<i class="fas fa-circle" style="color:#D952F7"></i> '+arr1[3])
$('#tag5').html('<i class="fas fa-circle" style="color:#12CDFC"></i> '+arr1[4])
// Pie Chart Example
var ctx = document.getElementById("myTagChart");
var myPieChart = new Chart(ctx, {
  type: 'pie',
  data: {
    labels: [arr1[0], arr1[1], arr1[2], arr1[3], arr1[4]],
    datasets: [{
      data: [arr2[0],arr2[1],arr2[2],arr2[3],arr2[4]],
      backgroundColor: ['#FF6B6B', '#FFD573', '#8BF759','#D952F7','#12CDFC'],
      hoverBackgroundColor: ['#BD4B4B', '#C7A558', '#5FAD3B','#B63BB8','#0B78B8'],
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
