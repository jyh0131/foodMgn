<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ include file="../include/header.jsp" %>
<style>
   .s_visu1 {
      width: 100%;
      height: 350px;
   }
   .s_visu1 img{
      width: 100%;
      height: 350px;
   }
   #menu_li {
      border: 1px solid #887c75;
      width: 200px;
      height: 25px;
      line-height: 25px;
      padding: 10px 0;
      background-color: #f2efec;
      font-size: 15px;
      text-indent: 16px;
      position: relative;
      cursor: pointer;
      float: left;
   }
   #menu_li2 {
      float: right;                 
   }
   #menu_li2 li {
      list-style: none;
      float: left;
      padding: 5px; 
   }
   .li_img {
      background: url("${pageContext.request.contextPath}/images/menu/s_menu_bg.gif") no-repeat;
      position: absolute;
      top: 20px;
      right: 10px;
      width: 20px;
      height: 10px;
   }
   #menulist {
      display: none;
      width: 200px;
      position: absolute;
      top: 46px;
      left: -1px;
   }
   #menulist li {
      border: 1px solid #887c75;
      border-bottom: 1px dotted #887c75;
      border-top: none;
      width: 200px;
      height: 20px;
      line-height: 20px;
      padding: 10px 0;
      background-color: #f2efec;
   }
   #menulist li:hover {
      background-color: #887c75;
   }
   #menulist li:hover a {
      color: white;
   }
   #menulist li a {
      color: black;
      padding: 10px;
   }
   #menulist li:last-child {
      border-bottom: 1px solid #887c75;
   }
   #mypage_content {
      width: 1200px;
      margin: 0 auto;
      padding: 20px 0;
   }
   #menulist a {
      color: black;
   }
   
   
#wrap {
   min-height: 600px;
   height: 600px;
   width: 1200px;
   margin: 20px auto;
   overflow: auto;
   border: 1px solid #555;
   margin-bottom: 40px;
   margin-top: 10px;
}

#sub {
   width: 100%;
   height: 40px;
   padding-left: 15px;
   margin-bottom: 10px;
}

#selDate {
   padding-top: 20px;
   width: 1200px;
   margin: 0 auto;
}


 table {
   border-collapse: collapse;
   width: 100%;
   overflow: hidden;
   font-size: 14px;
}

#saleList th, #saleList td {
   border-bottom: 1px solid #ccc;
   border-right: 1px solid #ccc;
   padding: 5px 10px;
}

#saleList td:last-child {
   border-right: none;
}

 #saleList tr:nth-child(2n) {
   background-color: #F7F7F7;
}

#saleList tr:last-child {
   border-bottom: 1px solid #ccc;
}

#saleList th {
   padding: 10px 10px;
}

#saleList th:nth-child(1) {
   width: 50px;
}

#saleList th:nth-child(2) {
   width: 100px;
}

#saleList th:nth-child(3) {
   width: 300px;
}

#saleList th:nth-child(4) {
   width: 90px;
}

button {
   padding: 3px 5px;
   background-color: #c7a593;
   border: 1px solid #c7a593;
   color: white;
   border-radius: 3px;
   outline: none;
}

.payMemberNo {
   display: none;
}

.bb {
   text-decoration: line-through;
   color: red;
   font-size: 0.9em;
}

#total1,#total2,#total3{
   font-size: 18px;
   font-weight: bold;
   color:blue;
}

#total4{
   font-size: 18px;
   font-weight: bold;
   color:red;
}
td:nth-child(4), td:nth-child(6) {
      text-align: right;
}
td:nth-child(7), td:nth-child(8), td:nth-child(9), td:nth-child(10) {
      text-align: center;
}
</style>

<script src="https://code.jquery.com/jquery-3.3.1.js">
   
