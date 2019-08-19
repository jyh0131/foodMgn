<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>

<style>
@media screen and (min-width:768px){
	#wrap {
		width: 100%;
		z-index: -100;
		position:relative;
	}
	#wrap div.bx-wrapper{
		width:100%;
		box-shadow: none;
		margin-bottom:60px;                      
	}
	#wrap .bxslider{
		width: 100%;
	}
	
	#wrap .bxslider, .bx-wrapper {
		border: none;
	}
	#wrap .bx-wrapper .bx-pager {
    position: absolute;
    bottom: 50px;
    left:0;                          
    }
    #wrap .bx-wrapper .bx-pager.bx-default-pager a:hover,
	#wrap .bx-wrapper .bx-pager.bx-default-pager a.active,
	#wrap .bx-wrapper .bx-pager.bx-default-pager a:focus {
 	 	background: #4a83da;
	}
    #wrap .bx-wrapper .bx-controls-auto{
   	display: none;
  	  
    }           
    .main_img{
    	width:100% !important;
    }
    
 /*---------------------------------------------middle---------------------------------------------------------------*/
 
 	#middleContainer{
		width:1030px;
		margin:0 auto;
		overflow: hidden; 
	 }
	 #middleTop, #middleBottom{
	 	overflow: hidden; 
	 	margin-bottom:25px;
	 }
	  
	 .middleTop1, .middleBottom1{
	 	float: left;
	 }
	#newOpen{
		width:300px;
		height:110px;
		padding:10px;
		margin-bottom:10px;
		margin-right:10px;
		background: url(images/main/s_b5_t_bg.gif) no-repeat;
		position: relative;
	}
	#newOpen h2{
		font-size: 17px;
		color: #4c4c4c;
		margin-bottom:10px;
	}
	#newOpen a{
		display: block;
		border-right: 1px solid #fff;
		position: absolute;
		height:24px;
		z-index: 3;
	}
	#newOpen #left img, #newOpen #right img{
		height:24px;
	}
	#newOpen #left{
		right:35px;
	}	
	#newOpen #right{
		right:10px;
	}
	
	#thumb{
		overflow: hidden;
		margin-left:10px;
	}
	#thumb h3{
		font-size: 15px;
	}
	#newOpen .bx-wrapper{
		box-shadow: none;
		background: none;
	}
	
	#thumb .thumbImg{
		width :100px;
		height:70px;
		float: left;
		margin-right:10px;
	}
	#thumb .thumbImg img{
		width :100px;
		height:70px;
	}
	#thumb .thumbContent{
		float: left;
	}
	#middleTopCenter{
		width: 230px;
		height:270px;
		margin-right:10px;
		background: url(images/main/s_b7_bg.gif) no-repeat;
	}
	#middleTopCenterMo{
		display: none;
	}
	#middleTopCenter .bx-wrapper{
		box-shadow: none;
		background: none;
	}
	#middleTopCenter img{
		width: 230px;
		height:230px;
	}
	#middleTopRight{
		width: 430px;
		height:260px;
	}
	#middleTopRight video{
		width: 430px;
		height:260px;
	}
	
	
	#middleTop #openSchedule{
		width:300px;
		height:110px;
		padding:10px;
		background: url(images/main/s_b3_f_bg.gif) no-repeat;
		
	}
	#middleTop #openSchedule h2{
		color:#fff;
		font-size: 17px;
		margin-bottom:20px;
	}
	#middleTop #openSchedule p{
		color:#fff;
		font-size: 13px;
		border-bottom:1px solid orange;
	}
	
	.middleBottom1{
	 	width: 238px;
    	height: 388px;
    	margin-right: 16px;
    	border: 1px solid #ddd;
    	overflow: hidden;
    	background: #f8f8f8;
	 }
	 
	 #middleBottom dl{
	 	padding:15px 0 10px 20px;
	 	border-top:1px solid #ddd;
	 	border-bottom:1px solid #ddd;
	 	background: url(images/main/ico.png) no-repeat 190px center;
	 }
	 #middleBottom dl dt{
	  	font-size: 18px;
    	color: #828181;
    	font-weight: bold;
   		width: 160px;
   		white-space: nowrap;
   		overflow: hidden;
   	 	text-overflow: ellipsis;
	  }
	 #middleBottom dl dd{
	 	margin-top: 10px;
   		color: #8a8a8a;
   		font-size: 12px;
   	 }
   	 #middleBottom .text{
   	 	padding: 10px 20px 0 20px;
   	 	font-size: 12px;
   		width: 198px;
    	height: 30px;
    	overflow: hidden;
    	color: #8d8d8d;
   	 }
   	 #middleSlider{
   	 	position: relative;
   	 	margin-bottom:30px;
   	 }
   	 #content{
   	 	position: absolute;
   	 	top:150px;
   	 	left:650px;
   	 }
   	 .backImg{
   	 	width:100%;
   	 	height:540px;
   	 }
   	 #back{
   	 	background: url(images/main/f_visu1.jpg) center 0px no-repeat rgb(198, 216, 214);
   	 }
   	  #back2{
   	 	background: url(images/main/f_visu2.jpg) center 0px no-repeat rgb(198, 216, 214);
   	 }   
   	  #back3{
   	 	background: url(images/main/f_visu4.jpg) center 0px no-repeat rgb(198, 216, 214);
   	 }   
   	  #back4{
   	 	background: url(images/main/f_visu5.jpg) center 0px no-repeat rgb(198, 216, 214);
   	 }   
   	  #back5{
   	 	background: url(images/main/f_visu6.jpg) center 0px no-repeat rgb(198, 216, 214);
   	 }   
   	  #back6{
   	 	background: url(images/main/f_visu7.jpg) center 0px no-repeat rgb(198, 216, 214);
   	 }   
   	  
   	 
   	 
   	 
   	 
   	 #bottomContainer{
		width:1030px;
		margin:0 auto;
		overflow: hidden;
		margin-bottom:30px; 
	 }
	 
	 #news, #hire, #counsel{
	 	float: left;
	 }
	 
	  #news{
	  	width:315px;
	  	margin-right:15px;
	  }
	 #bottomContainer .h2{
	 	color: #4c4c4c;
    	font-size: 17px !important;
    	padding: 20px 0 20px 0;
	 }
	 #bottomContainer p{
	 	padding : 10px 0;
	 	font-size: 12px;
	 	color:#bbb;
	 }
	 #notice{
	 	border-top:1px solid #ccc;
	 	border-bottom: 1px solid #c7a593;
	 	height:140px;
	 }
	#notice p a{
		color:#bbbbbb;
	}
	 #red{
	 	color:red;
	 }
	 #hire{
	 	width:315px;
	 	margin-right:15px;
	 	overflow: hidden;
	 }
	 #both{
	 	clear:both;
	 }
	 #orange{
	 	color:orange;
	 }
	 #hire #double{
	 	border-top:1px solid #ccc;
	 	border-bottom: 1px solid #c7a593;
	 }
	 
	 #hire #facebook{
	 	margin-top:10px;
	 	margin-left: 30px;
	 }
	 .instar{
	 	float: left;
	 	margin-left:60px;
	 }
	 
	 #counsel{
	 	width:320px;
	 	font-size: 12px;
	 }
	 label{
	 	width:50px;
	 	float: left;
	 	display: block;
	 	line-height: 30px;
	 	height:30px;
	 	
	 }
	 #name{
	 	width:267px;
	 	height:27px;
	 }
	 .tel{
	 	width:76px;
	 	height:27px;
	 }
	fieldset{
		width:320px;
		height:350px;
		padding:15px;
		position: relative;
	}
	#view{
		width:65px;
		height:22px;
		line-height:22px;
		background: #473524;
		padding:2px 5px !important;
		text-align: center;
		position: absolute;
		bottom:65px;
		right:20px;
	}
	#view a{
		color:white;
		font-weight: bold;
	}
	#request{
		width:320px;
		height:34px;
		text-align: center;
		color:white;
		font-weight: bold;
		font-size: 17px !important; 
		margin-top:20px;
		background: #4c4946;
	}
	fieldset h2{
		font-size:20px !important;
		padding:0 !important;
		margin-bottom:15px;
	}
	textarea{
		width:310px;
		height:117px;
		padding:5px;
	}
	
}




