/* Buttons */
var start_trade_class = "TradeCurrencyModalBtn";
var cancel_trade_class = "btn-negative";

/* Input */
var limit_order_id = "ctl00_ctl00_cphRoblox_cphMyRobloxContent_ctl00_LimitOrderRadioButton";
var give_currency_id = "ctl00_ctl00_cphRoblox_cphMyRobloxContent_ctl00_HaveCurrencyDropDownList";
var receive_currency_id = "ctl00_ctl00_cphRoblox_cphMyRobloxContent_ctl00_WantCurrencyDropDownList";
var give_box_id = "ctl00_ctl00_cphRoblox_cphMyRobloxContent_ctl00_HaveAmountTextBoxRestyle";
var receive_box_id = "ctl00_ctl00_cphRoblox_cphMyRobloxContent_ctl00_WantAmountTextBox";
var submit_trade_id = "ctl00_ctl00_cphRoblox_cphMyRobloxContent_ctl00_SubmitTradeButton";

/* Info */
var quote_panel_class = "CurrencyQuote";
var my_robux = "RobuxAlertCaption";
var my_tix = "TicketsAlertCaption";

/* History */ // Dp not touch these values. Or anything for that matter. Go away
var Previous_Tix_Traded = 0;
var Previous_Robux_Traded = 0;
var Current_Tix_Gained = 0; // "Current" variables are the ones that hold the values of the maximum to trade. They will not trade more money than you have gained.
var Current_Robux_Gained = 0;
var Trading_Robux = 60; // CHANGE NUMBER TO THE NUMBER OF ROBUX YOU CURRENTLY HAVE/ARE WILLING TO USE
var Trading_Tix = 37442;
var Previous_Bux_Rate = 0;
var Previous_Tix_Rate = 0;
var Current_Trading = "tix" // We start trading bux first
var InTrade = 0;
var Loading = 0;
var total_profit = 0;
var pending_profit = 0;

/* others */
var framedoc;
var tcinterval;
var currenttrading_element;
var expecting_element;
var giving_element;
var totalprofit_element;

// Multiply R$ by the right
// Divide TIX by the left
// Round only final value

function FetchExternalData(){
var d = "";
$.get("http://www.roblox.com/My/Money.aspx#/#TradeCurrency_tab", function(data){
d = data;
//console.log( $("#" + my_robux, data).text() );
});
return d;
}
/*
function getPos(ele){
var x=0;
var y=0;
while(true){
x += ele.offsetLeft;
y += ele.offsetTop;
if(ele.offsetParent === null){
break;
}
ele = ele.offsetParent;
}
return [x, y];
}
console.log( getPos( document.getElementById("frame1").contentDocument.getElementById("ctl00_ctl00_cphRoblox_cphMyRobloxContent_ctl00_SubmitTradeButton") ))*/

function GetBuxRate(Rates){ // What to multiply bux by
var tes = Rates.match(/(.*)\/(.*)/);
return tes[2];
}

function GetTixRate(Rates){ // What to divide tix by
var tes = Rates.match(/(.*)\/(.*)/);
return tes[1];
}

function GetSpread(){ // Get spread
var Spread = framedoc.getElementsByClassName("column")[0].childNodes[5]
console.log(Spread);
return Spread.innerHTML;
}

function Click(String, isClass, d){
if (isClass == true){
$("." + String, d)[0].click();
}else{
$("#" + String, d).click()
}
}

function OpenTradeWindow(d){
Click(start_trade_class, true, d);
Click(limit_order_id, false, d);
}

function SetTradeTo(currency, d){
if (currency === "tix"){
$("#" + give_currency_id, d).val("Tickets");
$("#" + receive_currency_id, d).val("Robux");
}else if(currency === "bux"){
$("#" + give_currency_id, d).val("Robux");
$("#" + receive_currency_id, d).val("Tickets");
}
}