</script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<script type="text/javascript">
   $(function() {
      
      var sum1 = 0;
      var sum2 = 0;
      var sum3 = 0;
      var sum4 = 0;
      $(".selectList").datepicker({
         dateFormat : 'yy-mm-dd',
         minDate: null
      });
      
      $("#btnDate").click(function(){
         sum1 = 0;
         sum2 = 0;
         sum3 = 0;
         sum4 = 0;
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
            url:"${pageContext.request.contextPath}/my/mypageSaleList.do",
            type:"post",
            data:{"date":$("input[name='date']").val(), "date2":$("input[name='date2']").val(), "kind":"date"},
            dataType:"json",
            success: function(json){
               console.log(json);
               $("tbody").empty();
               if(json.list.length==0){
                  alert("조회조건에 맞는 내역이 없습니다.");
                  return false;
               }
               for(var i=0; i<json.list.length; i++){
                  var list=json.list[i];
                  if(list.payCancel==1){
                     $("tbody").append("<tr class='bb'>");
                     $("tbody tr").eq(i).append("<td><span class='payNo'>"+list.payNo+"</span><span class='payMemberNo'>"+list.payMemberNo+"</span></td>");
                     var formattedDate = new Date(list.payTime);
                     var d = formattedDate.getDate();
                     if( d<10){
                        d= "0"+d;
                     }
                     var m =  formattedDate.getMonth()+1;
                     if( m<10){
                        m= "0"+m;
                     }
                     var y = formattedDate.getFullYear();
                     
                     var h = formattedDate.getHours();
                     if( h<10){
                        h= "0"+h;
                     }
                     var mi = formattedDate.getMinutes();
                     if( mi<10){
                        mi= "0"+mi;
                     }
                     
                     var s = formattedDate.getSeconds();
                     if( s<10){
                        s= "0"+s;
                     }
                     var payDate = y+"/"+m+"/"+d+"<br>"+h+":"+mi+":"+s;
                     
                     $("tbody tr").eq(i).append("<td><span class='payTime'>"+payDate+"</span></td>");
                     $("tbody tr").eq(i).append("<td><span class='payMenu'>"+list.payMenu+"</span></td>");
                     $("tbody tr").eq(i).append("<td><span class='payPrice'>"+list.payPrice.toLocaleString()+"</span>원</td>");
                     $("tbody tr").eq(i).append("<td><span class='payDiscountInfo'>"+list.payDiscountInfo+"</span></td>");
                     $("tbody tr").eq(i).append("<td><span class='payDiscountPrice'>"+list.payDiscountPrice.toLocaleString()+"</span>원</td>");
                     if(list.payType==1){
                        $("tbody tr").eq(i).append("<td><span class='payType'>현금</span></td>");
                     }else{
                        $("tbody tr").eq(i).append("<td><span class='payType'>카드</span></td>");
                     }
                     
                     $("tbody tr").eq(i).append("<td><span class='payMember'>"+list.payMember+"</span></td>");
                     if(list.payCancel==1){
                        $("tbody tr").eq(i).append("<td><span class='payCancel'>취소</span></td>");
                     }else{
                        $("tbody tr").eq(i).append("<td><span class='payCancel'>결제완료</span></td>");
                     }
                     if(list.payOrderKind==1){
                        $("tbody tr").eq(i).append("<td><span class='payOrderKind'>매장</span></td>");
                     }else{
                        $("tbody tr").eq(i).append("<td><span class='payOrderKind'>배달</span></td>");
                     }
                     sum1 += 1;
                     sum3 += 1;
                  }else{
                     $("tbody").append("<tr class='aa'>");
                     $("tbody tr").eq(i).append("<td><span class='payNo'>"+list.payNo+"</span><span class='payMemberNo'>"+list.payMemberNo+"</span></td>");
                     var formattedDate = new Date(list.payTime);
                     var d = formattedDate.getDate();
                     if( d<10){
                        d= "0"+d;
                     }
                     var m =  formattedDate.getMonth()+1;
                     if( m<10){
                        m= "0"+m;
                     }
                     var y = formattedDate.getFullYear();
                     
                     var h = formattedDate.getHours();
                     if( h<10){
                        h= "0"+h;
                     }
                     var mi = formattedDate.getMinutes();
                     if( mi<10){
                        mi= "0"+mi;
                     }
                     
                     var s = formattedDate.getSeconds();
                     if( s<10){
                        s= "0"+s;
                     }
                     var payDate = y+"/"+m+"/"+d+"<br>"+h+":"+mi+":"+s;
                     
                     $("tbody tr").eq(i).append("<td><span class='payTime'>"+payDate+"</span></td>");
                     $("tbody tr").eq(i).append("<td><span class='payMenu'>"+list.payMenu+"</span></td>");
                     $("tbody tr").eq(i).append("<td><span class='payPrice'>"+list.payPrice.toLocaleString()+"</span>원</td>");
                     $("tbody tr").eq(i).append("<td><span class='payDiscountInfo'>"+list.payDiscountInfo+"</span></td>");
                     $("tbody tr").eq(i).append("<td><span class='payDiscountPrice'>"+list.payDiscountPrice.toLocaleString()+"</span>원</td>");
                     if(list.payType==1){
                        $("tbody tr").eq(i).append("<td><span class='payType'>현금</span></td>");
                     }else{
                        $("tbody tr").eq(i).append("<td><span class='payType'>카드</span></td>");
                     }
                     
                     $("tbody tr").eq(i).append("<td><span class='payMember'>"+list.payMember+"</span></td>");
                     if(list.payCancel==1){
                        $("tbody tr").eq(i).append("<td><span class='payCancel'>취소</span></td>");
                     }else{
                        $("tbody tr").eq(i).append("<td><span class='payCancel'>결제완료</span></td>");
                     }
                     if(list.payOrderKind==1){
                        $("tbody tr").eq(i).append("<td><span class='payOrderKind'>매장</span></td>");
                     }else{
                        $("tbody tr").eq(i).append("<td><span class='payOrderKind'>배달</span></td>");
                     }
                     sum1+=1;
                     sum2+=1;
                     sum4+=list.payPrice;
                     
                  }
                  
                  
               }
                $("#total1").text( sum1.toLocaleString());
                $("#total2").text( sum2.toLocaleString());
                $("#total3").text( sum3.toLocaleString());
                 $("#total4").text( sum4.toLocaleString());
               
            }
            
         })
         
         
         
         
      })
      
      
      
      
      
      $("#all").click(function() {
         sum1 = 0;
         sum2 = 0;
         sum3 = 0;
         sum4 = 0;
         $("#datepicker").val("");
         $.ajax({
            url:"${pageContext.request.contextPath }/my/mypageSaleList.do",
            type:"post",
            dataType:"json",
            success:function(json){
               console.log(json);
               $("tbody").empty();
               if(json.list.length==0){
                  alert("조회조건에 맞는 내역이 없습니다.");
                  return false;
               }
               for(var i=0; i<json.list.length; i++){
                  var list=json.list[i];
                  if(list.payCancel==1){
                     $("tbody").append("<tr class='bb'>");
                     $("tbody tr").eq(i).append("<td><span class='payNo'>"+list.payNo+"</span><span class='payMemberNo'>"+list.payMemberNo+"</span></td>");
                     var formattedDate = new Date(list.payTime);
                     var d = formattedDate.getDate();
                     if( d<10){
                        d= "0"+d;
                     }
                     var m =  formattedDate.getMonth()+1;
                     if( m<10){
                        m= "0"+m;
                     }
                     var y = formattedDate.getFullYear();
                     
                     var h = formattedDate.getHours();
                     if( h<10){
                        h= "0"+h;
                     }
                     var mi = formattedDate.getMinutes();
                     if( mi<10){
                        mi= "0"+mi;
                     }
                     
                     var s = formattedDate.getSeconds();
                     if( s<10){
                        s= "0"+s;
                     }
                     var payDate = y+"/"+m+"/"+d+"<br>"+h+":"+mi+":"+s;
                     
                     $("tbody tr").eq(i).append("<td><span class='payTime'>"+payDate+"</span></td>");
                     $("tbody tr").eq(i).append("<td><span class='payMenu'>"+list.payMenu+"</span></td>");
                     $("tbody tr").eq(i).append("<td><span class='payPrice'>"+list.payPrice.toLocaleString()+"</span>원</td>");
                     $("tbody tr").eq(i).append("<td><span class='payDiscountInfo'>"+list.payDiscountInfo+"</span></td>");
                     $("tbody tr").eq(i).append("<td><span class='payDiscountPrice'>"+list.payDiscountPrice.toLocaleString()+"</span>원</td>");
                     if(list.payType==1){
                        $("tbody tr").eq(i).append("<td><span class='payType'>현금</span></td>");
                     }else{
                        $("tbody tr").eq(i).append("<td><span class='payType'>카드</span></td>");
                     }
                     
                     $("tbody tr").eq(i).append("<td><span class='payMember'>"+list.payMember+"</span></td>");
                     if(list.payCancel==1){
                        $("tbody tr").eq(i).append("<td><span class='payCancel'>취소</span></td>");
                     }else{
                        $("tbody tr").eq(i).append("<td><span class='payCancel'>결제완료</span></td>");
                     }
                     if(list.payOrderKind==1){
                        $("tbody tr").eq(i).append("<td><span class='payOrderKind'>매장</span></td>");
                     }else{
                        $("tbody tr").eq(i).append("<td><span class='payOrderKind'>배달</span></td>");
                     }
                     sum1 += 1;
                     sum3 += 1;
                  }else{
                     $("tbody").append("<tr class='aa'>");
                     $("tbody tr").eq(i).append("<td><span class='payNo'>"+list.payNo+"</span><span class='payMemberNo'>"+list.payMemberNo+"</span></td>");
                     var formattedDate = new Date(list.payTime);
                     var d = formattedDate.getDate();
                     if( d<10){
                        d= "0"+d;
                     }
                     var m =  formattedDate.getMonth()+1;
                     if( m<10){
                        m= "0"+m;
                     }
                     var y = formattedDate.getFullYear();
                     
                     var h = formattedDate.getHours();
                     if( h<10){
                        h= "0"+h;
                     }
                     var mi = formattedDate.getMinutes();
                     if( mi<10){
                        mi= "0"+mi;
                     }
                     
                     var s = formattedDate.getSeconds();
                     if( s<10){
                        s= "0"+s;
                     }
                     var payDate = y+"/"+m+"/"+d+"<br>"+h+":"+mi+":"+s;
                     
                     $("tbody tr").eq(i).append("<td><span class='payTime'>"+payDate+"</span></td>");
                     $("tbody tr").eq(i).append("<td><span class='payMenu'>"+list.payMenu+"</span></td>");
                     $("tbody tr").eq(i).append("<td><span class='payPrice'>"+list.payPrice.toLocaleString()+"</span>원</td>");
                     $("tbody tr").eq(i).append("<td><span class='payDiscountInfo'>"+list.payDiscountInfo+"</span></td>");
                     $("tbody tr").eq(i).append("<td><span class='payDiscountPrice'>"+list.payDiscountPrice.toLocaleString()+"</span>원</td>");
                     if(list.payType==1){
                        $("tbody tr").eq(i).append("<td><span class='payType'>현금</span></td>");
                     }else{
                        $("tbody tr").eq(i).append("<td><span class='payType'>카드</span></td>");
                     }
                     
                     $("tbody tr").eq(i).append("<td><span class='payMember'>"+list.payMember+"</span></td>");
                     if(list.payCancel==1){
                        $("tbody tr").eq(i).append("<td><span class='payCancel'>취소</span></td>");
                     }else{
                        $("tbody tr").eq(i).append("<td><span class='payCancel'>결제완료</span></td>");
                     }
                     if(list.payOrderKind==1){
                        $("tbody tr").eq(i).append("<td><span class='payOrderKind'>매장</span></td>");
                     }else{
                        $("tbody tr").eq(i).append("<td><span class='payOrderKind'>배달</span></td>");
                     }
                     sum1+=1;
                     sum2+=1;
                     sum4+=list.payPrice;
                  }
                  
                  
               }
               $("#total1").text( sum1.toLocaleString());
                $("#total2").text( sum2.toLocaleString());
                $("#total3").text( sum3.toLocaleString());
                 $("#total4").text( sum4.toLocaleString());
            }
         }) 
      })
      
      
      

          
          $(document).on("click","#btnToday",function(){
             sum1 = 0;
            sum2 = 0;
            sum3 = 0;
            sum4 = 0;
         $("input[name='date']").val("");
         $("input[name='date2']").val(""); 
         var dt = new Date();
         var recentYear = dt.getFullYear();
          var recentMonth = dt.getMonth() + 1;
          var recentDay = dt.getDate();
       
          if(recentMonth < 10) recentMonth = "0" + recentMonth;
          if(recentDay < 10) recentDay = "0" + recentDay;
          
          var today = recentYear + "-" + recentMonth + "-" + recentDay;
         
         $.ajax({
            url:"${pageContext.request.contextPath}/my/mypageSaleList.do",
            type:"post",
            data:{"date":today, "date2":today, "kind":"date"},
            dataType:"json",
            success: function(json){
               console.log(json);
               
               $("tbody").empty();
               if(json.list.length==0){
                  alert("조회조건에 맞는 내역이 없습니다.");
                  return false;
               }
               for(var i=0; i<json.list.length; i++){
                  var list=json.list[i];
                  if(list.payCancel==1){
                     $("tbody").append("<tr class='bb'>");
                     $("tbody tr").eq(i).append("<td><span class='payNo'>"+list.payNo+"</span><span class='payMemberNo'>"+list.payMemberNo+"</span></td>");
                     var formattedDate = new Date(list.payTime);
                     var d = formattedDate.getDate();
                     if( d<10){
                        d= "0"+d;
                     }
                     var m =  formattedDate.getMonth()+1;
                     if( m<10){
                        m= "0"+m;
                     }
                     var y = formattedDate.getFullYear();
                     
                     var h = formattedDate.getHours();
                     if( h<10){
                        h= "0"+h;
                     }
                     var mi = formattedDate.getMinutes();
                     if( mi<10){
                        mi= "0"+mi;
                     }
                     
                     var s = formattedDate.getSeconds();
                     if( s<10){
                        s= "0"+s;
                     }
                     var payDate = y+"/"+m+"/"+d+"<br>"+h+":"+mi+":"+s;
                     
                     $("tbody tr").eq(i).append("<td><span class='payTime'>"+payDate+"</span></td>");
                     $("tbody tr").eq(i).append("<td><span class='payMenu'>"+list.payMenu+"</span></td>");
                     $("tbody tr").eq(i).append("<td><span class='payPrice'>"+list.payPrice.toLocaleString()+"</span>원</td>");
                     $("tbody tr").eq(i).append("<td><span class='payDiscountInfo'>"+list.payDiscountInfo+"</span></td>");
                     $("tbody tr").eq(i).append("<td><span class='payDiscountPrice'>"+list.payDiscountPrice.toLocaleString()+"</span>원</td>");
                     if(list.payType==1){
                        $("tbody tr").eq(i).append("<td><span class='payType'>현금</span></td>");
                     }else{
                        $("tbody tr").eq(i).append("<td><span class='payType'>카드</span></td>");
                     }
                     
                     $("tbody tr").eq(i).append("<td><span class='payMember'>"+list.payMember+"</span></td>");
                     if(list.payCancel==1){
                        $("tbody tr").eq(i).append("<td><span class='payCancel'>취소</span></td>");
                     }else{
                        $("tbody tr").eq(i).append("<td><span class='payCancel'>결제완료</span></td>");
                     }
                     if(list.payOrderKind==1){
                        $("tbody tr").eq(i).append("<td><span class='payOrderKind'>매장</span></td>");
                     }else{
                        $("tbody tr").eq(i).append("<td><span class='payOrderKind'>배달</span></td>");
                     }
                     sum1 += 1;
                     sum3 += 1;
                  }else{
                     $("tbody").append("<tr class='aa'>");
                     $("tbody tr").eq(i).append("<td><span class='payNo'>"+list.payNo+"</span><span class='payMemberNo'>"+list.payMemberNo+"</span></td>");
                     var formattedDate = new Date(list.payTime);
                     var d = formattedDate.getDate();
                     if( d<10){
                        d= "0"+d;
                     }
                     var m =  formattedDate.getMonth()+1;
                     if( m<10){
                        m= "0"+m;
                     }
                     var y = formattedDate.getFullYear();
                     
                     var h = formattedDate.getHours();
                     if( h<10){
                        h= "0"+h;
                     }
                     var mi = formattedDate.getMinutes();
                     if( mi<10){
                        mi= "0"+mi;
                     }
                     
                     var s = formattedDate.getSeconds();
                     if( s<10){
                        s= "0"+s;
                     }
                     var payDate = y+"/"+m+"/"+d+"<br>"+h+":"+mi+":"+s;
                     
                     $("tbody tr").eq(i).append("<td><span class='payTime'>"+payDate+"</span></td>");
                     $("tbody tr").eq(i).append("<td><span class='payMenu'>"+list.payMenu+"</span></td>");
                     $("tbody tr").eq(i).append("<td><span class='payPrice'>"+list.payPrice.toLocaleString()+"</span>원</td>");
                     $("tbody tr").eq(i).append("<td><span class='payDiscountInfo'>"+list.payDiscountInfo+"</span></td>");
                     $("tbody tr").eq(i).append("<td><span class='payDiscountPrice'>"+list.payDiscountPrice.toLocaleString()+"</span>원</td>");
                     if(list.payType==1){
                        $("tbody tr").eq(i).append("<td><span class='payType'>현금</span></td>");
                     }else{
                        $("tbody tr").eq(i).append("<td><span class='payType'>카드</span></td>");
                     }
                     
                     $("tbody tr").eq(i).append("<td><span class='payMember'>"+list.payMember+"</span></td>");
                     if(list.payCancel==1){
                        $("tbody tr").eq(i).append("<td><span class='payCancel'>취소</span></td>");
                     }else{
                        $("tbody tr").eq(i).append("<td><span class='payCancel'>결제완료</span></td>");
                     }
                     if(list.payOrderKind==1){
                        $("tbody tr").eq(i).append("<td><span class='payOrderKind'>매장</span></td>");
                     }else{
                        $("tbody tr").eq(i).append("<td><span class='payOrderKind'>배달</span></td>");
                     }
                     sum1+=1;
                     sum2+=1;
                     sum4+=list.payPrice;
                  }
                  
                  
               }
               
               $("#total1").text( sum1.toLocaleString());
                $("#total2").text( sum2.toLocaleString());
                $("#total3").text( sum3.toLocaleString());
                 $("#total4").text( sum4.toLocaleString());
            }
            
         })
      })
      

       $("#total1").text( Number($("#totals").val()).toLocaleString());
        $("#total2").text( Number($("#totals2").val()).toLocaleString());
        $("#total3").text( Number($("#totals3").val()).toLocaleString());
        $("#total4").text( Number($("#totalp").val()).toLocaleString());
            

      
      $("#menu_li").click(function() {
         $("#menulist").toggle();
      })         

      
   })
