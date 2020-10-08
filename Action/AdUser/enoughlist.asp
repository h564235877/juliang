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
Sql="Select * From CFWztg_User where UserName='"&AdUserName&"'"
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
%>
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2" >您的金额状况</td>
</tr>

<tr> 
<td class="td_r" width="100">广告主：</td>
<td><%=AdUserName%>
<%
Sql="Select * From CFWztg_User where BindUserName='"&AdUserName&"'"
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.open Sql,Conn,1,1
Response.write "&nbsp;&nbsp;[此广告主已经绑定在"&Rs2("UserName")&"用户上-<a href=""javascript:;"" onclick=""$(function () { confirm('确定要解除绑定吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=aduserbinddel')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});"">点击解除绑定</a>]"
%>
</td>
</tr>

  <tr> 
    <td class="td_r">总金额：</td>
    <td><%=GetTurnCent(Rs("Total_Cent"))%>元</td>
  </tr>
  <tr> 
    <td class="td_r">花费金额：</td>
    <td><%=GetTurnCent(Rs("Spend_Cent"))%>元</td>
  </tr>
  <tr> 
    <td class="td_r">剩余金额：</td>
    <td><%=GetTurnCent(Rs("Spare_Cent"))%>元</td>
  </tr>
  
<tr> 
<td></td>
<td>
<%
If RsSet("Pay_Default")<>"" Then
 Response.write "<input type='submit' name='ubmit4' value='在线充值' onClick=""location.href='?Action=onlinepay';"" class='btn btn-primary'>"
Else
 Response.write "在线充值接口没有开通，无法在线充值，请联盟管理员手工充值"
End If
%>
</td>
</tr>


<%If RsSet("QRPay_AlipayOpen")=1 Or RsSet("QRPay_WeixinOpen")=1 Then%>
<tr> 
<td colspan="2">
<div style="width:720px;margin:0px auto;">
<%If RsSet("QRPay_AlipayOpen")=1 Then%>
<ul style="float:left;width:360px">
<li style="font-weight:bold;">支付宝扫码支付</li>
<li><img src="../../images/qrpay_alipay.png" border=0 /></li>
<li style="width:280px"><%=RsSet("QRPay_AlipayDesc")%></li>
</ul>
<%End If%>

<%If RsSet("QRPay_WeixinOpen")=1 Then%>
<ul style="float:left;width:360px">
<li style="font-weight:bold;">微信二维码支付</li>
<li><img src="../../images/qrpay_weixin.png" border=0 /></li>
<li style="width:280px"><%=RsSet("QRPay_WeixinDesc")%></li>
</ul>
<%End If%>
</div>
</td>
</tr>
<%End If%>

</table>
<br><br>
<%
PageUrl = "?Action="&Action


Sql="Select * From CFWztg_AdUser_OnlinePay Where AdUserName='"&AdUserName&"' Order By ID Desc"
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1


If Not Rs.eof Then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1 
 Rs.pagesize=20
 TotalRs=Rs.RecordCount
 TotalPage=Rs.PageCount
 MyPageSize=Rs.PageSize
 FixedSize=Rs.PageSize
 Rs.AbsolutePage=Page
End If
%>
        

<table class="tb_2">
<tr>
<td><span class="title">充值记录</span></td>
</tr>
</table>

<table class="tb_1">
<tr class="tr_1"> 
<td>序号</td>
<td>充值订单</td>
<td>充值金额</td>
<td>充值时间</td>
<td>已支付</td>
<td>充值类型</td>
</tr>

<%
While Not Rs.Eof And MyPageSize>0
%>
<tr class="tr_2"> 
<td style="font-weight:bold;"><%=Rs.RecordCount-Rs.Pagesize*(Page)+MyPageSize%></td>
<td>
<%
If Rs("PayOk")=1 Then
 Response.write Rs("OrderCode")
Else
 Response.write "<font color='#D4D4D4'>"&Rs("OrderCode")&"</font>"
End If
%>
</td>

<td><%=Rs("PayMoney")%></td>
<td><%=Rs("AddTime")%></td>
<td>
<%
If Rs("PayOk")=0 Then
 Response.write "否"
ElseIf Rs("PayOk")=1 Then
 Response.write "是"
End if
%>
</td>
    <td>
<%
If Rs("EnoughType")=1 Then
 Response.write "在线支付"
ElseIf Rs("EnoughType")=2 Then
 Response.write "管理员人工充值"
End if
%>
</td>
  </tr>
<%
MyPageSize=MyPageSize-1
Rs.MoveNext
Wend
Rs.Close
%>
</table>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>
