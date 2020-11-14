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

function Pay_Default_(){
 $("#t_Pay_AlipayEmail,#t_Pay_AlipayID,#t_Pay_AlipayKey,#t_Pay_TenpayID,#t_Pay_TenpayKey,#t_Pay_99BillID,#t_Pay_99BillKey,#t_Pay_ChinabankID,#t_Pay_ChinabankKey").hide();
}

function Pay_Default_alipay(){
 Pay_Default_();
 $("#t_Pay_AlipayEmail,#t_Pay_AlipayID,#t_Pay_AlipayKey").show(); 
}

function Pay_Default_tenpay(){
 Pay_Default_();
 $("#t_Pay_TenpayID,#t_Pay_TenpayKey").show(); 
}

function Pay_Default_99bill(){
 Pay_Default_();
 $("#t_Pay_99BillID,#t_Pay_99BillKey").show(); 
}

function Pay_Default_chinabank(){
 Pay_Default_();
 $("#t_Pay_ChinabankID,#t_Pay_ChinabankKey").show(); 
}

Pay_Default_<%=Rs("Pay_Default")%>(); 

$("#Pay_Default_").click(function(){Pay_Default_();});
$("#Pay_Default_alipay").click(function(){Pay_Default_alipay();});
$("#Pay_Default_tenpay").click(function(){Pay_Default_tenpay();});
$("#Pay_Default_99bill").click(function(){Pay_Default_99bill();});
$("#Pay_Default_chinabank").click(function(){Pay_Default_chinabank();});


function QRPay_AlipayOpen_0(){
 $("#t_QRPay_AlipayDesc").hide(); 
}

function QRPay_AlipayOpen_1(){
 $("#t_QRPay_AlipayDesc").show(); 
}

QRPay_AlipayOpen_<%=Rs("QRPay_AlipayOpen")%>(); 
$("#QRPay_AlipayOpen_0").click(function(){QRPay_AlipayOpen_0();});
$("#QRPay_AlipayOpen_1").click(function(){QRPay_AlipayOpen_1();});


function QRPay_WeixinOpen_0(){
 $("#t_QRPay_WeixinDesc").hide(); 
}

function QRPay_WeixinOpen_1(){
 $("#t_QRPay_WeixinDesc").show(); 
}

QRPay_WeixinOpen_<%=Rs("QRPay_WeixinOpen")%>(); 
$("#QRPay_WeixinOpen_0").click(function(){QRPay_WeixinOpen_0();});
$("#QRPay_WeixinOpen_1").click(function(){QRPay_WeixinOpen_1();});

});

</script> 

<form name="form2" method="post" action="../../AdminUser.aspx?Action=sysmodifysave&Label=<%=Label%>">
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">在线支付接口设置</td>
</tr>


<tr id="t_Pay_Default">
<td width="185" class="td_r">选择在线支付接口：</td>
<td>
<input name="Pay_Default" id="Pay_Default_" type="radio" value=""<%If Rs("Pay_Default")="" Then Response.Write " Checked"%>>关闭 
<input name="Pay_Default" id="Pay_Default_alipay" type="radio" value="alipay"<%If Rs("Pay_Default")="alipay" Then Response.Write " Checked"%>>支付宝
<input name="Pay_Default" id="Pay_Default_tenpay" type="radio" value="tenpay"<%If Rs("Pay_Default")="tenpay" Then Response.Write " Checked"%>>东方钱包
<input name="Pay_Default" id="Pay_Default_99bill" type="radio" value="99bill"<%If Rs("Pay_Default")="99bill" Then Response.Write " Checked"%>>快钱
<input name="Pay_Default" id="Pay_Default_chinabank" type="radio" value="chinabank"<%If Rs("Pay_Default")="chinabank" Then Response.Write " Checked"%>>网银在线
</td>
</tr>
      
<tr id="t_Pay_AlipayEmail"> 
<td class="td_r">支付宝Email：</td>
<td><input name="Pay_AlipayEmail" type="text" id="Pay_AlipayEmail" value="<%=rs("Pay_AlipayEmail")%>"></td>
</tr>
<tr id="t_Pay_AlipayID"> 
<td class="td_r">支付宝ID：</td>
<td><input name="Pay_AlipayID" type="text" id="Pay_AlipayID" value="<%=rs("Pay_AlipayID")%>"></td>
</tr>
<tr id="t_Pay_AlipayKey"> 
<td class="td_r">KEY：</td>
<td><input name="Pay_AlipayKey" type="text" id="Pay_AlipayKey" value="<%=rs("Pay_AlipayKey")%>"></td>
</tr>