function MakeIFrame(){
var f = document.createElement("iframe");
f.width = window.innerWidth;
f.height = 350
f.style.position = "absolute"
f.style.top = "0px";
f.style.left = "0px";
f.style.zIndex = 100001;
f.setAttribute("src", "http://www.roblox.com/My/Money.aspx#/#TradeCurrency_tab");
f.id = "frame1";
document.body.outerHTML = "";
document.body.appendChild(f);

currenttrading_element = document.createElement("span");
currenttrading_element.style.display = "block";
currenttrading_element.style.width = "400px"
currenttrading_element.style.backgroundColor = "rgb(200,200,200)";
currenttrading_element.style.position = "absolute";
currenttrading_element.style.top = "360px";
currenttrading_element.style.left = "10px";
currenttrading_element.style.fontSize = "25px";
currenttrading_element.style.textAlign = "center";
currenttrading_element.style.borderRadius = "5px";
currenttrading_element.innerHTML = "Currently exchanging: R$";
document.body.appendChild(currenttrading_element);

giving_element = document.createElement("span");
giving_element.style.display = "block";
giving_element.style.borderRadius = "5px";
giving_element.style.width = "400px"
giving_element.style.backgroundColor = "rgb(200,200,200)";
giving_element.style.position = "absolute";
giving_element.style.top = "400px";
giving_element.style.left = "10px";
giving_element.style.fontSize = "25px";
giving_element.style.textAlign = "center";
document.body.appendChild(giving_element);

expected_element = document.createElement("span");
expected_element.style.display = "block";
expected_element.style.borderRadius = "5px";
expected_element.style.width = "400px"
expected_element.style.backgroundColor = "rgb(200,200,200)";
expected_element.style.position = "absolute";
expected_element.style.top = "440px";
expected_element.style.left = "10px";
expected_element.style.fontSize = "25px";
expected_element.style.textAlign = "center";
document.body.appendChild(expected_element);

totalprofit_element = document.createElement("span");
totalprofit_element.style.display = "block";
totalprofit_element.style.borderRadius = "5px";
totalprofit_element.style.width = "400px"
totalprofit_element.style.backgroundColor = "rgb(200,200,200)";
totalprofit_element.style.position = "absolute";
totalprofit_element.style.top = "360px";
totalprofit_element.style.right = "10px";
totalprofit_element.style.fontSize = "25px";
totalprofit_element.style.textAlign = "center";
totalprofit_element.innerHTML = "Total Profit: 0 R$";
document.body.appendChild(totalprofit_element);
}

function simulatedClick(target, options) {

var event = target.ownerDocument.createEvent('MouseEvents'),
options = options || {};

//Set your default options to the right of ||
var opts = {
type: options.type || 'click',
canBubble:options.canBubble || true,
cancelable:options.cancelable || true,
view:options.view || target.ownerDocument.defaultView,
detail:options.detail || 1,
screenX:options.screenX || 0, //The coordinates within the entire page
screenY:options.screenY || 0,
clientX:options.clientX || 0, //The coordinates within the viewport
clientY:options.clientY || 0,
ctrlKey:options.ctrlKey || false,
altKey:options.altKey || false,
shiftKey:options.shiftKey || false,
metaKey:options.metaKey || false, //I *think* 'meta' is 'Cmd/Apple' on Mac, and 'Windows key' on Win. Not sure, though!
button:options.button || 0, //0 = left, 1 = middle, 2 = right
relatedTarget:options.relatedTarget || null,
}

//Pass in the options
event.initMouseEvent(
opts.type,
opts.canBubble,
opts.cancelable,
opts.view,
opts.detail,
opts.screenX,
opts.screenY,
opts.clientX,
opts.clientY,
opts.ctrlKey,
opts.altKey,
opts.shiftKey,
opts.metaKey,
opts.button,
opts.relatedTarget
);

//Fire the event
target.dispatchEvent(event);
}

MakeIFrame();
console.log("Giving 5 seconds for page to load.");

