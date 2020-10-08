<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>

<script>
$(function(){

function clicksestate_0(){
$("#t_clicksemul").hide();
}

function clicksestate_1(){
$("#t_clicksemul").show();
}

function clicksestate_2(){
clicksestate_1();
}

clicksestate_<%=Rs("clicksestate")%>();

$("#clicksestate_0").click(function(){
clicksestate_0();
});

$("#clicksestate_1").click(function(){
clicksestate_1();
});

$("#clicksestate_2").click(function(){
clicksestate_2();
});


$('#t_unit_cent_first').html("<br>换算:"+parseFloat($('#unit_cent_first').val()*1000).toFixed(2)+'元/千IP');
$('#t_moblie_mul_first').html("<br>换算:"+parseFloat($('#unit_cent_first').val()*$('#moblie_mul_first').val()*1000).toFixed(2)+'元/千IP');
  
$('#t_unit_cent').html("<br>换算:"+parseFloat($('#unit_cent').val()*1000).toFixed(2)+'元/千IP');
$('#t_moblie_mul').html("<br>换算:"+parseFloat($('#unit_cent').val()*$('#moblie_mul').val()*1000).toFixed(2)+'元/千IP');

$('#t_clicksemul1').html("<br>换算:"+parseFloat($('#unit_cent').val()*$('#clicksemul').val()*1000).toFixed(2)+'元/千IP');


$('#unit_cent_first').bind('input propertychange', function() {
 if(!isNaN($('#unit_cent_first').val())){
  $('#t_unit_cent_first').html("<br>换算:"+parseFloat($('#unit_cent_first').val()*1000).toFixed(2)+'元/千IP');
  $('#t_moblie_mul_first').html("<br>换算:"+parseFloat($('#unit_cent_first').val()*$('#moblie_mul_first').val()*1000).toFixed(2)+'元/千IP');
 }
});

$('#moblie_mul_first').bind('input propertychange', function() {
 if(!isNaN($('#unit_cent_first').val())&&!isNaN($('#moblie_mul_first').val())){
  $('#t_moblie_mul_first').html("<br>换算:"+parseFloat($('#unit_cent_first').val()*$('#moblie_mul_first').val()*1000).toFixed(2)+'元/千IP');
 }
});


$('#unit_cent').bind('input propertychange', function() {
 if(!isNaN($('#unit_cent').val())){
  $('#t_unit_cent').html("<br>换算:"+parseFloat($('#unit_cent').val()*1000).toFixed(2)+'元/千IP');
  $('#t_moblie_mul').html("<br>换算:"+parseFloat($('#unit_cent').val()*$('#moblie_mul').val()*1000).toFixed(2)+'元/千IP');
 }
 
 if(!$("#clicksestate_0").prop("checked")&&!isNaN($('#unit_cent').val())&&!isNaN($('#clicksemul').val())){
  $('#t_clicksemul1').html("<br>换算:"+parseFloat($('#unit_cent').val()*$('#clicksemul').val()*1000).toFixed(2)+'元/千IP');
 }
 
});

$('#moblie_mul').bind('input propertychange', function() {
 if(!isNaN($('#unit_cent').val())&&!isNaN($('#moblie_mul').val())){
  $('#t_moblie_mul').html("<br>换算:"+parseFloat($('#unit_cent').val()*$('#moblie_mul').val()*1000).toFixed(2)+'元/千IP');
 }
});

$('#clicksemul').bind('input propertychange', function() {
 if(!$("#clicksestate_0").prop("checked")&&!isNaN($('#unit_cent').val())&&!isNaN($('#clicksemul').val())){
  $('#t_clicksemul1').html("<br>换算:"+parseFloat($('#unit_cent').val()*$('#clicksemul').val()*1000).toFixed(2)+'元/千IP');
 }
});



$("#adpricebtn").click(function(){
//开启了次要计费时
if($("#clicksestate_1").is(":checked")||$("#clicksestate_2").is(":checked")){
 if($('#clicksemul').val()==""){
  alert('请填写次要单价是首要单价的多少倍', '', function () {$("#clicksemul").focus();});
  return false;
 }

 if($('#clicksemul').val()<=0){
  alert('次要单价是首要单价的倍数填写需大于0', '', function () {$("#clicksemul").focus();});
  return false;
 }
}


 if($('#unit_cent').val()>$('#unit_cent_first').val()){
  alert('网站主的单价不能大于广告主的单价', '', function () {$("#unit_cent").focus();});
  return false;
 }
 
 if($('#moblie_mul').val()>$('#moblie_mul_first').val()){
  alert('网站主的移动设备倍数不能大于广告主的移动设备倍数', '', function () {$("#moblie_mul").focus();});
  return false;
 }
 
});


});
</script>


<table class="tb_1" id="tbu">

<tr class="tr_1">
<td colspan="2">广告首要价格</td>
</tr>

<TR> 
<TD width="200" class="td_r">首要计费模式：</TD>
<TD>
<%
If Rs("ClickState")=1 Then
 Response.write "点击获利(CPC)"
ElseIf Rs("ClickState")=2 Then
 Response.write "显示获利(CPV)"
ElseIf Rs("ClickState")=3 Then
 Response.write "注册获利(CPA)"
