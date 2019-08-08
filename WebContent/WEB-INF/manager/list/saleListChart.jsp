<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../view/include/header_mgn.jsp"%>
<style>
#wrap {
	width: 1200px;
	margin: 0 auto;
	padding-bottom: 180px;
}

#wrap2 {
	padding-top: 180px;
}

#charWrap {
	width: 1200px;
	overflow: hidden;
}

#piechart_3d {
	float: left;
}

#chart_div {
	float: left;
}
</style>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
					url : "${pageContext.request.contextPath }/saleListChart.do",
					type : "post",
					dataType : "json",
					success : function(json) {
						console.log(json);

						google.charts.load("current", {
							packages : [ "corechart" ]
						});
						google.charts.setOnLoadCallback(drawChart);
						google.charts.setOnLoadCallback(drawChar2t);
						function drawChart() {
							
							var sum1 = 0;
							var sum2 = 0;
					
							for (var i = 0; i < json.list.length; i++) {
								var list = json.list[i];
								if(list.payCancel==0){
									var type=list.payType;
									if(type==1){
										sum1 += list.payPrice;
									}else{
										sum2+= list.payPrice;
									}
								}
																
							}
							var dataChart = [ [ 'name', '판매수' ] ];
							dataChart.push([ '현금', sum1 ]);
							dataChart.push([ '카드', sum2 ]);
							var data = google.visualization
									.arrayToDataTable(dataChart);
							var view = new google.visualization.DataView(data);
							var options = {
								title : '결제 현황',
								is3D : true,
							};

							var chart = new google.visualization.PieChart(
									document.getElementById('piechart_3d'));
							chart.draw(view, options);
						}

						function drawChar2t() {

							// 차트 데이터 설정
							var sum1 = 0;
							var sum2 = 0;
					
							for (var i = 0; i < json.list.length; i++) {
								var list = json.list[i];
								if(list.payCancel==0){
									var type=list.payType;
									if(type==1){
										sum1 += list.payPrice;
									}else{
										sum2+= list.payPrice;
									}
								}
																
							}
							var dataChart = [ [ 'name', '결제금액' ] ];
							dataChart.push([ '현금', sum1 ]);
							dataChart.push([ '카드', sum2 ]);
							
							var data = google.visualization
									.arrayToDataTable(dataChart);
							// 그래프 옵션
							var options = {
								title : '결제현황', // 제목
								width : 600, // 가로 px
								height : 400, // 세로 px
								bar : {
									groupWidth : '80%' // 그래프 너비 설정 %
								},
								legend : {
								/*  position : 'none' // 항목 표시 여부 (현재 설정은 안함) */
								}
							};

							var chart = new google.visualization.ColumnChart(
									document.getElementById('chart_div'));
							chart.draw(data, options);
						}

					}
				})

	})
</script>
<div id="wrap">
	<div id="wrap2"></div>
	<div id="charWrap">
		<div id="piechart_3d" style="width: 600px; height: 500px;"></div>
		<div id="chart_div" style="width: 400px; height: 500px;"></div>
	</div>
</div>
<%@ include file="../../view/include/footer.jsp"%>