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
Set Rs = Server.CreateObject("Adodb.RecordSet")
Sql="Select * From CFWztg_User Where UserName='"&CoUserName&"'"
Rs.Open Sql,Conn,1,1
If Rs("Pay_Type")="" Then Call AlertUrl("您的汇款信息为空，请设置好汇款信息后再进行结算!","?Action=userpaymodify")
%>

<script>
$(function(){
 $("#submit").click(function(){
  Spend_Cent=$('#Spend_Cent').val();
  if(Spend_Cent==""){
   alert('请填写想要结算的金额', '', function () {$("#Spend_Cent").focus();});
   return false;
  }

  if(Spend_Cent < <%=RsSet("LowSpendCent")%>){
   alert('结算的金额最低必须不小于最低结算标准<%=RsSet("LowSpendCent")%>元', '', function () {$("#Spend_Cent").focus();});
   return false;
  }
  
  if(Spend_Cent > <%=Int(Cdbl(rs("Spare_Cent"))*100)/100%>){
   alert('结算的金额必须不大于剩余的金额<%=Int(Cdbl(rs("Spare_Cent"))*100)/100%>元', '', function () {$("#Spend_Cent").focus();});
   return false;
  }
  
<%If RsSet("SpendCentBS")=0 Then'判断填写不能有小数点%>
  if(!/^\d{1,10}(\.\d{1,2})?$/.test(Spend_Cent)){
   alert('结算金额输入有误，只能填写到小数点2位', '', function () {$("#Spend_Cent").focus();});
   return false;
  }
<%Else'判断是否为倍数%>
  if(Spend_Cent%<%=RsSet("SpendCentBS")%>!=0){
   alert('结算的金额必须为<%=RsSet("SpendCentBS")%>的整数倍', '', function () {$("#Spend_Cent").focus();});
   return false;
  }
<%End If%>
 })
});
</script>

<a href="?Action=spendlist" class="actionBtn" style="margin-top:10px;"><i class="mdi mdi-keyboard-return"></i>返回列表</a>

<form name="form4" method="post" action="../../CoUser.aspx?Action=spendsave&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_1"><tr class="tr_1"> 
<td colspan="2">申请结算 </td>
</tr>
<tr> 
<td width="120" class="td_r">剩余金额：</td>
<td><%
Response.write Int(Cdbl(rs("Spare_Cent"))*100)/100&"元"
%></td>
</tr>
<tr> 
<td class="td_r">想要结算的金额：</td>
<td>
<input name="Spend_Cent" type="text" id="Spend_Cent">元
<%
Response.write "(每次最低需结算" & GetTurnCent(RsSet("LowSpendCent")) & "元"
If RsSet("SpendCentBS")>0 Then Response.write ",且结算金额必须为"&RsSet("SpendCentBS")&"元的倍数"
Response.write ")"
%>
</td>
</tr>
<tr> 
<td class="td_r">结算说明：</td>
<td><input name="SpendDesc" type="text" id="SpendDesc">(没有请留空)</td>
</tr>
<tr> 
<td>&nbsp;</td>
<td><input type="submit" name="submit" id="submit" value="结算" class="btn btn-primary"></td>
</tr>
<tr class="tr_1"> 
<td colspan="2">您的汇款方式如下</td>
</tr>
<tr id="t_2"> 
<td class="td_r">真实姓名：</td>
<td><%=Rs("Pay_RealName")%></td>
</tr>
	
<tr> 
<td class="td_r">收款方式</td>
<td align="left">
<%
If Rs("pay_type")="alipay" Then
 Response.write "支付宝"
ElseIf Rs("pay_type")="tenpay" Then
 Response.write "财付通"
ElseIf Rs("pay_type")="boc" Then
 Response.write "中国银行"
ElseIf Rs("pay_type")="abc" Then
 Response.write "农业银行"
ElseIf Rs("pay_type")="icbc" Then
 Response.write "工商银行"
ElseIf Rs("pay_type")="ccb" Then
 Response.write "建设银行"
ElseIf Rs("pay_type")="cmb" Then
 Response.write "招商银行"
ElseIf Rs("pay_type")="otherbank" Then
 Response.write "其它银行"
End If
%>
</td>
</tr>

<tr> 
<td class="td_r">帐号：</td>
<td><%=Rs("pay_account")%></td>
</tr>

<%If Not(Rs("pay_type")="alipay" Or Rs("pay_type")="alipay") Then%>
<tr> 
<td class="td_r">开户银行：</td>
<td><%=Rs("pay_bankaddress")%></td>
</tr>
<%End If%>

<tr>
<td colspan="2">请确认您的汇款方式正确，如果不正确请<a href="?Action=userpaymodify">立即修改</a><br>
管理员是以审核结算时你最后设置的汇款方式为准</td>
</tr>
</table>
</form>