<tr id="t_Pay_TenpayID"> 
<td class="td_r">东方钱包ID：</td>
<td><input name="Pay_TenpayID" type="text" id="Pay_TenpayID" value="<%=rs("Pay_TenpayID")%>"></td>
</tr>
<tr id="t_Pay_TenpayKey"> 
<td class="td_r">KEY：</td>
<td><input name="Pay_TenpayKey" type="text" id="Pay_TenpayKey" value="<%=rs("Pay_TenpayKey")%>"></td>
</tr>

<tr id="t_Pay_99BillID"> 
<td class="td_r">快钱ID：</td>
<td><input name="Pay_99BillID" type="text" id="Pay_99BillID" value="<%=rs("Pay_99BillID")%>"></td>
</tr>
<tr id="t_Pay_99BillKey"> 
<td class="td_r">KEY：</td>
<td><input name="Pay_99BillKey" type="text" id="Pay_99BillKey" value="<%=rs("Pay_99BillKey")%>"></td>
</tr>

<tr id="t_Pay_ChinabankID"> 
<td class="td_r">网银在线ID：</td>
<td><input name="Pay_ChinabankID" type="text" id="Pay_ChinabankID" value="<%=rs("Pay_ChinabankID")%>"></td>
</tr>
<tr id="t_Pay_ChinabankKey"> 
<td class="td_r">KEY：</td>
<td><input name="Pay_ChinabankKey" type="text" id="Pay_ChinabankKey" value="<%=rs("Pay_ChinabankKey")%>"></td>
</tr>

<tr class="tr_1"> 
<td colspan="2">在线支付最低充值</td>
</tr>
<tr> 
<td class="td_r">最低充值金额：</td>
<td><input name="Pay_LowCent" type="text" id="Pay_LowCent" value="<%=rs("Pay_LowCent")%>">元</td>
</tr>


<tr class="tr_1"> 
<td colspan="2">支付宝二维码收款设置</td>
</tr>

<tr>
<td class="td_r">支付宝二维收款码支付：</td>
<td>
<input name="QRPay_AlipayOpen" id="QRPay_AlipayOpen_0" type="radio" value="0"<%If Rs("QRPay_AlipayOpen")=0 Then Response.Write " Checked"%>>关闭 
<input name="QRPay_AlipayOpen" id="QRPay_AlipayOpen_1" type="radio" value="1"<%If Rs("QRPay_AlipayOpen")=1 Then Response.Write " Checked"%>>开启
</td>
</tr>
      
<tr id="t_QRPay_AlipayDesc"> 
<td class="td_r">支付宝二维收款码支付说明：</td>
<td>
<img src="../../images/qrpay_alipay.png" border=0 />(替换自己的支付宝收款二维码，根目录images下的qrpay_alipay.png文件)
<input name="QRPay_AlipayDesc" type="text" id="QRPay_AlipayDesc" value="<%=rs("QRPay_AlipayDesc")%>" size="80"></td>
</tr>

<tr class="tr_1"> 
<td colspan="2">微信二维码收款设置</td>
</tr>
<tr>
<td class="td_r">微信二维收款码支付：</td>
<td>
<input name="QRPay_WeixinOpen" id="QRPay_WeixinOpen_0" type="radio" value="0"<%If Rs("QRPay_WeixinOpen")=0 Then Response.Write " Checked"%>>关闭 
<input name="QRPay_WeixinOpen" id="QRPay_WeixinOpen_1" type="radio" value="1"<%If Rs("QRPay_WeixinOpen")=1 Then Response.Write " Checked"%>>开启
</td>
</tr>
      
<tr id="t_QRPay_WeixinDesc"> 
<td class="td_r">微信二维收款码支付说明：</td>
<td>
<img src="../../images/qrpay_weixin.png" border=0 />(替换自己的微信收款二维码，根目录images下的qrpay_weixin.png文件)
<input name="QRPay_WeixinDesc" type="text" id="QRPay_WeixinDesc" value="<%=rs("QRPay_WeixinDesc")%>" size="80"></td>
</tr>

<tr> 
<td>&nbsp;</td>
<td>

<input type="submit" name="submit" value="修改" class="btn btn-primary">
 </td>
</tr>
</table></form>
