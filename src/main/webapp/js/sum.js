







//예약날짜별 금액합
function PriceSum(){
	
	var up=document.getElementById("useprice");
	
	var rowLen=up.rows.length;
	var sumPrice=0;

	for(var i=0;i<rowLen;i++){
		sumPrice+=parseInt(up.rows[i].cells[0].outerText);				
	}

	return sumPrice;
}

//예약 총 결제정보
function allPriceSum(){
	
	var tb= document.getElementById("resconfirm");
	/*var tb=$("#resconfirm");*/
	
	var sumprice=0;
	var up=document.getElementById("useprice");
	
	var rowLen=up.rows.length;
	for(var i=0;i<rowLen;i++){
		sumprice+=parseInt(up.rows[i].cells[0].outerText);
	}
	
	var price=sumprice;	
	var price_option= tb.rows[1].cells[4].outerText;
	price_option=price_option.split('원');
	price_option=parseInt(price_option);
	
	
		
	var sum= price + price_option;
	
	var text="<input type='hidden' name='reserve_price' class='reserve_price' size='3' readonly='readonly' value="+sum;
	text=text+">"+sum;
	return text;
		
}
function confirmPrice(){
	var tb=document.getElementById("resconfirm");
	var form=document.getElementById("resok");
	
	var cp=tb.rows[1].cells[5].outerText;
	cp=cp.split('원');
	cp=parseInt(cp);
	
	var allprice=document.getElementById("reserve_price");
	
	allprice.value(cp);	
}
//예약정보 전송
$(document).ready(function(){

	var tb=document.getElementById("resconfirm");
	var allprice=tb.rows[1].cells[5].outerText;
	allprice=allprice.split('원');
	allprice=parseInt(allprice);
	
	$("#reserve_price").val(allprice);
	
	$("#next").click(function(){
		$("#resok").submit();
	});
});




function cancelgo(resref){
	
	if(confirm("예약취소를 신청하시겠습니까?") == true){
		rescancel('cancelgo',resref);
	}
}
function rescancel(a,b){
	if(a=='cancelgo'){
		location.href="res_cancel.coc?r_resref="+b;
	}
}

function paygo(resref,rPrice){
	location.href="cardPay.kkc?r_resref="+resref+"&r_price="+rPrice;
}











