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
button {
	padding: 3px 5px;
	background-color: #c7a593;
	border: 1px solid #c7a593;
	color: white;
	border-radius: 3px;
	outline: none;
}
</style>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>



	<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">

<script
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js">
	
</script>
<script type="text/javascript">
	$(function() {
		$.ajax({
					url : "${pageContext.request.contextPath }/mgn/saleListChart.do",
					type : "post",
					dataType : "json",
					success : function(json) {
						console.log(json);
						if(json.list.length==0){
	 						alert("조회조건에 맞는 내역이 없습니다.");
	 						return false;
						}

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
									groupWidth : '40%' // 그래프 너비 설정 %
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
				
				
				 //년도,월별
				var now = new Date();
		       var nyear = now.getFullYear();
		       var nmon = (now.getMonth()+1) > 9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);            
		       
		       //년도 selectbox만들기               
		       $("#fd_year").append("<option value='100'>년도를 선택해주세요</option>");
		       
		       for(var sy = 2002 ; sy <= nyear ; sy++) {
		           $('#fd_year').append('<option value="'+sy+'">' + sy + '년</option>');    
		       }

		       // 월별 selectbox 만들기            
		        $("#fd_month").append("<option value='100'>월을 선택해주세요</option>");
		       for(var i=1; i <= 12; i++) {
		           var sm = i > 9 ? i : "0"+i ;            
		           $('#fd_month').append('<option value="'+sm+'">' + sm + '월</option>');    
		        }            
		       
		       $("#fd_year  > option[value='100'").attr("selected", "true");    
		       $("#fd_month  > option[value='100'").attr("selected", "true");  
		       
		       
		       $("#search2").click(function() { //조회 버튼 클릭시  
		       		var y =$("#fd_year").val();
		       		var m =$("#fd_month").val();
		       		$("#datepicker").val("");
		       		if(y==100){
		       			alert("년도를 선택해주세요.")
		       		}else if(y!=100 && m==100){ //년도별 검색,월x
		       			$.ajax({
							url : "${pageContext.request.contextPath }/mgn/saleListDate.do",
							type : "get",
							data : {"date":y},
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
											groupWidth : '40%' // 그래프 너비 설정 %
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
		       		}else if(y!=100 && m!=100){ //년도,월 같이
		       			var ym = y+"-"+m;
		       			$.ajax({
							url : "${pageContext.request.contextPath }/mgn/saleListDate.do",
							type : "get",
							data : {"date":ym},
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
											groupWidth : '40%' // 그래프 너비 설정 %
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
		       		}
		       })
		       
		       
		       
		       
		       //검색
		       
		$(".selectList").datepicker({
			dateFormat : 'yy-mm-dd',
			minDate: null
		});
		
		$("#btnDate").click(function(){
			if($("input[name='date']").val() == "" || $("input[name='date2']").val() == "") {
				alert("검색할 날짜를 입력하세요.");
	            return false;
	        }
			
			var date = new Date($("input[name='date']").val());
			var date2 = new Date($("input[name='date2']").val());
			
			if((date.getTime()-date2.getTime())>0 ){
				alert("끝나는 날짜는 시작날짜보다 작을 수 없습니다.");
				$("input[name='date']").val("");
				$("input[name='date2']").val("");
	            return false;
			}
				
		       
		       
			$.ajax({
				url:"${pageContext.request.contextPath}/mgn/saleListDate.do",
				type:"post",
				data:{"date":$("input[name='date']").val(), "date2":$("input[name='date2']").val(), "kind":"date"},
				dataType:"json",
				success: function(json){
					console.log(json);
					
					if(json.list.length==0){
 						alert("조회조건에 맞는 내역이 없습니다.");
 						$("#piechart_3d").empty();
 						$("#chart_div").empty();
 						return false;
					}

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
								groupWidth : '40%' // 그래프 너비 설정 %
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
		  
		       
		       
		     
				
				
		       $("#all").click(function() {
		    	   $("input[name='date']").val("");
					$("input[name='date2']").val("");   
					$.ajax({
						url : "${pageContext.request.contextPath }/mgn/saleListChart.do",
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
										groupWidth : '40%' // 그래프 너비 설정 %
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
				
				
				

	})
</script>
<div id="wrap">
	<div id="wrap2"></div>
	<div id="search">
		<p id="selDate">
		<input type="text" name="date" class="selectList" autocomplete="off"> ~ <input type="text" name="date2" class="selectList" autocomplete="off"> <button id="btnDate">날짜로검색</button>
			<button id="all">전체보기</button>
		</p> 
	</div>
	<div id="charWrap">
		<div id="piechart_3d" style="width: 600px; height: 500px;"></div>
		<div id="chart_div" style="width: 400px; height: 500px;"></div>
	</div>
</div>
<%@ include file="../../view/include/footer.jsp"%>