</script>


<div class="s_visu1">
   <img src="${pageContext.request.contextPath}/images/main/f_visu4.jpg">
</div>
<div id="mypage_content">
   <div id="menu_li">
      결제내역
      <span class="li_img"></span>
      <ul id="menulist">
         <a href="${pageContext.request.contextPath}/my/mypage.do"><li id="updateMember">회원정보수정</li></a>
         <a href="${pageContext.request.contextPath}/my/searchMyRsv.do"><li id="searchRsv2">예약내역</li></a>
         <a href="${pageContext.request.contextPath}/my/mypageSaleList.do"><li id="searchPay">결제내역</li></a>
      </ul>
   </div>
   <div id="menu_li2">
      <ul>
         <li>HOME</li>
         <li>></li>
         <li>마이페이지</li>
         <li>></li>
         <li><b>결제내역</b></li>
      </ul>
   </div>
   <div class="clear"></div>
</div>
   <p id="selDate">
      <input type="text" name="date" class="selectList" autocomplete="off"> ~ <input type="text" name="date2" class="selectList" autocomplete="off"> <button id="btnDate">날짜로검색</button>
      <button id="btnToday">오늘날짜 보기</button>
         <button id="all">전체보기</button>
          총 판매  : <span id="total1"></span>건    결제완료  : <span id="total2"></span>건   결제취소  : <span id="total3"></span>건    결제금액  : <span id="total4"></span>원
      </p> 