@media all and (max-width:767px){
	#wrap {
		width: 95%;
		z-index: -100;
		position:relative;
		height:250px;
		padding: 0 10px 10px 10px;
	}
	#wrap img{
		height:250px;
	}
	#wrap div.bx-wrapper {
		width:100%;
		height:250px;
		box-shadow: none;                                           
	}
	#wrap .bxslider{
		width: 100%;
	}
	
	#wrap .bxslider, .bx-wrapper {
		border: none;
	}
	#wrap .bx-wrapper .bx-pager {
    position: absolute;
    bottom: 10px;
    left:0;                          
    }
    #wrap .bx-wrapper .bx-pager.bx-default-pager a:hover,
	#wrap .bx-wrapper .bx-pager.bx-default-pager a.active,
	#wrap .bx-wrapper .bx-pager.bx-default-pager a:focus {
 	 	background: #4a83da;
	}
    #wrap .bx-wrapper .bx-controls-auto{
   	display: none;
  	  
    }           
    .main_img{
    	width:100% !important;
    }
    
 /*---------------------------------------------middle---------------------------------------------------------------*/
 
 	#middleContainer{
		width:95%;
		margin:0 auto;
		overflow: hidden; 
	 }
	 #middleTop{
	 	overflow: hidden; 
	 	height:320px;
	 }
	 #middleTopLeft{
	 	display: none;
	 }
	
	#middleTopCenter{
		display: none;
	}
	#middleTopCenterMo{
		display:inline;
		width: 100%;		
		padding:0 10px;
		position: relative;
	}
	
	#middleTopCenterMo .bx-wrapper{
		box-shadow: none;
		background: none;
	}
	#middleTopCenterMo .bx-wrapper .bx-pager {
    position: absolute;
    bottom: 35px;
    left:0;                          
    }
	
	
	
	#middleTopRight{
		display: none;
	}
	
	
	
	#middleTop #openSchedule{
		display: none;
		
	}
	
	
   	 #middleSlider{
   	 	position: relative;
   	 	margin-top: 30px;
   	 }
   	 #middleSlider div.bx-wrapper{
   	 	margin-bottom:30px;
   	 }
   	 #content{
   	 	display: none;
   	 }
   	 .backImg{
   	 	width:100%;
   	 	height:340px;
   	 }
   	 #back{
   	 	background: url(images/main/f_visu1.jpg) center 0px no-repeat rgb(198, 216, 214);
   	 }
   	  #back2{
   	 	background: url(images/main/f_visu2.jpg) center 0px no-repeat rgb(198, 216, 214);
   	 }   
   	  #back3{
   	 	background: url(images/main/f_visu4.jpg) center 0px no-repeat rgb(198, 216, 214);
   	 }   
   	  #back4{
   	 	background: url(images/main/f_visu5.jpg) center 0px no-repeat rgb(198, 216, 214);
   	 }   
   	  #back5{
   	 	background: url(images/main/f_visu6.jpg) center 0px no-repeat rgb(198, 216, 214);
   	 }   
   	  #back6{
   	 	background: url(images/main/f_visu7.jpg) center 0px no-repeat rgb(198, 216, 214);
   	 }   
   	  
   	 
   	 
   	 
   	 
   	 #bottomContainer{
		display: none;
	 }
	 
	#middleBottom{
		display: none;
	}

}
</style>

