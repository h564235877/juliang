<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>

<%
OrderCode=Left(DateDiff("s","1970-1-1",Now())&GenRanStr_2(16),16)
%>

<script>
  let rate=6.9;
  $(function(){
   $("#submit").click(function(){
    PayMoney=$('#PayMoney').val();
    if(PayMoney==""){
     alert('请填写想要结算的金额', '', function () {$("#PayMoney").focus();});
     return false;
    }

    if(PayMoney <= 0){
     alert('请填写正确的充值的金额', '', function () {$("#PayMoney").focus();});
     return false;
    }
    
    if(!/^\d{1,10}(\.\d{1,2})?$/.test(PayMoney)){
     alert('结算金额输入有误，只能填写到小数点2位', '', function () {$("#PayMoney").focus();});
     return false;
    }
    
    if(PayMoney < <%=RsSet("Pay_LowCent")%>){
     alert('最低需充值<%=RsSet("Pay_LowCent")%>元', '', function () {$("#PayMoney").focus();});
     return false;
    }
    
   })


  });


function getRate(el){
  let rmb=$(el).val();
  if(rate){
    $("#ustd").val(rmb/rate);
    $("#submit").attr("disabled", false);
  }
  console.log($("#ustd").val());
}
</script>

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn" style="margin-top:10px;"><i class="mdi mdi-keyboard-return"></i>返回列表</a>


<form name="f" method="post" action="../../action/aduser/onlinepay_send.asp" target="_blank">
<table class="tb_1">
  <tr class="tr_1"> 
    <td colspan="2">在线充值</td>
  </tr>
  <tr> 
      <td width="80" class="td_r">广告主：</td>
      <td><%=AdUserName%><input type="hidden" name="AdUserName" id="AdUserName" value="<%=AdUserName%>">
      </td>
    </tr>
  <tr> 
      <td class="td_r">订单号：</td>
      <td><%=OrderCode%><input type="hidden" name="OrderCode" id="OrderCode" value="<%=OrderCode%>">
      </td>
    </tr>

    <tr> 
      <td class="td_r">支持接口：</td>
      <td><%
If RsSet("Pay_Default")="alipay" Then
 Response.write "支付宝"
 
ElseIf RsSet("Pay_Default")="tenpay" Then
 Response.write "东方钱包"
 
ElseIf RsSet("Pay_Default")="99bill" Then
 Response.write "快钱"
 
ElseIf RsSet("Pay_Default")="chinabank" Then
 Response.write "网银在线"
ElseIf RsSet("Pay_Default")="" Then
 Response.write "在线充值接口没有开通，无法充值"
End If

%> </td>
    </tr>
    
    <tr> 
      <td class="td_r">订单金额：</td>
      <td><input  id='PayMoney' name='PayMoney' type='text' > 元
        <span style="color: #999">(最低充值金额<%=RsSet("Pay_LowCent") %>元)</sapn>
      </td>
    </tr>
    
    <tr> 
	<td></td>
      <td>
        <input type="submit" name="submit" id="submit" value="充值" class="btn btn-primary">

      </td>
    </tr>
</table>
</form>