<div id="wrap">
   <c:set var="sum1"></c:set>
   <c:set var="sum2"></c:set>
   <c:set var="sum3"></c:set>
   <c:set var="sum4"></c:set>
   <table id="saleList" class="display">
      <thead>
         <tr>
            <th>결제<br>번호
            </th>
            <th>결제 시간</th>
            <th>결제 메뉴</th>
            <th>결제 금액</th>
            <th>할인 정보</th>
            <th>할인 금액</th>
            <th>결제 방식</th>
            <th>회원</th>
            <th>결제 상태</th>
            <th>결제 장소</th>
            
         </tr>
      </thead>
      <tbody>
         <c:forEach var="item" items="${list}">
            <c:if test="${item.payCancel==0 }">
               <tr class="aa">
                  <td><span class="payNo">${item.payNo }</span><span
                     class="payMemberNo">${item.payMemberNo }</span></td>
                  <td><span class="payTime"><fmt:formatDate
                           value="${item.payTime}" pattern="yyyy/MM/dd hh:mm:ss" /></span></td>
                  <td><span class="payMenu">${item.payMenu }</span></td>
                  <td><span class="payPrice"><fmt:formatNumber
                           value="${item.payPrice}" /></span>원</td>
                  <td><span class="payDiscountInfo">${item.payDiscountInfo}</span></td>
                  <td><span class="payDiscountPrice"><fmt:formatNumber
                           value="${item.payDiscountPrice}" /></span>원</td>
                  <td><span class="payType"><c:if
                           test="${item.payType==0 }">
                   카드
                </c:if> <c:if test="${item.payType==1 }">
                   현금
                </c:if></span></td>
                  <td><span class="payMember">${item.payMember }</span></td>
                  <td><span class="payCancel"><c:if
                           test="${item.payCancel==0 }">결제완료</c:if> <c:if
                           test="${item.payCancel==1 }">취소</c:if></span></td>
                           <td><span class="payOrderKind"><c:if test="${item.payOrderKind==0}">배달</c:if><c:if test="${item.payOrderKind==1}">매장</c:if></span></td>
               </tr>
               <c:set var="sum2" value="${sum2+1 }"></c:set>
               <c:set var="sum4" value="${sum4 + item.payPrice}"></c:set>
            </c:if>
            <c:if test="${item.payCancel==1 }">
               <tr class="bb">
                  <td><span class="payNo">${item.payNo }</span><span
                     class="payMemberNo">${item.payMemberNo }</span></td>
                  <td><span class="payTime"><fmt:formatDate
                           value="${item.payTime}" pattern="yyyy/MM/dd hh:mm:ss" /></span></td>
                  <td><span class="payMenu">${item.payMenu }</span></td>
                  <td><span class="payPrice"><fmt:formatNumber
                           value="${item.payPrice}" /></span>원</td>
                  <td><span class="payDiscountInfo">${item.payDiscountInfo}</span></td>
                  <td><span class="payDiscountPrice"><fmt:formatNumber
                           value="${item.payDiscountPrice}" /></span>원</td>
                  <td><span class="payType"><c:if
                           test="${item.payType==0 }">
                   카드
                </c:if> <c:if test="${item.payType==1 }">
                   현금
                </c:if></span></td>
                  <td><span class="payMember">${item.payMember }</span></td>
                  <td><span class="payCancel"><c:if
                           test="${item.payCancel==0 }">결제완료</c:if> <c:if
                           test="${item.payCancel==1 }">취소</c:if></span></td>
                           <td><span class="payOrderKind"><c:if test="${item.payOrderKind==0}">배달</c:if><c:if test="${item.payOrderKind==1}">매장</c:if></span></td>
               </tr>
               <c:set var="sum3" value="${sum3+1 }"></c:set>
            </c:if>
      <c:set var="sum1" value="${sum1+1 }"></c:set>
                  
         </c:forEach>
         <input type="hidden" value="${sum1 }" id="totals">
         <input type="hidden" value="${sum2 }" id="totals2">
         <input type="hidden" value="${sum3 }" id="totals3">
         <input type="hidden" value="${sum4 }" id="totalp">
      </tbody>
   </table>
</div>

<%@ include file="../include/footer.jsp" %>