<script>
	$(function(){
		  $('.bxslider').bxSlider({
							auto: true,
						    mode: 'fade',
						    pause: 3000,
						    pager: true,               
						    controls: false
						    /* page: true */
		  });
		 $('#salad').bxSlider({
				auto: true,
			    pause: 2000,
			    pager: true,               
			    controls: false
			   
		}); 
		 
		 $('#saladMo').bxSlider({
				auto: true,
			    pause: 2000,
			    pager: true,               
			    controls: false
			   
		}); 
		
		  $('#slider').bxSlider({
				auto: true,
			    pause: 2000,              
			    stopAutoOnClick: true,
			    pager:false
			    /* page: true */
			});
		  $('#thumb').bxSlider({
				auto: true,
			    pause: 3000,
			    stopAutoOnClick: false,
			    controls:false,
			    pager:false
			    /* page: true */
			});
	});
</script>

	<div id="wrap">
		<div class="bxslider">
			<div class="main_img">
				<img src="${pageContext.request.contextPath}/images/main/m_banner0.jpg">
			</div>
			<div class="main_img">
				<img src="${pageContext.request.contextPath}/images/main/m_banner1.jpg">
			</div>
			<div class="main_img">
				<img src="${pageContext.request.contextPath}/images/main/m_banner2.jpg">
			</div>
		</div>
	</div>
	
	<div id="middleContainer">
		<div id="middleTop">
			<div id="middleTopLeft" class="middleTop1">
				<div id="newOpen">
					<h2>신규오픈매장</h2>
						<a href="#" id="left"><img src="images/main/s_b3_left.png"></a>
						<a href="#" id="right"><img src="images/main/s_b3_right.png"></a>
					<div id="thumb">
						<div>
							<div class="thumbImg">
								<img src="images/main/thumb_237946995_5fwHLpM8_DSC05679.jpg">
							</div>
							<div class="thumbContent">
								<h3>문경시청점</h3>
							</div>
						</div>
						<div>
							<div class="thumbImg">
								<img src="images/main/thumb_237946995_h5PEb7jC_01.jpg">
							</div>
							<div class="thumbContent">
								<h3>목동점</h3>
							</div>
						</div>
						<div>
							<div class="thumbImg">
								<img src="images/main/thumb_237946995_qWdtFLVY_04.jpg">
							</div>
							<div class="thumbContent">
								<h3>군포산본점</h3>
							</div>
						</div>
					</div>
				</div>
				
				<div id="openSchedule">
					<h2>오픈예정점</h2>
					<p>등록된 글이 없습니다.</p>
				</div>
			</div>
			
			<div id="middleTopCenter" class="middleTop1">
				<div id="salad">
					<c:forEach var="saleList" items="${saleList }">
						<div>
							<img src="${pageContext.request.contextPath}/images/food/${saleList.ssName }.png">
						</div>	
					</c:forEach>
				</div>
			</div>
			
			<div id="middleTopCenterMo" class="middleTop1">
				<div id="saladMo">
					<div>
						<img src="${pageContext.request.contextPath}/images/main/mo_visual1.jpg">
					</div>	
					<div>
						<img src="${pageContext.request.contextPath}/images/main/mo_visual2.jpg">
					</div>
					<div>
						<img src="${pageContext.request.contextPath}/images/main/mo_visual3.jpg">
					</div>
					<div>
						<img src="${pageContext.request.contextPath}/images/main/mo_visual4.jpg">
					</div>
					<div>
						<img src="${pageContext.request.contextPath}/images/main/mo_visual5.jpg">
					</div>
					<div>
						<img src="${pageContext.request.contextPath}/images/main/mo_visual6.jpg">
					</div>
					<div>
						<img src="${pageContext.request.contextPath}/images/main/mo_visual7.jpg">
					</div>
				</div>
			</div>
			
			<div id="middleTopRight" class="middleTop1">
				<video src="${pageContext.request.contextPath}/video/videoplayback.mp4" controls="controls" autoplay="autoplay"></video>
			</div>		
		</div>
		
		<div id="middleBottom">
		
			<c:forEach var="list" items="${eventList }">
			<div class="middleBottom1">
				<p>
					<a href="eventDetail.do?no=${list.eNo }"><img src="${pageContext.request.contextPath}/se2/upload/${list.eImg}"></a>
				</p>
				<dl>
					<dt>${list.eTitle }</dt>
					<dd><fmt:formatDate value="${list.eStartDate}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${list.eEndDate}" pattern="yyyy-MM-dd"/></dd>
				</dl>
				<p class="text">${list.eTitle }</p>
			</div>
			</c:forEach>
			
		</div>
	</div>
	
	<div id="middleSlider">
		<div id="slider">
			<div id="back" class="backImg">
		
			</div>
			<div id="back2" class="backImg">
		
			</div>
			<div id="back3" class="backImg">
		
			</div>
			<div id="back4" class="backImg">
		
			</div>
			<div id="back5" class="backImg">
		
			</div>
			<div id="back6" class="backImg">
		
			</div>
		</div>
		<div id="content">
			<p>
				<img src="images/main/f_visu_text.png">
			<p>
		</div>
		
	</div>
	
	<div id="bottomContainer">
		<div id="news">
			<h2 class="h2">NEWS & NOTICE</h2>
			<div id="notice">
				<c:forEach var="list" items="${notice }">
					<p><a href="noticeDetail.do?no=${list.noNo }&page=1">${list.noTitle }</a></p>
				</c:forEach>
			</div>
			<h2 class="h2">라라코스트 <span id="red">고객센터</span></h2>
			<img src="images/main/f_call_.gif">		
		</div>
		<div id="hire">
			<h2 class="h2">라라코스트 채용공고</h2>
			<p id="double">
				등록된 글이 없습니다.
			</p>
			<h2 class="h2" id="facebook">라라코스트 <span id="orange">SNS</span></h2>
			<p class="instar"><img src="images/main/f_sns1_.gif"></p>
			<p class="instar"><img src="images/main/f_sns4_.gif"></p>
			<p id="both">라라코스트의 즐거운 이벤트와 새로운 소식을 라라코스트 SNS에서 가장 빨리 만나보세요!</p>
		</div>
		<div id="counsel">
			<fieldset>
				<h2 class="h2">빠른창업상담</h2>
				<label>이름</label>
				<input type="text" id="name"><br><br>
				<label>연락처</label>
				<input type="text" class="tel"> - <input type="text" class="tel"> - <input type="text" class="tel"><br><br>
				<textarea placeholder="상담내용을 입력하세요.(창업 희망지역 등)"></textarea><br><br>
				<input type="checkbox">개인정보수집동의 
				<p id="view"><a href="#">내용보기</a></p>
				<input type="button" id="request" value="상담신청하기">
			</fieldset>
		</div>
	</div>
	
<%@ include file="../include/footer.jsp" %>
