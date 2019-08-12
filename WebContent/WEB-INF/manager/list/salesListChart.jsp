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
	<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.js">
	
</script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">

<script
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js">
	
</script>
<script type="text/javascript">
	$(function() {
		$.ajax({
					url : "${pageContext.request.contextPath }/mgn/salesListChart.do",
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
							var dataChart = [ [ 'name', '판매수' ] ];

							for (var i = 0; i < json.list.length; i++) {
								var list = json.list[i];
								dataChart.push([ list.ssName, list.ssCount ]);
							}
							var data = google.visualization
									.arrayToDataTable(dataChart);
							var view = new google.visualization.DataView(data);
							var options = {
								title : '판매 현황',
								is3D : true,
							};

							var chart = new google.visualization.PieChart(
									document.getElementById('piechart_3d'));
							chart.draw(view, options);
						}

						function drawChar2t() {

							// 차트 데이터 설정
							var dataChart = [ [ 'name', '판매수'] ];

							for (var i = 0; i < json.list.length; i++) {
								var list = json.list[i];
								dataChart.push([ list.ssName, list.ssCount ]);
							}
							var data = google.visualization
									.arrayToDataTable(dataChart);
							// 그래프 옵션
							var options = {
								title : '판매현황', // 제목
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
				
				
				
				
				
				//일별 검색
				$("#datepicker").datepicker({
					dateFormat : 'yy-mm-dd',
					  onSelect: function(dateText, inst) {
				          var date = $(this).val();
				          $.ajax({
								url : "${pageContext.request.contextPath }/mgn/salesList.do",
								type : "get",
								data : {"date":date},
								dataType : "json",
								success : function(json) {
									console.log(json);

									google.charts.load("current", {
										packages : [ "corechart" ]
									});
									google.charts.setOnLoadCallback(drawChart);
									google.charts.setOnLoadCallback(drawChar2t);
									function drawChart() {
										var dataChart = [ [ 'name', '판매수' ] ];

										for (var i = 0; i < json.list.length; i++) {
											var list = json.list[i];
											dataChart.push([ list.ssName, list.ssCount ]);
										}
										var data = google.visualization
												.arrayToDataTable(dataChart);
										var view = new google.visualization.DataView(data);
										var options = {
											title : '판매 현황',
											is3D : true,
										};

										var chart = new google.visualization.PieChart(
												document.getElementById('piechart_3d'));
										chart.draw(view, options);
									}

									function drawChar2t() {

										// 차트 데이터 설정
										var dataChart = [ [ 'name', '판매수'] ];

										for (var i = 0; i < json.list.length; i++) {
											var list = json.list[i];
											dataChart.push([ list.ssName, list.ssCount ]);
										}
										var data = google.visualization
												.arrayToDataTable(dataChart);
										// 그래프 옵션
										var options = {
											title : '판매현황', // 제목
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
					  }
				});
				

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
     		if(y==100){
     			alert("년도를 선택해주세요.")
     		}else if(y!=100 && m==100){ //년도별 검색,월x
     			 $.ajax({
						url : "${pageContext.request.contextPath }/mgn/salesList.do",
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
								var dataChart = [ [ 'name', '판매수' ] ];

								for (var i = 0; i < json.list.length; i++) {
									var list = json.list[i];
									dataChart.push([ list.ssName, list.ssCount ]);
								}
								var data = google.visualization
										.arrayToDataTable(dataChart);
								var view = new google.visualization.DataView(data);
								var options = {
									title : '판매 현황',
									is3D : true,
								};

								var chart = new google.visualization.PieChart(
										document.getElementById('piechart_3d'));
								chart.draw(view, options);
							}

							function drawChar2t() {

								// 차트 데이터 설정
								var dataChart = [ [ 'name', '판매수'] ];

								for (var i = 0; i < json.list.length; i++) {
									var list = json.list[i];
									dataChart.push([ list.ssName, list.ssCount ]);
								}
								var data = google.visualization
										.arrayToDataTable(dataChart);
								// 그래프 옵션
								var options = {
									title : '판매현황', // 제목
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
     		}else if(y!=100 && m!=100){ //년도,월 같이
     			var ym = y+"-"+m;
     			 $.ajax({
						url : "${pageContext.request.contextPath }/mgn/salesList.do",
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
								var dataChart = [ [ 'name', '판매수' ] ];

								for (var i = 0; i < json.list.length; i++) {
									var list = json.list[i];
									dataChart.push([ list.ssName, list.ssCount ]);
								}
								var data = google.visualization
										.arrayToDataTable(dataChart);
								var view = new google.visualization.DataView(data);
								var options = {
									title : '판매 현황',
									is3D : true,
								};

								var chart = new google.visualization.PieChart(
										document.getElementById('piechart_3d'));
								chart.draw(view, options);
							}

							function drawChar2t() {

								// 차트 데이터 설정
								var dataChart = [ [ 'name', '판매수'] ];

								for (var i = 0; i < json.list.length; i++) {
									var list = json.list[i];
									dataChart.push([ list.ssName, list.ssCount ]);
								}
								var data = google.visualization
										.arrayToDataTable(dataChart);
								// 그래프 옵션
								var options = {
									title : '판매현황', // 제목
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
     		}
     })
     
     
     $(document).on("click","#all",function(){
			$("#datepicker").val("");
			$("#fd_year  > option[value='100'").attr("selected", "true");    
		    $("#fd_month  > option[value='100'").attr("selected", "true"); 
			
		    $.ajax({
				url : "${pageContext.request.contextPath }/mgn/salesListChart.do",
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
						var dataChart = [ [ 'name', '판매수' ] ];

						for (var i = 0; i < json.list.length; i++) {
							var list = json.list[i];
							dataChart.push([ list.ssName, list.ssCount ]);
						}
						var data = google.visualization
								.arrayToDataTable(dataChart);
						var view = new google.visualization.DataView(data);
						var options = {
							title : '판매 현황',
							is3D : true,
						};

						var chart = new google.visualization.PieChart(
								document.getElementById('piechart_3d'));
						chart.draw(view, options);
					}

					function drawChar2t() {

						// 차트 데이터 설정
						var dataChart = [ [ 'name', '판매수'] ];

						for (var i = 0; i < json.list.length; i++) {
							var list = json.list[i];
							dataChart.push([ list.ssName, list.ssCount ]);
						}
						var data = google.visualization
								.arrayToDataTable(dataChart);
						// 그래프 옵션
						var options = {
							title : '판매현황', // 제목
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
				

	})
</script>
<div id="wrap">
	<div id="wrap2"></div>
	<div id="search">
		<p id="selDate">
			<label>날짜 선택: </label><input type="text" id="datepicker">
			<select id="fd_year" name="fd_year" style="width:130px;"></select>    
          	 <select id="fd_month" name="fd_month" style="width:130px;"></select> 
          	 <button id="search2">조회</button>   
			<button id="all">전체보기</button>
		</p>
	</div>
	<div id="charWrap">
		<div id="piechart_3d" style="width: 600px; height: 500px;"></div>
		<div id="chart_div" style="width: 400px; height: 500px;"></div>
	</div>
</div>
<%@ include file="../../view/include/footer.jsp"%>