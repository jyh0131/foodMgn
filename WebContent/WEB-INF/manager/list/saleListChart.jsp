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
								title : '결제수단별 결제현황',
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
								title : '결제수단별 결제현황', // 제목
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
				
			
		       
		       
		       
		       //날짜 선택 검색
		       
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
				
		    if($("input[name='r']:checked").val()=="1"){
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
							title : '결제수단별 결제현황',
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
							title : '결제수단별 결제현황', // 제목
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
				
			}) //아작스끝  
			
		    } else if($("input[name='r']:checked").val()=="2"){
		    	$.ajax({
					url:"${pageContext.request.contextPath}/mgn/saleListMemberChart.do",
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
							var dataChart = [ [ 'name', '회원명' ] ];
							for (var i = 0; i < json.list.length; i++) {
								var list = json.list[i];
									dataChart.push([list.payMember+"("+list.payMemberNo+")", list.payPrice ]);
																
							}
							
							var data = google.visualization
									.arrayToDataTable(dataChart);
							var view = new google.visualization.DataView(data);
							var options = {
								title : '회원별 결제현황',
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
							var dataChart = [ [ 'name', '결제금액' ] ];
							for (var i = 0; i < json.list.length; i++) {
								var list = json.list[i];
									dataChart.push([list.payMember+"("+list.payMemberNo+")", list.payPrice ]);
																
							}
							
							var data = google.visualization
									.arrayToDataTable(dataChart);
							// 그래프 옵션
							var options = {
								title : '회원별 결제현황', // 제목
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
					
				}) //아작스끝
		    	
		    	
		    } else if($("input[name='r']:checked").val()=="3"){
		    	
		    	
		    	
		    	
		    }
		       
		       
		})
		  
		       
		       
		     
				
			//전체보기 클릭시	
		       $("#all").click(function() {
		    	   $("input[name='date']").val("");
					$("input[name='date2']").val("");
					
					if($("input[name='r']:checked").val()=="1"){
						
			
					
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
									title : '결제수단별 결제현황',
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
									title : '결제수단별 결제현황', // 제목
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
					}) //아작스끝
					
					}else if($("input[name='r']:checked").val()=="2"){
						$.ajax({
							url : "${pageContext.request.contextPath }/mgn/saleListMemberChart.do",
							type : "get",
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
									var dataChart = [ [ 'name', '회원명' ] ];
									for (var i = 0; i < json.list.length; i++) {
										var list = json.list[i];
											dataChart.push([list.payMember+"("+list.payMemberNo+")", list.payPrice ]);
																		
									}
									
									var data = google.visualization
											.arrayToDataTable(dataChart);
									var view = new google.visualization.DataView(data);
									var options = {
										title : '회원별 결제현황',
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
									var dataChart = [ [ 'name', '결제금액' ] ];
									for (var i = 0; i < json.list.length; i++) {
										var list = json.list[i];
											dataChart.push([list.payMember+"("+list.payMemberNo+")", list.payPrice ]);
																		
									}
									
									var data = google.visualization
											.arrayToDataTable(dataChart);
									// 그래프 옵션
									var options = {
										title : '회원별 결제현황', // 제목
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
						
					}else if($("input[name='r']:checked").val()=="1"){
						
					}
				})
				
				//라디오 박스 체인지 옵션
				$("input[name='r']").change(function() {
					if($(this).val()=="1"){
						$("#search").css("display","block");
						$("input[name='date']").val("");
						$("input[name='date2']").val("");
						$("#curve_chart").empty();
						
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
										title : '결제수단별 결제현황',
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
										title : '결제수단별 결제현황', // 제목
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
						
						
						
						
					}else if($(this).val()=="2"){
						$("#search").css("display","block");
						$("input[name='date']").val("");
						$("input[name='date2']").val("");
						/* $("#piechart_3d").empty();
 						$("#chart_div").empty(); */
 						$("#curve_chart").empty();
 						
 						
 						
 						
 						$.ajax({
							url : "${pageContext.request.contextPath }/mgn/saleListMemberChart.do",
							type : "get",
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
									var dataChart = [ [ 'name', '회원명' ] ];
									for (var i = 0; i < json.list.length; i++) {
										var list = json.list[i];
											dataChart.push([list.payMember+"("+list.payMemberNo+")", list.payPrice ]);
																		
									}
									
									var data = google.visualization
											.arrayToDataTable(dataChart);
									var view = new google.visualization.DataView(data);
									var options = {
										title : '회원별 결제현황',
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
									var dataChart = [ [ 'name', '결제금액' ] ];
									for (var i = 0; i < json.list.length; i++) {
										var list = json.list[i];
											dataChart.push([list.payMember+"("+list.payMemberNo+")", list.payPrice ]);
																		
									}
									
									var data = google.visualization
											.arrayToDataTable(dataChart);
									// 그래프 옵션
									var options = {
										title : '회원별 결제현황', // 제목
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
 						
 						
 						
						
					}else if($(this).val()=="3"){
						$("input[name='date']").val("");
						$("input[name='date2']").val("");
						$("#piechart_3d").empty();
 						$("#chart_div").empty();
 						
 						
 						$("#search").css("display","none");
 						
 						
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
								function drawChart() {
									var sum1 = new Array(12); //배달
									var sum2 = new Array(12); //매장
									
									for(var i=0;i<12;i++){
										sum1[i]=0;
									}
									
									for(var i=0;i<12;i++){
										sum2[i]=0;
									}
									
									
									var dataChart = [ [ '월', '배달' ,'매장'] ];
							
									for (var i = 0; i < json.list.length; i++) {
										var list = json.list[i];
										if(list.payCancel==0){
											var kind=list.payOrderKind;
											var date=list.payTime;
											var date2 = new Date(date);
											var nowYear = new Date();
											var dYear = nowYear.getFullYear();
											var dMonth = date2.getMonth()+1;
											
											if(dMonth < 10) dMonth = "0" + dMonth;
											
											var date3 = dYear+"-"+dMonth;
											
										
											
											if(list.payOrderKind==0){//배달
												if(date3==dYear+"-01"){
													sum1[0] += 1;
												}else if(date3==dYear+"-02"){
													sum1[1] += 1;
												
												}else if(date3==dYear+"-03"){
													sum1[2] += 1;
												
												}else if(date3==dYear+"-04"){
													sum1[3] += 1;
												
												}else if(date3==dYear+"-05"){
													sum1[4] += 1;
												
												}else if(date3==dYear+"-06"){
													
													sum1[5] +=1;
												}else if(date3==dYear+"-07"){
													sum1[6] +=1;
												
												}else if(date3==dYear+"-08"){
													sum1[7] += 1;
												
												}else if(date3==dYear+"-09"){
													sum1[8] +=1;
											
												}else if(date3==dYear+"-10"){
													sum1[9] += 1;
												
												}else if(date3==dYear+"-11"){
													sum1[10] +=1;
												
												}else if(date3==dYear+"-12"){
													sum1[11] +=1;
												}
											}else if(list.payOrderKind==1){//매장
												if(date3==dYear+"-01"){
													sum2[0] += 1;
												}else if(date3==dYear+"-02"){
													sum2[1] += 1;
												
												}else if(date3==dYear+"-03"){
													sum2[2] +=1;
												
												}else if(date3==dYear+"-04"){
													sum2[3] += 1;
												
												}else if(date3==dYear+"-05"){
													sum2[4] += 1;
												
												}else if(date3==dYear+"-06"){
													
													sum2[5] += 1;
												}else if(date3==dYear+"-07"){
													sum2[6] +=1;
												
												}else if(date3==dYear+"-08"){
													sum2[7] += 1;
												
												}else if(date3==dYear+"-09"){
													sum2[8] += 1;
											
												}else if(date3==dYear+"-10"){
													sum2[9] += 1;
												
												}else if(date3==dYear+"-11"){
													sum2[10] += 1;
												
												}else if(date3==dYear+"-12"){
													sum2[11] +=1;
												}
											}
											
											
											
										}
																		
									}
									
									
									dataChart.push([ '1월', sum1[0],sum2[0] ]);
									dataChart.push([ '2월',   sum1[1],sum2[1] ]);
									dataChart.push([ '3월',   sum1[2],sum2[2] ]);
									dataChart.push([ '4월',  sum1[3],sum2[3] ]);
									dataChart.push([ '5월',   sum1[4],sum2[4] ]);
									dataChart.push([ '6월',   sum1[5],sum2[5] ]);
									dataChart.push([ '7월',   sum1[6],sum2[6]]);
									dataChart.push([ '8월',   sum1[7],sum2[7]]);
									dataChart.push([ '9월',   sum1[8],sum2[8]]);
									dataChart.push([ '10월',   sum1[9],sum2[9]]);
									dataChart.push([ '11월',   sum1[10],sum2[10]]);
									dataChart.push([ '12월',   sum1[11],sum2[11]]);
									
									var data = google.visualization
											.arrayToDataTable(dataChart);
									var view = new google.visualization.DataView(data);
									
									var nowYear = new Date();
									var dYear = nowYear.getFullYear();
									
									   var options = {
										          title: dYear+'년 결제형태별 결제현황',
										          curveType: 'function',
										          legend: { position: 'bottom' }
										        };

									var chart = new google.visualization.LineChart(
											document.getElementById('curve_chart'));
									chart.draw(view, options);
								}

			

							}
						})
						
 						
 						
 						
 						
 						
 						
					}
				})
				
				
				

	})
</script>
<div id="wrap">
	<div id="wrap2"></div>
	<div id="rad">
		<input type="radio" name="r" value="1" checked="checked"> 결제수단별 결제현황    &nbsp;&nbsp;&nbsp;
		<input type="radio" name="r" value="2"> 회원별 결제 현황 &nbsp;&nbsp;&nbsp;
		<input type="radio" name="r" value="3"> 결제형태별 결제 현황 
		<br>
	 </div>
	 <br>
	<div id="search">
		<p id="selDate">
		<input type="text" name="date" class="selectList" autocomplete="off"> ~ <input type="text" name="date2" class="selectList" autocomplete="off"> <button id="btnDate">날짜로검색</button>
			<button id="all">전체보기</button>
		</p> 
	</div>
	<div id="charWrap">
		<div id="piechart_3d" style="width: 600px; height: 500px;"></div>
		<div id="chart_div" style="width: 400px; height: 500px;"></div>
		<div id="curve_chart" style="width: 900px; height: 500px"></div>
	</div>
</div>
<%@ include file="../../view/include/footer.jsp"%>