ElseIf Rs("ClickState")=4 Then
 Response.write "商品获利(CPS)"
End If
%></TD>
</TR>

    <TR> 
      <TD class="td_r">广告主支付单价：</TD>
      <TD><input name="unit_cent_first" type="text" id="unit_cent_first" value="<%=GetTurnCent(Rs("unit_cent_first"))%>">元/IP (精确到：0.00001元)<span id='t_unit_cent_first'></span></TD>
    </TR>


<TR> 
<TD class="td_r"><span  id="t1">广告主移动设备支付单价倍数：</span></TD>
<TD><input name="moblie_mul_first" type="text" id="moblie_mul_first" value="<%=Rs("moblie_mul_first")%>">倍 (注：精确到0.01)<span id='t_moblie_mul_first'></span></TD>
</TR>


<TR> 
<TD class="td_r">网站主实际得到的单价：</TD>
<TD><input name="unit_cent" type="text" id="unit_cent" value="<%=GetTurnCent(Rs("unit_cent"))%>">元/IP (精确到：0.00001元，需小于或等于广告主支付单价)<span id='t_unit_cent'></span>
</TD>
</TR>

<TR> 
<TD class="td_r"><span  id="t1">网站主移动设备得到单价倍数：</span></TD>
<TD><input name="moblie_mul" type="text" id="moblie_mul" value="<%=Rs("moblie_mul")%>">倍 (注：精确到0.01倍，需小于或等于广告主移动支付倍数)<span id='t_moblie_mul'></span></TD>
</TR>


<tr class="tr_1">
<td colspan="2">广告次要价格</td>
</tr>

<TR id="t_clicksestate"> 
<TD class="td_r">
次要计费模式：</TD>
<TD>


<input name='clicksestate' type='radio' value='0' id="clicksestate_0"<%If Rs("clicksestate")=0 Then Response.write " checked"%>>关闭

<%
If (Rs("ad_class")=1 Or Rs("ad_class")=2 Or Rs("ad_class")=11) and (Rs("clickstate")=3 or Rs("clickstate")=4) Then clicksestate_1=1
If (Rs("ad_class")=3 Or Rs("ad_class")=4 Or Rs("ad_class")=5 Or Rs("ad_class")=6 Or Rs("ad_class")=7 Or Rs("ad_class")=10 Or Rs("ad_class")=11) and (Rs("clickstate")=2 or Rs("clickstate")=3 or Rs("clickstate")=4) Then clicksestate_1=1
%>
<%If clicksestate_1=1 Then%>
<input name='clicksestate' type='radio' value='1' id="clicksestate_1"<%If Rs("clicksestate")=1 Then Response.write " checked"%>>开启-点击获利(CPC)
<%End If%>

<%
If (Rs("ad_class")=3 Or Rs("ad_class")=4 Or Rs("ad_class")=5 Or Rs("ad_class")=6 Or Rs("ad_class")=7 Or Rs("ad_class")=10 Or Rs("ad_class")=11) and (Rs("clickstate")=1 or Rs("clickstate")=3 or Rs("clickstate")=4) Then clicksestate_1=2
%>
<%If clicksestate_1=2 Then%>
<input name='clicksestate' type='radio' value='2' id="clicksestate_2"<%If Rs("clicksestate")=2 Then Response.write " checked"%>>开启-显示获利(CPV)
<%End If%>
</TD>
</TR>

<TR id="t_clicksemul"> 
<TD class="td_r"><span  id="t1">次要价格是首要单价的多少倍：</span></TD>
<TD><input name="clicksemul" type="text" id="clicksemul" value="<%=GetTurnCent(Rs("clicksemul"))%>">倍 (注：精确到0.00001倍)<span id='t_clicksemul1'></span></TD>
</TR>



<tr class="tr_1">
<td colspan="2">广告扣点率</td>
</tr>

<TR> 
<TD class="td_r">广告扣点率：</TD>
<TD><input name="AdDeDuct_Rate" type="text" value="<%=Rs("AdDeDuct_Rate")%>">%(请输入0-100之间数字，0为不扣点)<br>
注：这里扣的点归管理员所得，比如此广告原始每点击：0.10元，共发布了1000点，花费了100元，这里的扣点率为20%，这样广告消耗完广告后，网站主共分得80元，管理员共分得20元。</p></TD>
</TR>

<TR> 
<TD class="td_r">用户的此广告点击数在多少以上扣点率才开始生效：</TD>
<TD><input name="AdDeDuct_BaseNum" type="text" value="<%=Rs("AdDeDuct_BaseNum")%>">默认0</TD>
</TR>



<%If Rs("Ad_Class") >2 Then%>
<tr class="tr_1">
<td colspan="2">广告点击率</td>
</tr>

<tr> 
<td class="td_r">广告点击率：</td>
<td><input name="AdClickRate" type="text" id="AdClickRate" value="<%=Rs("AdClickRate")%>">
‰(千分之几,一般在120‰以内,0表示不限制)</td>
</tr>
<%End If%>


<tr> 
<td>&nbsp;</td>
<td>
<input type="submit" name="adpricebtn" id="adpricebtn" value="修改" class="btn btn-primary">
</td>
</tr>

</table>