setTimeout(function(){
tcinterval = setInterval(function(){
$d = $("#frame1").contents()
console.log("===================== NEW TRANSACTION ======================");
if ((InTrade == 0) && (Loading == 0) && ($("." + start_trade_class, $d)[0]) ){
Loading = 1;
$.get("http://www.roblox.com/My/Money.aspx#/#TradeCurrency_tab", function(data){
Loading = 0;
$my_robux = $("#" + my_robux, data).text();
$my_tix = $("#" + my_tix, data).text();
$tix_rate = Number(GetTixRate($("." + quote_panel_class, data)[0].childNodes[3].childNodes[2].innerHTML));
$bux_rate = Number(GetBuxRate($("." + quote_panel_class, data)[0].childNodes[3].childNodes[2].innerHTML));
$spread = Number($(".column", data)[0].childNodes[5].innerHTML);
// check if any offers or bids are pending (bids = tix, offers = bux)
$offers = $('.offer', data).length/2;
$bids = $('.bid', data).length/2;
$offerspending = $offers + $bids
console.log( $offerspending + " offers pending.");
if ( ($offerspending) < 1){
total_profit = (total_profit + pending_profit);
pending_profit = 0;
totalprofit_element.innerHTML = "Total Profit: " + total_profit + " R$";
$expected_bux = Math.round(Trading_Tix/$tix_rate);
$bux_profit = ($expected_bux - Trading_Robux);
$expected_tix = Math.round(Trading_Robux*$bux_rate);
$tix_profit = ($expected_tix - Trading_Tix);
console.log($tix_profit);
if ((Math.abs($spread) < 550) && ($spread < 0) && ($bux_profit > 0) && (Current_Trading === "tix")){
console.log("Profit to be made on TIX to R$: " + $spread + " - Rate: " + $tix_rate);
InTrade = 1;
console.log("Expected to profit " + $bux_profit + " R$ from this trade.");
OpenTradeWindow($d);
//SetTradeTo("tix", $d);
$("#"+give_box_id, $d).val(Trading_Tix);
$("#"+receive_box_id, $d).val($expected_bux);
Trading_Robux = $expected_bux;
Current_Trading = "bux"
currenttrading_element.innerHTML = "Currently exchanging: R$";
giving_element.innerHTML = "Gave: " + Trading_Tix + " TIX";
expected_element.innerHTML = "Expecting: " + $expected_bux + " R$";
pending_profit = $bux_profit;
setTimeout(function(){
simulatedClick( document.getElementById("frame1").contentDocument.getElementById(submit_trade_id) )
//simulatedClick($("#"+submit_trade_id, $d));
//$("#"+submit_trade_id, $d).trigger('click');
InTrade = 0;
}, 1500
);
}else if((Math.abs($spread) < 550) && ($bux_profit < 0) && (Current_Trading === "tix")){
console.log("Will lose profit on TIX to R$. Not trading.");
}else if ((Math.abs($spread) < 550) && ($spread > 0) && ($tix_profit > 20) && (Current_Trading === "bux")){
console.log("Good spread to trade R$ to TIX: " + $spread + " - Rate: " + $bux_rate);
InTrade = 1;
console.log("Expected to profit " + $tix_profit + " TIX from this trade.");
OpenTradeWindow($d);
SetTradeTo("bux", $d);
$("#"+give_box_id, $d).val(Trading_Robux);
$("#"+receive_box_id, $d).val($expected_tix);
Trading_Tix = $expected_tix;
Current_Trading = "tix"
currenttrading_element.innerHTML = "Currently exchanging: TIX";
giving_element.innerHTML = "Gave: " + Trading_Robux + " R$";
expected_element.innerHTML = "Expecting: " + $expected_tix + " TIX";
setTimeout(function(){
simulatedClick( document.getElementById("frame1").contentDocument.getElementById(submit_trade_id) ) 
//simulatedClick($("#"+submit_trade_id, $d));
//$("#"+submit_trade_id, $d).trigger('click');
InTrade = 0;
}, 1500
);
}else if ((Math.abs($spread) < 550) && ($tix_profit < 20) && (Current_Trading === "bux")){
console.log("Will lose profit on R$ to TIX. Not trading.");
}else{
console.log("Bad spread. Not trading: " + $spread + " - Currently trying to exchange: " + Current_Trading);
}
}else{
console.log("Waiting for current offer to finish...");
}
});
}else{
console.log("Currently in trade or loading page. Waiting...");
}
}, 5000);
}, 1000);
