<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>

<%
Sql="Select * From CFWztg_User where UserName='"&AdUserName&"'"
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
%>
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2" >���Ľ��״��</td>
</tr>

<tr> 
<td class="td_r" width="100">�������</td>
<td><%=AdUserName%>
<%
Sql="Select * From CFWztg_User where BindUserName='"&AdUserName&"'"
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.open Sql,Conn,1,1
Response.write "&nbsp;&nbsp;[�˹�����Ѿ�����"&Rs2("UserName")&"�û���-<a href=""javascript:;"" onclick=""$(function () { confirm('ȷ��Ҫ�������?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=aduserbinddel')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});"">��������</a>]"
%>
</td>
</tr>

  <tr> 
    <td class="td_r">�ܽ�</td>
    <td><%=GetTurnCent(Rs("Total_Cent"))%>Ԫ</td>
  </tr>
  <tr> 
    <td class="td_r">���ѽ�</td>
    <td><%=GetTurnCent(Rs("Spend_Cent"))%>Ԫ</td>
  </tr>
  <tr> 
    <td class="td_r">ʣ���</td>
    <td><%=GetTurnCent(Rs("Spare_Cent"))%>Ԫ</td>
  </tr>
  
<tr> 
<td></td>
<td>
<%
If RsSet("Pay_Default")<>"" Then
 Response.write "<input type='submit' name='ubmit4' value='���߳�ֵ' onClick=""location.href='?Action=onlinepay';"" class='btn btn-primary'>"
Else
 Response.write "���߳�ֵ�ӿ�û�п�ͨ���޷����߳�ֵ�������˹���Ա�ֹ���ֵ"
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
<li style="font-weight:bold;">֧����ɨ��֧��</li>
<li><img src="../../images/qrpay_alipay.png" border=0 /></li>
<li style="width:280px"><%=RsSet("QRPay_AlipayDesc")%></li>
</ul>
<%End If%>

<%If RsSet("QRPay_WeixinOpen")=1 Then%>
<ul style="float:left;width:360px">
<li style="font-weight:bold;">΢�Ŷ�ά��֧��</li>
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
<td><span class="title">��ֵ��¼</span></td>
</tr>
</table>

<table class="tb_1">
<tr class="tr_1"> 
<td>���</td>
<td>��ֵ����</td>
<td>��ֵ���</td>
<td>��ֵʱ��</td>
<td>��֧��</td>
<td>��ֵ����</td>
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
 Response.write "��"
ElseIf Rs("PayOk")=1 Then
 Response.write "��"
End if
%>
</td>
    <td>
<%
If Rs("EnoughType")=1 Then
 Response.write "����֧��"
ElseIf Rs("EnoughType")=2 Then
 Response.write "����Ա�˹���ֵ"
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
